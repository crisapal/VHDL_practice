library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_SIGNED.ALL;

entity booth is
Generic (n:INTEGER);

Port (clk: in std_logic; 
Rst: in std_logic; 
Start: in std_logic;    
X:in std_logic_vector(n-1 downto 0);
Y:in std_logic_vector(n-1 downto 0);
A: out std_logic_vector(n-1 downto 0);
Q:out std_logic_vector(n-1 downto 0);
Term: out std_logic);
end booth;

architecture Behavioral of booth is

signal loadA,rstA,subB,loadB,ShrAQ,LoadQ,RstQm1,qbist,rstB,tout,ovf: std_logic;
signal outA,B,outQ,outSumator,bsig:std_logic_vector(n-1 downto 0);


begin

neg:for i in 0 to n-1 generate
    bsig(i)<=B(i) xor subB;
end generate;

unit_control:  entity work.uc 
generic map( n =>n )
port map(clk=>clk,
rst=>rst ,
start=>start,
qreg=>outQ(0), 
qbist=>qbist,
loadA=>loadA,
rstA=>rstA,
subB=>subB,
loadB=>loadB,
term=>term ,
ShrAQ=>shrAQ,
LoadQ=>loadQ,
RstQm1=>RstQm1);

registruB: entity WORK.FDN 
    Generic map( n => n)
    Port map( CLK => clk,
           CE => LoadB,
           RST => rst, 
           D => X,
           Q => B);

bistabil: entity work.FD
Port map(
Clk=>clk,
CE=> shraq,    
RST=> rstqm1,      
D=>outQ(0),
Q=>qbist);

registruA:entity WORK.SRRN
Generic map(n=>n)
Port map( 
clk=>clk,
sri=>outA(n-1), --- pe A il shiftez cu semn
load=>loadA,
ce=>shrAQ,
rst=>rstA,
D=>outSumator,
Q=>outA);


registruQ:entity work.SRRN
Generic map(n=>n)
Port map( 
clk=>clk,
sri=>outA(0),
load=>loadQ,
ce=>shrAQ,
rst=>rst, -- nu resetez Q cand sunt la inceput, vreau sa il incarc cu y si sa ramana ( nu rstA)
D=>y,
Q=>outQ);

sumator: entity WORK.ADDN
    Generic map( n => n)
    Port map( Tin => SubB,
    X => outA,
    Y => Bsig,
    S => outSumator,
    Tout => Tout,
    OVF => Ovf);




A<= outA;
Q<=outQ;
end Behavioral;
