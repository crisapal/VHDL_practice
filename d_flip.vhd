library ieee;
use ieee.std_logic_1164.all;


entity d_flip is
	port(clk,en,r,s,d: in bit;
	qt,qt_not: out bit);
end entity;

entity and2 is
	port(a,b: in bit;
	y: out bit);
end entity;
	architecture sii2 of and2 is
	begin
		y<=a and b;
	end architecture;

architecture dcomportamentala of d_flip is
signal q: bit:='0';
begin
	process(r,s,clk,d)
	begin
		if r='1' then 
			q<='0';
		elsif s='1' then
			q<='1';
		elsif clk'event and clk='1' then
			if en<='1' then
				q<=d;
			else
				q<='0';
			end if;	
		else
				q<=q;
		end if;
		
	end process;
qt<=q;
qt_not<= not(q);
end architecture;