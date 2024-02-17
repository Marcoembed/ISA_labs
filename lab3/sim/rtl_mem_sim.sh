#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

ls ../src/*.sv > compile_VLOG.f
ls ../tb/*.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f

vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v

vlog -work work -svinputport=relaxed -F compile_VLOG.f
vcom -work work  -F compile_VHDL.f


#vcom -93 -work ./work ../src/mem_test.vhd
#vcom -93 -work ./work ../tb/tb_mem_test.vhd

#vsim -do simulate.do work.tb_mem_test

vsim -t ps -do wave2.do work.tb_mem_real -voptargs=+acc
