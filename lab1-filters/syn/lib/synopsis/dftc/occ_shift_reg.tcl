
#!/usr/local/bin/tclsh

################################################################
# internal modules
################################################################
proc get_shftreg_mux { module_name } {

 global rtl_language

 if { ${rtl_language} == "verilog" } { 
puts "
module $module_name (a, b, sel, z);
input a;
input b;
input sel;
output z;

reg z; 

always@(a or b or sel)
begin
if (!sel)
  z = a;
else 
  z = b;
end
endmodule
"

 } else {
puts "
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is
   port (
    a   : in  std_logic;
    b   : in  std_logic;
    sel : in  std_logic;
    z   : out std_logic);
end $module_name;

architecture rtl of $module_name is
begin
 mux_proc: process(a, b, sel)
  begin
    if sel = '0'  then
      z <= a;
    else
      z <= b; 
    end if;
 end process mux_proc;
end rtl;
"
 }
}

proc get_shftreg_ff { module_name} {

 global rtl_language

 if { ${rtl_language} == "verilog" } { 
puts "
module $module_name (d, clk, q);
input d;
input clk;
output q;

reg q;

always@(posedge clk)
 q = d;
endmodule
"
 } else {
puts "
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is
   port (
    d   : in  std_logic;
    clk : in  std_logic;
    q   : out  std_logic);
end $module_name;

architecture rtl of $module_name is
begin
 ff_proc: process(clk)
  begin
    if clk'event and clk = '1' then
      q <= d; 
    end if;
  end process ff_proc;
end rtl;
"
 }
}


################################################################
# occ shift reg top module
################################################################

proc get_DFT_shftreg { module_name index chain_length } {

 global rtl_language

 set mux_module_name [get_design_name shftreg_mux_${index}]
 get_shftreg_mux ${mux_module_name}

 set ff_module_name [get_design_name shftreg_ff_${index}]
 get_shftreg_ff ${ff_module_name}

################################################################
 if { ${rtl_language} == "verilog" } { 
     puts "module $module_name (clk, s_in, shift_n, p_out ); "
puts "
input clk;
input s_in;
input shift_n;
output \[[expr $chain_length - 1]:0\] p_out;
"
puts "
wire \[[expr $chain_length - 1]:0\] d;
wire \[0:[expr $chain_length - 1]\] q;
"
for { set n [expr $chain_length - 1] } { $n >= 0 } { set n [expr $n - 1] } {

# shift register multiplexers
puts "
${mux_module_name} mux_$n ("
if { $n == [expr $chain_length - 1] } {
  puts "    .a(s_in),"
} else {
    puts "    .a(q\[[expr $n + 1]\]),"
}
puts "    .b(q\[$n\]),
    .sel(shift_n),
    .z(d\[$n\]));"

# registers
puts "
${ff_module_name} ff_$n (
    .d(d\[$n\]),
    .clk(clk),
    .q(q\[$n\]));
"

}

# registers outputs
puts "
// outputs
assign p_out = q;
"
puts "endmodule"

 } else {
################################################################
puts "
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is
	port
	(	clk:		in std_logic;
		s_in:		in std_logic;
		shift_n:	in std_logic;
		p_out:		out std_logic_vector([expr $chain_length - 1] downto 0) );
end $module_name;
"
puts "
architecture rtl of $module_name is

 signal d : std_logic_vector([expr $chain_length - 1] downto 0);
 signal q : std_logic_vector([expr $chain_length - 1] downto 0);

 component ${mux_module_name} is
   port (
    a   : in  std_logic;
    b   : in  std_logic;
    sel : in  std_logic;
    z   : out std_logic);
 end component;

 component ${ff_module_name} is
   port (
    d   : in  std_logic;
    clk : in  std_logic;
    q   : out  std_logic);
 end component;

begin
"
for { set n [expr $chain_length - 1] } { $n >= 0 } { set n [expr $n - 1] } {

# shift register multiplexers
puts "
  mux_$n : ${mux_module_name} port map ("
if { $n == 0 } {
  puts "    a   => s_in,"
} else {
  puts "    a   => q([expr $n - 1]),"
}
puts "    b   => q($n),
    sel => shift_n,
    z   => d($n));"

# registers
puts "
  ff_$n : ${ff_module_name} port map (
    d   => d($n),
    clk => clk,
    q   => q($n));
"

}

# registers outputs
puts "
  -- outputs
  p_out <= q;
"
puts "end rtl;
"
}
}
