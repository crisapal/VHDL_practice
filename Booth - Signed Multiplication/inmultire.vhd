
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity inmultire is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Start: in STD_LOGIC; 
           X: in STD_LOGIC_VECTOR (7 downto 0); 
           Y: in STD_LOGIC_VECTOR (7 downto 0); 
           A: out STD_LOGIC_VECTOR (8 downto 0); 
           Q: out STD_LOgiC_VECTOR (7 downto 0); 
           Term: out STD_LOGIC);
end inmultire;

architecture Behavioral of inmultire is

signal LoadA, RstA, SubB, LoadB ,ShrAQ, LoadQ , Q_B, Tout, Ovf, T : STD_LOGIC;
signal IesireB, IesireQ ,iesireSumator : std_logic_vector (7 downto 0) := (others =>'0');
signal RegA, iesireA : std_logic_vector (8 downto 0):=(others=>'0');

begin

registruB:entity WORK.FDN 
    Generic map( n => 8)
    Port map( CLK => clk,
           CE => LoadB,
           RST => rst, 
           D => X,
           Q => IesireB);
           

registruA:entity WORK.SRRN
    Generic map( n => 9)
    Port map (CLK => clk, 
    CE => ShrAQ, 
    RST => RstA,
    SRI => '0', 
    Load => LoadA,  
    D => RegA, 
    Q =>IesireA);
    
registruQ:entity WORK.SRRN
    Generic map( n => 8)
    Port map (CLK => clk, 
    CE => ShrAQ, 
    RST => Rst,
    SRI => IesireA(0), 
    Load => LoadQ,  
    D => Y, 
    Q =>IesireQ);

sumator: entity WORK.ADDN
    Generic map( n => 8)
    Port map( Tin => '0',
    X => IesireA(7 downto 0),
    Y => iesireB,
    Tout => Tout,
    OVF => Ovf,
    S => iesireSumator);
    
UC: entity WORK.UC
    generic map( n => 8)
    Port map( CLK => clk,
           RST => rst,
           Q_R => IesireQ(0),
           Start => Start,
           LoadA => LoadA,
           RstA => RstA,
           LoadB => LoadB,
           Term => T,
           ShrAQ => ShrAQ,
           LoadQ => LoadQ);
   
A<= IesireA; Q<=IesireQ; Term<=T;


RegA <= Tout & IesireSumator;

end Behavioral;
