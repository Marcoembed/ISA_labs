source /eda/scripts/init_questa_core_prime 

vlib work 

vlog -work work ../src/cf_math_pkg.sv
vlog -work work ../src/lzc.sv
vlog -work work ../src/rr_arb_tree.sv
vlog -work work ../src/fpnew_pkg.sv
vlog -work work ../src/fpnew_classifier.sv
vlog -work work ../src/fpnew_rounding.sv
vlog -work work ../src/fpnew_fma.sv
vlog -work work ../src/fpnew_opgroup_fmt_slice.sv
vlog -work work ../src/fpnew_opgroup_block.sv
vlog -work work ../netlist/fpnew.v
vcom -work work ../tb/clk_gen.vhd
vcom -work work ../tb/data_gen16.vhd
vlog -work work ../tb/tb_fpnew_top_rtl.sv

vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4  work.tb_fpnew_top  -voptargs=+acc -do script.tcl


