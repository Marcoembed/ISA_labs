#!/bin/bash

source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work

vlog -work work ../src/riscv_pkg.sv
vcom -work work ../tb/clk_gen.vhd

vlog -work work ../src/obi_intf.sv
vlog -work ./work ../netlist/riscv.v
vlog -work ./work ../tb/tb_post_syn.sv

## NOTE: the memory has no timing annotation, thus sdf simulation is not possible as sdf symbols have no match in the memory verilog model
vsim   -L ../sim/mem_wrap -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_post_syn -suppress 3009