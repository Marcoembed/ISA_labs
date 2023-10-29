#!/usr/local/bin/tclsh

proc get_DW_decoder { module_name } {

    global rtl_language
    global dec_inwidth

################################################################
# DW decoder module
################################################################
if { ${rtl_language} == "verilog" } {
    set width $dec_inwidth
    set dec_width [expr 1 << $dec_inwidth]
puts "
module $module_name (A, B);

input \[[expr $dec_inwidth - 1]:0\] A;
output \[[expr [expr 1 << $dec_inwidth] - 1]:0\] B;"
puts "
wire \[[expr $dec_width - 1]:0\]   and_out;
wire \[[expr [expr $dec_width * $width] - 1]:0\] and_in;
wire \[[expr [expr $dec_width * [expr $width + 1]] - 1]:0\] and_acc;
"
for { set j 1 } { $j <= $width } {incr j} {
    for { set k 0 } { $k < $dec_width } {incr k} {
	set index [expr [expr $j - 1] + [expr $k * $width]]   
	if { [expr $k % [expr 1 << $j]] < [expr 1 << [expr $j - 1]] } {
	    puts "assign and_in\[$index\] = ~A\[[expr $j - 1]\];"
	} else {
	    puts "assign and_in\[$index\] = A\[[expr $j - 1]\];"
	}
    }
}
for { set i 0 } { $i < $dec_width } { incr i} {
    puts "assign and_acc\[[expr $i * [expr $width + 1]]\] = 1'b1;"
    for {set j 0} { $j < $width } {incr j} {
	set index_in [expr $j + [expr $i * $width]]
	set index_acc [expr $j + [expr $i * [expr $width + 1]]]
	puts "assign and_acc\[[expr $index_acc + 1]\] = and_acc\[$index_acc\] & and_in\[$index_in\];"
    }
    puts "assign and_out\[$i\] = and_acc\[[expr $width + [expr $i * [expr $width + 1]]]\];"
}

puts "assign B = and_out;"
puts "
endmodule
"
} else {
################################################################
puts "
library IEEE;
use IEEE.std_logic_1164.all;

entity $module_name is 
  port(A: in std_logic_vector([expr $dec_inwidth - 1] downto 0);
       B: out std_logic_vector([expr [expr 1 << $dec_inwidth] - 1] downto 0));
end $module_name;
"
puts "
architecture str of $module_name is

  constant width: NATURAL := $dec_inwidth;
  constant dec_width: NATURAL := 2**width;

  signal and_out: std_logic_vector(dec_width-1 downto 0);
    
  type and_array is array(dec_width-1 downto 0) of std_logic_vector(width-1 downto 0);
  signal and_in : and_array;
  type acc_array is array(dec_width-1 downto 0) of std_logic_vector(width downto 0);
  signal and_acc : acc_array;

begin

  A0: for j in 1 to width generate
    A1: for k in 0 to dec_width-1 generate
      A2: if (k mod 2**j) < 2**(j-1) generate
          A21: and_in(k)(j-1) <= not A(j-1);
      end generate A2;
      A3: if (k mod 2**j) >= 2**(j-1) generate
          and_in(k)(j-1) <= A(j-1);
      end generate A3;
    end generate A1;
  end generate A0;

  B0: for i in 0 to dec_width-1 generate
    and_acc(i)(0) <= '1';
    B1: for j in 0 to width-1 generate
        B11: and_acc(i)(j+1) <= and_acc(i)(j) and and_in(i)(j);
    end generate B1;
    and_out(i) <= and_acc(i)(width);
  end generate B0;

  C1: for i in 0 to dec_width-1 generate
    B(i) <= and_out(i);
  end generate C1;

end str;"
}

}
