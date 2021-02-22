library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FD is
Port (
Clk:in std_logic;
CE: in std_logic;
RST: in std_logic;
D:in std_logic;
Q:out std_logic);
end FD;

architecture Behavioral of FD is

begin
process(clk,rst,ce)
begin
if rising_edge(clk) then 
    if rst = '1' then
      Q<='0';
    elsif ce = '1' then
      Q<= D;
    end if;
end if;
end process;

end Behavioral;
