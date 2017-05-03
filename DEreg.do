vsim work.dereg
# vsim work.dereg 
# Start time: 21:25:39 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.dereg(deregarch)
add wave -position insertpoint  \
sim:/dereg/CLK \
sim:/dereg/RST \
sim:/dereg/EN \
sim:/dereg/FLUSH \
sim:/dereg/RET \
sim:/dereg/LD \
sim:/dereg/INT \
sim:/dereg/RTI \
sim:/dereg/FlagMod \
sim:/dereg/DecSP \
sim:/dereg/DSrc \
sim:/dereg/DTarget \
sim:/dereg/JMPtyp \
sim:/dereg/INSTDATA \
sim:/dereg/PCplus \
sim:/dereg/RegWR \
sim:/dereg/OutWR \
sim:/dereg/XtoReg \
sim:/dereg/AddRselect \
sim:/dereg/MemWR \
sim:/dereg/XtoMem \
sim:/dereg/SetC \
sim:/dereg/ClrC \
sim:/dereg/Shift \
sim:/dereg/AluOP \
sim:/dereg/RETOUT \
sim:/dereg/LDOUT \
sim:/dereg/INTOUT \
sim:/dereg/RTIOUT \
sim:/dereg/FlagModOUT \
sim:/dereg/DecSPOUT \
sim:/dereg/DSrcOUT \
sim:/dereg/DTargetOUT \
sim:/dereg/JMPtypOUT \
sim:/dereg/INSTDATAOUT \
sim:/dereg/PCplusOUT \
sim:/dereg/RegWROUT \
sim:/dereg/OutWROUT \
sim:/dereg/XtoRegOUT \
sim:/dereg/AddRselectOUT \
sim:/dereg/MemWROUT \
sim:/dereg/XtoMemOUT \
sim:/dereg/SetCOUT \
sim:/dereg/ClrCOUT \
sim:/dereg/ShiftOUT \
sim:/dereg/AluOPOUT
force -freeze sim:/dereg/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/dereg/RST 0 0
force -freeze sim:/dereg/RST 1 0
run
run
force -freeze sim:/dereg/EN 1 0
run
run
force -freeze sim:/dereg/RST 0 0
run
run
force -freeze sim:/dereg/FLUSH 0 0
force -freeze sim:/dereg/RET 1 0
force -freeze sim:/dereg/LD 1 0
force -freeze sim:/dereg/INT 1 0
force -freeze sim:/dereg/RTI 1 0
force -freeze sim:/dereg/FlagMod 1 0
force -freeze sim:/dereg/DecSP 1 0
force -freeze sim:/dereg/RegWR 1 0
force -freeze sim:/dereg/OutWR 1 0
force -freeze sim:/dereg/AddRselect 1 0
force -freeze sim:/dereg/MemWR 1 0
force -freeze sim:/dereg/XtoMem 1 0
force -freeze sim:/dereg/SetC 1 0
force -freeze sim:/dereg/ClrC 1 0
force -freeze sim:/dereg/Shift 1 0
run
run
force -freeze sim:/dereg/DSrc 16'hffff 0
force -freeze sim:/dereg/DTarget 16'h1111 0
force -freeze sim:/dereg/JMPtyp 01 0
force -freeze sim:/dereg/INSTDATA 01010101011 0
force -freeze sim:/dereg/PCplus 16'h0001 0
force -freeze sim:/dereg/XtoReg 01 0
force -freeze sim:/dereg/AluOP 0011 0
run
run
force -freeze sim:/dereg/FLUSH 1 0
run
run