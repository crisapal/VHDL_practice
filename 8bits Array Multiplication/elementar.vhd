
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity elementar is
 Port (x:in std_logic;
 y:in std_logic;
 tin:in std_logic;
 s:out std_logic;
 tout:out std_logic );
end elementar;

architecture Behavioral of elementar is

begin

s<=x xor y xor tin;
tout<=(x and y) or ((x or y)and tin);


end Behavioral;
