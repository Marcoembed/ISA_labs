#!/usr/local/bin/tclsh

proc get_DFT_gf_mux { module_name } {

 global rtl_language

################################################################
 if { $rtl_language == "verilog" } { 

puts "
module $module_name ( fast_clk_enable, slow_clk_enable, pll_bypass,
                    test_mode, scan_en, 
                    fast_gate, slow_gate );
  input fast_clk_enable, slow_clk_enable, pll_bypass,
         test_mode, scan_en;
  output fast_gate, slow_gate;

assign fast_gate = ((fast_clk_enable & (~ pll_bypass)) | (~ test_mode));
assign slow_gate = ((slow_clk_enable | pll_bypass) & test_mode & (scan_en | pll_bypass));

endmodule
"
} else {

################################################################
puts "
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is
 port (
   fast_clk_enable : in std_logic;
   slow_clk_enable : in std_logic;
   pll_bypass : in std_logic;
   test_mode  : in std_logic;
   scan_en    : in std_logic;
   fast_gate        : out std_logic;
   slow_gate        : out std_logic
 );
end $module_name;

architecture rtl of $module_name is

begin

fast_gate <= ((fast_clk_enable AND (NOT pll_bypass)) OR (NOT test_mode));
slow_gate <= ((slow_clk_enable OR pll_bypass) AND test_mode AND (scan_en OR pll_bypass));

end rtl;
"
}
}
