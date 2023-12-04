#!/bin/bash

rm -rf work
vlib work

vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v

vlog -work ./work ../netlist/mem_test.v

vcom -93 -work ./work ../tb/tb_mem_test.vhd

## NOTE: the memory has no timing annotation, thus sdf simulation is not possible as sdf symbols have no match in the memory verilog model
vsim -do simulate.do -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_mem_test
