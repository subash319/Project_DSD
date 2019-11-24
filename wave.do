onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /unit_tb/sig_D_IN
add wave -noupdate /unit_tb/sig_CLK
add wave -noupdate /unit_tb/sig_LD
add wave -noupdate /unit_tb/sig_CLR
add wave -noupdate /unit_tb/sig_END_FLAG
add wave -noupdate /unit_tb/sig_D_OUT
add wave -noupdate /unit_tb/dut/reg_map/DATA_OUT
add wave -noupdate /unit_tb/dut/reg_map/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19343 ns} 0}
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
WaveRestoreZoom {17778 ns} {27065 ns}
