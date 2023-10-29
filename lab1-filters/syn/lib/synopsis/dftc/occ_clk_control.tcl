#!/usr/local/bin/tclsh

#--
#-- ABSTRACT: 
#--

proc get_DFT_clk_control { module_name index} {

################################################################
# global variables
################################################################

global rtl_language 
global launch_delay 
global bit_width 

global clk_cycle_bits
global dec_inwidth  
global dec_outwidth 
global term_count  
global impl_type

################################################################
# local variables
################################################################
set logicbist 1

################################################################
# local modules generation
################################################################
# or tree module
set or_tree_module_name [get_design_name DFT_or_gate_width${clk_cycle_bits}_$index]
get_DFT_or_tree $or_tree_module_name

# counter module
set counter_module_name [get_design_name DFT_cntr_scnto_width${dec_inwidth}_count_to${term_count}_rst_mode0_dcod_mode0_${index}] 
get_DW_counter $counter_module_name $index
 
# decoder module
set decoder_module_name [get_design_name DFT_decode_width${dec_inwidth}_$index]
get_DW_decoder $decoder_module_name

################################################################
if { ${rtl_language} == "verilog" } {
puts "
module $module_name (reset, scan_en, clk_enable, fast_clk, slow_clk, fast_clk_enable, slow_clk_enable);"
puts "input reset;
input scan_en;"
get_port "verilog" "clk_enable" "in" $clk_cycle_bits 0
puts "input fast_clk;
input slow_clk;
output fast_clk_enable;
output slow_clk_enable;
"
#signals declaration
puts "
wire fast_data, slow_data;
wire load_n_meta_0_data, load_n_meta_1_data, load_n_meta_2_data;
wire clk_sel, reset_n;
wire capture_clk_enable, capture_clk_enable_i;
reg fast_clk_enable_l;
wire slow_clk_enable_l_n;
reg load_n_meta_0_l, load_n_meta_1_l, load_n_meta_2_l;
reg pipeline_or_tree_l;
wire pipeline_or_tree_data;
integer count_int;
wire ctr_enable;
wire tercnt_n;
wire \[[expr $dec_inwidth - 1]:0\] count;
wire \[[expr $dec_inwidth - 1]:0\] next_count;
wire \[[expr $dec_outwidth - 1]:0\] decode_count;
wire count_done;
wire \[[expr $clk_cycle_bits - 1]:0\] clk_enable_i;"
if { $impl_type >= $logicbist } {
  puts "reg slow_clk_enable_l;"
} else {
  puts "wire slow_clk_enable_l;"
}

#concurrent statements
puts "// Register to generate the fast clk enable signal
  always @(negedge fast_clk or posedge reset)
    if (reset == 1'b1) 
      fast_clk_enable_l = 1'b0;
    else 
      fast_clk_enable_l = fast_data;
"
# this register will be generated only in case of LogicBist 
# and legacy scan since the scan_en and the slow_clk signals are always 
# controllable in the other cases.
if { $impl_type >= $logicbist } {
puts "// Register to generate the slow clk enable signal
  always @(negedge slow_clk or posedge reset)
    if (reset == 1'b1)
      slow_clk_enable_l = 1'b0;
    else
      slow_clk_enable_l = slow_data;
"
} else {
puts "  assign slow_clk_enable_l = slow_data;"
}
puts "// Register to generate signals for meta-stability
  always @(posedge fast_clk or posedge reset)
    if (reset == 1'b1) 
      load_n_meta_0_l = 1'b0;
    else
      load_n_meta_0_l = load_n_meta_0_data;
"
puts "
  always @(posedge fast_clk or posedge reset)
    if (reset == 1'b1)
      load_n_meta_1_l = 1'b0;
    else
      load_n_meta_1_l = load_n_meta_1_data;

  always @(posedge fast_clk or posedge reset)
    if (reset == 1'b1) 
      load_n_meta_2_l = 1'b0;
    else
      load_n_meta_2_l = load_n_meta_2_data;

  assign load_n_meta_0_data = ~slow_clk_enable_l;
  assign load_n_meta_1_data = load_n_meta_0_l;
  assign load_n_meta_2_data = load_n_meta_1_l;
"
puts "
  assign reset_n = ~reset;
  assign fast_clk_enable = fast_clk_enable_l;
  assign slow_clk_enable = slow_clk_enable_l;
  assign fast_data = (~(scan_en | slow_clk_enable_l)) & capture_clk_enable;
  assign slow_data = scan_en & (~fast_clk_enable_l);
"
puts "
// Used to count fast clock pulses
// This \"MUST BE\" synthesized to the \"create_clock\" frequency 
//   to ensure at-speed operation

  assign ctr_enable = tercnt_n & (~ scan_en); 
${counter_module_name} U_cycle_ctr_i (
       .clk(fast_clk),
       .rst_n(reset_n), 
       .enable(ctr_enable),
       .load_n(load_n_meta_2_l),
       .tercnt_n(tercnt_n), 
       .count(count));
"
puts "  assign slow_clk_enable_l_n = ~slow_clk_enable_l;"

puts "
${decoder_module_name} U_decode_i (
    .A(count), .B(decode_count));
"

if { $clk_cycle_bits > 1 } {
    for { set n 0 } { $n < $clk_cycle_bits } { incr n } {
	puts "
    assign clk_enable_i\[$n\] = clk_enable\[$n\] & decode_count\[[expr $n + $launch_delay]\];
"
    }
} else {
	puts "
    assign clk_enable_i\[0\] = clk_enable & decode_count\[$launch_delay\];
"
}

puts "
${or_tree_module_name} U_or_tree_i (
      .a(clk_enable_i), 
      .b(capture_clk_enable_i));
"
puts "
  always @(posedge fast_clk or posedge reset)
    if (reset == 1'b1)
      pipeline_or_tree_l = 1'b0;
    else
      pipeline_or_tree_l = pipeline_or_tree_data;
"
puts "
  assign pipeline_or_tree_data = capture_clk_enable_i;	
  assign capture_clk_enable = pipeline_or_tree_l;
"

puts "
endmodule
"
} else {
################################################################

puts "
library IEEE;
use IEEE.std_logic_1164.all;
"
puts "
entity $module_name is
 port (
   reset : in std_logic;
   scan_en : in std_logic;
"
get_port "vhdl" "clk_enable" "in" $clk_cycle_bits 0
puts "   fast_clk: in std_logic;
   slow_clk: in std_logic;
   fast_clk_enable : out std_logic;
   slow_clk_enable : out std_logic
 );
end $module_name;
"
puts "
architecture rtl of $module_name is

signal fast_data, slow_data : std_logic;
signal load_n_meta_0_data, load_n_meta_1_data, load_n_meta_2_data : std_logic;
signal clk_sel, reset_n : std_logic;
signal capture_clk_enable, capture_clk_enable_i : std_logic;
signal fast_clk_enable_l : std_logic;
signal slow_clk_enable_l : std_logic;
signal slow_clk_enable_l_n : std_logic;
signal load_n_meta_0_l, load_n_meta_1_l, load_n_meta_2_l : std_logic;
signal pipeline_or_tree_l : std_logic;
signal pipeline_or_tree_data : std_logic;
signal count_int : integer;
signal ctr_enable : std_logic;
signal tercnt_n : std_logic;
signal count : std_logic_vector([expr $dec_inwidth - 1] downto 0);
signal next_count : std_logic_vector([expr $dec_inwidth - 1] downto 0);
signal decode_count : std_logic_vector([expr $dec_outwidth - 1] downto 0);
signal count_done : std_logic;
signal clk_enable_i : std_logic_vector([expr $clk_cycle_bits - 1] downto 0);
signal zero_vec : std_logic_vector([expr $dec_inwidth - 1] downto 0); 
"
puts "
component ${or_tree_module_name}
    port( a : in std_logic_vector( [expr $clk_cycle_bits - 1] downto 0 );
	  b : out std_logic );
end component;

component ${counter_module_name}
    port(   clk : in std_logic;
	    rst_n : in std_logic;
	    enable : in std_logic;
	    load_n : in std_logic;
	    ld_data : in std_logic_vector([expr $dec_inwidth - 1] downto 0 );
	    tercnt_n : out std_logic;
	    count : out std_logic_vector ([expr $dec_inwidth - 1] downto 0 ) );
end component;

component ${decoder_module_name}
  port(A: in std_logic_vector([expr $dec_inwidth - 1] downto 0);
       B: out std_logic_vector([expr [expr 1 << $dec_inwidth] - 1] downto 0));
end component;

"
puts "
begin
"
puts "
-- Register to generate the fast clk enable signal
  fast_clk_proc : process(fast_clk, reset)
    begin
    if (reset = '1') then
      fast_clk_enable_l <= '0';
    elsif falling_edge(fast_clk) then
      fast_clk_enable_l <= fast_data;
    end if;
  end process;
"
if { $impl_type >= $logicbist } {
puts "
-- Register to generate the slow clk enable signal
  slow_clk_proc : process(slow_clk, reset)
    begin
    if (reset = '1') then
      slow_clk_enable_l <= '0';
    elsif falling_edge(slow_clk) then
      slow_clk_enable_l <= slow_data;
    end if;
  end process;
"
} else {
puts "  slow_clk_enable_l <= slow_data;"
}
puts "
-- Register to generate signals for meta-stability
  load_n_meta_0_proc: process(fast_clk, reset)
    begin
    if (reset = '1') then
      load_n_meta_0_l <= '0';
    elsif rising_edge(fast_clk) then
      load_n_meta_0_l <= load_n_meta_0_data;
    end if;
  end process;
"
puts "
  load_n_meta_1_proc: process(fast_clk, reset)
    begin
    if (reset = '1') then
      load_n_meta_1_l <= '0';
    elsif rising_edge(fast_clk) then
      load_n_meta_1_l <= load_n_meta_1_data;
    end if;
  end process;

  load_n_meta_2_proc: process(fast_clk, reset)
    begin
    if (reset = '1') then
      load_n_meta_2_l <= '0';
    elsif rising_edge(fast_clk) then
      load_n_meta_2_l <= load_n_meta_2_data;
    end if;
  end process;

  load_n_meta_0_data <= NOT slow_clk_enable_l;
  load_n_meta_1_data <= load_n_meta_0_l;
  load_n_meta_2_data <= load_n_meta_1_l;
"
puts "
  reset_n <= NOT reset;
  zero_vec <= (others => '0');
  fast_clk_enable <= fast_clk_enable_l;
  slow_clk_enable <= slow_clk_enable_l;
  fast_data <= 
    (NOT(scan_en OR slow_clk_enable_l)) AND capture_clk_enable;
  slow_data <= scan_en AND (NOT fast_clk_enable_l);
"

puts "
-- Used to count fast clock pulses
-- This \"MUST BE\" synthesized to the \"create_clock\" frequency 
--   to ensure at-speed operation

  ctr_enable <= tercnt_n AND (NOT scan_en); 
U_cycle_ctr_i: ${counter_module_name}
     port map(
       clk => fast_clk,
       rst_n => reset_n, 
       enable => ctr_enable,
       load_n => load_n_meta_2_l,
       ld_data => zero_vec,
       tercnt_n => tercnt_n, 
       count=>count);
"
puts "  slow_clk_enable_l_n <= not slow_clk_enable_l;"

puts "
U_decode_i : ${decoder_module_name}
    port map (count, decode_count);
"

if { $clk_cycle_bits > 1 } {
    for { set n 0 } { $n < $clk_cycle_bits } { incr n } {
	puts "
    clk_enable_i($n) <= clk_enable($n) AND decode_count([expr $n + $launch_delay]);
"
    }
} else {
	puts "
    clk_enable_i(0) <= clk_enable AND decode_count($launch_delay);
"
}

puts "
  U_or_tree_i : ${or_tree_module_name}
    port map(
      a => clk_enable_i, 
      b => capture_clk_enable_i);
"
puts "
  pipeline_or_tree_proc: process(fast_clk, reset)
    begin	
    if (reset = '1') then
      pipeline_or_tree_l <= '0';
    elsif rising_edge(fast_clk) then
      pipeline_or_tree_l <= pipeline_or_tree_data;
    end if;
  end process;
"
puts "
  pipeline_or_tree_data <= capture_clk_enable_i;	
  capture_clk_enable <= pipeline_or_tree_l;
	
end rtl;
"

}

}
