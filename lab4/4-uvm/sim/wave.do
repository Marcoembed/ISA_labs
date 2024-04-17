onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/sum/fpnew_top_u/op_i
add wave -noupdate {/top/sum/fpnew_top_u/operands_i[2]}
add wave -noupdate {/top/sum/fpnew_top_u/operands_i[1]}
add wave -noupdate {/top/sum/fpnew_top_u/operands_i[0]}
add wave -noupdate /top/sum/fpnew_top_u/result_o
add wave -noupdate /top/in/op
add wave -noupdate -expand -group inter_in /top/sum/in_inter/rst
add wave -noupdate -expand -group inter_in /top/sum/in_inter/A
add wave -noupdate -expand -group inter_in /top/sum/in_inter/B
add wave -noupdate -expand -group inter_in /top/sum/in_inter/C
add wave -noupdate -expand -group inter_in /top/sum/in_inter/op
add wave -noupdate -expand -group inter_in /top/sum/in_inter/valid
add wave -noupdate -expand -group inter_in /top/sum/in_inter/ready
add wave -noupdate -expand -group inter_out /top/sum/out_inter/clk
add wave -noupdate -expand -group inter_out /top/sum/out_inter/rst
add wave -noupdate -expand -group inter_out /top/sum/out_inter/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 239
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
WaveRestoreZoom {0 ns} {54 ns}
