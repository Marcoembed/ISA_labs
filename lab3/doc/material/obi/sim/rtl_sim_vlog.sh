#!/bin/bash

rm -rf work
vlib work

#rm -rf mem_wrap
#vlib mem_wrap

tres="ps"

#vcom -work mem_wrap -nodebug ../src/mem_wrap_fake2.0.vhd

vcom -work work ../tb/req_gen.vhd
vcom -work work ../tb/req_gen_fast.vhd

vcom -work work ../tb/clk_gen.vhd
vcom -work work ../tb/data_dumper.vhd
vlog -work work ../tb/tb_mem_wrap_fake.v

vsim -t ${tres} -L ./mem_wrap -do wave2.0.do work.tb_mem_wrap_fake -voptargs=+acc
