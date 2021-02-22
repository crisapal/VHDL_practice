library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDN is
Generic (n:INTEGER);

Port (
X:in std_logic_vector(n-1 downto 0);
Y:in std_logic_vector(n-1 downto 0);
S:out std_logic_vector(n-1 downto 0);
tin:in std_logic;
tout:out std_logic;
ovf:out std_logic);
end ADDN;

architecture Behavioral of ADDN is
signal trans_temporar: std_logic_vector(n downto 0):=(others=>'0');

begin
trans_temporar(0)<=tin;

add: for i in 0 to n-1 generate
    S(i)<= x(i) xor y(i) xor trans_temporar(i);
    Trans_temporar(i+1) <= (X(i) and Y(i)) or ((X(i) or Y(i)) and trans_temporar(i));
end generate;

tout<=trans_temporar(n);
ovf <= trans_temporar(n) xor trans_temporar(n-1);

end Behavioral;