-- lucrare Palamaru Mihaela- Cristina
-- am testat si cu modificarile aduse numaratorului in bucla de for, merge bine
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity num4_tb is
--  Port ( );
end num4_tb;

architecture Behavioral of num4_tb is

-- constanta de timp
constant CLK_PERIOD: TIME:= 10ns;

signal Clk : STD_LOGIC:='0';
signal Rst : STD_LOGIC:='0';
signal En : STD_LOGIC:='0';
signal num : STD_LOGIC_VECTOR (3 Downto 0);
begin

DUT: entity WORK.num4 port map(Clk=> Clk,Rst=>Rst, En=>En, num=>num);

gen_clk: process
begin 
    Clk <= '0';
    wait for ( CLK_PERIOD/2);
    Clk <= '1';
    wait for ( CLK_PERIOD/2);
end process gen_clk;

gen_vect_test : process
	Variable RezCorect : STD_LOGIC_VECTOR (3 Downto 0):="0000"; -- rezultat asteptat
	Variable NrErori : Integer := 0; -- numar de erori
    Begin
       Rst <= '1';
       wait for CLK_PERIOD;
       Rst <= '0';
       wait for CLK_PERIOD;
       En <= '1';

	For i In 0 To 15 Loop -- genereaza toate combinatiile
	   if Num/= RezCorect then --- daca nu numar bine
	       report " Rezultat gresit! Rezultatul asteptat este ("  & STD_LOGIC'image (RezCorect(3)) & STD_LOGIC'image (RezCorect(2)) & STD_LOGIC'image (RezCorect(1)) & STD_LOGIC'image (RezCorect(0)) & ") dar, valoarea obtinuta este (" &STD_LOGIC'image (Num(3)) &  STD_LOGIC'image (Num(2)) &  STD_LOGIC'image (Num(1)) &  STD_LOGIC'image (Num(0)) & ") " severity ERROR;
           NrErori := NrErori + 1;
           end if;
           RezCorect := RezCorect + 1;
           wait for (CLK_PERIOD);
	End Loop;
	
	if NrErori /= 0 then
        report "Testare terminata cu " & INTEGER'image(NrErori) & " erori";
    else
        report "Testare terminata cu 100% succes";       
	end if;
	wait; --suspendare proces
End Process gen_vect_test;

end Behavioral;
