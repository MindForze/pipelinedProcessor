LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ControlUnit IS
	PORT( opCode : IN  std_logic_vector(4 DOWNTO 0);
		Load : OUT std_logic;
		NeedRs : OUT std_logic;
		NeedRt : OUT std_logic;
		RegWrite : OUT std_logic;
		OutWrite : OUT std_logic;
		XToReg: OUT std_logic_vector(1 DOWNTO 0);

		AddrSelector : OUT std_logic;
		MemWrite : OUT std_logic;
		XToMem : OUT std_logic;

		JmpType : OUT std_logic_vector(1 DOWNTO 0);
		JmpCall : OUT std_logic;
		IncSP : OUT std_logic;
		DecSP : OUT std_logic;
		Int : OUT std_logic;
		Rti : OUT std_logic;
		Ret : OUT std_logic;
		FlagsModify : OUT std_logic;

		SetC : OUT std_logic;
		ClrC : OUT std_logic;
		Operation : OUT std_logic_vector(3 DOWNTO 0);
		Shift : OUT std_logic;

		FromIn : OUT std_logic);
END ControlUnit;

ARCHITECTURE a_ControlUnit OF ControlUnit IS
	BEGIN
	Process(opCode)
	Begin
		IF opCode = "00000" THEN --NOP
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";
			
			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00001" THEN --MOV
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00010" THEN --ADD
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '1';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0010";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00011" THEN --SUB
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '1';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0011";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00100" THEN --AND
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '1';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0100";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00101" THEN --OR
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '1';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0101";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00110" THEN --RLC
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0110";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "00111" THEN --RRC
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0111";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01000" THEN --SHL
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1000";
			
			Shift <= '1';

			FromIn <= '0';
		ELSIF opCode = "01001" THEN --SHR
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1001";
			
			Shift <= '1';

			FromIn <= '0';
		ELSIF opCode = "01010" THEN --SETC
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '1';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01011" THEN --CLRC
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '1';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01100" THEN --PUSH
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '1';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '1';
			XToMem <= '1';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '1';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01101" THEN --POP
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '1';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '1';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01110" THEN --OUT
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '1';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "01111" THEN --IN
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '1';
		ELSIF opCode = "10000" THEN --NOT
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1010";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10001" THEN --NEG
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1011";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10010" THEN --INC
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1100";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10011" THEN --DEC
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "01";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "1101";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10100" THEN --JZ
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "01";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10101" THEN --JN
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "10";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10110" THEN --JC
			Load <= '0';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "11";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "10111" THEN --JMP
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '1';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11000" THEN --CALL
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '1';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '1';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '1';
			IncSP <= '0';
			DecSP <= '1';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11001" THEN --RET
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '1';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '1';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '1';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11010" THEN --RTI
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '1';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '1';
			DecSP <= '0';
			Int <= '0';
			Rti <= '1';
			Ret <= '0';
			FlagsModify <= '1';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11011" THEN --LDM
			Load <= '1';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "10";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11100" THEN --LDD
			Load <= '1';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '1';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '1';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11101" THEN --STD
			Load <= '1';
			NeedRs <= '1';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '1';
			MemWrite <= '1';
			XToMem <= '1';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSIF opCode = "11110" THEN --INT
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '1';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '1';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '1';
			Int <= '1';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		ELSE 
			Load <= '0';
			NeedRs <= '0';
			NeedRt <= '0';
			RegWrite <= '0';
			OutWrite <= '0';
			XToReg <= "00";

			AddrSelector <= '0';
			MemWrite <= '0';
			XToMem <= '0';

			JmpType <= "00";
			JmpCall <= '0';
			IncSP <= '0';
			DecSP <= '0';
			Int <= '0';
			Rti <= '0';
			Ret <= '0';
			FlagsModify <= '0';

			SetC <= '0';
			ClrC <= '0';
			Operation <= "0000";
			
			Shift <= '0';

			FromIn <= '0';
		END IF;
		End Process;

END a_ControlUnit;

