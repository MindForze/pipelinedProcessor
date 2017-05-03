LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY SubOne IS
	PORT(
		  d : IN  std_logic_vector(15 DOWNTO 0);
		  q : OUT std_logic_vector(15 DOWNTO 0));
END SubOne;

ARCHITECTURE a_SubOne OF SubOne IS
	BEGIN
		q <= std_logic_vector(unsigned(d) - 1);
END a_SubOne;

