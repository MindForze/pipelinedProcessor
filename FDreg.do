vsim work.fdreg
# vsim work.fdreg 
# Start time: 18:54:37 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.fdreg(fdregarch)
# vsim work.fdreg 
# Start time: 18:35:09 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.fdreg(fdregarch)
# vsim work.fdreg 
# Start time: 17:45:58 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.fdreg(fdregarch)
add wave -position insertpoint  \
sim:/fdreg/CLK \
sim:/fdreg/RST \
sim:/fdreg/EN \
sim:/fdreg/FLUSH \
sim:/fdreg/PCplus \
sim:/fdreg/INST \
sim:/fdreg/PCcurrent \
sim:/fdreg/RSrc \
sim:/fdreg/RTarget \
sim:/fdreg/PCplusOUT \
sim:/fdreg/OPcode \
sim:/fdreg/INSTDATA \
sim:/fdreg/PCcurrentOUT
force -freeze sim:/fdreg/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/fdreg/RST 1 0
run
force -freeze sim:/fdreg/EN 1 0
run
run
force -freeze sim:/fdreg/RST 0 0
run
run
force -freeze sim:/fdreg/INST 16'h1234 0
run
run
force -freeze sim:/fdreg/PCcurrent 16'h0001 0
force -freeze sim:/fdreg/PCplus 16'h0002 0
force -freeze sim:/fdreg/FLUSH 0 0
run
run
force -freeze sim:/fdreg/FLUSH 1 0
run
run
force -freeze sim:/fdreg/FLUSH 0 0
run
run
force -freeze sim:/fdreg/EN 0 0
force -freeze sim:/fdreg/INST 16'hffff 0
run
force -freeze sim:/fdreg/EN 1 0
run