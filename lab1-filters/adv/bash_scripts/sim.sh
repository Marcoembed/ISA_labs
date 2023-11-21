###############################################################
##########   Adding modelsim to path                 ##########
###############################################################
source /eda/scripts/init_questa_core_prime
cd ../sim
###############################################################
##########   Making work directory                   ##########
###############################################################
rm -rf work
vlib work

###############################################################
##########   Compiling all VHDL and VERILOG files    ##########
###############################################################
vcom -work work ../src/iir_pkg.vhd 
vcom -work work ../src/reg.vhd 
vcom -work work ../tb/clk_gen.vhd 
vcom -work work ../src/iir.vhd 
vcom -work work ../tb/data_maker.vhd 
vcom -work work ../tb/data_sink.vhd 
vlog -work work ../tb/tb_iir.v 

###############################################################
##########   Run Modelsim GUI, add waves, run sim    ##########
###############################################################
vsim -c work.tb_iir -voptargs=+acc -do sim.tcl

cd -


