LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FlagsReg IS
	GENERIC ( n : integer := 4);
	PORT( Clk,Rst, Enable, SetC, ClrC : IN std_logic;
		  d : IN  std_logic_vector(n-1 DOWNTO 0);
		  q : OUT std_logic_vector(n-1 DOWNTO 0));
END FlagsReg;

ARCHITECTURE a_FlagsReg OF FlagsReg IS
	BEGIN
		PROCESS (Clk,Rst)
			BEGIN
				IF Rst = '1' THEN
					q <= (OTHERS=>'0');
				ELSIF ((rising_edge(Clk)) and Enable= '1' and ClrC = '0' and SetC = '0') THEN
					q <= d;
				ELSIF ((rising_edge(Clk)) and Enable= '1' and ClrC = '1' and SetC = '0') THEN
					q(0) <= '0';
				ELSIF ((rising_edge(Clk)) and Enable= '1' and ClrC = '0' and SetC = '1') THEN
					q(0) <='1';
				END IF;
		END PROCESS;
END a_FlagsReg;

