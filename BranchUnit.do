vsim work.branchunit(a_branchunit)
# vsim work.branchunit(a_branchunit) 
# Start time: 01:01:26 on Apr 26,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.branchunit(a_branchunit)
add wave  \
sim:/branchunit/JmpCallFromID \
sim:/branchunit/DestFromID \
sim:/branchunit/JmpTypeFromEx \
sim:/branchunit/DestFromEx \
sim:/branchunit/RetFromEx \
sim:/branchunit/RtiFromEx \
sim:/branchunit/RetFromMem \
sim:/branchunit/RtiFromMem \
sim:/branchunit/DestFromMem \
sim:/branchunit/Flags \
sim:/branchunit/FlushID \
sim:/branchunit/FlushEx \
sim:/branchunit/FlushMem \
sim:/branchunit/ChangePC \
sim:/branchunit/NewPC
force -freeze sim:/branchunit/JmpCallFromID 0 0
force -freeze sim:/branchunit/DestFromID 0000000000000000 0
force -freeze sim:/branchunit/JmpTypeFromEx 00 0
force -freeze sim:/branchunit/DestFromEx 0000000000000000 0
force -freeze sim:/branchunit/RetFromEx 0 0
force -freeze sim:/branchunit/RtiFromEx 0 0
force -freeze sim:/branchunit/RetFromMem 0 0
force -freeze sim:/branchunit/RtiFromMem 0 0
force -freeze sim:/branchunit/DestFromMem 0000000000000000 0
force -freeze sim:/branchunit/Flags 0000 0
force -freeze sim:/branchunit/FlushID 0 0
force -freeze sim:/branchunit/FlushEx 0 0
force -freeze sim:/branchunit/FlushMem 0 0
force -freeze sim:/branchunit/ChangePC 0 0
force -freeze sim:/branchunit/NewPC 0000000000000000 0
noforce sim:/branchunit/NewPC
noforce sim:/branchunit/ChangePC
noforce sim:/branchunit/FlushMem
noforce sim:/branchunit/FlushEx
noforce sim:/branchunit/FlushID
run
force -freeze sim:/branchunit/DestFromID 0000000000110000 0
force -freeze sim:/branchunit/DestFromEx 0000000000001100 0
force -freeze sim:/branchunit/DestFromMem 0000000000000011 0
run
force -freeze sim:/branchunit/JmpCallFromID 1 0
run
force -freeze sim:/branchunit/JmpCallFromID 0 0
run
force -freeze sim:/branchunit/JmpCallFromID 1 0
force -freeze sim:/branchunit/RetFromMem 1 0
run
force -freeze sim:/branchunit/RetFromMem 0 0
run
force -freeze sim:/branchunit/RtiFromMem 1 0
run
force -freeze sim:/branchunit/RtiFromMem 0 0
run
force -freeze sim:/branchunit/RetFromEx 1 0
run
force -freeze sim:/branchunit/RetFromEx 0 0
force -freeze sim:/branchunit/RtiFromEx 1 0
run
force -freeze sim:/branchunit/RtiFromEx 0 0
run
force -freeze sim:/branchunit/Flags 1000 0
force -freeze sim:/branchunit/JmpTypeFromEx 01 0
run
force -freeze sim:/branchunit/Flags 0001 0
run
force -freeze sim:/branchunit/Flags 1111 0
run
force -freeze sim:/branchunit/JmpCallFromID 0 0
run
force -freeze sim:/branchunit/Flags 1000 0
run
force -freeze sim:/branchunit/Flags 0001 0
run
force -freeze sim:/branchunit/Flags 0100 0
run
force -freeze sim:/branchunit/RetFromMem 1 0
run
force -freeze sim:/branchunit/Flags 0000 0
force -freeze sim:/branchunit/RetFromMem 0 0
run
force -freeze sim:/branchunit/Flags 0010 0
run
