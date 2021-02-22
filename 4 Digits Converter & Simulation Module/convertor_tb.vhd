--- Laborator Palamaru Mihaela-Cristina

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;



entity convertor_tb is --fiind test, nu am porturi
end convertor_tb;

architecture Behavioral of convertor_tb is
signal numar:  std_logic_vector(3 downto 0);
signal cifraUnit:  std_logic_vector(3 downto 0);
signal  cifraZeci: std_logic_vector(3 downto 0);

begin
CONV: entity WORK.convertor port map(
    numar=>numar, 
    cifraUnit=>cifraUnit, 
    cifraZeci=>cifraZeci);

convTestBench : process
variable RezCorectUnit : STD_LOGIC_VECTOR (3 Downto 0):="0000";
variable RezCorectZeci: STD_LOGIC_VECTOR (3 Downto 0):="0000"; 
--fiindca nu am ceas, am nevoie sa simulez numarul caruia ii voi extrage cifrele
variable numaratorIntern: STD_LOGIC_VECTOR(3 Downto 0):="0000"; 
variable NrEroriUnit: Integer := 0; 
variable NrEroriZeci: Integer := 0; 

begin
for i in 0 to 15 loop
    numar<= numaratorIntern;
    wait for 20ns; ---as vrea sa ma asigur ca valoarea mea se actualizeaza secvential
    
    if RezCorectUnit /= cifraUnit then
        report " Rezultat gresit! Rezultatul asteptat este (" & STD_LOGIC'image (RezCorectUnit(3)) & STD_LOGIC'image (RezCorectUnit(2)) & STD_LOGIC'image (RezCorectUnit(1)) & STD_LOGIC'image (RezCorectUnit(0)) & ") dar, valoarea obtinuta este (" &STD_LOGIC'image (cifraUnit(3)) & STD_LOGIC'image (cifraUnit(2)) & STD_LOGIC'image (cifraUnit(1)) & STD_LOGIC'image (cifraUnit(0)) & ") " severity ERROR;
        NrEroriUnit := NrEroriUnit+1;
    end if;
    
    if RezCorectZeci /= cifraZeci then 
        report " Rezultat gresit! Rezultatul asteptat este (" & STD_LOGIC'image (RezCorectZeci(3)) & STD_LOGIC'image (RezCorectZeci(2)) & STD_LOGIC'image (RezCorectZeci(1)) & STD_LOGIC'image (RezCorectZeci(0)) & ") dar, valoarea obtinuta este (" &STD_LOGIC'image (cifraZeci(3)) & STD_LOGIC'image (cifraZeci(2)) & STD_LOGIC'image (cifraZeci(1)) & STD_LOGIC'image (cifraZeci(0)) & ") " severity ERROR;
        NrEroriZeci := NrEroriZeci+1;
    end if;
    
    --- 10 - 15
    if cifraUnit = "1001" then  --cand am ajuns la 9, vreau sa ma asigur ca urmatoarea o sa fie 0
        RezCorectUnit := "0000";
        RezCorectZeci :="0001";
    else --- 0 - 9 
        RezCorectUnit := RezCorectUnit + "0001";
    end if;
 numaratorIntern := numaratorIntern +1;
end loop;

if NrEroriZeci /= 0 then
report "Testare terminata cu " & INTEGER'image(NrEroriZeci) & " erori";
else
report "Testare 100% corecta pe cifra zecilor";
end if;

if NrEroriUnit /= 0 then
report "Testare terminata cu " & INTEGER'image(NrEroriUnit) & " erori";
else
report "Testare 100% corecta pe cifra unitatilor";
end if;

---pun wait ca sa suspend proces
wait; 
end process convTestBench;


end Behavioral;
