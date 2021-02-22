library ieee;
use ieee.std_logic_1164.all;

----sumator-scazator1bit

entity fullsum_scaz is
	port( nr1,nr2: in bit_vector(3 downto 0);
	op: in bit;
	suma,diferenta:out bit_vector(3 downto 0);
	carry,borrow: out bit);
end entity;

architecture sum_scaz4 of fullsum_scaz is
component sumator_scazator is
port(a,b,cin,bin: in bit;			  
op: in bit;  --- (0 adunare, 1 scadere)
sum,carry,borrow,dif: out bit);
end component; 
	signal carry_out,borrow_out: bit_vector(2 downto 0);

begin 
	bit0:  sumator_scazator port map(nr1(0),nr2(0),'0','0',op,suma(0),carry_out(0),borrow_out(0),diferenta(0));
	bit1:  sumator_scazator port map(nr1(1),nr2(1),carry_out(0),borrow_out(0),op,suma(1),carry_out(1),borrow_out(1),diferenta(1));
	bit2:  sumator_scazator port map(nr1(2),nr2(2),carry_out(1),borrow_out(1),op,suma(2),carry_out(2),borrow_out(2),diferenta(2));
	bit3:  sumator_scazator port map(nr1(3),nr2(3),carry_out(2),borrow_out(2),op,suma(3),carry,borrow,diferenta(3));
end architecture;