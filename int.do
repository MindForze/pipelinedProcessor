vsim work.interruptunit
# vsim work.interruptunit 
# Start time: 22:19:26 on Apr 25,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.interruptunit(a_interruptunit)
add wave -position insertpoint  \
sim:/interruptunit/Clk
add wave  \
sim:/interruptunit/IsPipeLineStalled \
sim:/interruptunit/IntRequest \
sim:/interruptunit/Reset \
sim:/interruptunit/LoadFromID \
sim:/interruptunit/JmpCallFromID \
sim:/interruptunit/JmpTypeFromID \
sim:/interruptunit/RetFromID \
sim:/interruptunit/RtiFromID \
sim:/interruptunit/JmpTypeFromEx \
sim:/interruptunit/RetFromEx \
sim:/interruptunit/RtiFromEx \
sim:/interruptunit/RetFromMem \
sim:/interruptunit/RtiFromMem \
sim:/interruptunit/PcPcMinus \
sim:/interruptunit/FlushExecute \
sim:/interruptunit/IntOut
force -freeze sim:/interruptunit/Clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/interruptunit/IsPipeLineStalled 0 0
force -freeze sim:/interruptunit/IntRequest 0 0
force -freeze sim:/interruptunit/Reset 0 0
force -freeze sim:/interruptunit/LoadFromID 0 0
force -freeze sim:/interruptunit/JmpCallFromID 0 0
force -freeze sim:/interruptunit/JmpTypeFromID 00 0
force -freeze sim:/interruptunit/RetFromID 0 0
force -freeze sim:/interruptunit/RtiFromID 0 0
force -freeze sim:/interruptunit/JmpTypeFromEx 00 0
force -freeze sim:/interruptunit/RetFromEx 0 0
force -freeze sim:/interruptunit/RtiFromEx 0 0
force -freeze sim:/interruptunit/RetFromMem 0 0
force -freeze sim:/interruptunit/RtiFromMem 0 0
force -freeze sim:/interruptunit/PcPcMinus 0 0
force -freeze sim:/interruptunit/FlushExecute 0 0
force -freeze sim:/interruptunit/IntOut 0 0
noforce sim:/interruptunit/IntOut
noforce sim:/interruptunit/FlushExecute
noforce sim:/interruptunit/PcPcMinus
run
force -freeze sim:/interruptunit/IntRequest 1 0
run
run
run
run
force -freeze sim:/interruptunit/IntRequest 0 0
run
force -freeze sim:/interruptunit/Reset 1 0
run
force -freeze sim:/interruptunit/Reset 0 0
run
force -freeze sim:/interruptunit/LoadFromID 1 0
force -freeze sim:/interruptunit/IntRequest 1 0
run
run
force -freeze sim:/interruptunit/LoadFromID 0 0
force -freeze sim:/interruptunit/RtiFromMem 1 0
run
run
run

force -freeze sim:/interruptunit/RtiFromMem 0 0
run
force -freeze sim:/interruptunit/IntRequest 0 0
run
force -freeze sim:/interruptunit/JmpCallFromID 1 0
run
force -freeze sim:/interruptunit/IntRequest 1 0
run
force -freeze sim:/interruptunit/IntRequest 0 0
run
force -freeze sim:/interruptunit/JmpCallFromID 0 0
run
run
force -freeze sim:/interruptunit/RtiFromMem 1 0
run
force -freeze sim:/interruptunit/RtiFromMem 0 0
run
force -freeze sim:/interruptunit/JmpCallFromID 1 0
force -freeze sim:/interruptunit/IntRequest 1 0
run
force -freeze sim:/interruptunit/IntRequest 0 0
run
force -freeze sim:/interruptunit/JmpCallFromID 0 0
run
run
