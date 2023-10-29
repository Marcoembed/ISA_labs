# Synthesis script
# The logical synthesis process can be divided into the following steps:
# 1 reading source files;
# 2 applying constraints;
# 3 start the synthesis;
# 4 save the results;

proc listFromFile {filename} {
    set f [open $filename r]
    set data [split [string trim [read $f]]]
    close $f
    return $data
}

set TOP_LVL_ENTITY "CFG_IIR_BEHAV"

set VHDL_COMPILE_FILE "./src/compile_VHDL.f"
set VLOG_COMPILE_FILE "./src/compile_VLOG.f"

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
# 2 reading source files
################################################################################
