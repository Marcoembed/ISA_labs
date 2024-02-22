#
## Global variables
source .synopsys_dc.setup
set TOP_LVL_ENTITY "riscv_top"
#
## The logical synthesis process can be divided into the following steps:
## 1 reading source files;
## 2 applying constraints;
## 3 start the synthesis;
## 4 save the results;
#
#################################################################################
## 1 reading source files
#################################################################################
#

# Analyze the src files, with params:
# -format the format of files that will be analyzed
# -work work directory library where to put and find file

set file_handle [open "compile_VLOG.f" r]
set sources [split [read $file_handle] "\n"]
close $file_handle

foreach file_el $sources {
    analyze -work WORK -format "SVERILOG" $file_el
}

# Preserve rtl names in the netlist to ease the procedure for power consumption estimation.
set power_preserve_rtl_hier_names true

# Elaborate design, with params:
# top level entity to elaborate
# -work work directory library where to put and find files
# -update Reanalyzes out-of-date intermediate files if the source can be found.
# [opt] -arch <architecture_name> specify the architecture name, don't need
#   since we use configuratoins
#   -parameters {list of generic assignments if any}
elaborate $TOP_LVL_ENTITY -lib WORK

# If the design contains multiple instances of the same entity you can issue the uniquify command.
# This will reuse the same entity insetead of creating new ones with the same port
# https://github.com/ucb-bar/chisel2-deprecated/issues/374
uniquify

# Resolve the design reference based on reference names
# Locate all design and library components and link them to the references in the design
link

################################################################################
# 2 applying constraints
################################################################################

# Bind the clock constraint (named MY_CLK) to the internal signal of the architecture (called CLK)
# use a 10.0 ns period clock => 100MHz
#

#TEST clock = 0 TODO
create_clock -name MY_CLK -period 1.35 CLK 

# SLACK MET
#
# clk is a special signal so don't touch it in synthesis
set dont_touch_network MY_CLK
# simulate jitter of clk with uncertainty
set_clock_uncertainty 0.07 [get_clocks MY_CLK]

set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] CLK]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OUTPUT_LOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OUTPUT_LOAD [all_outputs]

# Removes a level of hierarchy TODO: check what it does
#-all   Indicates that all  cells  in  the  current  design  or  current instance  are  to be ungrouped.  You must specify either -all or cell_list but not both.
#-flatten Indicates that the specified cell and all of its subcells are to be  exploded  recursively  until  all  levels  of  hierarchy are removed.
#ungroup -all -flatten

#  Checks the current design for consistency. TODO: check what it does
check_design

################################################################################
# 3 Start synthesis
################################################################################
compile_ultra


# apply clock gating on FLIP-FLOPS with enable signal
#compile -gate_clock

change_names -hierarchy -rules verilog

report_area > ../RISCV_rep/report_area_top 
report_timing > ../RISCV_rep/report_timing_top

write_sdf ../netlist/riscv_top.sdf 
write_sdc ../netlist/riscv_top.sdc 
write -f verilog -hierarchy -output ../netlist/riscv_top.v

exit
