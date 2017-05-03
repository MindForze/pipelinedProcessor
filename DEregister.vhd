LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY  DEreg IS
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
				
END DEreg;


ARCHITECTURE DEregArch OF DEreg IS
	BEGIN
		PROCESS(CLK, RST)
			BEGIN
				IF RST = '1' THEN
					RETOUT		<= '0';
					LDOUT 	   	<= '0';
					INTOUT     	<= '0';
					RTIOUT     	<= '0';
					FlagModOUT 	<= '0';
					DecSPOUT   	<= '0';
					DSrcOUT    	<= (OTHERS => '0');
					DTargetOUT 	<= (OTHERS => '0');
					JMPtypOUT 	<= (OTHERS => '0');
					INSTDATAOUT	<= (OTHERS => '0');
					PCplusOUT	<= (OTHERS => '0');
					NeedRsOUT <= '0';
					NeedRtOUT <= '0';
					--WB SEGMENT 4 BITS
					RegWROUT  <= '0';
					OutWROUT  <= '0';
					XtoRegOUT <= (OTHERS => '0');
					
					--MEM SEGMENT 3 BITS
					AddRselectOUT <= '0';
					MemWROUT      <= '0';
					XtoMemOUT     <= '0';

					--EXE SEGMENT 7 BITS
					SetCOUT  <= '0';
					ClrCOUT  <= '0';
					ShiftOUT <= '0';
					AluOPOUT <= (OTHERS => '0');

				ELSIF RISING_EDGE(CLK) AND EN = '1' THEN
					IF FLUSH = '1' THEN
						RETOUT		<= '0';
						LDOUT 	   	<= '0';
						INTOUT     	<= '0';
						RTIOUT     	<= '0';
						FlagModOUT 	<= '0';
						DecSPOUT   	<= '0';
						DSrcOUT    	<= (OTHERS => '0');
						DTargetOUT 	<= (OTHERS => '0');
						JMPtypOUT 	<= (OTHERS => '0');
						INSTDATAOUT	<= (OTHERS => '0');
						PCplusOUT	<= (OTHERS => '0');
						NeedRsOUT 	<= '0';
						NeedRtOUT 	<= '0';
						--WB SEGMENT 4 BITS
						RegWROUT  <= '0';
						OutWROUT  <= '0';
						XtoRegOUT <= (OTHERS => '0');
					
						--MEM SEGMENT 3 BITS
						AddRselectOUT <= '0';
						MemWROUT      <= '0';
						XtoMemOUT     <= '0';

						--EXE SEGMENT 7 BITS
						SetCOUT  <= '0';
						ClrCOUT  <= '0';
						ShiftOUT <= '0';
						AluOPOUT <= (OTHERS => '0');				
					
					ELSE
						RETOUT		<= RET;
						LDOUT 	   	<= LD;
						INTOUT     	<= INT;
						RTIOUT     	<= RTI;
						FlagModOUT 	<= FlagMod;
						DecSPOUT   	<= DecSP;
						DSrcOUT    	<= DSrc;
						DTargetOUT 	<= DTarget;
						JMPtypOUT 	<= JMPtyp;
						INSTDATAOUT	<= INSTDATA;
						PCplusOUT	<= PCplus;
						NeedRsOUT 	<= NeedRs;
						NeedRtOUT 	<= NeedRt;
						--WB SEGMENT 4 BITS
						RegWROUT <= RegWR;
						OutWROUT <= OutWR;
						XtoRegOUT <= XtoReg;
		
						--MEM SEGMENT 3 BITS
						AddRselectOUT <= AddRselect;
						MemWROUT <= MemWR;
						XtoMemOUT <= XtoMem;

						--EXE SEGMENT 7 BITS
						SetCOUT <= SetC;
						ClrCOUT  <= ClrC;
						ShiftOUT <= Shift;
						AluOPOUT <= AluOP;
					END IF;			
				END IF;	
		END PROCESS;

END DEregArch;