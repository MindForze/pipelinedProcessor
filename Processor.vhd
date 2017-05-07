LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity Processor is 
	
	PORT( Clk, Rst, Reset, Int : in std_logic;
		InPort : in std_logic_vector(15 downto 0);
		OutPort : out std_logic_vector(15 downto 0)
);
end processor;

Architecture a_Processor of Processor IS

Component AddOne IS
	PORT(
		  d : IN  std_logic_vector(15 DOWNTO 0);
		  q : OUT std_logic_vector(15 DOWNTO 0));
END Component;

component alu IS
	PORT( a,b : IN std_logic_vector (15 downto 0);
	s : IN std_logic_vector (3 downto 0);
	f : OUT std_logic_vector (15 downto 0);
	flags_in : IN std_logic_vector (3 downto 0);
	flags_out : OUT std_logic_vector(3 downto 0));
END component alu;

component BranchUnit IS
	PORT( 
		JmpCallFromID : IN std_logic;
		DestFromID : IN std_logic_vector(15 downto 0);
		JmpTypeFromEx : IN std_logic_vector (1 downto 0);
		DestFromEx : IN std_logic_vector(15 downto 0);
		RetFromEx: IN std_logic;
		RtiFromEx: IN std_logic;
		RetFromMem: IN std_logic;
		RtiFromMem: IN std_logic;
		DestFromMem: IN std_logic_vector(15 downto 0);
		Flags : IN std_logic_vector(3 downto 0); --Z N C V
		FlushID : OUT std_logic;
		FlushEx : OUT std_logic;
		FlushMem : OUT std_logic;
		ChangePC : OUT std_logic;
		NewPC : OUT std_logic_vector(15 downto 0));
End component;

component ControlUnit IS
	PORT( opCode : IN  std_logic_vector(4 DOWNTO 0);
		Load : OUT std_logic;
		NeedRs : OUT std_logic;
		NeedRt : OUT std_logic;
		RegWrite : OUT std_logic;
		OutWrite : OUT std_logic;
		XToReg: OUT std_logic_vector(1 DOWNTO 0);

		AddrSelector : OUT std_logic;
		MemWrite : OUT std_logic;
		XToMem : OUT std_logic;

		JmpType : OUT std_logic_vector(1 DOWNTO 0);
		JmpCall : OUT std_logic;
		IncSP : OUT std_logic;
		DecSP : OUT std_logic;
		Int : OUT std_logic;
		Rti : OUT std_logic;
		Ret : OUT std_logic;
		FlagsModify : OUT std_logic;

		SetC : OUT std_logic;
		ClrC : OUT std_logic;
		Operation : OUT std_logic_vector(3 DOWNTO 0);
		Shift : OUT std_logic;

		FromIn : OUT std_logic);
end component ControlUnit;

component FlagsReg IS
	GENERIC ( n : integer := 4);
	PORT( Clk,Rst, Enable, SetC, ClrC : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
end component FlagsReg;

component FlagsRegRes IS
	GENERIC ( n : integer := 4);
	PORT( Clk,Rst, Enable : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
END  component FlagsRegRes;

component ForwardingUnit IS
	PORT(JmpCallFromId : In std_logic;
		RsFromId : In std_logic_vector(2 downto 0);
		RtFromId : In std_logic_vector(2 downto 0);
		RsFromEx : In std_logic_vector(2 downto 0);
		RtFromEx : In std_logic_vector(2 downto 0);
		RdFromEx : In std_logic_vector(2 downto 0);

		NeedRsFromId : In std_logic;
		NeedRtFromId : In std_logic;

		NeedRsFromEx : In std_logic;
		NeedRtFromEx : In std_logic;
		
		RdFromMem: In std_logic_vector(2 downto 0);
		RdFromWb: In std_logic_vector(2 downto 0);
		
		RegWriteFromEx: In std_logic;
		XToRegFromEx: In std_logic_vector(1 downto 0);

		RegWriteFromMem: In std_logic;
		XToRegFromMem: In std_logic_vector(1 downto 0);

		RegWriteFromWb: In std_logic;
		XToRegFromWb: In std_logic_vector(1 downto 0);

		ALUResFromMem: In std_logic_vector(15 downto 0);
		ImmFromMem: In std_logic_vector(15 downto 0);

		ALUResFromWb: In std_logic_vector(15 downto 0);
		ImmFromWb: In std_logic_vector(15 downto 0);
		MemDataFromWb: In std_logic_vector(15 downto 0);
		
		StallPc: Out std_logic;
		StallIfId: Out std_logic;
		FlushIdEx: Out std_logic;
		
		ForwardToId: Out std_logic;
		RsToId: Out std_logic_vector(15 downto 0);
		
		ForwardRsToEx: Out std_logic;
		ForwardRtToEx: Out std_logic;
		RsToEx: Out std_logic_vector(15 downto 0);
		RtToEx: Out std_logic_vector(15 downto 0));
	
end component ForwardingUnit;

component InReg IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
end component InReg;

component InterruptUnit IS
	PORT(	Clk : IN std_logic;
		IsPipeLineStalled : IN std_logic;
		IntRequest : IN  std_logic;
		Reset : IN std_logic;
		LoadFromID : IN std_logic;
		JmpCallFromID : IN std_logic;
		JmpTypeFromID : IN std_logic_vector(1 downto 0);
		RetFromID : IN std_logic;
		RtiFromID : IN std_logic;
		JmpTypeFromEx : IN std_logic_vector (1 downto 0);
		RetFromEx: IN std_logic;
		RtiFromEx: IN std_logic;
		RetFromMem: IN std_logic;
		RtiFromMem: IN std_logic;
		IntInstr : OUT std_logic_vector(15 downto 0);
		PcPcMinus : OUT  std_logic;
		FlushExecute : OUT std_logic;
		IntOut : OUT std_logic );
end component InterruptUnit;

component Mux2 IS  
		PORT (a, b : IN std_logic_vector(15 downto 0);
			s0 : IN  std_logic;
		        x : OUT std_logic_vector(15 downto 0) );  
end component Mux2;

component OutReg IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst, Enable : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
end component OutReg;

component PC IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst, Enable : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
end component PC;

component  reg_file is
port(
    Rs : in std_logic_vector(2 downto 0);
    Rt : in std_logic_vector(2 downto 0);
    Rd : in std_logic_vector(2 downto 0);
    StallSp : in std_logic;
    Ds : out std_logic_vector(15 downto 0);
    Dt : out std_logic_vector(15 downto 0);
    Pc : in std_logic_vector(15 downto 0);
    wB : in std_logic;
    WD : in std_logic_vector(15 downto 0);
    rst, clk, incSp, decSp: in std_logic); -- negative clk

end component reg_file;

component SubOne IS
	PORT(
		  d : IN  std_logic_vector(15 DOWNTO 0);
		  q : OUT std_logic_vector(15 DOWNTO 0));
end component SubOne;

component MWreg IS
	PORT(
		CLK, RST, EN : IN STD_LOGIC; 
		
		IMM      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		MEMDATA  : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ALUResult: IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		Rd    	 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);--3 BITS

		--WB SEGMENT 4 BITS
		RegWR, OutWR : IN STD_LOGIC;
		XtoReg : IN STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS

		---------------------------------------------------	
		
		IMMOUT	     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		MEMDATAOUT   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ALUResultOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		RdOUT  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);--3 BITS
		
		--WB SEGMENT 4 BITS
		RegWROUT, OutWROUT : OUT STD_LOGIC;
		XtoRegOUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));--2 BITS

end component MWreg;

component  DEreg IS
	PORT(
		CLK, RST, EN, FLUSH : IN STD_LOGIC; 
		
		RET	: IN STD_LOGIC;
		LD 	: IN STD_LOGIC;
		INT     : IN STD_LOGIC;
		RTI     : IN STD_LOGIC;
		FlagMod : IN STD_LOGIC;
		DecSP   : IN STD_LOGIC;
		DSrc    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		DTarget : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		JMPtyp  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		INSTDATA: IN STD_LOGIC_VECTOR(10 DOWNTO 0);--11 BITS
		PCplus	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		NeedRs 	: IN STD_LOGIC;
		NeedRt 	: IN STD_LOGIC;

		--WB SEGMENT 4 BITS
		RegWR, OutWR : IN STD_LOGIC;
		XtoReg : IN STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS
		
		--MEM SEGMENT 3 BITS
		AddRselect, MemWR, XtoMem : IN STD_LOGIC;

		--EXE SEGMENT 7 BITS
		SetC, ClrC, Shift : IN STD_LOGIC;
		AluOP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);--4 BITS

		---------------------------------------------------		
		
		RETOUT		: OUT STD_LOGIC;
		LDOUT 	   	: OUT STD_LOGIC;
		INTOUT     	: OUT STD_LOGIC;
		RTIOUT     	: OUT STD_LOGIC;
		FlagModOUT 	: OUT STD_LOGIC;
		DecSPOUT   	: OUT STD_LOGIC;
		DSrcOUT    	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DTargetOUT 	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		JMPtypOUT 	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		INSTDATAOUT	: OUT STD_LOGIC_VECTOR(10 DOWNTO 0);--11 BITS
		PCplusOUT	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		NeedRsOUT 	: OUT STD_LOGIC;
		NeedRtOUT 	: OUT STD_LOGIC;
		--WB SEGMENT 4 BITS
		RegWROUT, OutWROUT : OUT STD_LOGIC;
		XtoRegOUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS
		
		--MEM SEGMENT 3 BITS
		AddRselectOUT, MemWROUT, XtoMemOUT : OUT STD_LOGIC;

		--EXE SEGMENT 7 BITS
		SetCOUT, ClrCOUT, ShiftOUT : OUT STD_LOGIC;
		AluOPOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));--4 BITS
				
end component DEreg;

component EMreg IS
	PORT(
		CLK, RST, EN, FLUSH : IN STD_LOGIC; 

		RET	 : IN STD_LOGIC;
		RTI      : IN STD_LOGIC;
		Rd 	 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);--3 BITS
		DTarget  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PCplus	 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALUResult: IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ImmEA 	 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		IncSP    : IN STD_LOGIC;
		DecSP    : IN STD_LOGIC;
		--WB SEGMENT 4 BITS
		RegWR, OutWR : IN STD_LOGIC;
		XtoReg : IN STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS
		
		--MEM SEGMENT 3 BITS
		AddRselect, MemWR, XtoMem : IN STD_LOGIC;
		
		---------------------------------------------------		
		
		RETOUT	    : OUT STD_LOGIC;
		RTIOUT      : OUT STD_LOGIC;
		RdOUT 	    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);--3 BITS
		DTargetOUT  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		PCplusOUT   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALUResultOUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ImmEAOUT    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		IncSPOUT    : OUT STD_LOGIC;
		DecSPOUT    : OUT STD_LOGIC;
		--WB SEGMENT 4 BITS
		RegWROUT, OutWROUT : OUT STD_LOGIC;
		XtoRegOUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS
		
		--MEM SEGMENT 3 BITS
		AddRselectOUT, MemWROUT, XtoMemOUT : OUT STD_LOGIC);

end component EMreg;

component  FDreg IS
	PORT(
		CLK, RST, EN, FLUSH : IN STD_LOGIC; 

		PCplus 	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		INST	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PCcurrent:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		PCplusOUT:   OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		OPcode   :   OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --5 BITS
		INSTDATA :   OUT STD_LOGIC_VECTOR(10 DOWNTO 0); --11 BITS
		PCcurrentOUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
		
end component FDreg;

component instMem IS
	PORT(
		--1KB ADD.SPACE BUT PC IS 16 BITS
		CLK : IN STD_LOGIC;
		RST : IN STD_LOGIC;
		ADDRESS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		INSTOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END component instMem;

component dataMem IS

	PORT(
		CLK : IN STD_LOGIC;
		MEMWR  : IN STD_LOGIC;
		RST : IN STD_LOGIC;
		-- 1kB
		ADDRESS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		DATAIN  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		M0 	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		M1	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DATAOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));

END component dataMem;

--AddOne

Signal AddOne_result : std_logic_vector(15 downto 0);

--alu

signal alu_result : std_logic_vector(15 downto 0);
signal alu_flags_out : std_logic_vector(3 downto 0);

--BranchUnit

signal BranchUnit_FlushID, BranchUnit_FlushEx, BranchUnit_FlushMem, BranchUnit_ChangePC : std_logic;
signal BranchUnit_NewPC : std_logic_vector(15 downto 0);

--ControlUnit

signal ControlUnit_Load, ControlUnit_NeedRs, ControlUnit_NeedRt,
	ControlUnit_RegWrite, ControlUnit_OutWrite, ControlUnit_AddrSelector,
	ControlUnit_MemWrite, ControlUnit_XToMem, ControlUnit_JmpCall,
	ControlUnit_IncSP, ControlUnit_DecSP, ControlUnit_Int, ControlUnit_Rti,
	ControlUnit_Ret, ControlUnit_FlagsModify, ControlUnit_SetC, ControlUnit_ClrC
	, ControlUnit_Shift, ControlUnit_FromIn : std_logic;

signal ControlUnit_XToReg, ControlUnit_JmpType : std_logic_vector(1 downto 0);
signal ControlUnit_Operation : std_logic_vector(3 downto 0);

--FlagsReg

signal FlagsReg_out : std_logic_vector(3 downto 0);

--FlagsRegRes

signal FlagsRegRes_out : std_logic_vector(3 downto 0);

--ForwardingUnit

signal ForwardingUnit_StallPc, ForwardingUnit_StallIfId, ForwardingUnit_FlushIdEx,
	ForwardingUnit_ForwardToId, ForwardingUnit_ForwardRsToEx,
	ForwardingUnit_ForwardRtToEx : std_logic;

signal ForwardingUnit_RsToId, ForwardingUnit_RsToEx, ForwardingUnit_RtToEx : std_logic_vector(15 downto 0);

--InReg

signal InReg_out : std_logic_vector(15 downto 0);

--InterruptUnit

signal InterruptUnit_IntInstr : std_logic_vector(15 downto 0);
signal InterruptUnit_PcPcMinus, InterruptUnit_FlushExecute, InterruptUnit_IntOut : std_logic;

--OutReg

--signal OutReg_Out : std_logic_vector(15 downto 0); --unused

--PC

signal PC_Out : std_logic_vector(15 downto 0);

--reg_file

signal reg_file_Ds , reg_file_Dt : std_logic_vector(15 downto 0);

-- SubOne

signal SubOne_Out : std_logic_vector(15 downto 0);

--MWreg

signal MWreg_IMMOUT, MWreg_MEMDATAOUT, MWreg_ALUResultOUT : std_logic_vector(15 downto 0);
signal MWreg_RdOUT : std_logic_vector(2 downto 0);
signal MWreg_RegWROUT, MWreg_OutWROUT : std_logic;
signal MWreg_XtoRegOUT : std_logic_vector(1 downto 0);

--DEreg

signal DEreg_RETOUT, DEreg_LDOUT, DEreg_INTOUT, DEreg_RTIOUT, DEreg_FlagModOUT,
	DEreg_DecSPOUT, DEreg_NeedRsOUT, DEreg_NeedRtOUT, DEreg_RegWROUT,
	DEreg_OutWROUT, DEreg_AddRselectOUT, DEreg_MemWROUT, DEreg_XtoMemOUT,
	DEreg_SetCOUT, DEreg_ClrCOUT, DEreg_ShiftOUT : std_logic;

signal DEreg_DSrcOUT, DEreg_DTargetOUT, DEreg_PCplusOUT : std_logic_vector(15 downto 0);

signal DEreg_JMPtypOUT, DEreg_XtoRegOUT : std_logic_vector(1 downto 0);
signal DEreg_INSTDATAOUT : std_logic_vector(10 downto 0);

signal DEreg_AluOPOUT : std_logic_vector(3 downto 0);

--EMreg

signal EMreg_RETOUT, EMreg_RTIOUT, EMreg_IncSPOUT, EMreg_DecSPOUT, EMreg_RegWROUT
	,EMreg_OutWROUT, EMreg_AddRselectOUT, EMreg_MemWROUT, EMreg_XtoMemOUT : std_logic;

signal EMreg_RdOUT : std_logic_vector(2 downto 0);

signal EMreg_DTargetOUT, EMreg_PCplusOUT, EMreg_ALUResultOUT, EMreg_ImmEAOUT : std_logic_vector(15 downto 0);

signal EMreg_XtoRegOUT : std_logic_vector(1 downto 0);

--FDreg

signal FDreg_OPcode :std_logic_vector (4 downto 0);
signal FDreg_INSTDATA : std_logic_vector(10 downto 0);
signal FDreg_PCplusOUT, FDreg_PCcurrentOUT : std_logic_vector(15 downto 0);

--instMem

signal instMem_INSTOUT : std_logic_vector(15 downto 0);

--dataMem

signal dataMem_M0, dataMem_M1, dataMem_DATAOUT : std_logic_vector(15 downto 0);

--PCMux

signal PCMux_JmpOut, PCMux_IntOut, PCMux_ResetOut, PCMux_PcPcMinusOut, PCMux_PcPlusOut, PCMux_IntInstOut : std_logic_vector(15 downto 0);

--IDMux

signal IDMux_ForwardOut, IDMux_InOut : std_logic_vector(15 downto 0);

--ExMux

signal ExMux_ForwardDsOut, ExMux_ForwardDtOut, ExMux_ShiftOut : std_logic_vector(15 downto 0);

--MemMux

signal MemMux_AddrOut : std_logic_vector(15 downto 0);
signal MemMux_DataOut : std_logic_vector(15 downto 0);

--WBMux

signal WBMux_ImmOut, WBMux_AluOut : std_logic_vector(15 downto 0);

--FlagsMux

signal FlagsMux_out : std_logic_vector(15 downto 0);

--Other
signal ResetInt : std_logic;

signal InvertedStallPc : std_logic;

signal DEregFlusher : std_logic;

signal EMregFlusher : std_logic;

signal FDregFlusher : std_logic;

signal FDreg_Imm : std_logic_vector(15 downto 0);

signal ShiftVal : std_logic_vector(15 downto 0);

signal aluFlagsToMux : std_logic_vector(15 downto 0);

signal FlagResFlagsToMux : std_logic_vector(15 downto 0);

begin 

ResetInt <= (Rst or Reset);
InvertedStallPc <= (not ForwardingUnit_StallPc);
DEregFlusher <= ForwardingUnit_FlushIdEx or DEreg_LDOUT or BranchUnit_FlushEx or Reset;
EMregFlusher <= Reset or BranchUnit_FlushMem;
FDregFlusher <= Reset or BranchUnit_FlushId;
FDreg_Imm <= FDreg_OPcode & FDreg_INSTDATA;
ShiftVal <= "00000000000" & DEreg_INSTDATAOUT(7 downto 5) & DEreg_INSTDATAOUT(1 downto 0);
pm_AddOne : AddOne port map (PC_Out, AddOne_result);
aluFlagsToMux <= "000000000000" & alu_flags_out;
FlagResFlagsToMux <= "000000000000" & FlagsRegRes_out;

pm_alu : alu port map (ExMux_ForwardDsOut, ExMux_ShiftOut, DEreg_AluOPOUT, alu_result, FlagsReg_out, alu_flags_out);

pm_BranchUnit : BranchUnit port map (ControlUnit_JmpCall, IDMux_InOut, DEreg_JMPtypOUT, alu_result, DEreg_RETOUT, DEreg_RTIOUT, EMreg_RETOUT, EMreg_RTIOUT, dataMem_DATAOUT, FlagsReg_out, BranchUnit_FlushID, BranchUnit_FlushEx, BranchUnit_FlushMem, BranchUnit_ChangePC, BranchUnit_NewPC );

pm_ControlUnit : ControlUnit port map (FDreg_OPcode, ControlUnit_Load, ControlUnit_NeedRs, ControlUnit_NeedRt, ControlUnit_RegWrite, ControlUnit_OutWrite, ControlUnit_XToReg, ControlUnit_AddrSelector, ControlUnit_MemWrite, ControlUnit_XToMem, ControlUnit_JmpType, ControlUnit_JmpCall, ControlUnit_IncSP, ControlUnit_DecSP, ControlUnit_Int, ControlUnit_Rti, ControlUnit_Ret, ControlUnit_FlagsModify, ControlUnit_SetC, ControlUnit_ClrC, ControlUnit_Operation, ControlUnit_Shift, ControlUnit_FromIn);

pm_FlagsReg : FlagsReg port map  ( Clk, Rst, DEreg_FlagModOUT, DEreg_SetCOUT, DEreg_ClrCOUT, FlagsMux_out(3 downto 0), FlagsReg_out);

pm_FlagsRegRes : FlagsRegRes port map  ( Clk, Rst, DEreg_INTOUT, FlagsReg_out, FlagsRegRes_out);

pm_ForwardingUnit : ForwardingUnit port map (ControlUnit_JmpCall, FDreg_INSTDATA(10 downto 8), FDreg_INSTDATA(7 downto 5), DEreg_INSTDATAOUT(10 downto 8), DEreg_INSTDATAOUT(7 downto 5), DEreg_INSTDATAOUT(4 downto 2), ControlUnit_NeedRs, ControlUnit_NeedRt, DEreg_NeedRsOUT, DEreg_NeedRtOUT, EMreg_RdOUT, MWreg_RdOUT, DEreg_RegWROUT, DEreg_XtoRegOUT, EMreg_RegWROUT, EMreg_XtoRegOUT, MWreg_RegWROUT, MWreg_XtoRegOUT, EMreg_ALUResultOUT, EMreg_ImmEAOUT, MWreg_ALUResultOUT, MWreg_IMMOUT, MWreg_MEMDATAOUT, ForwardingUnit_StallPc, ForwardingUnit_StallIfId, ForwardingUnit_FlushIdEx, ForwardingUnit_ForwardToId, ForwardingUnit_RsToId, ForwardingUnit_ForwardRsToEx, ForwardingUnit_ForwardRtToEx, ForwardingUnit_RsToEx, ForwardingUnit_RtToEx);

pm_InReg : InReg port map (Clk, Rst, InPort, InReg_out);

pm_InterruptUnit : InterruptUnit port map (Clk, ForwardingUnit_StallPc, Int, ResetInt, ControlUnit_Load, ControlUnit_JmpCall, ControlUnit_JmpType, ControlUnit_Ret, ControlUnit_Rti, DEreg_JMPtypOUT, DEreg_RETOUT, DEreg_RTIOUT, EMreg_RETOUT, EMreg_RTIOUT, InterruptUnit_IntInstr, InterruptUnit_PcPcMinus, InterruptUnit_FlushExecute, InterruptUnit_IntOut);

pm_OutReg : OutReg port map ( Clk, Rst, MWreg_OutWROUT, MWreg_ALUResultOUT, OutPort);

pm_PC : PC port map (Clk, Rst, InvertedStallPc, PCMux_ResetOut, PC_Out);

pm_reg_file : reg_file port map (FDreg_INSTDATA(10 downto 8), FDreg_INSTDATA(7 downto 5), MWreg_RdOUT, ForwardingUnit_StallPc, reg_file_Ds, reg_file_Dt, FDreg_PCcurrentOUT, MWreg_RegWROUT, WBMux_AluOut, Rst, Clk, ControlUnit_IncSP, DEreg_DecSPOUT);

pm_SubOne : SubOne port map ( PC_Out, SubOne_Out);

pm_MWreg : MWreg port map (Clk, Rst, '1', EMreg_ImmEAOUT, dataMem_DATAOUT, EMreg_ALUREsultOUT, EMreg_RdOUT, EMreg_RegWROUT, EMreg_OutWROUT, EMreg_XtoRegOUT, MWreg_IMMOUT, MWreg_MEMDATAOUT, MWreg_ALUResultOUT, MWreg_RdOUT, MWreg_RegWROUT, MWreg_OutWROUT, MWreg_XtoRegOUT);

pm_DEreg : DEreg port map (Clk, Rst, '1', DEregFlusher, ControlUnit_Ret, ControlUnit_Load, ControlUnit_Int, ControlUnit_Rti, ControlUnit_FlagsModify, ControlUnit_DecSP, IDMux_InOut, reg_file_Dt, ControlUnit_JmpType, FDreg_InstData, FDreg_PCplusOUT, ControlUnit_NeedRs, ControlUnit_NeedRt, ControlUnit_RegWrite, ControlUnit_OutWrite, ControlUnit_XtoReg, ControlUnit_AddrSelector, ControlUnit_MemWrite, ControlUnit_XtoMem , ControlUnit_SetC, ControlUnit_ClrC, ControlUnit_Shift, ControlUnit_Operation, DEreg_RETOUT, DEreg_LDOUT, DEreg_INTOUT, DEreg_RTIOUT, DEreg_FlagModOUT, DEreg_DecSPOUT, DEreg_DSrcOUT, DEreg_DTargetOUT, DEreg_JMPtypOUT, DEreg_INSTDATAOUT, DEreg_PCplusOUT, DEreg_NeedRsOUT, DEreg_NeedRtOUT, DEreg_RegWROUT, DEreg_OutWROUT, DEreg_XtoRegOUT, DEreg_AddRselectOUT, DEreg_MemWROUT, DEreg_XtoMemOUT, DEreg_SetCOUT, DEreg_ClrCOUT, DEreg_ShiftOUT, DEreg_AluOPOUT);

pm_EMreg : EMreg port map (Clk, Rst, '1', EMregFlusher, DEreg_RETOUT, DEreg_RTIOUT, DEreg_INSTDATAOUT(4 downto 2), DEreg_DTargetOUT, DEreg_PCplusOUT, alu_result, FDreg_Imm, '0', DEreg_DecSPOUT, DEreg_RegWROUT, DEreg_OutWROUT, DEreg_XtoRegOUT, DEreg_AddRselectOUT, DEreg_MemWROUT, DEreg_XtoMemOUT, EMreg_RETOUT, EMreg_RTIOUT, EMreg_RdOUT, EMreg_DTargetOUT, EMreg_PCplusOUT, EMreg_ALUResultOUT, EMreg_ImmEAOUT, EMreg_IncSPOUT, EMreg_DecSPOUT, EMreg_RegWROUT, EMreg_OutWROUT, EMreg_XtoRegOUT, EMreg_AddRselectOUT, EMreg_MemWROUT, EMreg_XtoMemOUT); 

pm_FDreg : FDreg port map (Clk, Rst, InvertedStallPc, FDregFlusher, PCMux_PcPlusOut, PCMux_IntInstOut, PC_Out, FDreg_PCplusOUT, FDreg_OPcode, FDreg_INSTDATA, FDreg_PCcurrentOUT);

pm_instMem : instMem port map (Clk, Rst, PC_Out(9 downto 0), instMem_INSTOUT);

pm_dataMem : dataMem port map (Clk, EMreg_MEMWROUT, Rst, MemMux_AddrOut(9 downto 0), MemMux_DataOut, dataMem_M0, dataMem_M1, dataMem_DATAOUT);

pm_PCMux_Jmp : Mux2  port map ( AddOne_result, BranchUnit_NewPC, BranchUnit_ChangePC, PCMux_JmpOut);

pm_PCMux_Int : Mux2 port map (PCMux_JmpOut, dataMem_M1, InterruptUnit_IntOut, PCMux_IntOut);

pm_PCMux_Reset : Mux2 port map (PCMux_IntOut, dataMem_M0, Reset, PCMux_ResetOut);

pm_PCMux_PcPcMinus : Mux2 port map (PC_Out, SubOne_Out, InterruptUnit_PcPcMinus, PCMux_PcPcMinusOut);

pm_PCMux_PcPlus : Mux2 port map (AddOne_result, PCMux_PcPcMinusOut, InterruptUnit_IntOut, PCMux_PcPlusOut);

pm_PCMux_IntInst : Mux2 port map (instMem_INSTOUT, InterruptUnit_IntInstr, InterruptUnit_IntOut, PCMux_IntInstOut);

pm_IDMux_Forward : Mux2 port map (reg_file_Ds, ForwardingUnit_RsToId, ForwardingUnit_ForwardToId, IDMux_ForwardOut);

pm_IDMux_In : Mux2 port map (IDMux_ForwardOut, InReg_out, ControlUnit_FromIn, IDMux_InOut);

pm_ExMux_ForwardDs : Mux2 port map (DEreg_DSrcOUT, ForwardingUnit_RsToEx, ForwardingUnit_ForwardRsToEx, ExMux_ForwardDsOut);

pm_ExMux_ForwardDt : Mux2 port map (DEreg_DTargetOUT, ForwardingUnit_RtToEx, ForwardingUnit_ForwardRtToEx, ExMux_ForwardDtOut);

pm_ExMux_Shift : Mux2 port map (ExMux_ForwardDtOut, ShiftVal, DEreg_ShiftOUT, ExMux_ShiftOut);

pm_MemMux_Addr : Mux2 port map (EMreg_DTargetOUT, EMreg_ImmEAOUT, EMreg_AddRselectOUT, MemMux_AddrOut);

pm_MemMux_Data : Mux2 port map (EMreg_PCplusOUT, EMreg_ALUResultOUT, EMreg_XtoMemOUT, MemMux_DataOut);

pm_WBMux_Imm : Mux2 port map (MWreg_MEMDATAOUT, MWreg_IMMOUT, MWreg_XToRegOUT(1), WBMux_ImmOut);

pm_WBMux_Alu : Mux2 port map (WBMux_ImmOut, MWreg_ALUResultOUT, MWreg_XToRegOUT(0), WBMux_AluOut);

pm_FlagsMux : Mux2 port map (aluFlagsToMux, FlagResFlagsToMux, DEreg_RTIOUT, FlagsMux_Out);

END a_Processor;
