#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

tres="ps"

ls ../src/*.sv | grep -vE 'riscv_top.sv|riscv_pkg.sv' > compile_VLOG.f
ls ../tb/tb_fake.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f

vcom -work work  -F compile_VHDL.f
vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv

# Uncomment to perform post-synthesis simulation
#vlog -work work -svinputport=relaxed ../netlist/riscv_core.v

vlog -work work -svinputport=relaxed -F compile_VLOG.f
vsim -t ${tres} -L ./mem_wrap -do wave2.do work.tb_fake -voptargs=+acc -suppress 3009
