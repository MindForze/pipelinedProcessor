vsim work.processor
# vsim work.processor 
# Start time: 06:01:15 on May 07,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.processor(a_processor)
# Loading ieee.numeric_std(body)
# Loading work.addone(a_addone)
# Loading work.alu(struct)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_adder(a_my_adder)
# Loading work.branchunit(a_branchunit)
# Loading work.controlunit(a_controlunit)
# Loading work.flagsreg(a_flagsreg)
# Loading work.flagsregres(a_flagsregres)
# Loading work.forwardingunit(a_forwardingunit)
# Loading work.inreg(a_inreg)
# Loading work.interruptunit(a_interruptunit)
# Loading work.outreg(a_outreg)
# Loading work.pc(a_pc)
# Loading work.reg_file(a_file_reg)
# Loading work.my_nadderx(a_my_nadder)
# Loading work.n_reg(a_n_reg)
# Loading work.n_reg_sp(a_n_reg_sp)
# Loading work.subone(a_subone)
# Loading work.mwreg(mwregarch)
# Loading work.dereg(deregarch)
# Loading work.emreg(emregarch)
# Loading work.fdreg(fdregarch)
# Loading work.instmem(instmemarch)
# Loading work.datamem(datamemarch)
# Loading work.mux2(a_mux2)

force -freeze sim:/processor/Clk 1 0, 0 {50 ps} -r 100
add wave  \
sim:/processor/Clk \
sim:/processor/Rst \
sim:/processor/Reset \
sim:/processor/Int \
sim:/processor/InPort \
sim:/processor/OutPort \
sim:/processor/AddOne_result \
sim:/processor/alu_result \
sim:/processor/alu_flags_out \
sim:/processor/BranchUnit_FlushID \
sim:/processor/BranchUnit_FlushEx \
sim:/processor/BranchUnit_FlushMem \
sim:/processor/BranchUnit_ChangePC \
sim:/processor/BranchUnit_NewPC \
sim:/processor/ControlUnit_Load \
sim:/processor/ControlUnit_NeedRs \
sim:/processor/ControlUnit_NeedRt \
sim:/processor/ControlUnit_RegWrite \
sim:/processor/ControlUnit_OutWrite \
sim:/processor/ControlUnit_AddrSelector \
sim:/processor/ControlUnit_MemWrite \
sim:/processor/ControlUnit_XToMem \
sim:/processor/ControlUnit_JmpCall \
sim:/processor/ControlUnit_IncSP \
sim:/processor/ControlUnit_DecSP \
sim:/processor/ControlUnit_Int \
sim:/processor/ControlUnit_Rti \
sim:/processor/ControlUnit_Ret \
sim:/processor/ControlUnit_FlagsModify \
sim:/processor/ControlUnit_SetC \
sim:/processor/ControlUnit_ClrC \
sim:/processor/ControlUnit_Shift \
sim:/processor/ControlUnit_FromIn \
sim:/processor/ControlUnit_XToReg \
sim:/processor/ControlUnit_JmpType \
sim:/processor/ControlUnit_Operation \
sim:/processor/FlagsReg_out \
sim:/processor/FlagsRegRes_out \
sim:/processor/ForwardingUnit_StallPc \
sim:/processor/ForwardingUnit_StallIfId \
sim:/processor/ForwardingUnit_FlushIdEx \
sim:/processor/ForwardingUnit_ForwardToId \
sim:/processor/ForwardingUnit_ForwardRsToEx \
sim:/processor/ForwardingUnit_ForwardRtToEx \
sim:/processor/ForwardingUnit_RsToId \
sim:/processor/ForwardingUnit_RsToEx \
sim:/processor/ForwardingUnit_RtToEx \
sim:/processor/InReg_out \
sim:/processor/InterruptUnit_IntInstr \
sim:/processor/InterruptUnit_PcPcMinus \
sim:/processor/InterruptUnit_FlushExecute \
sim:/processor/InterruptUnit_IntOut \
sim:/processor/PC_Out \
sim:/processor/reg_file_Ds \
sim:/processor/reg_file_Dt \
sim:/processor/SubOne_Out \
sim:/processor/MWreg_IMMOUT \
sim:/processor/MWreg_MEMDATAOUT \
sim:/processor/MWreg_ALUResultOUT \
sim:/processor/MWreg_RdOUT \
sim:/processor/MWreg_RegWROUT \
sim:/processor/MWreg_OutWROUT \
sim:/processor/MWreg_XtoRegOUT \
sim:/processor/DEreg_RETOUT \
sim:/processor/DEreg_LDOUT \
sim:/processor/DEreg_INTOUT \
sim:/processor/DEreg_RTIOUT \
sim:/processor/DEreg_FlagModOUT \
sim:/processor/DEreg_DecSPOUT \
sim:/processor/DEreg_NeedRsOUT \
sim:/processor/DEreg_NeedRtOUT \
sim:/processor/DEreg_RegWROUT \
sim:/processor/DEreg_OutWROUT \
sim:/processor/DEreg_AddRselectOUT \
sim:/processor/DEreg_MemWROUT \
sim:/processor/DEreg_XtoMemOUT \
sim:/processor/DEreg_SetCOUT \
sim:/processor/DEreg_ClrCOUT \
sim:/processor/DEreg_ShiftOUT \
sim:/processor/DEreg_DSrcOUT \
sim:/processor/DEreg_DTargetOUT \
sim:/processor/DEreg_PCplusOUT \
sim:/processor/DEreg_JMPtypOUT \
sim:/processor/DEreg_XtoRegOUT \
sim:/processor/DEreg_INSTDATAOUT \
sim:/processor/DEreg_AluOPOUT \
sim:/processor/EMreg_RETOUT \
sim:/processor/EMreg_RTIOUT \
sim:/processor/EMreg_IncSPOUT \
sim:/processor/EMreg_DecSPOUT \
sim:/processor/EMreg_RegWROUT \
sim:/processor/EMreg_OutWROUT \
sim:/processor/EMreg_AddRselectOUT \
sim:/processor/EMreg_MemWROUT \
sim:/processor/EMreg_XtoMemOUT \
sim:/processor/EMreg_RdOUT \
sim:/processor/EMreg_DTargetOUT \
sim:/processor/EMreg_PCplusOUT \
sim:/processor/EMreg_ALUResultOUT \
sim:/processor/EMreg_ImmEAOUT \
sim:/processor/EMreg_XtoRegOUT \
sim:/processor/FDreg_OPcode \
sim:/processor/FDreg_INSTDATA \
sim:/processor/FDreg_PCplusOUT \
sim:/processor/FDreg_PCcurrentOUT \
sim:/processor/instMem_INSTOUT \
sim:/processor/dataMem_M0 \
sim:/processor/dataMem_M1 \
sim:/processor/dataMem_DATAOUT \
sim:/processor/PCMux_JmpOut \
sim:/processor/PCMux_IntOut \
sim:/processor/PCMux_ResetOut \
sim:/processor/PCMux_PcPcMinusOut \
sim:/processor/PCMux_PcPlusOut \
sim:/processor/PCMux_IntInstOut \
sim:/processor/IDMux_ForwardOut \
sim:/processor/IDMux_InOut \
sim:/processor/ExMux_ForwardDsOut \
sim:/processor/ExMux_ForwardDtOut \
sim:/processor/ExMux_ShiftOut \
sim:/processor/MemMux_AddrOut \
sim:/processor/MemMux_DataOut \
sim:/processor/WBMux_ImmOut \
sim:/processor/WBMux_AluOut \
sim:/processor/FlagsMux_out \
sim:/processor/ResetInt \
sim:/processor/InvertedStallPc \
sim:/processor/DEregFlusher \
sim:/processor/EMregFlusher \
sim:/processor/FDregFlusher \
sim:/processor/FDreg_Imm \
sim:/processor/ShiftVal \
sim:/processor/aluFlagsToMux \
sim:/processor/FlagResFlagsToMux \
sim:/processor/pm_reg_file/outreg0 \
sim:/processor/pm_reg_file/outreg1 \
sim:/processor/pm_reg_file/outreg2 \
sim:/processor/pm_reg_file/outreg3 \
sim:/processor/pm_reg_file/outreg4 \
sim:/processor/pm_reg_file/outreg5 \
sim:/processor/pm_reg_file/outreg6 \
sim:/processor/pm_reg_file/outreg7

force -freeze sim:/processor/Rst 1 0
force -freeze sim:/processor/Reset 0 0
force -freeze sim:/processor/Int 0 0
force -freeze sim:/processor/InPort 0000111100001111 0
run
force -freeze sim:/processor/Rst 0 0
run
run
force -freeze sim:/processor/Rst 1 0
run
force -freeze sim:/processor/Rst 0 0
run
mem load -filltype value -filldata 0111100000000100 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
mem load -filltype value -filldata 0000100100000000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata 0001000000101100 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata 0001101100101000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata 0111001100000000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata {0010000001101000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata {0010100001101000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
run
run
run
run
run
run
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
mem load -filltype value -filldata {0011001000001000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
mem load -filltype value -filldata {0011101000001000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
mem load -filltype value -filldata {0101000000000000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
mem load -filltype value -filldata {0101100000000000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
mem load -filltype value -filldata {0101000000000000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
mem load -filltype value -filldata 0011101000001000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
run
run
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
mem load -filltype value -filldata 0110001011000000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
mem load -filltype value -filldata 0110100011010000 -fillradix symbolic /processor/pm_instMem/MEMORY(1)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
run
add wave -position insertpoint  \
sim:/processor/pm_reg_file/newSp
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
mem load -filltype value -filldata 0110100011010000 -fillradix symbolic /processor/pm_instMem/MEMORY(2)
mem load -filltype value -filldata 0000000000000000 -fillradix symbolic /processor/pm_instMem/MEMORY(1)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
mem load -filltype value -filldata {0110100011010100 } -fillradix symbolic /processor/pm_instMem/MEMORY(2)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
run
mem load -filltype value -filldata {1000000000000000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
mem load -filltype value -filldata 1000100100000100 -fillradix symbolic /processor/pm_instMem/MEMORY(1)
mem load -filltype value -filldata 1001001000001000 -fillradix symbolic /processor/pm_instMem/MEMORY(2)
mem load -filltype value -filldata 1001101100001100 -fillradix symbolic /processor/pm_instMem/MEMORY(3)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
run
mem load -filltype value -filldata 000 -fillradix symbolic /processor/pm_instMem/MEMORY(3)
mem load -filltype value -filldata 0 -fillradix symbolic /processor/pm_instMem/MEMORY(2)
mem load -filltype value -filldata 0 -fillradix symbolic /processor/pm_instMem/MEMORY(1)
mem load -filltype value -filldata 0 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
mem load -filltype value -filldata 1010001000000000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
run
run
run
run
mem load -filltype value -filldata 0001101001001000 -fillradix symbolic /processor/pm_instMem/MEMORY(14)
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
run
mem load -filltype value -filldata 1011100100000000 -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run
force -freeze sim:/processor/Reset 1 0
force -freeze sim:/processor/Reset 0 0
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
mem load -filltype value -filldata {1011101100000000 } -fillradix symbolic /processor/pm_instMem/MEMORY(0)
force -freeze sim:/processor/Reset 1 0
run
force -freeze sim:/processor/Reset 0 0
run
run
run
run