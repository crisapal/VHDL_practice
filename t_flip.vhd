library ieee;
use ieee.std_logic_1164.all;


entity t_flip is
	port(clk,en,r,s,t: in bit;
	qt,qt_not: out bit);
end entity;



architecture dcomportamentala of t_flip is
signal q: bit:=qt;
begin
	process(r,s,clk,t)
	begin
		if r='1' then 
			q<='0';
		elsif s='1' then
			q<='1';
		elsif clk'event and clk='1' then
			if en<='1' then
				if t='0' then q<=q;
				else
					q<=not(q);
				end if;	
			else
				q<=q;
			end if;
		end if;
		
	end process;
qt<=q;
qt_not<= not(q);
end architecture;