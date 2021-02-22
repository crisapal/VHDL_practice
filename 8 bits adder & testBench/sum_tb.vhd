-- proiect Palamaru Cristina

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sum_tb is
end sum_tb;

architecture Behavioral of sum_tb is

signal x: std_logic_vector(7 downto 0);
signal y: std_logic_vector(7 downto 0);
signal sum: std_logic_vector(7 downto 0);
signal tin: std_logic;
signal tout: std_logic;

begin

sumator: entity WORK.controller port map(x=>x,y=>y,sum=>sum,tin=>tin,tout=>tout);

simulare: process
begin 
--simulare numere mici -

x<="00000001";
y<="00000011";
tin<='0';

wait for 10ns; --incerc sa ma asigur ca imi ajunge suma cum trebuie
-- pentru a fi verificata

if sum = "00000100" then
    report " Test trecut 1+3= 4";
else
    report " Test failed - 4 != " & Integer'image(to_integer(unsigned(sum))) ;
end if;

--simulare numere intermediare

x<=std_logic_vector(TO_UNSIGNED(73,x'length));
y<=std_logic_vector(TO_UNSIGNED(79,x'length));
tin<='0';

wait for 10ns;


if to_integer(unsigned(sum))= 152 then
    report " Test trecut 73+79= 152";
else
    report " Test failed - 152 != " & Integer'image(to_integer(unsigned(sum))) ;
end if; 


--simulare numere mari

x<=std_logic_vector(TO_UNSIGNED(254,x'length));
y<=std_logic_vector(TO_UNSIGNED(254,x'length));
tin<='1';

wait for 10ns;

if to_integer(unsigned(sum))= 253 and tout='1' then
    report " Test trecut 254+254+1= 509";
else
    report " Test failed - 509 != " & Integer'image(to_integer(unsigned(sum))) ;
end if; 


wait;
end process;
end Behavioral;
