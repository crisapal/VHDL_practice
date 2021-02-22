library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FDN is
Generic (n:INTEGER);

Port (
Clk:in std_logic;
CE: in std_logic;
RST: in std_logic;
D:in std_logic_vector(n-1 downto 0);
Q:out std_logic_vector(n-1 downto 0 ));
end FDN;

architecture Behavioral of FDN is

begin
process(clk,rst,ce)
begin
if rising_edge(clk) then 
    if rst = '1' then
      Q<=(others =>'0');
    elsif ce = '1' then
      Q<= D;
    end if;
end if;
end process;

end Behavioral;
