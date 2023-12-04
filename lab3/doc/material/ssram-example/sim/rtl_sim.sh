#!/bin/bash

rm -rf work
vlib work

vlog -work ./work ../sram_32_1024_freepdk45/sram_32_1024_freepdk45.v

vcom -93 -work ./work ../src/mem_test.vhd

vcom -93 -work ./work ../tb/tb_mem_test.vhd

vsim -do simulate.do work.tb_mem_test
