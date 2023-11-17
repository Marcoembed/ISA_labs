###############################################################
##########   Adding modelsim to path                 ##########
###############################################################
source /eda/scripts/init_questa_core_prime

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
vcom -work work ../tb/adv_clk_gen.vhd 
vcom -work work ../src/adv_iir.vhd 
vcom -work work ../tb/data_maker_adv.vhd 
vcom -work work ../tb/data_sink_adv.vhd 
vlog -work work ../tb/tb_adv_iir.v 

###############################################################
##########   Run Modelsim GUI, add waves, run sim    ##########
###############################################################
#vsim work.tb_adv_iir -voptargs=+acc


vsim -c work.tb_adv_iir -voptargs=+acc -do mini_tcl.tcl
#vsim -c work.tb_adv_iir -voptargs=+acc > log1


