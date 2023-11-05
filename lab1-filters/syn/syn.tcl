# Synthesis script
# ##############################################################################

# Handy functions
# https://stackoverflow.com/questions/18219420/how-to-convert-a-file-to-a-tcl-list
proc listFromFile {filename} {
    set f [open $filename r]
    set data [split [string trim [read $f]]]
    close $f
    return $data
}

# Global variables
set TOP_LVL_ENTITY "CFG_IIR_BEHAV"
set VHDL_COMPILE_FILE "./src/compile_VHDL.f"
set VLOG_COMPILE_FILE "./src/compile_VLOG.f"

# The logical synthesis process can be divided into the following steps:
# 1 reading source files;
# 2 applying constraints;
# 3 start the synthesis;
# 4 save the results;

################################################################################
# 1 reading source files
################################################################################

set vhdl_srcs [listFromFile $VHDL_COMPILE_FILE]
set vlog_srcs [listFromFile $VLOG_COMPILE_FILE]

# Analyze the src files, with params:
# -format the format of files that will be analyzed
# -work work directory library where to put and find files
analyze -work WORK -format VHDL $vhdl_srcs 
analyze -work WORK -format Verilog $vlog_srcs 

# Preserve rtl names in the netlist to ease the procedure for power consumption estimation.
set power_preserve_rtl_hier_names true

# Elaborate design, with params:
# top level entity to elaborate
# -work work directory library where to put and find files
# -update Reanalyzes out-of-date intermediate files if the source can be found.
# [opt] -arch <architecture_name> specify the architecture name, don't need
#	since we use configuratoins
#	-parameters {list of generic assignments if any}
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
create_clock -name MY_CLK -period 3.00 CLK
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
ungroup -all -flatten

#  Checks the current design for consistency. TODO: check what it does
check_design

################################################################################
# 3 Start synthesis
################################################################################
compile
# apply clock gating on FLIP-FLOPS with enable signal
compile -gate clock

change_names -hierarchy -rules verilog
report_area > ./reports/iir_area.txt
report_timing > ./reports/iir_timing.txt
write_sdf ./netlist/myiir.sdf 
write_sdc ./netlist/myiir.sdc 
write -f verilog -hierarchy -output ./netlist/iir.v
exit
