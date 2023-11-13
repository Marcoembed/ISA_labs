source /eda/scripts/init_design_vision
source /eda/scripts/init_questa_core_prime

rm -rf work
vlib work
vcom -work ./work ../tb/*.vhd
vlog -work ./work ../netlist/iir.v
vlog -work ./work ../tb/tb_iir.v
rm -rf ../vcd
rm -rf ../saif
mkdir ../saif
mkdir ../vcd

vsim -c -do power.tcl

vcd2saif -input ../vcd/myiir_syn.vcd -output ../saif/myiir_syn.saif

cd ../syn/
dc_shell-xg-t -f power2.tcl
