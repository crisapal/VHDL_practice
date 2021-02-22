library ieee;
use ieee.std_logic_1164.all;



entity nrt_assincron_binar_direct is
	port( clk,reset,en: in bit;
	numar: out bit_vector( 0 to 3):="0000");
end entity;

	
architecture a of nrt_assincron_binar_direct is
component jk_flip is
	port(clk,en,r,s,j,k: in bit;
	qt,qt_not: out bit);
end component;


component and2 is
	port(a,b: in bit;
	y: out bit);
end component;
signal q,qn: bit_vector(3 downto 0):="0000";
signal d: bit_vector(0 to 3):="0000";
begin
	bit0: jk_flip port map( clk,'1','0','0','1','1',qn(0),q(0));
	bit1: jk_flip port map(q(0),'1','0','0','1','1',qn(1),q(1));
	bit2: jk_flip port map( q(1),'1','0','0','1','1',qn(2),q(2));
	bit3: jk_flip port map( q(2),'1','0','0','1','1',qn(3),q(3));
	 numar<=qn;
end architecture;