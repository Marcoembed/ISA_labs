onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fake/core/CLK
add wave -noupdate /tb_fake/core/RSTn
add wave -noupdate /tb_fake/INSTR_MEM/ADDR
add wave -noupdate /tb_fake/INSTR_MEM/RDATA
add wave -noupdate /tb_fake/INSTR_MEM/WDATA
add wave -noupdate /tb_fake/INSTR_MEM/MEM_RDY
add wave -noupdate /tb_fake/INSTR_MEM/PROC_REQ
add wave -noupdate /tb_fake/INSTR_MEM/VALID
add wave -noupdate /tb_fake/DATA_MEM/WDATA
add wave -noupdate /tb_fake/DATA_MEM/RDATA
add wave -noupdate /tb_fake/DATA_MEM/ADDR
add wave -noupdate /tb_fake/core/control_unit/INSTR
add wave -noupdate /tb_fake/core/control_unit/opcode
add wave -noupdate /tb_fake/core/decode/IDdata_PC_in
add wave -noupdate /tb_fake/core/decode/register_file_unit/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4324870 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
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
WaveRestoreZoom {4040561 ps} {4368687 ps}
set StdArithNoWarnings 1
run 4.3 us
