add wave -position insertpoint  \
sim:/alu/a \
sim:/alu/b \
sim:/alu/s \
sim:/alu/f \
sim:/alu/tmp_out \
sim:/alu/flags_in \
sim:/alu/flags_out 

#1-add
force -freeze sim:/alu/a 16'h0001 0
force -freeze sim:/alu/b 16'h0002 0
force -freeze sim:/alu/flags_in 0000 0
force -freeze sim:/alu/s 0010 0
run

#2-add with overflow and negative
force -freeze sim:/alu/a 16'h7FFF 0
force -freeze sim:/alu/b 16'h7FFF 0
run

#3-subtract wih negative flag
force -freeze sim:/alu/a 16'h0001 0
force -freeze sim:/alu/b 16'h0002 0
force -freeze sim:/alu/s 0011 0
force -freeze sim:/alu/s 0011 0
run

#4-pass a
force -freeze sim:/alu/s 0000 0
run

#5-pass b
force -freeze sim:/alu/s 0001 0
run

#6-and with zero flag
force -freeze sim:/alu/s 0100 0
run

#7-or
force -freeze sim:/alu/s 0101 0
run

#8-rotate left 
force -freeze sim:/alu/s 0110 0
run

#9-rotate right with carry,Zero & OV flags
force -freeze sim:/alu/s 0111 0
run

#10-rotate right
force -freeze sim:/alu/b 0000000000000011 0
run

#11-shif right with flags 
force -freeze sim:/alu/a 0000000000111000 0
force -freeze sim:/alu/b 0000000000000100 0
force -freeze sim:/alu/s 1001 0
run

#12-shif left with flags
force -freeze sim:/alu/a 1100000000000111 0
force -freeze sim:/alu/flags_in 0001 0
force -freeze sim:/alu/s 1000 0
run

#13-not a with flags
force -freeze sim:/alu/s 1010 0
run

#14-negate a with flags
force -freeze sim:/alu/a 0000000000000111 0
force -freeze sim:/alu/s 1011 0
run

#15-inc a 
force -freeze sim:/alu/a 16'h1111 0
force -freeze sim:/alu/s 1100 0
run

#16-inc a with carry&Zero flag
force -freeze sim:/alu/a 16'hFFFF 0
run

#17-dec a with carry&Negative flag
force -freeze sim:/alu/s 1101 0
run

