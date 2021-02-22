library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
Port (CLK:in std_logic;
RST: in std_logic;
X:in std_logic_vector(7 downto 0);
Y:in std_logic_vector(7 downto 0);
AN:out std_logic_vector(7 downto 0);
SEG:out std_logic_vector(7 downto 0)
);
end control;

architecture Behavioral of control is

signal data:std_logic_vector(63 downto 0):=(others=>'0');
signal p:std_logic_vector(15 downto 0):=(others=>'0');

begin


	displ7seg_blink_i : Entity WORK.displ7seg_blink
						Port Map(
							Clk   => Clk, 
							Rst   => Rst, 
							Data  => Data, 
							An    => An, 
							Seg   => Seg
						);
						
	inmultire: Entity WORK.matriceala
						Port Map(
							X=>X, Y=>Y,P=>P);
	--numai pe ultimele as vrea sa le pot activa
						
    -- in versiunea initiala uitam sa imi pun pe afisor numerele x si y care urmeaza a fi inmultite
    --data iau pe 16 ca sa acopar toate afisoarele de pe nexys4, dar eu ma voi folosi doar de 32 de biti (8 -x si y, 16 -produs) 
 
 
   
    
    ---inainte sa trec datele in afisor, trebuie sa le convertesc
    conv1: entity work.convertor port map(numar=>x(7 downto 0),cifz=>data(55 downto 48),cifu=>data(63 downto 56));
    conv2: entity work.convertor port map(numar=>y(7 downto 0),cifz=>data(39 downto 32),cifu=>data(47 downto 40));
    conv3: entity work.convertor port map(numar=>p(15 downto 8),cifz=>data(23 downto 16),cifu=>data(31 downto 24));
    conv4: entity work.convertor port map(numar=>p(7 downto 0),cifz=>data(7 downto 0),cifu=>data(15 downto 8));


end Behavioral;
