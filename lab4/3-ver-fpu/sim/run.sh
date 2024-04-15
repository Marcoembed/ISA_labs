#!/bin/bash
vlog -sv ../tb/FF16_ops.c
vlog -f compile_VLOG.F
vsim  -voptargs=+acc -sv_seed random -do sim.do alu_tb
exit 0