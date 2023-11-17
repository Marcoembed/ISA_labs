#!/bin/bash

port=10038
user="isa01_2023_2024"
host="led-x3850-2.polito.it"
lab="lab1-filters"
name="renato"
path="/home/"$user"/$name/ISA_labs/"$lab
com="scp -P "$port" "$user"@"$host":"$path

files[0]="/src/iir_pkg.vhd"
files[1]="/src/reg.vhd"
files[2]="/src/adv_iir.vhd"
files[3]="/src/iir.vhd"
files[4]="/tb/data_sink.vhd"
files[5]="/tb/data_sink_adv.vhd"
files[6]="/tb/data_maker_adv.vhd"
files[7]="/tb/adv_clk_gen.vhd"
files[8]="/tb/tb_adv_iir.v"
files[9]="/sim/adv_power.sh"
files[10]="/sim/artifacts.tar.gz"
files[11]="/sim/log1"
files[12]="/sim/mini_script_adv.sh"
files[13]="/sim/mini_script_basic.sh"
files[14]="/sim/transcript"
files[15]="/sim/vsim.wlf"
files[16]="/sim/adv_power.tcl"
files[17]="/syn/adv_power2.tcl"


for file in "${files[@]}"; do
    
    comando=$com$file" ."$file
    $comando

done


