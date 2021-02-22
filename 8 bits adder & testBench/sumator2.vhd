-- proiect Palamaru Cristina

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sumator2 is
Port ( 
op1: in std_logic_vector(1 downto 0);
op2: in std_logic_vector(1 downto 0);
tin: in std_logic;
sum: out std_logic_vector(1 downto 0);
p: out std_logic;
g:out std_logic);
end sumator2;

architecture Behavioral of sumator2 is

signal p0:std_logic;
signal g0:std_logic;
signal p1:std_logic;
signal g1:std_logic;

begin

sum(0) <= op1(0) xor op2(0) xor tin;
sum(1) <= op1(1) xor op2(1) xor (g0 or (p0 and Tin));
p0<= op1(0) or op2(0);
p1<= op1(1) or op2(1);

g0<= op1(0) and op2(0);
g1<= op1(1) and op2(1);

p<=p1 and p0;
g<=g1 or (p1 and g0) or (p1 and p0);

end Behavioral;
