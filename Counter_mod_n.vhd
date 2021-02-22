library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.math_real.all;

entity numarator_mod_n is
	generic(n: natural := 5);
	port(clk, enable, reset, set: in std_logic;
	d_in: in std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0);
	d_out: out std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0));
end entity;

architecture arh_numarator_mod_n of	numarator_mod_n is

signal aux: std_logic_vector(natural(ceil(log2(real(n))))-1 downto 0) := (others => '0');

begin
	
	process(reset, set, clk)
	begin
		if reset = '1' then
			aux <= (others => '0');
		elsif set = '1' then
			aux <= d_in; 
		elsif clk = '1' and clk'event then
			if enable = '0' then
				aux <= (others => '0');
			else	
				if conv_integer(aux) = n-1 then
					aux <= (others => '0');
				else
					aux <= aux+1;
				end if;
			end if;
		end if;
	end process;
	
	d_out <= aux;
end architecture;