LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MWreg IS
	PORT(
		CLK, RST, EN, FLUSH : IN STD_LOGIC; 
		
		IMM      : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		MEMDATA  : IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ALUResult: IN STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		INSTDATA : IN STD_LOGIC_VECTOR(10 DOWNTO 0);--11 BITS

		--WB SEGMENT 4 BITS
		RegWR, OutWR : IN STD_LOGIC;
		XtoReg : IN STD_LOGIC_VECTOR(1 DOWNTO 0);--2 BITS

		---------------------------------------------------	
		
		IMMOUT	     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		MEMDATAOUT   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		ALUResultOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 BITS
		INSTDATAOUT  : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);--11 BITS
		
		--WB SEGMENT 4 BITS
		RegWROUT, OutWROUT : OUT STD_LOGIC;
		XtoRegOUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));--2 BITS

END MWreg;

ARCHITECTURE MWregArch OF MWreg IS
	BEGIN
		PROCESS(CLK)
			BEGIN
				IF RST = '1' THEN
					IMMOUT       <= (OTHERS => '0');
					MEMDATAOUT   <= (OTHERS => '0');
					ALUResultOUT <= (OTHERS => '0');
					INSTDATAOUT  <= (OTHERS => '0');
		
					--WB SEGMENT 4 BITS
					RegWROUT  <= '0';
					OutWROUT  <= '0';
					XtoRegOUT <= (OTHERS => '0');	

				ELSIF RISING_EDGE(CLK) AND EN = '1' THEN
					IF FLUSH = '1' THEN
						IMMOUT       <= (OTHERS => '0');
						MEMDATAOUT   <= (OTHERS => '0');
						ALUResultOUT <= (OTHERS => '0');
						INSTDATAOUT  <= (OTHERS => '0');
						
						--WB SEGMENT 4 BITS
						RegWROUT  <= '0';
						OutWROUT  <= '0';
						XtoRegOUT <= (OTHERS => '0');			
		
					ELSE			
						IMMOUT	     <= IMM;
						MEMDATAOUT   <= MEMDATA;
						ALUResultOUT <= ALUResult;
						INSTDATAOUT  <= INSTDATA;
						
						--WB SEGMENT 4 BITS
						RegWROUT  <= RegWR;
						OutWROUT  <= OutWR;
						XtoRegOUT <= XtoReg;

					END IF;
				END IF;
		END PROCESS;

END MWregArch;