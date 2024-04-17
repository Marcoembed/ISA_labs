COMP= vlog -svinputport=relaxed
SIM= vsim -c -voptargs=+acc -sv_seed random
SIM_GUI= vsim -voptargs=+acc -sv_seed random
DO= -do sim.do
CYCLES=100
TB= ../tb/compile_VLOG.f
SRC= ../src/compile_VLOG.f
TOP= alu_tb
DPI= ../tb/FF16_ops.c

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


fpm: clean	## Compile and Simulate FPU
	@${COMP} ${DPI}
	${COMP} -F ${SRC}
	${COMP} -F ${TB}
	${SIM} ${DO} ${TOP} +n${CYCLES}

fpm_gui: clean	## Compile and Simulate with GUI FPU
	@${COMP} ${DPI}
	${COMP} -F ${SRC}
	${COMP} -F ${TB}
	${SIM_GUI} ${DO} ${TOP} +n${CYCLES}

clean:		## Delete work folder
	@if [ -d "/path/to/directory" ]; then \
		echo "Work dir removed"; \
	else \
		echo "Work does not exist"; \
	fi
