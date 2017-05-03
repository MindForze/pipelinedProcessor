vsim work.instmem
# vsim work.instmem 
# Start time: 22:03:48 on Apr 19,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.instmem(instmemarch)
force -freeze sim:/instmem/ADDRESS 16'h403ff 0
force -freeze sim:/instmem/MEMORY(1023) 16'h0000 0
add wave -position insertpoint  \
sim:/instmem/ADDRESS
add wave -position insertpoint  \
sim:/instmem/INSTOUT
add wave -position insertpoint  \
sim:/instmem/MEMORY
run