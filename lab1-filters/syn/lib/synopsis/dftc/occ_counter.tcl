
#!/usr/local/bin/tclsh

proc get_DW_counter { module_name index } {

global rtl_language
global dec_inwidth
global term_count

#internal modules name
set DW_inc_module_name [get_design_name DW_inc_width${dec_inwidth}_$index]
################################################################
# counter module
################################################################
if { ${rtl_language} == "verilog" } {
puts "
module $module_name (clk, rst_n, enable, load_n, tercnt_n, count);"
set width $dec_inwidth
set count_to $term_count

puts "input clk;
input rst_n;
input enable;
input load_n;
output tercnt_n ;
output \[[expr $width-1]:0\] count;

wire \[[expr $width-1]:0\] count_in, tercnt_cmp_bus,next_count,count_inc, load_n_bus;
reg \[[expr $width-1]:0\] count_int;
reg tercnt_n_reg;
wire logic_high, tercnt_d, tc_d_n_gated;"

for {set i 0} {$i<$width} {incr i} {
    set p [expr pow(2,$i)]
    set p [expr int($p) ]
    set p [expr $count_to/$p]
    set p [expr  int($p)]
    set p [expr $p % 2]
    if { $p==0} {
	puts "  assign tercnt_cmp_bus\[[expr $i]\] = ~next_count\[[expr $i]\];"
    } else {
	puts "  assign tercnt_cmp_bus\[[expr $i]\] = next_count\[[expr $i]\];"
    }
}
puts "  //U1_3 component
  always @ (posedge clk or negedge rst_n) begin 
    if (rst_n == 1'b0) begin
      count_int <= {[expr $width]{1'b0}};
    end else begin
      count_int <= next_count;
    end // if-else
  end //

  // U2_1 component
  assign load_n_bus = {$width{load_n}};
  assign next_count = load_n_bus & count_inc;
  always @ (posedge clk or negedge rst_n) begin 
    if (rst_n == 1'b0) begin
      tercnt_n_reg <= 1'b0;
    end else begin
     tercnt_n_reg <= tercnt_d;
    end // if-else
  end 

  assign tercnt_d = &tercnt_cmp_bus; // U3 component
  assign count_inc = count_int + enable;  //U4 component
  assign count =count_int;
  assign tercnt_n = ~ tercnt_n_reg;

endmodule"

} else {
################################################################
# DW_inc module

puts "
library IEEE,GTECH;
use IEEE.std_logic_1164.all;
use GTECH.GTECH_components.all;

entity ${DW_inc_module_name} is
   port(carry_in : in std_logic;
	a : in std_logic_vector([expr $dec_inwidth - 1] downto 0);
	carry_out : out std_logic;
	sum : out std_logic_vector([expr $dec_inwidth - 1] downto 0));
end ${DW_inc_module_name};
"
puts "
architecture rpl of ${DW_inc_module_name} is

  constant n: integer := $dec_inwidth;  
  signal carry : std_logic_vector(n downto 1);
  signal ONE : std_logic;

begin
    U0: GTECH_ADD_AB port map(a(0), carry_in, sum(0), carry(1));
    S1: if n > 1 generate
        L1: for I in 1 to n-1 generate
	    U1: GTECH_ADD_AB port map(a(i), carry(i), sum(i), carry(i+1));
        end generate;
    end generate;

    carry_out <= carry(n);
end rpl;
"

################################################################
puts "
library IEEE,DW01,GTECH;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.AND_REDUCE;
use GTECH.GTECH_components.all;
use DW01.DW01_components.all;
"
puts "
entity $module_name is
    port(   clk : in std_logic;
	    rst_n : in std_logic;
	    enable : in std_logic;
	    load_n : in std_logic;
	    ld_data : in std_logic_vector([expr $dec_inwidth - 1] downto 0 );
	    tercnt_n : out std_logic;
	    count : out std_logic_vector ([expr $dec_inwidth - 1] downto 0 ) );
end $module_name;

architecture rpl of $module_name is

  constant width: NATURAL := $dec_inwidth;
  constant count_to: POSITIVE := $term_count;
  constant rst_mode: INTEGER := 0;
  constant dcod_mode: INTEGER := 0;
  signal logic_high, tercnt_d, tc_d_n_gated : std_logic;
  signal count_int, tercnt_cmp_bus : std_logic_vector( width-1 downto 0);
  signal next_count, count_inc : std_logic_vector( width-1 downto 0);
  signal next_cnt_gated : std_logic_vector( width-1 downto 0);

component ${DW_inc_module_name}
   port(carry_in : in std_logic;
	a : in std_logic_vector([expr $dec_inwidth - 1] downto 0);
	carry_out : out std_logic;
	sum : out std_logic_vector([expr $dec_inwidth - 1] downto 0));
  end component;

begin
    
    G1 : for i in 0 to width-1 generate
	G1_1 : if ( (count_to / 2**i) mod 2 = 0 ) generate
	    G1_1_1 : if ( dcod_mode = 0 ) generate
		U1_1_1 : GTECH_NOT port map( A => next_count(i), Z => tercnt_cmp_bus(i) );
	    end generate;

	    G1_1_2 : if ( dcod_mode = 1 ) generate
		tercnt_cmp_bus(i) <= logic_high;
	    end generate;
	end generate;

	G1_2 : if ( (count_to / 2**i) mod 2 = 1 ) generate
	    tercnt_cmp_bus(i) <= next_count(i);
	end generate;

	G1_3 : if ( rst_mode = 0 ) generate
	    U1_3 : GTECH_FD2 port map(
				    CP => clk,
				    CD => rst_n,
				    D => next_count(i),
				    Q => count_int(i)
				     );
	end generate;

	G1_4 : if ( rst_mode = 1 ) generate
	    U1_4_1 : GTECH_NAND2 port map(
					A => rst_n,
					B => next_count(i),
					Z => next_cnt_gated(i)
					 );
	    
	    U1_4_2 : GTECH_FD1 port map (
					CP => clk,
					D => next_cnt_gated(i),
					QN => count_int(i)
					);
	end generate;

	U1_5 : GTECH_MUX2 port map (
				    A => ld_data(i),
				    B => count_inc(i),
				    S => load_n,
				    Z => next_count(i)
				   );

    end generate;


    G2_1 : if ( rst_mode = 0 ) generate
	U2_1 : GTECH_FD2 port map(
				CP => clk,
				CD => rst_n,
				D => tercnt_d,
				QN => tercnt_n
				 );
    end generate;

    G2_2 : if ( rst_mode = 1 ) generate
	U2_2_1 : GTECH_FD1 port map(
				CP => clk,
				D => tc_d_n_gated,
				Q => tercnt_n
				 );

	U2_2_2 : GTECH_NAND2 port map(
				A => rst_n,
				B => tercnt_d,
				Z => tc_d_n_gated
				 );
    end generate;
	

    
    U3 : tercnt_d <= AND_REDUCE(tercnt_cmp_bus);


U4 : ${DW_inc_module_name}
	    port    map( a => count_int, carry_in => enable, sum => count_inc );


    G5 : if ( dcod_mode = 1 ) generate
	U5 : GTECH_ONE port map( logic_high );
    end generate;


    count <= count_int;




end rpl;
"
}
}
