#!/bin/bash

rm -rf work
vlib work

#rm -rf mem_wrap
#vlib mem_wrap

tres="ps"

#vcom -work mem_wrap -nodebug ../src/mem_wrap_fake2.0.vhd

vlog -work work ../tb/riscv_pkg.sv
vlog -work work ../tb/fetcher.sv
vlog -work work ../tb/obi_intf.sv

vcom -work work ../tb/clk_gen.vhd
vcom -work work ../tb/data_dumper.vhd
vlog -work work ../tb/tb.sv

vsim -t ${tres} -L ./mem_wrap -do wave2.0.do work.tb -voptargs=+acc
