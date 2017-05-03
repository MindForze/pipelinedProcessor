LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY OutReg IS
	GENERIC ( n : integer := 16);
	PORT( Clk,Rst, Enable : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
END OutReg;

ARCHITECTURE a_OutReg OF OutReg IS
	BEGIN
		PROCESS (Clk,Rst)
			BEGIN
				IF Rst = '1' THEN
					q <= (OTHERS=>'0');
				ELSIF ((rising_edge(Clk)) and Enable= '1') THEN
					q <= d;
				END IF;
		END PROCESS;
END a_OutReg;

