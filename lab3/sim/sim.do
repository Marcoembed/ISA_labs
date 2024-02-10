onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate /tb/core/CLK
add wave -noupdate /tb/core/RSTn
add wave -noupdate -group DECODE /tb/core/decode/RSTn
add wave -noupdate -group DECODE /tb/core/decode/CLK
add wave -noupdate -group DECODE /tb/core/decode/EN
add wave -noupdate -group DECODE /tb/core/decode/DECctrl_in
add wave -noupdate -group DECODE /tb/core/decode/IDdata_INSTRUCTION_in
add wave -noupdate -group DECODE /tb/core/decode/IDdata_PC_in
add wave -noupdate -group DECODE /tb/core/decode/WBdata_RD_in
add wave -noupdate -group DECODE /tb/core/decode/WBdata_WriteData_in
add wave -noupdate -group DECODE /tb/core/decode/EXdata_PC_out
add wave -noupdate -group DECODE /tb/core/decode/EXdata_IMM_out
add wave -noupdate -group DECODE /tb/core/decode/EXdata_RS1_out
add wave -noupdate -group DECODE /tb/core/decode/EXdata_RS2_out
add wave -noupdate -group DECODE /tb/core/decode/EXdata_RD_out
add wave -noupdate -group DECODE /tb/core/decode/IFctrl_out
add wave -noupdate -group DECODE /tb/core/decode/DECdata_RS1
add wave -noupdate -group DECODE /tb/core/decode/DECdata_RS2
add wave -noupdate -group DECODE /tb/core/decode/DECdata_RD
add wave -noupdate -group DECODE /tb/core/decode/DECdata_funct3
add wave -noupdate -group DECODE /tb/core/decode/DECdata_funct7
add wave -noupdate -group CU /tb/core/control_unit/INSTR
add wave -noupdate -group CU /tb/core/control_unit/FLUSH_IF_DEC
add wave -noupdate -group CU /tb/core/control_unit/DEC
add wave -noupdate -group CU /tb/core/control_unit/EX
add wave -noupdate -group CU /tb/core/control_unit/MEM
add wave -noupdate -group CU /tb/core/control_unit/WB
add wave -noupdate -group CU /tb/core/control_unit/opcode
add wave -noupdate -group CU /tb/core/control_unit/funct7
add wave -noupdate -group EXECUTE /tb/core/execute/EXctrl_in
add wave -noupdate -group EXECUTE /tb/core/execute/FUctrl_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_FRWDALU_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_FRWDWB_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_PC_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_IMM_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_RS1_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_RS2_in
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_ALU_out
add wave -noupdate -group EXECUTE /tb/core/execute/EXdata_IMM_out
add wave -noupdate -group EXECUTE /tb/core/execute/MUXA_out
add wave -noupdate -group EXECUTE /tb/core/execute/MUXB_out
add wave -noupdate -group EXECUTE /tb/core/execute/OP1
add wave -noupdate -group EXECUTE /tb/core/execute/OP2
add wave -noupdate -group FETCH /tb/core/fetch/CLK
add wave -noupdate -group FETCH /tb/core/fetch/RSTn
add wave -noupdate -group FETCH /tb/core/fetch/EN
add wave -noupdate -group FETCH /tb/core/fetch/HZctrl_in
add wave -noupdate -group FETCH /tb/core/fetch/BRANCH_cond_in
add wave -noupdate -group FETCH /tb/core/fetch/BRANCH_in
add wave -noupdate -group FETCH /tb/core/fetch/PC_out
add wave -noupdate -group FETCH /tb/core/fetch/NPC
add wave -noupdate -group FETCH /tb/core/fetch/PC
add wave -noupdate -group FETCH /tb/core/fetch/MUX_out
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/CLK
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/RSTn
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/HZ_instr_req
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/busy_out
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/PC_in
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/INSTR_out
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/current_state
add wave -noupdate -group FETCHER /tb/core/fetcher_unit/next_state
add wave -noupdate -group FORWARDING /tb/core/forwarding_unit/FU_in
add wave -noupdate -group FORWARDING /tb/core/forwarding_unit/FU_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/CLK
add wave -noupdate -group HAZARD /tb/core/hazard_unit/RSTn
add wave -noupdate -group HAZARD /tb/core/hazard_unit/EN
add wave -noupdate -group HAZARD /tb/core/hazard_unit/BRANCH_cond_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/INSTR_mem_busy_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/DATA_mem_busy_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/MEMctrl_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/EX_MEM_RD_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/DEC_EX_RS1_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/DEC_EX_RS2_in
add wave -noupdate -group HAZARD /tb/core/hazard_unit/HZ_instr_req
add wave -noupdate -group HAZARD /tb/core/hazard_unit/HZ_data_req
add wave -noupdate -group HAZARD /tb/core/hazard_unit/PC_REG_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/IF_DEC_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/DEC_EX_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/EX_MEM_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/MEM_WB_out
add wave -noupdate -group HAZARD /tb/core/hazard_unit/current_state
add wave -noupdate -group HAZARD /tb/core/hazard_unit/next_state
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/CLK
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/RSTn
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/HZ_data_req
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/busy_out
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/MEMctrl_in
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/addr_in
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/data_in
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/data_out
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/current_state
add wave -noupdate -group LOAD_STORE /tb/core/load_store_unit/next_state
add wave -noupdate -group WRITE_BACK /tb/core/write_back/WBctrl_in
add wave -noupdate -group WRITE_BACK /tb/core/write_back/WBdata_ALU_in
add wave -noupdate -group WRITE_BACK /tb/core/write_back/WBdata_IMM_in
add wave -noupdate -group WRITE_BACK /tb/core/write_back/WBdata_MEM_in
add wave -noupdate -group WRITE_BACK /tb/core/write_back/WBdata_MUX_out
add wave -noupdate -group PIPE_REG /tb/core/IF_DEC
add wave -noupdate -group PIPE_REG /tb/core/DEC_EX
add wave -noupdate -group PIPE_REG /tb/core/EX_MEM
add wave -noupdate -group PIPE_REG /tb/core/MEM_WB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148344 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {168 ns}
run 160 ns