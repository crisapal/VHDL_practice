

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity decodificator_2_zecimale is
    Port ( numar : in STD_LOGIC_VECTOR (7 downto 0);
           cifra1 : out STD_LOGIC_VECTOR (7 downto 0);
           cifra2 : out STD_LOGIC_VECTOR (7 downto 0));
end decodificator_2_zecimale;

architecture Behavioral of decodificator_2_zecimale is

signal numarI, unitati, zecimala: integer;

begin

numarI<= conv_integer(numar);

unitati<=numarI mod 10;
zecimala<=numarI / 10;

cifra2<=conv_std_logic_vector(unitati,8);
cifra1<=conv_std_logic_vector(zecimala,8);

end Behavioral;
