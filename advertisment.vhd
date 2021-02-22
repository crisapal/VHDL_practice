library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 

entity reclama is
	port(sel,clk:in std_logic);
end entity;

architecture a of reclama is
begin
	process(clk)
	begin
		if sel='0' then
			assert clk='1' report "Merge, bravo!" severity error;
		else 
			assert clk='1' report "Bravooo Baaaa" severity error;
		end if;
	end process;
end architecture;