#!/bin/bash

port=10038
user="isa01_2023_2024"
host="led-x3850-2.polito.it"
lab="lab1-filters"
name="matteo"
path="/home/"$user"/$name/ISA_labs/"$lab
com="scp -P "$port" "$user"@"$host":"$path

files[0]="/src/iir_pkg.vhd"
files[1]="/src/reg.vhd"
files[2]="/src/adv_iir.vhd"
files[]="/src/iir.vhd"
files[]="/tb/data_sink.vhd"
files[]="/tb/data_sink_adv.vhd"
files[]="/tb/data_maker_adv.vhd"
files[]="/tb/clk_gen.vhd"
files[]="/tb/tb_adv_iir.v"
files[]="/sim/power.sh"
files[]="/sim/artifacts.tar.gz"
files[]="/sim/log1"
files[]="/sim/mini_script_adv.sh"
files[]="/sim/mini_script_basic.sh"
files[]="/sim/transcript"
files[]="/sim/vsim.wlf"
files[]="/sim/power.tcl"
files[]="/syn/power2.tcl"


for file in "${files[@]}"; do
    
    comando=$com$file" ."$file
    $comando

done


