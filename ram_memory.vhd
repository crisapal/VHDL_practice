entity MEMORIE_RAM is
	port(ADR:in BIT_VECTOR(2 downto 0);
	CS: in BIT;
	WR: in BIT;
	D_IN:in BIT_VECTOR(2 downto 0);
	D_OUT: out BIT_VECTOR(2 downto 0));
end	MEMORIE_RAM;

architecture RAM of MEMORIE_RAM is
type MEM is array (0 to 7) of bit_vector(2 downto 0);
signal M: MEM := ("000","001","010","011","100","101","110","111");

begin
	process(ADR,CS,WR,D_IN)--nu uita parametrii formali
	begin -- process begins aici
	if CS='1' then
		if WR='1' then
			case ADR is
				when "000" => D_OUT<= M(0);
				when "001" => D_OUT<= M(1);
				when "010" => D_OUT<= M(2);
				when "011" => D_OUT<= M(3);
				when "100" => D_OUT<= M(4);
				when "101" => D_OUT<= M(5);
				when "110" => D_OUT<= M(6);
				when "111" => D_OUT<= M(7);
			end case;
		else
			case ADR is
				when "000" => M(0)<= D_IN;
				when "001" => M(0)<= D_IN;
				when "010" => M(0)<= D_IN;
				when "011" => M(0)<= D_IN;
				when "100" => M(0)<= D_IN;
				when "101" => M(0)<= D_IN;
				when "110" => M(0)<= D_IN;
				when "111" => M(0)<= D_IN;
			end case;
		end if;
		else D_OUT<="111";
		end if;
		end process;
	end RAM;