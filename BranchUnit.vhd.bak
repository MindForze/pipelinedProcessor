LIBRARY IEEE;
Use IEEE.std_logic_1164.all;

ENTITY BranchUnit IS
	PORT( 
		JmpCallFromID : IN std_logic;
		DestFromID : IN std_logic_vector(15 downto 0);
		JmpTypeFromEx : IN std_logic_vector (1 downto 0);
		DestFromEx : IN std_logic_vector(15 downto 0);
		RetFromEx: IN std_logic;
		RtiFromEx: IN std_logic;
		RetFromMem: IN std_logic;
		RtiFromMem: IN std_logic;
		DestFromMem: IN std_logic_vector(15 downto 0);
		Flags : IN std_logic_vector(3 downto 0); --Z N C V
		FlushID : OUT std_logic;
		FlushEx : OUT std_logic;
		FlushMem : OUT std_logic;
		ChangePC : OUT std_logic;
		NewPC : OUT std_logic_vector(15 downto 0));
End BranchUnit;

Architecture a_BranchUnit of BranchUnit IS
	BEGIN
	Process(JmpCallFromID, JmpTypeFromEx, RetFromEx, RtiFromEx, RetFromMem, RtiFromMem, Flags)
	BEGIN
		IF(RetFromMem = '1' OR RtiFromMem = '1') THEN
			NewPC <= DestFromMem;
			ChangePC <= '1';
			FlushID <= '1';
			FlushEx <= '1';
			FlushMem <= '1';
		ELSIF( JmpTypeFromEx = "01" AND Flags(0) = '1' ) THEN
			NewPC <= DestFromEx;
			ChangePC <= '1';
			FlushID <= '1';
			FlushEx <= '1';
		ELSIF (  JmpTypeFromEx = "10" AND Flags(1) = '1' ) THEN
			NewPC <= DestFromEx;
			ChangePC <= '1';
			FlushID <= '1';
			FlushEx <= '1';
		ELSIF ( JmpTypeFromEx = "11" AND Flags(2) = '1' ) THEN
			NewPC <= DestFromEx;
			ChangePC <= '1';
			FlushID <= '1';
			FlushEx <= '1';
		ELSIF(JmpCallFromID = '1' AND RetFromEx = '0' AND RtiFromEx = '0') THEN
			NewPC <= DestFromID;
			ChangePC <= '1';
			FlushID <= '1';
		ELSE
			NewPC <= "0000000000000000";
			ChangePC <= '0';
			FlushID <= '0';
			FlushEx <= '0';
			FlushMem <= '0';
		End IF;
	END Process;

End a_BranchUnit;