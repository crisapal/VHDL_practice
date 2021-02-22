library ieee;
use ieee.std_logic_1164.all;

	----sumator-scazator1bit
entity sumator_scazator is
port(a,b,cin,bin: in bit;			  
op: in bit;  --- (0 adunare, 1 scadere)
sum,carry,borrow,dif: out bit);
end entity;


architecture add_sub of sumator_scazator is

begin
	process(a,b,cin,op,bin)
	begin
	if op='0' then
	if a='0' and b='0' and cin='0' then sum<='0'; carry<='0';
	elsif a='0' and b='0' and cin='1' then sum<='1'; carry<='0';
	elsif a='0' and b='1' and cin='0' then sum<='1'; carry<='0';
	elsif a='0' and b='1' and cin='1' then sum<='0'; carry<='1';
	elsif a='1' and b='0' and cin='0' then sum<='1'; carry<='0';
	elsif a='1' and b='0' and cin='1' then sum<='0'; carry<='1';
	elsif a='1' and b='1' and cin='0' then sum<='0'; carry<='1';
	else
		 sum<='1'; carry<='1';
	end if;	
	else
		if a='0' and b='0' and bin='0' then dif<='0'; borrow<='0';
	elsif a='0' and b='0' and bin='1' then dif<='1'; borrow<='1';
	elsif a='0' and b='1' and bin='0' then dif<='1'; borrow<='1';
	elsif a='0' and b='1' and bin='1' then dif<='0'; borrow<='1';
	elsif a='1' and b='0' and bin='0' then dif<='1'; borrow<='0';
	elsif a='1' and b='0' and bin='1' then dif<='0'; borrow<='0';
	elsif a='1' and b='1' and bin='0' then dif<='0'; borrow<='0';	
	else  dif<='1'; borrow<='1';
	end if;
	end if;
	end process;
end architecture;