
#!/usr/local/bin/tclsh

proc get_DFT_or_tree { module_name } {

    global rtl_language
    global clk_cycle_bits

    if { ${rtl_language} == "verilog" } {
puts "
module $module_name (a, b);
input \[[expr $clk_cycle_bits - 1]:0\] a;
output b;
assign b = |a;
endmodule
"
    } else {
################################################################
puts "
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.OR_REDUCE;
"
puts "
entity $module_name is
    port( a : in std_logic_vector([expr $clk_cycle_bits - 1] downto 0 );
	  b : out std_logic );
end $module_name;

architecture rtl of $module_name is
begin
  b <= OR_REDUCE(a);
end rtl;"

}
}
