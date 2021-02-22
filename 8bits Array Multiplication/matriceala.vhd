---Proiect Palamru Cristina- 4.6
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity matriceala is
Port ( x:in std_logic_vector(7 downto 0);
y:in std_logic_vector(7 downto 0);
p:out std_logic_vector(15 downto 0)
);
end matriceala;

architecture Behavioral of matriceala is
type matPP is array (0 to 7) of std_logic_vector(7 downto 0);--prod partial;
type matS is array (0 to 7) of std_logic_vector(8 downto 0);
type matT is array (0 to 6) of std_logic_vector(8 downto 0);

signal pp:matPP:=(others=>"00000000"); -- produs partial
signal s:matS:=(others=>"000000000"); --sume;
signal t:matT:=(others=>"000000000"); --transport;

begin


sume:  for j in 0 to 7 generate
s(0)(j)<=x(j)and y(0);
end generate sume;

inmultire_linie: for i in 0 to 6 generate 
    inmultire_coloana: for j in 0 to 7 generate
          pp(i)(j)<= x(j) and y(i+1);
            inm: entity work.elementar port map(x=>pp(i)(j),y=>s(i)(j+1),tin=>t(i)(j),s=>s(i+1)(j),tout=>t(i)(j+1));
        end generate;
        
        s(i+1)(8)<=t(i)(8);
    end generate;

rezultat:  for i in 0 to 7 generate
p(i)<=s(i)(0);
p(i+8)<=s(7)(i+1);
end generate rezultat;

end Behavioral;
