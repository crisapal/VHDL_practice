library ieee;
use ieee.std_logic_1164.all;



entity jk_flip is
	port(clk,en,r,s,j,k: in bit;
	qt,qt_not: out bit);
end entity;


architecture conversie of jk_flip is

component d_flip is
port(clk,en,r,s,d: in bit;
qt,qt_not: out bit);
end component;
	 signal d,q,qnot,notk: bit:='0';
begin
	notk<= not(k);
	conv: d_flip port map(clk,en,r,s,d,q,qnot);
	d<=(j and qnot) or ( notk and q);
	
	qt<=q;
	qt_not<= not(q);
end architecture;