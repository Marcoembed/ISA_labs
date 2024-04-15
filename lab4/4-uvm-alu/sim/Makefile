COMP= vlog -sv
SIM= vsim
ADD= ADD
MBE= MBE
FPM= FPM
TOP= ../tb/top.sv
DEFINE= +define+
RUN= run 4us

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
	@${SIM} ${TOP}
	@${RUN}

mbe:	## Compile and Simulate BOOTH MULTIPLIER
	@${COMP} ${DEFINE}${MBE} ${TOP}
	@${SIM} ${TOP}
	@${RUN}

fpm:	## Compile and Simulate FPU MULTIPLIER
	@${COMP} ${DEFINE}${FPM} ${TOP}
	@${SIM} ${TOP}
	@${RUN}
