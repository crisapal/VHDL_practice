library IEEE;
use IEEE.STD_logic_1164.all;
use IEEE.STD_logic_unsigned.all;
use IEEE.STD_logic_arith.all;

  entity nrtr is
	port( 
	clk:in std_logic;
	reset:in std_logic;
	en:in std_logic:='0';
	load:in std_logic:='0';
	lzs:in integer;
	lzm:in integer;
	lss:in integer;
	lmm:in integer;
	dir:in std_logic:='0';
	secunde1:out integer:=0;
	zeci_secunde1:out integer:=0;
	minute1:out integer:=0;	
	zeci_minute1:out integer:=0;
	carry_down:out std_logic:='0');
end	entity;	



   
architecture count of nrtr is
   signal minute,zeci_minute,secunde,zeci_secunde: integer:=0;
begin	  
numar:process(clk,en,reset,dir,load)
begin
	if rising_edge(clk) then
	
		if reset='1' then 
			minute<=0;
			zeci_minute<=0;
			secunde<=0;
			zeci_secunde<=0;
		elsif load='1' then
			minute<=lmm;
			zeci_minute<=lzm;
			secunde<=lss;
			zeci_secunde<=lzs;	
		elsif en='1' then
			if dir='0' then				
					if secunde=9 then
						secunde<=0;
						if zeci_secunde=5 then
							zeci_secunde<=0;
							if minute=9 then
								minute<=0;
								if zeci_minute=9 then
									zeci_minute<=0;
								else
									zeci_minute<=zeci_minute+1;
								end if;	
							else
								minute<=minute+1;
							end if;	
						else
							zeci_secunde<=zeci_secunde+1;
						end if;	 
					else
						secunde<=secunde+1;
					end if;
				else 	---if dir=1
					if secunde=0 and minute=0 and zeci_secunde=0 and secunde=0 then
						carry_down<='1';
					else
						carry_down<='0';
					end if;
						
					if secunde=0 then
						secunde<=9;
						if zeci_secunde=0 then
							zeci_secunde<=5;
							if minute=0 then
								minute<=9;
								if zeci_minute=0 then
									zeci_minute<=9;
								else
									zeci_minute<=zeci_minute-1;
								end if;
							else
								minute<=minute-1;	
							end if;	
						else
							zeci_secunde<=zeci_secunde-1;
						end if;	 
					else
						secunde<=secunde-1;
					end if;
				end if;
	else 
		minute<=minute;
		zeci_minute<=zeci_minute;
		secunde<=secunde;
		zeci_secunde<=zeci_secunde;
	end if;	---load/entity
	end if;-- clk
end process;	   

minute1<=minute;
zeci_minute1<=zeci_minute;
secunde1<=secunde;
zeci_secunde1<=zeci_secunde;


end architecture;
