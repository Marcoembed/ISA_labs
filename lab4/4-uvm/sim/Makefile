COMP= vlog -svinputport=relaxed
SIM= vsim -c -voptargs=+acc
SIM_GUI= vsim -voptargs=+acc
DO= -do sim.do -do wave.do
COV_FPM= -do fpm.do -do report-cov-fpm.do
COV_MBE= -do mbe.do -do report-cov-mbe.do
SUPPRESS= -suppress 3999
ADD= ADD
MBE= MBE
FPM= FPM
TOP= -sv ../tb/top.sv
DEFINE= +define+
PKGS= $(shell find ../src/ -name '*pkg*')
DPI= -sv ../tb/fpm/FF16_ops.c

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all: add mbe fpm	## Compile and Simulate all: add, mbe, fpm

add: clean	## Compile and Simulate ADDER
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=100 ${DEFINE}${ADD} ${TOP}
	@${SIM} ${SUPPRESS} ${DO} top

mbe: clean	## Compile and Simulate BOOTH MULTIPLIER
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=100 ${DEFINE}${MBE} ${TOP}
	@${SIM} ${SUPPRESS} ${COV_MBE} top

fpm: clean	## Compile and Simulate FPU MULTIPLIER
	@${COMP} ${DPI}
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=1000 ${DEFINE}${FPM} ${TOP}
	@${SIM} ${SUPPRESS} ${COV_FPM} top

add_gui: clean	## Compile and Simulate with GUI ADDER
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=100 ${DEFINE}${ADD} ${TOP}
	@${SIM_GUI} ${SUPPRESS} ${DO} top

mbe_gui: clean	## Compile and Simulate with GUI BOOTH MULTIPLIER
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=100 ${DEFINE}${MBE} ${TOP}
	@${SIM_GUI} ${SUPPRESS} ${COV_MBE} top

fpm_gui: clean	## Compile and Simulate with GUI FPU MULTIPLIER
	@${COMP} ${DPI}
	@${COMP} ${PKGS}
	@${COMP} ${DEFINE}N_CYCLES=1000 ${DEFINE}${FPM} ${TOP}
	@${SIM_GUI} ${SUPPRESS} ${COV_FPM} top

clean:		## Delete work folder
	@if [ -d "/path/to/directory" ]; then \
		echo "Work dir removed"; \
	else \
		echo "Work does not exist"; \
	fi
