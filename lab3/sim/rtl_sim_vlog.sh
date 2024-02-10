#!/bin/bash

rm -rf work
vlib work

#rm -rf mem_wrap
#vlib mem_wrap

tres="ps"

#vcom -work mem_wrap -nodebug ../src/mem_wrap_fake2.0.vhd

ls ../src/*.sv > compile_VLOG.f
ls ../tb/*.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f

vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work work -svinputport=relaxed -F compile_VLOG.f
vcom -work work  -F compile_VHDL.f

vsim -t ${tres} -L ./mem_wrap -do wave2.0.do work.tb -voptargs=+acc