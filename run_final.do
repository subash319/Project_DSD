vcom exor_gate.vhdl
vcom exor_2s_compliment.vhdl
vcom 2s_complement.vhdl
vcom ripple_carry_adder.vhdl
vcom and_2.vhd
vcom half_adder.vhdl
vcom full_adder.vhdl
vcom partial_prodouct_generator.vhd
vcom multiplier.vhd
vcom register_8bit.vhdl
vcom ripple_carry_adder_14bit.vhdl
vcom reg_twos_compliment.vhd
vcom unit_tb.vhd
vsim unit_tb
#add wave sim:/unit_tb/*
#add wave -position insertpoint sim:/unit_tb/dut/reg_map/DATA_OUT
do wave.do
force -freeze sim:/unit_tb/sig_LD 0 25600
run 26600ns