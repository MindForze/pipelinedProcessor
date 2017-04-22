library ieee;
use ieee.std_logic_1164.all;
Entity  reg_file is
port(
    Rs : in std_logic_vector(2 downto 0);
    Rt : in std_logic_vector(2 downto 0);
    Rd : in std_logic_vector(2 downto 0);
    Ds : out std_logic_vector(15 downto 0);
    Dt : out std_logic_vector(15 downto 0);
    Pc : in std_logic_vector(15 downto 0);
    wB : in std_logic;
    WD : in std_logic_vector(15 downto 0);

    rst,clk,incSp,decSp: in std_logic;
    enable: in std_logic);
End reg_file;

architecture A_file_reg of reg_file is
component reg is
Generic(n: integer := 16);
port(
    d : in std_logic_vector(n-1 downto 0);
    q: out std_logic_vector(n-1 downto 0);
    rst,clk: in std_logic;
    enable: in std_logic
    );
End component;

component my_nadder is
GENERIC (n : integer := 16);
PORT(
    a,b : IN std_logic_vector(n-1  DOWNTO 0);
    cin : IN std_logic;
    add_out : OUT std_logic_vector(n-1 DOWNTO 0));
END component;

signal en_reg1: std_logic;
signal en_reg2: std_logic;
signal en_reg3: std_logic;
signal en_reg4: std_logic;
signal en_reg5: std_logic;
signal en_reg6: std_logic;


signal outreg1, outreg2, outreg3, outreg4, outreg5, outreg6, outreg7 : std_logic_vector(15 downto 0);
signal one :std_logic_vector(15 downto 0);
signal newSp :std_logic_vector(15 downto 0);

begin



en_reg1 <='1' when Rd ="000" AND wB ='1'
else '0';
en_reg2 <='1' when Rd ="001" AND wB ='1'
else '0';
en_reg3 <='1' when Rd ="010" AND wB ='1'
else '0';
en_reg4 <='1' when Rd ="011" AND wB ='1'
else '0';
en_reg5 <='1' when Rd ="100" AND wB ='1'
else '0';
en_reg6 <='1' when Rd ="101" OR decSp = '1' OR incSp = '1'
else '0';




one <= "0000000000000001" when incSp = '1' AND decSp ='0'
else "1111111111111110" when decSp = '1' AND incSp ='0'
else "0000000000000000";

incdec :my_nadder port map(outreg6,one,'0',newSp);


Reg1 : reg port map(WD,outreg1,rst,clk,en_reg1);
Reg2 : reg port map(WD,outreg2,rst,clk,en_reg2);
Req3 : reg port map(WD,outreg3,rst,clk,en_reg3);
Req4 : reg port map(WD,outreg4,rst,clk,en_reg4);
Req5 : reg port map(WD,outreg5,rst,clk,en_reg5);
Req6 : reg port map(newSp,outreg6,rst,clk,en_reg6);   -- this is sp reg
Req7 : reg port map(Pc,outreg7,rst,clk,'1');   -- this is pc reg


Ds <= outreg1 when Rs = "000"
else outreg2 when Rs =  "001"
else outreg3 when Rs =  "010"
else outreg4 when Rs =  "011"
else outreg5 when Rs =  "100"
else outreg6 when Rs =  "101"
else outreg7;

Dt <= outreg1 when Rt = "000"
else outreg2 when Rt =  "001"
else outreg3 when Rt =  "010"
else outreg4 when Rt =  "011"
else outreg5 when Rt =  "100"
else outreg6 when Rt =  "101"
else outreg7;


end A_file_reg;
