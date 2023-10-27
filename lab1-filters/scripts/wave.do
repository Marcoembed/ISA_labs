onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_iir/CLK_i
add wave -noupdate /tb_iir/RST_n_i
add wave -noupdate -radix decimal /tb_iir/DIN_i
add wave -noupdate -radix decimal /tb_iir/B0_i
add wave -noupdate -radix decimal /tb_iir/B1_i
add wave -noupdate -radix decimal /tb_iir/A1_i
add wave -noupdate -radix decimal /tb_iir/DOUT_i
add wave -noupdate /tb_iir/VIN_i
add wave -noupdate /tb_iir/VOUT_i
add wave -noupdate /tb_iir/END_SIM_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2089608 ps} 0}
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
WaveRestoreZoom {0 ps} {17226525 ps}
