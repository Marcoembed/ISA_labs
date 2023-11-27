# Makefile for module compilation and simulation -- ModelSim

# Variables

SHELL		:=bash
VCOM 		= vcom -2008
VLOG 		= vlog
VSIM 		= vsim 
WORK_LIB	= work
VSIM_FLAGS 	= -do
NOGUI		= -c
SRC_DIR		= src
TB_DIR		= tb
#TCL			= $(wildcard ./script.tcl)
#TESTBENCH   = $(wildcard ../$(SRC_DIR)/tb_*)
#TB			= $(notdir $(basename $(TESTBENCH)))

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
	#if [[ $@ == tb_* ]]; then \
	#	$(VCOM) ../$(TB_DIR)/$@ \
	#else \
	#	$(VCOM) ../$(SRC_DIR)/$@
	#fi
	$(VCOM) ../$(TB_DIR)/$@

%.v %.sv:
	@echo 
	@echo "#################################################"
	@echo "#####	Compiling File: $@"
	@echo "#################################################" 
	@echo 
	if [[ $@ == tb_* ]]; then \
		$(VLOG) ../$(TB_DIR)/$@; \
	else \
		$(VLOG) ../$(SRC_DIR)/$@; \
	fi
	#$(VLOG) ../$(SRC_DIR)/$@

	@echo "Done"

#sim:
#	@echo "Starting simulation ..."
#	#$(VSIM) $(NOGUI) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL) ### NO GUI ###
#	$(VSIM) $(WORK_LIB).$(TB) $(VSIM_FLAGS) $(TCL)

.PHONY: all comp #sim
