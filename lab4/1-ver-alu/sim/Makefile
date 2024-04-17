COMP= vlog -F 
SIM= vsim -c -voptargs=+acc -sv_seed random
SIM_GUI= vsim -voptargs=+acc -sv_seed random
DO= -do sim.do
CYCLES= 100
TB= ../tb/compile_VLOG.f
SRC= ../src/compile_VLOG.f
TOP= alu_tb

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


alu: clean	## Compile and Simulate ALU
	${COMP} ${SRC}
	${COMP} ${TB}
	${SIM} ${DO} ${TOP} +n${CYCLES}

alu_gui: clean	## Compile and Simulate with GUI ALU
	${COMP} ${SRC}
	${COMP} ${TB}
	${SIM_GUI} ${DO} ${TOP} +n${CYCLES}

clean:		## Delete work folder
	@if [ -d "./work" ]; then \
		echo "Work dir removed"; \
	else \
		echo "Work does not exist"; \
	fi
