#vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 work.tb_iir
vsim -c -L /eda/dk/nangate45/verilog/qsim2020.4 -sdfmax /tb_iir/UUT=../innovus/myiir.sdf work.tb_iir
vcd file ../vcd/design.vcd
vcd add /tb_iir/UUT/*
run 40 us
quit


