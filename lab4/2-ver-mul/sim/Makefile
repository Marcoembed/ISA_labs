COMP= vlog -svinputport=relaxed
SIM= vsim -c -voptargs=+acc
SIM_GUI= vsim -voptargs=+acc
DO= -do sim.do
SUPPRESS= -suppress 3999
TOP= -sv ../tb/alu_tb.sv
DEFINE= +define+
PKGS= $(shell find ../src/ -name '*pkg*')

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


mbe: clean	## Compile and Simulate MBE
	@ vlog ../src/alu_pkg.sv
	@ vlog ../src/alu.sv
	@ vlog ../src/booth_pkg.sv
	@ vlog ../src/booth.sv
	@ vlog ../src/dadda.sv
	@ vlog ../src/fa.sv
	@ vlog ../src/ha.sv
	@ vlog ../src/multiplier.sv
	@ vlog ../tb/alu_cov.svh
	@ vlog ../tb/alu_if.sv
	@ vlog ../tb/alu_op_verbose_tester.svh
	@ vlog ../tb/alu_tb.sv
	@ vlog ../tb/alu_tester.svh
	@ vlog ../tb/alu_verbose_tester.svh
	@ vlog ../tb/alu_wrap.sv
	@ vlog ../tb/mul_wrap.sv
	@ vsim -c -voptargs=+acc -sv_seed random -do sim.do alu_tb +n1000

mbe_gui: clean	## Compile and Simulate with GUI MBE
	@ vlog ../src/alu_pkg.sv
	@ vlog ../src/alu.sv
	@ vlog ../src/booth_pkg.sv
	@ vlog ../src/booth.sv
	@ vlog ../src/dadda.sv
	@ vlog ../src/fa.sv
	@ vlog ../src/ha.sv
	@ vlog ../src/multiplier.sv
	@ vlog ../tb/alu_cov.svh
	@ vlog ../tb/alu_if.sv
	@ vlog ../tb/alu_op_verbose_tester.svh
	@ vlog ../tb/alu_tb.sv
	@ vlog ../tb/alu_tester.svh
	@ vlog ../tb/alu_verbose_tester.svh
	@ vlog ../tb/alu_wrap.sv
	@ vlog ../tb/mul_wrap.sv
	@ vsim  -voptargs=+acc -sv_seed random -do sim.do alu_tb +n1000

clean:		## Delete work folder
	@if [ -d "/path/to/directory" ]; then \
		echo "Work dir removed"; \
	else \
		echo "Work does not exist"; \
	fi
