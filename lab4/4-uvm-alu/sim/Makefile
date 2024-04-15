COMP= vlog
SIM= vsim -c -do sim.do
ADD= ADD
MBE= MBE
FPM= FPM
TOP= -sv ../tb/top.sv
DEFINE= +define+

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

all:	## Compile and Simulate all: add, mbe, fpm
	add
	mbe
	fpm

add:	## Compile and Simulate ADDER
	@${COMP} ${DEFINE}${ADD} ${TOP}
	@${SIM} top

mbe:	## Compile and Simulate BOOTH MULTIPLIER
	@${COMP} ${DEFINE}${MBE} ${TOP}
	@${SIM} top

fpm:	## Compile and Simulate FPU MULTIPLIER
	@${COMP} ${DEFINE}${FPM} ${TOP}
	@${SIM} top
