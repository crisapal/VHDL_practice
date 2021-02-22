library ieee;
use ieee.std_logic_1164.all;
use ieee. std_logic_unsigned.all;

entity lifo is
	port(clk, reset, wr: in std_logic;
	d_in: in std_logic_vector(3 downto 0);
	d_out: out std_logic_vector(3 downto 0);
	empty, full: out std_logic);
end entity;

architecture arh_lifo of lifo is 

type mem is array (0 to 3) of std_logic_vector(3 downto 0);
signal memorie: mem;
signal stack_cont: natural; 
signal aux_full, aux_empty: std_logic;

begin
	
	process(clk, reset)
	begin
		if reset = '1' then
			memorie <= (others => "0000"); 
			d_out <= (others => '0');
			aux_empty <= '1';
			aux_full <= '0';
			stack_cont <= 0;
		elsif clk = '1' and clk'event then
			if wr = '0' and aux_empty = '0' then --citire
				d_out <= memorie(stack_cont);  
				aux_full <= '0';
				if stack_cont = 0 then
					aux_empty <= '1';
				else
					stack_cont <= stack_cont-1;
				end if;
			elsif wr = '1' and aux_full = '0' then
					d_out <= (others => '0');
					memorie(stack_cont) <= d_in;
					aux_empty <= '0';
					if stack_cont = 3 then
						aux_full <= '1';
					else
						stack_cont <= stack_cont+1;
					end if;
			else
				d_out <= (others => '0');
			end if;
		end if;
	end process;
	
	empty <= aux_empty;
	full <= aux_full;
	
	
end architecture;