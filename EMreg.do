vsim work.emreg
# vsim work.emreg 
# Start time: 22:16:01 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.emreg(emregarch)
add wave -position insertpoint  \
sim:/emreg/CLK \
sim:/emreg/RST \
sim:/emreg/EN \
sim:/emreg/FLUSH \
sim:/emreg/RET \
sim:/emreg/RTI \
sim:/emreg/INSTDATA \
sim:/emreg/DTarget \
sim:/emreg/PCplus \
sim:/emreg/ALUResult \
sim:/emreg/ImmEA \
sim:/emreg/RegWR \
sim:/emreg/OutWR \
sim:/emreg/XtoReg \
sim:/emreg/AddRselect \
sim:/emreg/MemWR \
sim:/emreg/XtoMem \
sim:/emreg/RETOUT \
sim:/emreg/RTIOUT \
sim:/emreg/INSTDATAOUT \
sim:/emreg/DTargetOUT \
sim:/emreg/PCplusOUT \
sim:/emreg/ALUResultOUT \
sim:/emreg/ImmEAOUT \
sim:/emreg/RegWROUT \
sim:/emreg/OutWROUT \
sim:/emreg/XtoRegOUT \
sim:/emreg/AddRselectOUT \
sim:/emreg/MemWROUT \
sim:/emreg/XtoMemOUT
force -freeze sim:/emreg/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/emreg/RST 1 0
force -freeze sim:/emreg/EN 0 0
force -freeze sim:/emreg/FLUSH 0 0
run
run
force -freeze sim:/emreg/RST 0 0
run
run
force -freeze sim:/emreg/EN 1 0
run
run
force -freeze sim:/emreg/RET 1 0
force -freeze sim:/emreg/RTI 1 0
force -freeze sim:/emreg/INSTDATA 00000001111 0
force -freeze sim:/emreg/DTarget 16'HFFFF 0
force -freeze sim:/emreg/PCplus 16'HFFFF 0
force -freeze sim:/emreg/ImmEA 16'HABC0 0
force -freeze sim:/emreg/RegWR 1 0
force -freeze sim:/emreg/OutWR 1 0
force -freeze sim:/emreg/XtoReg 00 0
force -freeze sim:/emreg/MemWR 1 0
force -freeze sim:/emreg/XtoMem 1 0
force -freeze sim:/emreg/AddRselect 1 0
force -freeze sim:/emreg/ALUResult 16'HABC0 0
run
run
force -freeze sim:/emreg/FLUSH 1 0
run
run