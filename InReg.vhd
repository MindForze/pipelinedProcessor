LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY InReg IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
END InReg;

ARCHITECTURE a_InReg OF InReg IS
	BEGIN
		PROCESS (Clk,Rst)
			BEGIN
				IF Rst = '1' THEN
					q <= (OTHERS=>'0');
				ELSIF ((rising_edge(Clk))) THEN
					q <= d;
				END IF;
		END PROCESS;
END a_InReg;

