analyze -f vhdl -lib WORK ../src/mem_test.vhd >> ./mem_test_rep/analyze.rep
set power_preserve_rtl_hier_names true
elaborate mem_test -arch beh -lib WORK > ./mem_test_rep/elaborate.rep
uniquify > ./mem_test_rep/uniquify.rep
link
create_clock -name MY_CLK -period 10.0 CLK
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] CLK]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
compile_ultra > ./mem_test_rep/compile.rep
report_timing > ./mem_test_rep/report_timing.rep
report_area > ./mem_test_rep/report_area.rep
report_area -hierarchy > ./mem_test_rep/report_area_hier.rep
ungroup -all -flatten > ./mem_test_rep/ungroup.rep
change_names -hierarchy -rules verilog > ./mem_test_rep/change_names.rep
#write_sdf ../netlist/mem_test.sdf > ./mem_test_rep/write_sdf.rep
write -f verilog -hierarchy -output ../netlist/mem_test.v > ./mem_test_rep/write_v.rep
#write_sdc ../netlist/mem_test.sdc > ./mem_test_rep/write_sdc.rep
quit
