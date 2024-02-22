#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

#rm -rf mem_wrap
#vlib mem_wrap

tres="ps"

#vcom -work mem_wrap -nodebug ../src/mem_wrap_fake2.0.vhd

ls ../src/*.sv | grep -vE 'riscv_top.sv|riscv_pkg.sv' > compile_VLOG.f
ls ../tb/tb.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f

vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work work -svinputport=relaxed -F compile_VLOG.f
vcom -work work  -F compile_VHDL.f

vsim -c  -t ${tres} -L ./mem_wrap -do wave2.do work.tb -voptargs=+acc
