library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
			 
entity afis is
	port(clk:in std_logic;
	reset : in std_logic;
	anod:out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0);
	ss,mm,zs,zm:in integer);
end entity;	  

architecture comportamantala of afis is	

component divizat_100Mhz_70Hz is
	port(clk_placa: in std_logic;
	reset:in std_logic;
	clk_70hz:out std_logic);
end component divizat_100Mhz_70Hz; 


siGNAL clk_70Hz: std_logic;
signal q_tmp: std_logic_vector(3 downto 0):= "1110";
--signal catod: std_logic_vector(6 downto 0);
signal intern_anod: std_logic_vector(3 downto 0);	
signal unit:std_logic_vector(6 downto 0);
signal zeci:std_logic_vector(6 downto 0);	 
signal sute:std_logic_vector(6 downto 0);
signal mii:std_logic_vector(6 downto 0);

----------------------------------------------------------------------------
begin
	 ceas_divizat: divizat_100Mhz_70Hz port map(clk,reset,clk_70Hz);
	 anod <= q_tmp;

	
	 
----------decodificare
process(zm,mm,zs,ss,clk_70Hz)is
begin
if ss=0 then unit<="0000001";
elsif ss=1 then	 unit<="1001111";
elsif ss=2 then	 unit<="0010010";
elsif ss=3 then	 unit<="0000110";
elsif ss=4 then	 unit<="1001100";
elsif ss=5 then	 unit<="0100100";
elsif ss=6 then	 unit<="0100000";
elsif ss=7 then	 unit<="0001111";
elsif ss=8 then	 unit<="0000000";
elsif ss=9 then	 unit<="0001100";
else	  unit<="0111000";
end if;	


if mm=0 then sute<="0000001";
elsif mm=1 then	 sute<="1001111";
elsif mm=2 then	 sute<="0010010";
elsif mm=3 then	 sute<="0000110";
elsif mm=4 then	 sute<="1001100";
elsif mm=5 then	 sute<="0100100";
elsif mm=6 then	 sute<="0100000";
elsif mm=7 then	 sute<="0001111";
elsif mm=8 then	 sute<="0000000";
elsif mm=9 then	 sute<="0001100";
else	  sute<="0111000";
end if;


if zs=0 then zeci<="0000001";
elsif zs=1 then	 zeci<="1001111";
elsif zs=2 then	 zeci<="0010010";
elsif zs=3 then	 zeci<="0000110";
elsif zs=4 then	 zeci<="1001100";
elsif zs=5 then	 zeci<="0100100";
elsif zs=6 then	 zeci<="0100000";
elsif zs=7 then	 zeci<="0001111";
elsif zs=8 then	 zeci<="0000000";
elsif zs=9 then	 zeci<="0001100";
else	  zeci<="0111000";
end if;


if zm=0 then mii<="0000001";
elsif zm=1 then	 mii<="1001111";
elsif zm=2 then	 mii<="0010010";
elsif zm=3 then	 mii<="0000110";
elsif zm=4 then	 mii<="1001100";
elsif zm=5 then	 mii<="0100100";
elsif zm=6 then	 mii<="0100000";
elsif zm=7 then	 mii<="0001111";
elsif zm=8 then	 mii<="0000000";
elsif zm=9 then	 mii<="0001100";
else	  mii<="0111000";
end if;


end process;
	
	
-------------------------- frequency divider
	 
	 
	process(clk_70Hz)
	begin
	if clk_70Hz'event and clk_70Hz='1' then
		q_tmp(1) <= q_tmp(0);
		q_tmp(2) <= q_tmp(1);
		q_tmp(3) <= q_tmp(2);
   		q_tmp(0) <= q_tmp(3);
	end if;
	end process;

-----------------------------------------------------------------------

spre_afisor_mux:process(q_tmp)

begin
case q_tmp is 
	when "0111"=> catod<=unit;
	when "1011"=> catod<=zeci;
	when "1101"=> catod<=sute;
	when "1110"=> catod<=mii;
	when others=> catod<="0000000";
end case;
end process; 
end architecture;
