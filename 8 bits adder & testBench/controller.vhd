library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity controller is  
Port (
x:in std_logic_vector(7 downto 0);
y:in std_logic_vector(7 downto 0);
sum:out std_logic_vector(7 downto 0);
tin:in std_logic;
tout:out std_logic );
end controller;

architecture Behavioral of controller is


signal p0,p2,p4,p6: std_logic;
signal g0,g2,g4,g6: std_logic;
signal t2,t4,t6: std_logic;

begin

    S1: entity WORK.sumator2 port map(op1=>x(1 downto 0),op2=>y(1 downto 0),tin=>tin,sum=>sum(1 downto 0),p=>p0,g=>g0);
    S2: entity WORK.sumator2 port map(op1=>x(3 downto 2),op2=>y(3 downto 2),tin=>t2,sum=>sum(3 downto 2),p=>p2,g=>g2);
    S3: entity WORK.sumator2 port map(op1=>x(5 downto 4),op2=>y(5 downto 4),tin=>t4,sum=>sum(5 downto 4),p=>p4,g=>g4);
    S4: entity WORK.sumator2 port map(op1=>x(7 downto 6),op2=>y(7 downto 6),tin=>t6,sum=>sum(7 downto 6),p=>p6,g=>g6);
    
    t2<= g0 or (p0 and tin);
    t4<= g2 or (p2 and g0) or (p2 and p0 and tin);
    t6<= g4 or (p4 and g2) or (p4 and p2 and g0) or (p4 and p2 and p0 and tin);
    tout<= g6 or (p6 and g4 )or (p6 and p4 and g2) or (p6 and p4 and p2 and g0) or (p6 and p4 and p2 and p0 and tin);
    

    

end Behavioral;
