onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_real/riscv/CLK
add wave -noupdate /tb_real/riscv/RSTn
add wave -noupdate /tb_real/riscv/core_PC_core
add wave -noupdate /tb_real/riscv/core_INSTR_core
add wave -noupdate /tb_real/riscv/instr_rdata_top
add wave -noupdate /tb_real/riscv/instr_addr0
add wave -noupdate /tb_real/riscv/data_rdata_top
add wave -noupdate /tb_real/riscv/data_addr0
add wave -noupdate /tb_real/riscv/data_din0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2628562 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {2240611 ps} {2535925 ps}
set StdArithNoWarnings 1
run 4.3 us