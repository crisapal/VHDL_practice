Library IEEE;
Use IEEE.STD_LOGIC_1164.All;
Entity num4 Is
	Port (
		Clk : In STD_LOGIC;
		Rst : In STD_LOGIC;
		En : In STD_LOGIC;
		Num : Out STD_LOGIC_VECTOR (3 Downto 0)
	);
End num4;

Architecture simul Of num4 Is
	Function INC_BV (A : STD_LOGIC_VECTOR) Return STD_LOGIC_VECTOR Is
	Variable Rez : STD_LOGIC_VECTOR (A'Range);
	Variable C : STD_LOGIC;
Begin
	C := '1';
	For i in A'low to A'high Loop
		Rez(i) := A(i) Xor C;
		C := A(i) And C;
	End Loop; Return Rez;
End INC_BV;
Signal Num_int : STD_LOGIC_VECTOR (3 Downto 0);
Begin
	Process (Clk)
	Begin
		If (Clk'EVENT And Clk = '1') Then
			If (Rst = '1') Then
				Num_int <= (Others => '0');
			Elsif (En = '1') Then
				Num_int <= INC_BV (Num_int);
			End If;
		End If;
	End Process;
	Num <= Num_int;
End simul;