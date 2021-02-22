--- Laborator Palamaru Mihaela-Cristina
-- e o descriere pur structurala, nu avem nevoie de ceas

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity convertor is
  Port (
  numar: in std_logic_vector(3 downto 0);
  cifraUnit: out std_logic_vector(3 downto 0);
  cifraZeci: out std_logic_vector(3 downto 0));
end convertor;

architecture Behavioral of convertor is

begin
--cifra zecilor e 1 doar cand am un nr >=10
cifraZeci <= "0001" when (numar = "1010" or 
                          numar = "1011" or  
                          numar = "1100" or 
                          numar = "1101" or 
                          numar = "1110" or 
                          numar = "1111" ) 
                          else "0000";
                          
-- model din lab ( 0 -9 ) 
cifraUnit<= "0000" when (numar="0000" or numar= "1010") else 
                  "0001" when (numar = "0001" or  numar= "1011" ) else
                  "0010" when (numar = "0010" or numar= "1100") else
                  "0011" when (numar = "0011" or numar= "1101") else
                  "0100" when (numar= "0100" or numar= "1110") else
                  "0101" when (numar= "0101" or numar= "1111") else
                  "0110" when (numar= "0110") else
                  "0111" when (numar= "0111") else
                  "1000" when (numar= "1000" ) else
                  "1001";-- cifra 9
               
end Behavioral;
