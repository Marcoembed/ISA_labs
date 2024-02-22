#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

ls ../src/*.sv | grep -vE 'riscv_top.sv|riscv_pkg.sv' > compile_VLOG.f
ls ../tb/tb_mem_real.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f

vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v

vcom -work work  -F compile_VHDL.f
vlog -work work -svinputport=relaxed -F compile_VLOG.f

vsim  -t ps -do wave_real_mem.do work.tb_mem_real -voptargs=+acc -suppress 3009
