vsim work.mwreg
# vsim work.mwreg 
# Start time: 22:50:14 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.mwreg(mwregarch)
add wave -position insertpoint  \
sim:/mwreg/CLK \
sim:/mwreg/RST \
sim:/mwreg/EN \
sim:/mwreg/FLUSH \
sim:/mwreg/IMM \
sim:/mwreg/MEMDATA \
sim:/mwreg/ALUResult \
sim:/mwreg/INSTDATA \
sim:/mwreg/RegWR \
sim:/mwreg/OutWR \
sim:/mwreg/XtoReg \
sim:/mwreg/IMMOUT \
sim:/mwreg/MEMDATAOUT \
sim:/mwreg/ALUResultOUT \
sim:/mwreg/INSTDATAOUT \
sim:/mwreg/RegWROUT \
sim:/mwreg/OutWROUT \
sim:/mwreg/XtoRegOUT
force -freeze sim:/mwreg/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/mwreg/RST 1 0
run
run
force -freeze sim:/mwreg/EN 1 0
force -freeze sim:/mwreg/RST 0 0
run
run
force -freeze sim:/mwreg/IMM 16'H1234 0
force -freeze sim:/mwreg/MEMDATA 16'H5678 0
force -freeze sim:/mwreg/ALUResult 16'HFFFF 0
force -freeze sim:/mwreg/INSTDATA 11'H1111 0
force -freeze sim:/mwreg/RegWR 1 0
force -freeze sim:/mwreg/OutWR 0 0
force -freeze sim:/mwreg/XtoReg 00 0
run
run
force -freeze sim:/mwreg/FLUSH 1 0
run
run