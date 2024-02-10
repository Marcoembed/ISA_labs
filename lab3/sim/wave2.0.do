onerror {resume}
quietly WaveActivateNextPane {} 0
restart
add wave -position end  sim:/tb/core/CLK
add wave -position end  sim:/tb/core/fetcher_unit/RSTn
add wave -position end  sim:/tb/core/fetcher_unit/current_state
add wave -position end  sim:/tb/core/fetcher_unit/next_state
add wave -position end  sim:/tb/core/fetcher_unit/HZ_instr_req
add wave -position end  sim:/tb/core/fetcher_unit/INSTR_out
add wave -position end  sim:/tb/core/fetcher_unit/PC_in
add wave -position end  sim:/tb/core/control_unit/INSTR
add wave -position end  sim:/tb/core/control_unit/opcode
add wave -position end  sim:/tb/core/control_unit/WB
add wave -position end  sim:/tb/core/control_unit/funct7
run 500 ns
