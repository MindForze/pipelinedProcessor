LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY  FDreg IS
	PORT(
		CLK, RST, EN : IN STD_LOGIC; 

		PCplus 	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		INST	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PCcurrent:IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		
		RSrc : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		RTarget : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		PCplusOUT: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		OPcode   : OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --5 BITS
		INSTDATA : OUT STD_LOGIC_VECTOR(10 DOWNTO 0); --11 BITS
		PCcurrentOUT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
		
END FDreg;


ARCHITECTURE FDregArch OF FDreg IS
	BEGIN
		PROCESS(CLK)
			BEGIN
				IF RST = '1' THEN
					PCplusOUT    <= (OTHERS => '0');
					PCcurrentOUT <= (OTHERS => '0');
					
					OPcode	 <= (OTHERS => '0');					
					INSTDATA <= (OTHERS => '0'); 
	
					RSrc    <= (OTHERS => '0');
					RTarget <= (OTHERS => '0');
	
				ELSIF RISING_EDGE(CLK) AND EN = '1' THEN
					PCplusOUT    <= PCplus;
					PCcurrentOUT <= PCcurrent;
					
					OPcode   <= INST(15 DOWNTO 11);
					INSTDATA <= INST(10 DOWNTO 0);
					
					RSrc     <= INST(10 DOWNTO 8);
					RTarget  <= INST(7 DOWNTO 5);
								
				END IF;	
		END PROCESS;

END FDregArch;