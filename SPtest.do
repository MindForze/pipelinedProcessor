vsim work.reg_file
# vsim work.reg_file 
# Start time: 02:29:37 on Apr 26,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.reg_file(a_file_reg)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_adder(a_my_adder)
# Loading work.n_reg(a_n_reg)
add wave -position insertpoint  \
sim:/reg_file/clk
add wave -position insertpoint  \
sim:/reg_file/rst
add wave -position insertpoint  \
sim:/reg_file/incSp
add wave -position insertpoint  \
sim:/reg_file/decSp
add wave -position insertpoint  \
sim:/reg_file/en_reg6
add wave -position insertpoint  \
sim:/reg_file/outreg6
add wave -position insertpoint  \
sim:/reg_file/one
add wave -position insertpoint  \
sim:/reg_file/newSp
force -freeze sim:/reg_file/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/reg_file/rst 1 0
force -freeze sim:/reg_file/incSp 0 0
force -freeze sim:/reg_file/decSp 0 0
run
force -freeze sim:/reg_file/rst 0 0
force -freeze sim:/reg_file/incSp 1 0
force -freeze sim:/reg_file/decSp 0 0
run
run
run
force -freeze sim:/reg_file/decSp 1 0
force -freeze sim:/reg_file/incSp 0 0
run
run
run
force -freeze sim:/reg_file/incSp 1 0
force -freeze sim:/reg_file/decSp 0 0
run
run