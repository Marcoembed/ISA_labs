#!/bin/bash

port=10038
user="isa01_2023_2024"
host="led-x3850-2.polito.it"
lab="lab1-filters"
path="/home/"$user"/renato/ISA_labs/"$lab
com="scp -P "$port" "$user"@"$host":"$path

files[0]="/src/iir_pkg.vhd"
files[1]="/src/reg.vhd"
files[2]="/src/adv_iir.vhd"
files[3]="/tb/data_sink.vhd"
files[4]="/tb/data_maker_adv.vhd"
files[5]="/tb/clk_gen.vhd"
files[6]="/tb/tb_adv_iir.v"
files[7]="/sim/power.sh"
files[8]="/sim/power.tcl"
files[9]="/syn/power2.tcl"

for file in "${files[@]}"; do
    
    comando=$com$file" ."$file
    $comando

done


