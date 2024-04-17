# Makefile, alternative to do.sh script using make command.
#
SCRIPT= ./do.sh
INIT= init
CLEAN= clean
ELA= ela
SIM_GUI= sim gui
SIM= sim
SYN= syn
SSH= shell
SSH_GUI= shell_gui
PUSH= push
USAGE= usage

# If the first argument is "push", "sim", or "sim_gui" takes also a second variable
ifeq (push,$(firstword $(MAKECMDGOALS)))
  ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(ARGS):;@:)
endif

# RECIPE

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo "For more details, run do.sh --help:"

all:	## Build all: init, ela, sim, syn
	@${SCRIPT} ${INIT}
	@${SCRIPT} ${ELA}
	@${SCRIPT} ${SIM_GUI}
	@${SCRIPT} ${SYN}

clean:	## clean repo
	@${SCRIPT} ${CLEAN}

init:	## directory file initialization: creation of "do" files and "compile" files
	@echo "File initialization..."
	@${SCRIPT} ${INIT}
	@echo "Done"

comp:	## Compile all vhdl, verilog and systemVerilog files in src/ and tb/ directories
	@${SCRIPT} ${ELA}

sim:	## Simulate the design with modelsim, shell interface
	@${SCRIPT} ${SIM}

sim_gui:## Simulate the design with modelsim, GUI
	@${SCRIPT} ${SIM_GUI}

syn:	## Synthetize the design with design vision 
	@${SCRIPT} ${SYN}

push:	## Push files/directories to the server, you can specify the file/directory (e.g. make push file.txt)
	@echo
	@${SCRIPT} ${PUSH} ${ARGS}

shell:	## SSH server connection 
	@echo
	${SCRIPT} ${SSH} 

shell_gui:	## SSH server connection 
	@echo
	${SCRIPT} ${SSH_GUI} 

.PHONY: help usage all comp sim sim_gui syn push shell shell_gui