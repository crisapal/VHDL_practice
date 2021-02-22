

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity inmultire_test is
end inmultire_test;

architecture Behavioral of inmultire_test is

signal x: std_logic_vector(7 downto 0);
signal y: std_logic_vector(7 downto 0);
signal p: std_logic_vector(15 downto 0);


begin

sumator: entity WORK.matriceala port map(x=>x,y=>y,p=>p);

simulare: process
begin 
--simulare numere mici -

x<="00001000";
y<="00001000";

wait for 10ns; --incerc sa ma asigur ca imi ajunge suma cum trebuie
-- pentru a fi verificata

if to_integer(unsigned(p))= 64 then
    report " Test trecut 8*8= 64";
else
    report " Test failed - 64 != " & Integer'image(to_integer(unsigned(p))) ;
end if;

--simulare numere intermediare

x<=std_logic_vector(TO_UNSIGNED(73,x'length));
y<=std_logic_vector(TO_UNSIGNED(79,x'length));

wait for 10ns;


if to_integer(unsigned(p))= 5767 then
    report " Test trecut 73*79= 5767";
else
    report " Test failed - 5767 != " & Integer'image(to_integer(unsigned(p))) ;
end if; 


--simulare numere mari

x<=std_logic_vector(TO_UNSIGNED(254,x'length));
y<=std_logic_vector(TO_UNSIGNED(254,x'length));

wait for 10ns;

if to_integer(unsigned(p))= 64516 then
    report " Test trecut 254*254= 64516";
else
    report " Test failed - 64516 != " & Integer'image(to_integer(unsigned(p))) ;
end if; 


wait;
end process;

end Behavioral;
