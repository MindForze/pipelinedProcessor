LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Mux2 IS  
		PORT (a, b : IN std_logic_vector(15 downto 0);
			s0 : IN  std_logic;
		        x : OUT std_logic_vector(15 downto 0) );  
END ENTITY Mux2;


ARCHITECTURE a_Mux2 OF Mux2 IS
BEGIN
     -- TODO : write the architecture of mux2
     x <= b WHEN s0 = '1' ELSE a;
END a_Mux2;

