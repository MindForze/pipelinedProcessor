LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- n-bit adder
ENTITY my_nadder IS
GENERIC (n : integer := 16);
PORT(
    a,b : IN std_logic_vector(n-1  DOWNTO 0);
    cin : IN std_logic;
    add_out : OUT std_logic_vector(n-1 DOWNTO 0));
END my_nadder;



ARCHITECTURE a_my_nadder OF my_nadder IS
COMPONENT my_adder IS
PORT( a,b,cin : IN std_logic;
    s,cout : OUT std_logic);
END COMPONENT;
SIGNAL temp : std_logic_vector(n-1 DOWNTO 0);

BEGIN
f0: my_adder PORT MAP(a(0),b(0),cin,add_out(0),temp(0));
loop1: FOR i IN 1 TO n-1 GENERATE
fx: my_adder PORT MAP  (a(i),b(i),
 temp(i-1),add_out(i),temp(i));
END GENERATE;
END a_my_nadder;

