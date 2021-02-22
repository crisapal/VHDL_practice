library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;



entity si_n is
GENERIC (n : INTEGER := 10);
PORT (data : IN STD_LOGIC_VECTOR(1 TO n);
y : OUT STD_LOGIC);
end entity;

ARCHITECTURE flux OF si_N IS
SIGNAL tmp : STD_LOGIC_VECTOR(1 TO n);
BEGIN
tmp <= (OTHERS => '1');
y <= '1' WHEN data= tmp ELSE '0';
END flux;