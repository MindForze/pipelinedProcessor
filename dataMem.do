vsim work.datamem
# vsim work.datamem 
# Start time: 23:14:00 on Apr 19,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.datamem(datamemarch)
add wave -position insertpoint  \
sim:/datamem/CLK \
sim:/datamem/MEMWR \
sim:/datamem/ADDRESS \
sim:/datamem/DATAIN \
sim:/datamem/DATAOUT
force -freeze sim:/datamem/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/datamem/MEMWR 0 0
force -freeze sim:/datamem/ADDRESS 16'h0000 0
force -freeze sim:/datamem/DATAIN 16'hffff 0
run
mem load -filltype value -filldata {0000 } -fillradix hexadecimal /datamem/DATAMEMORY(0)
run
force -freeze sim:/datamem/MEMWR 1 0
run
force -freeze sim:/datamem/ADDRESS 16'h00b4 0
force -freeze sim:/datamem/MEMWR 0 0
run
force -freeze sim:/datamem/MEMWR 1 0
run
run