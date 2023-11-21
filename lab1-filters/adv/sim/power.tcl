vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir
vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 -sdftyp /tb_iir/UUT=../netlist/myiir.sdf work.tb_iir
vcd file ../vcd/iir_syn.vcd
vcd add /tb_iir/UUT/*
run 40 us
quit


