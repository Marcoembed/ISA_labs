# Makefile for module compilation and simulation -- ModelSim

# Variables

SHELL				:=bash
VCOM				= vcom -2008 -autoorder 
VLOG 				= vlog 			
VSIM 				= vsim 
WORK_LIB			= work
VSIM_FLAGS 			= -do
NOGUI				= -c
SRC_DIR				= src
TB_DIR				= tb
TCL					= $(wildcard ./script.tcl)
TESTBENCH			= $(wildcard ../../$(TB_DIR)/tb_iir.v)
TESTBENCH_ADV   	= $(wildcard ../../$(TB_DIR)/tb_adv_iir.v)
TB					= $(notdir $(basename $(TESTBENCH_ADV))) 	# TESTBENCH_ADV | TESTBENCH

TB_VHDL_FILES		= $(wildcard ../../$(TB_DIR)/*.vhd) $(wildcard ../../$(TB_DIR)/*.vhdl)
TB_VERILOG_FILES	= $(wildcard ../../$(TB_DIR)/*.v)
VHDL_FILES			= $(wildcard ../../$(SRC_DIR)/*.vhd) $(wildcard ../../$(SRC_DIR)/*.vhdl)
VERILOG_FILES		= $(wildcard ../../$(SRC_DIR)/*.v)

# Recipe

all: comp sim

comp:
	@echo
	@echo "Starting compilation ..."
	@echo "SRC: verilog | sytemVerilog files: $(VERILOG_FILES)"
	@echo "SRC: vhdl files: $(VHDL_FILES)"
	@echo
	@if [ -z "$(VERILOG_FILES)" ]; then \
		echo "There's no verilog | systemVerilog files"; \
	else \
		$(VLOG) $(VERILOG_FILES); \
	fi
	@if [ -z "$(VHDL_FILES)" ]; then \
		echo "There's no vhdl file"; \
	else \
		$(VCOM) $(VHDL_FILES); \
	fi
	@echo
	@echo "TB: verilog | sytemVerilog files: $(TB_VERILOG_FILES)"
	@echo "TB: vhdl files: $(TB_VHDL_FILES)"
	@echo
	@if [ -z "$(TB_VHDL_FILES)" ]; then \
		echo "There's no vhdl file"; \
	else \
		$(VCOM) $(TB_VHDL_FILES); \
	fi
	@if [ -z "$(TB_VERILOG_FILES)" ]; then \
		echo "There's no verilog | systemVerilog files"; \
	else \
		$(VLOG) $(TB_VERILOG_FILES); \
	fi
	@echo
	@echo "Done"
	@echo

sim:
	@echo "Starting simulation ..."
	$(VSIM) $(NOGUI) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL) ### NO GUI ###
	#$(VSIM) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL)

.PHONY: all comp sim
