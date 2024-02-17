#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v

vlog -work ./work ../netlist/RISCV.v

vcom -93 -work ./work ../tb/tb_mem_real.sv


## NOTE: the memory has no timing annotation, thus sdf simulation is not possible as sdf symbols have no match in the memory verilog model
vsim -do wave2.do -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_mem_real

