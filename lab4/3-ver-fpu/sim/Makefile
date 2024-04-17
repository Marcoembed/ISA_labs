COMP= vlog -svinputport=relaxed
SIM= vsim -c -voptargs=+acc
SIM_GUI= vsim -voptargs=+acc
DO= -do sim.do
SUPPRESS= -suppress 3999
TOP= -sv ../tb/alu_tb.sv
DEFINE= +define+
PKGS= $(shell find ../src/ -name '*pkg*')
DPI= -sv ../tb/FF16_ops.c

help:   ## Show this help.
	@echo "Makefile help"
	@echo "usage: make [OPTIONS]"
	@echo
	@echo "OPTIONS:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


fpm: clean	## Compile and Simulate FPU
	@${COMP} ${DPI}
	@${COMP} ${PKGS}
	@ vlog ../src/booth.sv
	@ vlog ../src/dadda.sv
	@ vlog ../src/fa.sv
	@ vlog ../src/fpnew_classifier.sv
	@ vlog ../src/fpnew_fma.sv
	@ vlog ../src/fpnew_opgroup_block.sv
	@ vlog ../src/fpnew_opgroup_fmt_slice.sv
	@ vlog ../src/fpnew_rounding.sv
	@ vlog ../src/fpnew_top.sv
	@ vlog ../src/ha.sv
	@ vlog ../src/lzc.sv
	@ vlog ../src/multiplier.sv
	@ vlog ../src/rr_arb_tree.sv
	@ vlog ../tb/alu_if.sv
	@ vlog ../tb/alu_tb.sv
	@ vlog ../tb/alu_wrap.sv
	@ vsim -c -voptargs=+acc -sv_seed random -do sim.do alu_tb

fpm_gui: clean	## Compile and Simulate with GUI FPU
	@${COMP} ${DPI}
	@${COMP} ${PKGS}
	@ vlog ../src/booth.sv
	@ vlog ../src/dadda.sv
	@ vlog ../src/fa.sv
	@ vlog ../src/fpnew_classifier.sv
	@ vlog ../src/fpnew_fma.sv
	@ vlog ../src/fpnew_opgroup_block.sv
	@ vlog ../src/fpnew_opgroup_fmt_slice.sv
	@ vlog ../src/fpnew_rounding.sv
	@ vlog ../src/fpnew_top.sv
	@ vlog ../src/ha.sv
	@ vlog ../src/lzc.sv
	@ vlog ../src/multiplier.sv
	@ vlog ../src/rr_arb_tree.sv
	@ vlog ../tb/alu_if.sv
	@ vlog ../tb/alu_tb.sv
	@ vlog ../tb/alu_wrap.sv
	@ vsim  -voptargs=+acc -sv_seed random -do sim.do alu_tb

clean:		## Delete work folder
	@if [ -d "/path/to/directory" ]; then \
		echo "Work dir removed"; \
	else \
		echo "Work does not exist"; \
	fi