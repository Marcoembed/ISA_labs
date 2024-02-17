set TOP_LVL_ENTITY "RISCV"
set VHDL_COMPILE_FILE "compile_VHDL.f"
set VLOG_COMPILE_FILE "compile_VLOG.f"

set vhdl_srcs [listFromFile $VHDL_COMPILE_FILE]
set vlog_srcs [listFromFile $VLOG_COMPILE_FILE]

analyze -work WORK -format VHDL $vhdl_srcs
analyze -work WORK -format Verilog $vlog_srcs

elaborate $TOP_LVL_ENTITY -lib WORK > [string cat $TOP_LVL_ENTITY "_rep/elaborate.rep"]
uniquify > [string cat $TOP_LVL_ENTITY "_rep/uniquify.rep"]
link

create_clock -name MY_CLK -period 10.0 CLK
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]

set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] CLK]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]

compile_ultra > [string cat $TOP_LVL_ENTITY "_rep/compile.rep"]

report_timing > [string cat $TOP_LVL_ENTITY "_rep/report_timing.rep"]
report_area > [string cat $TOP_LVL_ENTITY "_rep/report_area.rep"]
report_area -hierarchy > [string cat $TOP_LVL_ENTITY "_rep/report_area_hier.rep"]

ungroup -all -flatten > [string cat $TOP_LVL_ENTITY "_rep/ungroup.rep"]
change_names -hierarchy -rules verilog > [string cat $TOP_LVL_ENTITY "_rep/change_names.rep"]


#write_sdf ../netlist/mem_test.sdf > ./mem_test_rep/write_sdf.rep
write -f verilog -hierarchy -output [string cat "../netlist/" $TOP_LVL_ENTITY ".v"] > [string cat $TOP_LVL_ENTITY "_rep/write_v.rep"]
#write_sdc ../netlist/mem_test.sdc > ./mem_test_rep/write_sdc.rep

quit

