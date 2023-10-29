#!/usr/local/bin/tclsh

set path $env(SYNOPSYS)/libraries/syn/dftc
#set path $env(REGRESSO_BASE)/dware/libraries/syn/dftc

source "$path/occ_utils.tcl"
source "$path/occ_shift_reg.tcl"

#####################
# TDW parameters
#####################
set DEBUG_MODE 0
if { $DEBUG_MODE } {
    set clk_ctrl_width 10
    set chain_count 3
    set pattern_ctr_width 1
    set cycle_ctr_width 1
    set MODULE_BASE_NAME "DFT_clk_chain"
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
set logicbist 1
set SEQCOMP 3
###############################################################
# internal variables
###############################################################
set rtl_language ${$net_format$}
set length $clk_ctrl_width 
set chain_length [expr $length / $chain_count]
set last_chain_length [expr $length - [expr [expr $chain_count - 1] * $chain_length]]


################################################################
# internal modules generation
################################################################
for { set n 0 } { $n < $chain_count } {incr n} {
    if { $n < [expr $chain_count - 1] } {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${chain_length}]
	get_DFT_shftreg ${shift_reg_base_name}_$n $n $chain_length
    } else {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${last_chain_length}]
	get_DFT_shftreg ${shift_reg_base_name}_$n $n $last_chain_length
    }
}


################################################################
# DFT_clk_chain top module generation
################################################################

################################################################
 if { ${rtl_language} == "verilog" } { 
puts " 
module $module_name (
 clk,"
if { $OCC_IMPL_TYPE == $logicbist } {
puts " bist_clk, bist_mode, lfsr_se,"
}
puts " se, si, so,"
puts " clk_ctrl_data"
if { $OCC_IMPL_TYPE == $logicbist } {
puts ", pattern_ctr_data, cycle_ctr_data"
}
if { $sccomp_type == $SEQCOMP } {
puts ", test_mode, cc_comp_clk"
}
puts ");"
puts "input clk;"
if { $OCC_IMPL_TYPE == $logicbist } {
puts "input bist_clk;"
puts "input bist_mode;"
puts "input lfsr_se;"
}
puts "input se;"
get_port "verilog" "si" "in" $chain_count 0   
get_port "verilog" "so" "out" $chain_count 0 
get_port "verilog" "clk_ctrl_data" "out" $clk_ctrl_width 0 
if { $OCC_IMPL_TYPE == $logicbist } {  
get_port "verilog" "pattern_ctr_data" "out" $pattern_ctr_width 0 
get_port "verilog" "cycle_ctr_data" "out" $cycle_ctr_width 0 
}
if { $sccomp_type == $SEQCOMP } {
puts "input test_mode;"
puts "input cc_comp_clk;"
}
puts "
// Declaritive region
wire se_inv;
wire \[[expr $length - 1]:0\] out_data; 
wire \[[expr $chain_count - 1]:0\] si_i;
wire \[[expr $chain_count - 1]:0\] so_i;
wire clk_i;
"
puts "
assign se_inv = ~se; "
if { $clk_ctrl_width > 1 } {
    puts "assign clk_ctrl_data = out_data\[[expr $clk_ctrl_width - 1]:0\];"
} else {
    puts "assign clk_ctrl_data = out_data\[0\];"
}
if { $OCC_IMPL_TYPE == $logicbist } {

    if { $pattern_ctr_width > 1 } {
	puts "assign pattern_ctr_data = out_data\[[expr $clk_ctrl_width + $pattern_ctr_width - 1]:$clk_ctrl_width\];"
    }
    if { $cycle_ctr_width > 1 } {
	puts "assign cycle_ctr_data = out_data\[[expr $length - 1]:[expr $length - $cycle_ctr_width]\];"
    }
}
if { $OCC_IMPL_TYPE == $logicbist } {
puts "assign clk_i = (bist_mode == 1'b0) ? clk : bist_clk;"
} elseif { $sccomp_type == $SEQCOMP } {
puts "assign clk_i = (test_mode == 1'b0) ? clk : cc_comp_clk;"
} else {
if { $cycle_ctr_width == -2 } {
    puts "assign clk_i = ~clk;"
} else {
    puts "assign clk_i = clk;"
}
}

if { $chain_count > 1 } {
    puts "assign si_i\[0\] = si\[0\];"
} else {
    puts "assign si_i\[0\] = si;"
}

if { $chain_count > 1 } {
    if { $OCC_IMPL_TYPE == $logicbist } {
puts "
assign si_i\[[expr $chain_count - 1]:1\] = (bist_mode == 1'b1 && lfsr_se == 1'b1) ?
                 so_i\[[expr $chain_count - 2]:0\] : 
                 si\[[expr $chain_count - 1]:1\];"
    } else {
puts "
assign si_i\[[expr $chain_count - 1]:1\] = si\[[expr $chain_count - 1]:1\];"
    }
}

if { $chain_count > 1 } {
    puts "assign so = so_i;"
} else {
    puts "assign so = so_i\[0\];"
}

for { set n 0 } { $n < $chain_count } {incr n} {

    if { $n < [expr $chain_count - 1] } {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${chain_length}]
	puts "
${shift_reg_base_name}_$n U_shftreg_$n (
          .clk(clk_i), 
          .s_in(si_i\[$n\]),
          .shift_n(se_inv), 
          .p_out(out_data\[[expr [expr [expr $n + 1] * $chain_length] - 1]:[expr $n * $chain_length]\]));
assign so_i\[$n\] = out_data\[[expr [expr [expr $n + 1] * $chain_length ] - 1]\];
"
    }
    if { $n == [expr $chain_count - 1] } {

# shift register with $last_chain_length
	set shift_reg_base_name [get_design_name DFT_shftreg_length${last_chain_length}]
puts "
${shift_reg_base_name}_$n U_shftreg_$n (
          .clk(clk_i), 
          .s_in(si_i\[$n\]), 
          .shift_n(se_inv), 
          .p_out(out_data\[[expr $length - 1]:[expr $length - $last_chain_length]\]));
assign so_i\[$n\] = out_data\[[expr $length - 1]\];
"
    }
}

puts "endmodule"

 } else {

################################################################
puts "
library IEEE;
use IEEE.std_logic_1164.all;
"
puts "
entity $module_name is
  port ("
puts "          clk: in std_logic;"
if { $OCC_IMPL_TYPE == $logicbist } {
puts "          bist_clk: in std_logic;"
puts "          bist_mode : in std_logic;"
puts "          lfsr_se : in std_logic;"
}
puts "          se : in std_logic;"
get_port "vhdl" "si" "in" $chain_count 0   
get_port "vhdl" "so" "out" $chain_count 0 
if {  $OCC_IMPL_TYPE == $logicbist } {  
get_port "vhdl" "pattern_ctr_data" "out" $pattern_ctr_width 0 
get_port "vhdl" "cycle_ctr_data" "out" $cycle_ctr_width 0 
}
get_port "vhdl" "clk_ctrl_data" "out" $clk_ctrl_width 1 
puts "	);
end $module_name;
"

puts "
  -- Embedded script
architecture rtl of $module_name is

-- Declaritive region

  signal se_inv : std_logic;
  signal out_data : std_logic_vector([expr $length - 1] downto 0);
  signal si_i     : std_logic_vector([expr $chain_count - 1] downto 0);
  signal so_i     : std_logic_vector([expr $chain_count - 1] downto 0);
  signal clk_i    : std_logic;
"
#shift register components 
for { set n 0 } { $n < $chain_count } {incr n} {

    if { $n < [expr $chain_count - 1] } {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${chain_length}]
puts "
  component ${shift_reg_base_name}_$n
	port
	(	clk:		in std_logic;
		s_in:		in std_logic;
		shift_n:	in std_logic;
		p_out:		out	std_logic_vector ([expr $chain_length - 1] downto 0) );
  end component;
"
    } else {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${last_chain_length}]
puts "
  component ${shift_reg_base_name}_$n
	port
	(	clk:		in std_logic;
		s_in:		in std_logic;
		shift_n:	in std_logic;
		p_out:		out	std_logic_vector ([expr $last_chain_length - 1] downto 0) );
  end component;
"
    }

}
puts "
-- Architecture body

begin
  se_inv <= NOT se;"
if { $clk_ctrl_width > 1 } {
    puts "  clk_ctrl_data <= out_data([expr $clk_ctrl_width - 1] downto 0);"
} else {
    puts "  clk_ctrl_data <= out_data(0);"
}

if { $OCC_IMPL_TYPE == $logicbist } {
    if { $pattern_ctr_width > 1 } {
	puts "    pattern_ctr_data <= out_data([expr $clk_ctrl_width + $pattern_ctr_width - 1] downto $clk_ctrl_width);"
    }
    if { $cycle_ctr_width > 1 } {
	puts "    cycle_ctr_data <= out_data([expr $length - 1] downto [expr $length - $cycle_ctr_width]);"
    }
}
if { $OCC_IMPL_TYPE == $logicbist } {
    puts "  clk_i <= clk when (bist_mode = '0') else bist_clk;"
} else {
    puts "  clk_i <= clk;"
}
if { $chain_count > 1 } {
    puts "  si_i(0) <= si(0);"
} else {
    puts "  si_i(0) <= si;"
}

if { $chain_count > 1 } {
    if { $OCC_IMPL_TYPE == $logicbist } {
puts "
    si_i([expr $chain_count - 1] downto 1) <= so_i([expr $chain_count - 2] downto 0)
      when (bist_mode='1' and lfsr_se='1') else si([expr $chain_count - 1] downto 1);"
    } else {
puts "
    si_i([expr $chain_count - 1] downto 1) <= si([expr $chain_count - 1] downto 1);"
    }
}

if { $chain_count > 1 } {
    puts "  so <= so_i;"
} else {
    puts "  so <= so_i(0);"
}

for { set n 0 } { $n < $chain_count } {incr n} {

    if { $n < [expr $chain_count - 1] } {
	set shift_reg_base_name [get_design_name DFT_shftreg_length${chain_length}]
	puts "
      U_shftreg_$n : ${shift_reg_base_name}_$n
        port map (
          clk=>clk_i, 
          s_in=>si_i($n),
          shift_n=>se_inv, 
          p_out=>out_data([expr [expr [expr $n + 1] * $chain_length] - 1] downto [expr $n * $chain_length]));
      so_i($n) <= out_data([expr [expr [expr $n + 1] * $chain_length ] - 1]);
"
    }
    if { $n == [expr $chain_count - 1] } {

# shift register with $last_chain_length
	set shift_reg_base_name [get_design_name DFT_shftreg_length${last_chain_length}]
puts "
      U_shftreg_$n : ${shift_reg_base_name}_$n
        port map(
          clk=>clk_i, 
          s_in=>si_i($n), 
          shift_n=>se_inv, 
          p_out=>out_data([expr $length - 1] downto [expr $length - $last_chain_length]));
      so_i($n) <= out_data([expr $length - 1]);
"
    }
}

puts "end rtl;"
}
