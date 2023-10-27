# Makefile for module compilation and simulation -- ModelSim

# Variables

VLOG 		= vlog 			
VCOM		= vcom -2008 -autoorder 
VSIM 		= vsim 
WORK_LIB	= work
VSIM_FLAGS 	= -do
NOGUI		= -c
SRC_DIR		= hdl
TCL			= $(wildcard ./script.tcl)
TESTBENCH   = $(wildcard ../$(SRC_DIR)/tb_*)
TB			= $(notdir $(basename $(TESTBENCH)))

VHDL_FILES		= $(wildcard ../$(SRC_DIR)/*.vhd)
VERILOG_FILES	= $(wildcard ../$(SRC_DIR)/*.v)

# Recipe

all: comp sim

comp:
	@echo "Starting compilation ..."
	@echo $(VERILOG_FILES)
	$(VLOG) $(VERILOG_FILES)
	$(VCOM) $(VHDL_FILES)
	@echo "Done"

sim:
	@echo "Starting simulation ..."
	#$(VSIM) $(NOGUI) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL) ### NO GUI ###
	$(VSIM) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL)

.PHONY: all comp sim
