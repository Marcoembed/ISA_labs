#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work


vcom -work work -F compile_VHDL.f 
vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work work -svinputport=relaxed -F compile_VLOG.f

#vlog -work ./work ../src/riscv_top.sv
vlog -work ./work ../netlist/riscv_top.v

vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v
vlog -work ./work ../tb/tb_post_syn_real.sv


## NOTE: the memory has no timing annotation, thus sdf simulation is not possible as sdf symbols have no match in the memory verilog model
vsim  -t ps -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_post_syn_real -suppress 3009 -do wave_top.do -voptargs=+acc 

