LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY EMreg IS
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

END EMreg;

ARCHITECTURE EMregArch OF EMreg IS
	BEGIN
		PROCESS(CLK, RST)
			BEGIN
				IF RST = '1' THEN
					RETOUT	    <= '0';
					RTIOUT      <= '0';
					RdOUT       <= (OTHERS => '0');
					DTargetOUT  <= (OTHERS => '0');
					PCplusOUT   <= (OTHERS => '0');
					ALUResultOUT<= (OTHERS => '0');
					ImmEAOUT    <= (OTHERS => '0');
					IncSPOUT    <= '0';
					DecSPOUT    <= '0';
					--WB SEGMENT 4 BITS
					RegWROUT  <= '0';
					OutWROUT  <= '0';
					XtoRegOUT <= (OTHERS => '0');
				
					--MEM SEGMENT 3 BITS
					AddRselectOUT <= '0';
					MemWROUT      <= '0';
					XtoMemOUT     <= '0';

				ELSIF RISING_EDGE(CLK) AND EN = '1' THEN
					IF FLUSH = '1' THEN
						RETOUT	    <= '0';
						RTIOUT      <= '0';
						RdOUT       <= (OTHERS => '0');
						DTargetOUT  <= (OTHERS => '0');
						PCplusOUT   <= (OTHERS => '0');
						ALUResultOUT<= (OTHERS => '0');
						ImmEAOUT    <= (OTHERS => '0');
						IncSPOUT    <= '0';
						DecSPOUT    <= '0';

						--WB SEGMENT 4 BITS
						RegWROUT  <= '0';
						OutWROUT  <= '0';
						XtoRegOUT <= (OTHERS => '0');
					
						--MEM SEGMENT 3 BITS
						AddRselectOUT <= '0';
						MemWROUT      <= '0';
						XtoMemOUT     <= '0';

					ELSE
								
						RETOUT	    <= RET;
						RTIOUT      <= RTI;
						RdOUT 	    <= Rd;
						DTargetOUT  <= DTarget;
						PCplusOUT   <= PCplus;
						ALUResultOUT<= ALUResult;
						ImmEAOUT    <= ImmEA;
						IncSPOUT    <= IncSP;
						DecSPOUT    <= DecSP;
		
						--WB SEGMENT 4 BITS
						RegWROUT <= RegWR;
						OutWROUT <= OutWR;
						XtoRegOUT <= XtoReg;
		
						--MEM SEGMENT 3 BITS
						AddRselectOUT <= AddRselect;
						MemWROUT <= MemWR;
						XtoMemOUT <= XtoMem;
					
					END IF;
				END IF;

		END PROCESS;

END EMregArch;