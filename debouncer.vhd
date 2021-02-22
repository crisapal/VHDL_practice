library IEEE;
use IEEE.STD_logic_1164.all;
use IEEE.STD_logic_unsigned.all;
use IEEE.STD_logic_arith.all;


entity debouncer_butoane is
	generic(NR:natural:=10);
	port(b_in:in std_logic;
	clock:in std_logic;
	reset:in std_logic:='0';
	b_out:out std_logic);
end entity;


architecture debounce of debouncer_butoane is
component bist_D
	port(D,CLK,R:in std_logic;
	Q:out std_logic);
end component;

component SI_N is
	generic(N:natural:=10);
	port(DATA:in STD_logic_vector(1 to N);
	y:out std_logic);
end component; 


signal Q_TEMP:STD_LOGIC_VECTOR(1 to NR);

begin
	primul: bist_D port map(B_IN,clock,reset,q_temp(1));
	
	generic_debouncer: for NR in 2 to NR generate
		begin
			instantiere: bist_D port map(Q_temp(NR-1),clock,reset,q_temp(NR)); 
		end generate;
		
		N_AND:SI_N port map(Q_TEMP,B_OUT);

end architecture;