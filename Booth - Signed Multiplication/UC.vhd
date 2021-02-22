
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity UC is
Generic (n:INTEGER);
Port (
clk: in std_logic;
rst: in std_logic;
start:in std_logic;
qreg:in std_logic; --q0
qbist: in std_logic; -- q-1
loadA:out std_logic;
rstA:out std_logic;
subB:out std_logic;
loadB: out std_logic;
term: out std_logic;
ShrAQ:out std_logic;
LoadQ:out std_logic;
RstQm1:out std_logic);
end UC;

architecture Behavioral of UC is
type state_type is (idle, init, verificare, add, sub,shift,decr,testCount,stop);
signal stare:state_type;
signal c:integer;
begin

process(clk)
begin
if rising_edge(clk) then
    if rst='1' then 
        stare<= idle;
    else
    case stare is
    when idle =>
        if start ='1' then
        stare<=init;
        else
        stare<=idle;
        end if;
    when init=>
        c<=n;
       stare<= verificare;
    when verificare =>
    if (qreg='0' and qbist='0') or (qreg='1' and qbist='1') then
    stare<=shift;
    elsif (qreg='1' and qbist='0') then
    stare<=sub;
    else
    stare<=add;
    end if;
    when add=>
       stare<= shift;
    when sub=>
       stare<= shift;
    when shift=>
       stare<= decr;
    when decr=>
       c<=c-1;    --scadem numarul         
       stare<= testCount;
    when testCount=>
    if c /= 0 then
    stare<=verificare;
    else
    stare<=stop;
    end if;
    when stop =>
    stare<=idle;
    end case;
 end if;
 end if;
end process;

proc2: process(stare)
        begin
            case stare is
                when idle => 
                    loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='0';
        ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                when init => 
                    loadA <='0';rstA<='1';subB<='0';loadB<='1';term<='0';
        ShrAQ<='0';LoadQ<='1';RstQm1<='1';
                when verificare => 
                    loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='0';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                 when add => 
                   loadA <='1';rstA<='0';subB<='0';loadB<='0';term<='0';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                 when sub => 
                    loadA <='1';rstA<='0';subB<='1';loadB<='0';term<='0';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                 when shift => 
                    loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='0';
       ShrAQ<='1';LoadQ<='0';RstQm1<='0';
                 when decr => 
                    loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='0';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                 when testCount => 
                   loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='0';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
                 when stop => 
                   loadA <='0';rstA<='0';subB<='0';loadB<='0';term<='1';
       ShrAQ<='0';LoadQ<='0';RstQm1<='0';
            end case;
        end process;
end Behavioral;
