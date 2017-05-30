LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu IS
	PORT( a,b : IN std_logic_vector (15 downto 0);
	s : IN std_logic_vector (3 downto 0);
	f : OUT std_logic_vector (15 downto 0);
	flags_in : IN std_logic_vector (3 downto 0);
	flags_out : OUT std_logic_vector(3 downto 0));
END ENTITY alu;


ARCHITECTURE struct OF alu IS
	
COMPONENT my_nadder IS 
     PORT(a,b : IN std_logic_vector(15  DOWNTO 0);
          cin : IN std_logic;  
            s : OUT std_logic_vector(15 DOWNTO 0);    
         cout : OUT std_logic);
END COMPONENT;

--aa,bb,not_b,not_a,x1,car1,x2,car2,y1,cary1,y2,cary2,x13,car13,x14,car14,car3,x3,x4,x5,car6,x6,x8,car8,x12,car12,car10,x10
signal aa,bb,not_b,not_a,y1,y2,x1,x2,x3,x4,x5,x6,x8,x10,x12,x13,x14,tmp_out :std_logic_vector(15  DOWNTO 0);
signal flags_tmp :std_logic_vector(3  DOWNTO 0);
signal not_cf,car1,car2,car3,car6,car8,car10,car12,car13,car14,cary1,cary2: std_logic;
BEGIN

--notcf: not_cf <= NOT flags_in(0);
passA: aa <= a;
passB: bb <= b;
invb: not_b <= NOT b;
inva: not_a <= NOT a;

adding:	my_nadder  port map (a,b,'0',x1,car1); -- a+b
subab :  my_nadder  port map (a,not_b,'1',x2,car2); --a-b
negateA :  my_nadder  port map (not_a,"0000000000000001",'0',x6,car6); -- -a

incA:		 my_nadder  port map (a,"0000000000000001",'0',y1,cary1); -- a+1
decA:      my_nadder  port map (a,"1111111111111110",'1',y2,cary2);-- a-1

--subba :  my_nadder  port map (b,not_a,'1',x2,car2);-- b-a
--addingC:   my_nadder  port map (a,b,flags_in(0),x6,car6);	-- a+b+c
--subbaC:    my_nadder  port map (b,not_a,not_cf,x7,car7); --b-a-c(when Cin=1 it will pass 0 so the result will be b-a-1 and vice versa)


	
logcar: car3 <=flags_in(2);	
anding: x3 <= a and b; 
oring: x4<= a or b;
--xoring: x5<= a xor b;

SHR1:x8 <= std_logic_vector(shift_right(unsigned(a),to_integer(unsigned(b))));
SHR2: car8 <= flags_in(2);	
--SHR2:x8(14 downto 0)<=b(15 downto 1);
--SHR3: car8<= b(0);


SHL1: x12 <= std_logic_vector(shift_left(unsigned(a),to_integer(unsigned(b))));
SHL2: car12 <= flags_in(2);
--SHL2: x12(15 downto 1)<=b(14 downto 0);
--SHL3: car12<= b(15);

RRC1: car10<=a(0);
RRC2: x10(15)<=flags_in(2);
RRC3: x10(14 downto 0)<=a(15 downto 1);

RLC1: x14(0)<=flags_in(2);
RLC2: x14(15 downto 1)<=a(14 downto 0);
RLC3: car14<=a(15);

--ASR1: x11(15)<=b(15);
--ASR2: x11(14 downto 0)<=b(15 downto 1);
--ASR3: car11<= b(0);

--ROR1: x9(15)<=b(0);
--ROR2: x9(14 downto 0)<=b(15 downto 1);
--ROR3: car9<=flags_in(0);

--ROL1: x13(0)<=b(0);
--ROL2: x13(15 downto 1)<=b(14 downto 0);
--ROL3: car13<=flags_in(0);


out_alu: tmp_out <= aa when s="0000" --a
else bb when s="0001" --b
else not_a when s="1010" -- ~a
else x6 when s="1011" -- -a

else y1 when s="1100" --incA
else y2 when s="1101" --decA

else x1 when s="0010" --a+b
else x2 when s="0011" --a-b

else x3 when s="0100" --and
else x4 when s="0101" --or 
--else x5 when s="01010" --xor

--else x7 when s="00111"
else x8 when s="1001" --SHR
else x12 when s="1000" --SHL
--else x9 when s="10000" 
else x10 when s="0111" --RRC
else x14 when s="0110"; --RLC

--else x11 when s="10010"
--else x13 when s="10100"

--else std_logic_vector(to_signed(to_integer(signed(a)) + 1 ,tmp_out'length)) WHEN s = "00010" --a+1 
--else std_logic_vector(to_signed(to_integer(signed(a)) - 1 ,tmp_out'length)) WHEN s = "00011" --a-1
--else std_logic_vector(to_signed(to_integer(signed(b)) + 1 ,tmp_out'length)) WHEN s = "01011" --b+1 
--else std_logic_vector(to_signed(to_integer(signed(b)) - 1 ,tmp_out'length)) WHEN s = "01100" --b-1




Cflag: flags_tmp(2)<= car1 when s="0010" --a+b
else car2 when s="0011" --a-b
else car3 when s="0100" or s="0101" or s="1010"--Logic operations
else car6 when s="1011" -- -a
else car12 when s="1000" --SHL
else car8 when s="1001" --SHR
else car14 when s="0110" --RLC
else car10 when s="0111" --RRC
else cary1 when s="1100" --Inc A
else cary2 when s="1101" --Dec A

--else car7 when s="00111"
--else cary1 when  --b+1
--else cary2 when  --b-1
--else car9 when s="10000" 
--else car11 when s="10010"
--else car13 when s="10100"

else '0';


	
--Zflag: flags_tmp(1)<= flags_in(1) when s="00001" or s="00010" or s="00011" or s="00000"
Zflag: flags_tmp(0)<= '1' when tmp_out="0000000000000000"
else '0';
	
Nflag: flags_tmp(1) <= tmp_out(15);
	
--Pflag: flags_tmp(3)<= flags_in(3) when s="00001" or s="00010" or s="00011" or s="00000"
--else tmp_out (0) xor tmp_out(1)xor tmp_out(2) xor tmp_out(3) xor tmp_out(4) xor tmp_out(5) xor tmp_out(6) xor tmp_out(7) xor tmp_out(8) xor tmp_out(9) xor tmp_out(10) --xor tmp_out(11) xor tmp_out(12) xor tmp_out(13) xor tmp_out(14) xor tmp_out(15);
	
	
--Oflag:flags_tmp(3) <= flags_in(3) when s="00001" or s="00010" or s="00011" or s="00000"
Oflag:flags_tmp(3) <= '1' when ( (a(15)='0' and b(15)='0' and tmp_out(15)='1' and s = "0010")  --a+b (a&b positive => out negative)
		   		   			or (  a(15)='1' and b(15)='1' and tmp_out(15)='0' and s = "0010")  --a+b (a&b negative => out negative)
				   			or (  a(15)='1' and b(15)='0' and tmp_out(15)='0' and s = "0011")  --a-b (a neg & b pos => out pos)
					   		or (  a(15)='0' and b(15)='1' and tmp_out(15)='1' and s = "0011")  --a-b (a pos & b neg => out neg)
					   		or (  a(15)='0' and tmp_out(15)='1' and s = "1100") -- a+1
					  		or (  a(15)='1' and tmp_out(15)='0' and s = "1101") -- a-1
   )	

else '0';
								

setf: f<=tmp_out;
setflags: flags_out<=flags_tmp;


END struct;
