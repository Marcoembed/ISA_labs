source .synopsys_dc.setup
read_verilog -netlist ../netlist/iir.v
current_design IIR
read_saif -input ../saif/myiir_syn.saif -instance tb_iir/UUT -unit ns -scale 1
create_clock -name MY_CLK -period 2.95 CLK
report_power > ../reports/report_power.txt
quit
