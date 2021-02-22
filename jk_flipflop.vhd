library ieee;
use ieee.std_logic_1164.all;


entity jk_flip is
	port(clk,en,r,s,j,k: in bit;
	qt,qt_not: out bit);
end entity;



architecture comportamentala of jk_flip is
signal q: bit:=qt;
begin
	process(r,s,clk,j,k)
	begin
		if r='1' then 
			q<='0';
		elsif s='1' then
			q<='1';
		elsif clk'event and clk='0' then
			if en<='1' then
				if j='0' and k='0' then
					q<=q;
				elsif j='0' and k='1' then 
					q<='0';
				elsif j='1' and k='0' then
					q<='1';
				else
					q<= not(q);
				end if;	
			else
				q<=q;
		end if;
		else
			q<=q;
		end if;
	end process;
qt<=q;
qt_not<= not(q);
end architecture;