library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity divizat_100Mhz_1secunda is
	port(clk_placa: in std_logic;
	clk_1secunda:out std_logic);

end entity;

---vom numara pana la 50mil si apoi facem switch

architecture divizor_afisor of divizat_100Mhz_1secunda is --pot declara semnale doar intre architecture	si begin
signal count : integer :=1;  --- semnal nume, tip si valoare asignata --
begin	   	 
	process(clk_placa)
	variable clk: std_logic:= '0';
	begin
		if (CLK_PLACA'EVENT and CLK_PLACA='1') then
				count<=count+1;
		if(count=50000000)then
			clk_1secunda <= not clk;
			clk:=not clk;---aici switch
			count <=1;
			
		end if;
		end if;
	
	end process;
end divizor_afisor;