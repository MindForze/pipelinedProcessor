LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY instMem IS
	PORT(
		--1KB ADD.SPACE BUT PC IS 16 BITS
		CLK : IN STD_LOGIC;
		RST : IN STD_LOGIC;
		ADDRESS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		INSTOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END ENTITY instMem;

ARCHITECTURE instMemArch OF instMem IS
	
	TYPE RAM_TYPE IS ARRAY(0 TO 1023) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL MEMORY : RAM_TYPE;

	BEGIN
		PROCESS(CLK, RST)
		BEGIN
			IF RST = '1' THEN
				MEMORY <= (others => (others => '0'));
			END IF;
		END PROCESS;
	INSTOUT <= MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)));


END instMemArch;
