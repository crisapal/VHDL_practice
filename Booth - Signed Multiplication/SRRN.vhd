library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SRRN is
Generic (n:INTEGER);
Port ( 
clk: in std_logic;
sri: in std_logic;
load:in std_logic;
ce:in std_logic;
rst:in std_logic;
D:in std_logic_vector(n-1 downto 0);
Q:out std_logic_vector(n-1 downto 0 ));
end SRRN;

architecture Behavioral of SRRN is

signal Qintermediar: std_logic_vector(n-1 downto 0):=(others=>'0');
begin

process(clk,rst,ce,load)
begin
if rising_edge(clk) then 
    if rst = '1' then
      Qintermediar<=(others =>'0');
    elsif load = '1' then
      Qintermediar<= D;
    elsif ce = '1' then 
      Qintermediar<= sri & Qintermediar(n-1 downto 1);
    end if;
end if;
end process;

Q<=Qintermediar;

end Behavioral;
