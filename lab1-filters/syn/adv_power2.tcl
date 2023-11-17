source .synopsys_dc.setup
read_verilog -netlist ../netlist/adv_iir.v
current_design adv_iir
read_saif -input ../adv_saif/adv_myiir_syn.saif -instance tb_adv_iir/UUT -unit ns -scale 1
create_clock -name MY_CLK -period 8.0 CLK
report_power > ../reports/adv_report_power.txt
quit
