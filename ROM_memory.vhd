entity MEMORIE_ROM is
	port(ADR:in BIT_VECTOR(3 downto 0);
	CS: in BIT;
	D_ROM: out BIT_VECTOR(7 downto 0));
end MEMORIE_ROM;

architecture ROM of MEMORIE_ROM is
type MEM is array (0 to 15) of bit_vector(7 downto 0);
signal M: MEM :=(x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"08",x"09",x"0A",x"0B",x"0C",x"0D",x"0E",x"0F");

begin
	process(ADR,CS)
	begin
		if CS='1' then
			case ADR is
				when "0000"=>D_ROM <= M(0);
				when "0001"=>D_ROM <= M(1);
				when "0010"=>D_ROM <= M(2);
				when "0011"=>D_ROM <= M(3);
				when "0100"=>D_ROM <= M(4);
				when "0101"=>D_ROM <= M(5);
				when "0110"=>D_ROM <= M(6);
				when "0111"=>D_ROM <= M(7);
				when "1000"=>D_ROM <= M(8);
				when "1001"=>D_ROM <= M(9);
				when "1010"=>D_ROM <= M(10);
				when "1011"=>D_ROM <= M(11);	
				when "1100"=>D_ROM <= M(12);
				when "1101"=>D_ROM <= M(13);
				when "1110"=>D_ROM <= M(14);	
				when "1111"=>D_ROM <= M(15);
			end case;
		else D_ROM <=x"FF";
	end if;
end process;
end ROM;