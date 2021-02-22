library IEEE;
use IEEE.STD_logic_1164.all;
use IEEE.STD_logic_unsigned.all;
use IEEE.STD_logic_arith.all;

entity bist_D is
	port(D,CLK:in std_logic;
	R:in std_logic:='0'; 
	Q:out std_logic);
end entity;


architecture comportamental of bist_D is  
begin  
 process(Clk)
 begin 
	if(rising_edge(Clk)) then
   		if(r='1') then 
   			 Q <= '0';
  	    else 
    		 Q <= D; 
  		end if;
    end if;       
end process;  
end architecture;