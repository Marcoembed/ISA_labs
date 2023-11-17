#!/bin/bash

rm -rf work
rm -rf ../syn/work
source /eda/scripts/init_questa_core_prime
source /eda/scripts/init_design_vision
vlib work
vcom -work ./work ../src/iir_pkg.vhd
vcom -work ./work ../src/reg.vhd
vcom -work ./work ../tb/adv_clk_gen.vhd
vcom -work ./work ../tb/data_maker_adv.vhd
vcom -work ./work ../tb/data_sink_adv.vhd
vcom -work ./work ../src/adv_iir.vhd
#vlog -work ./work ../netlist/adv_iir.v
vlog -work ./work ../tb/tb_adv_iir.v
rm -rf ../adv_vcd
rm -rf ../adv_saif
mkdir ../adv_saif
mkdir ../adv_vcd

vsim -c -do adv_power.tcl

vcd2saif -input ../adv_vcd/adv_myiir_syn.vcd -output ../adv_saif/adv_myiir_syn.saif

cd ../syn/
dc_shell-xg-t -f adv_power2.tcl
