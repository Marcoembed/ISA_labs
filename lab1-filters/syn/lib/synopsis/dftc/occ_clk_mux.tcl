#!/usr/local/bin/tclsh

set path $env(SYNOPSYS)/libraries/syn/dftc
#set path $env(REGRESSO_BASE)/dware/libraries/syn/dftc

source "$path/occ_utils.tcl"
source "$path/occ_gf_mux.tcl"
source "$path/occ_counter.tcl"
source "$path/occ_decoder.tcl"
source "$path/occ_or_tree.tcl"
source "$path/occ_clk_control.tcl"


###############################################################
# TDW parameters
###############################################################
set DEBUG_MODE 0
if { $DEBUG_MODE } {
    set clk_cycle_bits 1
    set clk_count 1
    set MODULE_BASE_NAME "DFT_clk_mux"
    set MODULE_PREFIX "prefix"
    set MODULE_SUFFIX "suffix"
    set {$net_format$} "verilog"
    set OCC_IMPL_TYPE 0
}

################################################################
# global varibles
################################################################
set module_name ${MODULE_PREFIX}_${MODULE_BASE_NAME}_${MODULE_SUFFIX}
set module_suffix ${MODULE_SUFFIX}
set module_prefix ${MODULE_PREFIX}

###############################################################
# internal variables
###############################################################
set rtl_language ${$net_format$}
set launch_delay 1
set dec_inwidth  [expr {int(ceil(log(abs(double([expr $clk_cycle_bits + $launch_delay + 1])))/log(2)))}]
set dec_outwidth [expr 1 << $dec_inwidth]
set term_count  [expr $clk_cycle_bits + $launch_delay]
set all_cycle_bits [expr $clk_count * $clk_cycle_bits]
set impl_type ${OCC_IMPL_TYPE}

################################################################
# local modules generation
################################################################

set gf_mux_base_name [get_design_name DFT_gf_mux]
set clk_cntrl_base_name [get_design_name DFT_clk_control]

for { set n 0 } { $n < $clk_count } {incr n} {
    get_DFT_gf_mux ${gf_mux_base_name}_$n
    get_DFT_clk_control ${clk_cntrl_base_name}_$n $n
}

################################################################
# clock mux top module
################################################################

if { ${rtl_language} == "verilog" } { 

puts "
module $module_name (
    reset, test_mode, pll_bypass, scan_en,
    slow_clk, clk_enable, fast_clk, clk);

input reset;
input test_mode;
input pll_bypass;
input scan_en;
input slow_clk;"
get_port "verilog" "clk_enable" "in" $all_cycle_bits 0  
get_port "verilog" "fast_clk" "in" $clk_count 0
get_port "verilog" "clk" "out" $clk_count 0

if { $clk_count == 1 }  {
# case of 1 clock controller, use simple signals
puts "
wire  fast_clk_enable;
wire  slow_clk_enable;
wire  fast_gate;
wire  slow_gate;
reg   int_slow_clock; 
reg   clk; 
"
puts "
 ${clk_cntrl_base_name}_0 U_clk_control_i_0 (
    .reset(reset), 
    .scan_en(scan_en), 
    .clk_enable(clk_enable),
    .fast_clk(fast_clk),
    .slow_clk(slow_clk), 
    .fast_clk_enable(fast_clk_enable), 
    .slow_clk_enable(slow_clk_enable));

 ${gf_mux_base_name}_0 U_gf_mux_0 (
    .fast_clk_enable(fast_clk_enable),
    .slow_clk_enable(slow_clk_enable),
    .pll_bypass(pll_bypass),  
    .test_mode(test_mode), 
    .scan_en(scan_en),
    .fast_gate(fast_gate),
    .slow_gate(slow_gate));
"
puts "
    always @(fast_gate or fast_clk or int_slow_clock)
    begin
	if (fast_gate == 1'b1) clk = fast_clk;
        else clk = int_slow_clock;
    end 
"
puts "
    always @(slow_gate or slow_clk) 
    begin
        if (slow_gate == 1'b1) int_slow_clock = slow_clk;
        else int_slow_clock = 1'b0;
    end 
"

} else {

puts "
wire \[[expr $clk_count - 1]:0\] fast_clk_enable;
wire \[[expr $clk_count - 1]:0\] slow_clk_enable;
wire \[[expr $clk_count - 1]:0\] fast_gate;
wire \[[expr $clk_count - 1]:0\] slow_gate;
reg \[[expr $clk_count - 1]:0\] int_slow_clock; 
reg \[[expr $clk_count - 1]:0\] clk; 
"
for { set i 0 } { $i < $clk_count } {incr i} {
puts "
 ${clk_cntrl_base_name}_$i U_clk_control_i_$i (
    .reset(reset), 
    .scan_en(scan_en), 
    .clk_enable(clk_enable\[[expr [expr [expr $i + 1] * $clk_cycle_bits] - 1]:[expr $i * $clk_cycle_bits]\]),
    .fast_clk(fast_clk\[$i\]),
    .slow_clk(slow_clk), 
    .fast_clk_enable(fast_clk_enable\[$i\]), 
    .slow_clk_enable(slow_clk_enable\[$i\]));

 ${gf_mux_base_name}_$i U_gf_mux_$i (
    .fast_clk_enable(fast_clk_enable\[$i\]),
    .slow_clk_enable(slow_clk_enable\[$i\]),
    .pll_bypass(pll_bypass),  
    .test_mode(test_mode), 
    .scan_en(scan_en),
    .fast_gate(fast_gate\[$i\]),
    .slow_gate(slow_gate\[$i\]));
"
puts "
    always @(fast_gate\[$i\] or fast_clk\[$i\] or int_slow_clock\[$i\])
    begin
	if (fast_gate\[$i\] == 1'b1) clk\[$i\] = fast_clk\[$i\];
        else clk\[$i\] = int_slow_clock\[$i\];
    end 
"
puts "
    always @(slow_gate\[$i\] or slow_clk) 
    begin
        if (slow_gate\[$i\] == 1'b1) int_slow_clock\[$i\] = slow_clk;
        else int_slow_clock\[$i\] = 1'b0;
    end 
"
}

}

puts "endmodule"

} else {

################################################################
puts " 
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is
  port (
"
puts "
    reset, test_mode, pll_bypass, scan_en : in std_logic;"
get_port "vhdl" "clk_enable" "in" $all_cycle_bits 0  
get_port "vhdl" "fast_clk" "in" $clk_count 0
get_port "vhdl" "clk" "out" $clk_count 0
puts "    slow_clk: in std_logic);
              
end $module_name;
"

puts "
architecture rtl of $module_name is

  signal fast_clk_enable : std_logic_vector([expr $clk_count - 1] downto 0);
  signal slow_clk_enable : std_logic_vector([expr $clk_count - 1] downto 0);
  signal fast_gate : std_logic_vector([expr $clk_count - 1] downto 0);
  signal slow_gate : std_logic_vector([expr $clk_count - 1] downto 0);
  signal int_slow_clock : std_logic_vector([expr $clk_count - 1] downto 0);
"

# clock control and glitch free components
for { set n 0 } { $n < $clk_count } {incr n} {
puts "
component ${clk_cntrl_base_name}_$n  
 port (
   reset, scan_en : in std_logic;
"
get_port "vhdl" "clk_enable" "in" $clk_cycle_bits 0
puts "   fast_clk: in std_logic;
   slow_clk: in std_logic;
   fast_clk_enable : out std_logic;
   slow_clk_enable : out std_logic
 );
end component;

component ${gf_mux_base_name}_$n
 port (
   fast_clk_enable : in std_logic;
   slow_clk_enable : in std_logic;
   pll_bypass : in std_logic;
   test_mode  : in std_logic;
   scan_en    : in std_logic;
   fast_gate        : out std_logic;
   slow_gate        : out std_logic
 );
end component;"

}

puts "
-- Architecture body
begin
"
for { set i 0 } { $i < $clk_count } {incr i} {

puts "
  U_clk_control_i_$i :  ${clk_cntrl_base_name}_$i
    port map(
    reset=>reset, 
    scan_en=>scan_en,"
if { $clk_count > 1 } {  
    puts "    clk_enable=>clk_enable([expr [expr [expr $i + 1] * $clk_cycle_bits] - 1] downto [expr $i * $clk_cycle_bits]),"
    puts "    fast_clk=>fast_clk($i),"
} else {
    puts "    clk_enable=>clk_enable,"
    puts "    fast_clk=>fast_clk,"
}
puts "    slow_clk=>slow_clk, 
    fast_clk_enable=>fast_clk_enable($i), 
    slow_clk_enable=>slow_clk_enable($i));"


puts "
  U_gf_mux_$i : ${gf_mux_base_name}_$i
    port map(
    fast_clk_enable=>fast_clk_enable($i),
    slow_clk_enable=>slow_clk_enable($i),
    pll_bypass=>pll_bypass,  
    test_mode=>test_mode, 
    scan_en=>scan_en,
    fast_gate=>fast_gate($i),
    slow_gate=>slow_gate($i));
"
if { $clk_count > 1 } {
    puts "
    process  (fast_gate($i), fast_clk($i), int_slow_clock($i))
    begin
	if (fast_gate($i)='1') then clk($i) <= fast_clk($i) ;
        else clk($i) <= int_slow_clock($i) ;
        end if;
    end process;
"
} else {
puts "
    process  (fast_gate($i), fast_clk, int_slow_clock($i))
    begin
	if (fast_gate($i)='1') then clk <= fast_clk ;
        else clk <= int_slow_clock($i) ;
        end if;
    end process;
"
}
puts "
    process  (slow_gate($i), slow_clk) 
    begin
        if (slow_gate($i)='1') then int_slow_clock($i) <= slow_clk ;
        else int_slow_clock($i) <= '0' ;
        end if;
    end process;
"
}

puts "end rtl;"

}
