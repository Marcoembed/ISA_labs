vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_adv_iir
vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_adv_iir/UUT=../netlist/adv_myiir.sdf work.tb_adv_iir
vcd file ../adv_vcd/adv_myiir_syn.vcd
vcd add /tb_adv_iir/UUT/*
run 40 us
quit


