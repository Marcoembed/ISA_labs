# Makefile for module compilation and simulation -- ModelSim

# Variables

SHELL		:=bash
VCOM 		= vcom -2008 -work work
VLOG 		= vlog -work work
VSIM 		= vsim 
WORK_LIB	= work
VSIM_FLAGS 	= -do
NOGUI		= -c
SRC_DIR		= src
TB_DIR		= tb
#TCL			= $(wildcard ./script.tcl)
TESTBENCH   = $(wildcard ../$(TB_DIR)/tb_fpnew_top_rtl.sv)
TB			= $(notdir $(basename $(TESTBENCH)))

MODULES	= $(shell cat prj.txt)

# Recipe

all: comp sim

comp: $(MODULES)

# Compilation rules
%.vhd %.vhdl:
	@echo 
	@echo "#################################################"
	@echo "#####	Compiling File: $@"
	@echo "#################################################" 
	@echo 
	$(VCOM) ../$(TB_DIR)/$@; 

%.v %.sv:
	@echo 
	@echo "#################################################"
	@echo "#####	Compiling File: $@"
	@echo "#################################################" 
	@echo 
	if [[ $@ == tb_fpnew_top_rtl.sv ]]; then \
		$(VLOG) ../$(TB_DIR)/$@; \
	else \
		$(VLOG) ../$(SRC_DIR)/$@; \
	fi

	@echo "Done"

sim:
	@echo "Starting simulation ..."
	#$(VSIM) $(NOGUI) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL) ### NO GUI ###
	$(VSIM) $(NOGUI) $(WORK_LIB).$(TB) 

.PHONY: all comp sim
