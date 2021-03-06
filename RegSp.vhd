
library ieee;
use ieee.std_logic_1164.all;

Entity n_reg_sp is
	port( d : in std_logic_vector(15 downto 0);
	      q: out std_logic_vector(15 downto 0);
	      rst,clk: in std_logic;
		enable: in std_logic);
End n_reg_sp;

architecture A_n_reg_sp of n_reg_sp is



begin
process(clk, rst)
begin
	if rst = '1' then
		q <= "0000001111111111";
	elsif falling_edge(clk) and enable = '1' then
		q <= d;
	end if;	
end process;

end A_n_reg_sp;
