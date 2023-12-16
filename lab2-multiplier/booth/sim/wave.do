onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /tb/dut/a
add wave -noupdate -expand -group DUT /tb/dut/b
add wave -noupdate -expand -group DUT /tb/dut/out
add wave -noupdate -expand -group DUT /tb/dut/pp1
add wave -noupdate -expand -group DUT /tb/dut/pp2
add wave -noupdate -expand -group DUT /tb/dut/pp3
add wave -noupdate -expand -group DUT /tb/dut/pp4
add wave -noupdate -expand -group DUT /tb/dut/pp5
add wave -noupdate -expand -group DUT /tb/dut/pp6
add wave -noupdate -expand -group DUT /tb/dut/signs
add wave -noupdate -expand -group DUT /tb/dut/dadda_A
add wave -noupdate -expand -group DUT /tb/dut/dadda_B
add wave -noupdate -expand -group BOOTH /tb/dut/booth/A
add wave -noupdate -expand -group BOOTH /tb/dut/booth/B
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP1
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP2
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP3
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP4
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP5
add wave -noupdate -expand -group BOOTH /tb/dut/booth/PP6
add wave -noupdate -expand -group BOOTH /tb/dut/booth/signs
add wave -noupdate -expand -group BOOTH /tb/dut/booth/B_int
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp1
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp2
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp3
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp4
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp5
add wave -noupdate -expand -group DADDA /tb/dut/dadda/pp6
add wave -noupdate -expand -group DADDA /tb/dut/dadda/signs
add wave -noupdate -expand -group DADDA /tb/dut/dadda/outA
add wave -noupdate -expand -group DADDA /tb/dut/dadda/outB
add wave -noupdate -expand -group DADDA /tb/dut/dadda/s1
add wave -noupdate -expand -group DADDA /tb/dut/dadda/s2
add wave -noupdate -expand -group DADDA /tb/dut/dadda/c2
add wave -noupdate -expand -group DADDA /tb/dut/dadda/c1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {43001 ps}
