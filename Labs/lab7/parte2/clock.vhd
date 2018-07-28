library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.clock_pack.all;

entity clock is
	port (
			clk : in std_logic;
			decimal : in std_logic_vector(3 downto 0);
			unity : in std_logic_vector(3 downto 0);
			set_hour : in std_logic;
			set_minute : in std_logic;
			set_second : in std_logic;
			hour_dec, hour_un : out std_logic_vector(6 downto 0);
			min_dec, min_un : out std_logic_vector(6 downto 0);
			sec_dec, sec_un : out std_logic_vector(6 downto 0)
	);
end clock;

architecture rtl of clock is

	signal clk_hz : std_logic;	
	
	signal hourDecAux : std_logic_vector(6 downto 0);
	signal hourUnAux : std_logic_vector(6 downto 0);
	signal minDecAux : std_logic_vector(6 downto 0);
	signal minUnAux : std_logic_vector(6 downto 0);
	signal secDecAux : std_logic_vector(6 downto 0);
	signal secUnAux : std_logic_vector(6 downto 0);
	
	signal hourDecAtual : std_logic_vector(3 downto 0);
	signal HourUnAtual : std_logic_vector(3 downto 0);
	signal minDecAtual : std_logic_vector(3 downto 0);
	signal minUnAtual : std_logic_vector(3 downto 0);
	signal SecDecAtual : std_logic_vector(3 downto 0);
	signal secUnAtual : std_logic_vector(3 downto 0);
  
	signal hourDec : std_logic_vector(3 downto 0);
	signal hourUn : std_logic_vector(3 downto 0);
	signal minDec : std_logic_vector(3 downto 0);
	signal minUn : std_logic_vector(3 downto 0);
	signal secDec : std_logic_vector(3 downto 0);
	signal secUn : std_logic_vector(3 downto 0);
	
begin

	clock_divider : clk_div port map (clk, clk_hz);
	
	bHourDec:	dec2bin port map(hourDecAux, hourDecAtual);
	bHourUn: 	dec2bin port map(hourUnAux, hourUnAtual);
	bMinDec: 	dec2bin port map(MinDecAux, MinDecAtual);
	bMinUn:		dec2bin port map(MinUnAux, MinUnAtual);
	bSecDec:		dec2bin port map(SecDecAux, SecDecAtual);
	bSecUn: 		dec2bin port map(SecUnAux, SecUnAtual);
	
	process(clk)
		variable bHourDecAux : std_logic_vector(3 downto 0);
		variable bHourUnAux  : std_logic_vector(3 downto 0);
		variable bMinDecAux  : std_logic_vector(3 downto 0);
		variable bMinUnAux : std_logic_vector(3 downto 0);
		variable bSecDecAux  : std_logic_vector(3 downto 0);
		variable bSecUnAux  : std_logic_vector(3 downto 0);
	 begin
	 
			if clk'event and clk = '1' then
				bHourDecAux := hourDecAtual;
				bHourUnAux := HourUnAtual;
				bMinDecAux := minDecAtual;
				bMinUnAux := minUnAtual ;
				bSecDecAux := secDecAtual;
				bSecUnAux := secUnAtual;
				
				if set_hour = '1' then
					if decimal < "0011" then
						if unity < "1010" then
							if decimal /= "0010" or unity < "0100" then
								bHourDecAux := decimal;
								bHourUnAux := unity;
							end if;
						end if;
					end if;
				end if;
				
				if set_minute = '1' then
					if decimal < "0110" then
						if unity < "1010" then
							bMinDecAux := decimal;
							bMinUnAux := unity;
						end if;
					end if;
				end if;
				
				if set_second = '1' then
					if decimal < "0110" then
						if unity < "1010" then
							bSecDecAux := decimal;
							bSecUnAux := unity;
						end if;
					end if;
				end if;
				
				if clk_hz = '1' then
					bSecUnAux := std_logic_vector(unsigned(bSecUnAux) + 1);
					if bSecUnAux > "1001" then
						bSecUnAux := "0000";
						bSecDecAux := std_logic_vector(unsigned(bSecDecAux) + 1);
						if bSecDecAux > "0101" then
							bSecDecAux  := "0000";
							bMinUnAux := std_logic_vector(unsigned(bMinUnAux) + 1);
							if bMinUnAux > "1001" then
								bMinUnAux := "0000";
								bMinDecAux := std_logic_vector(unsigned(bMinDecAux) + 1);
								if bMinDecAux > "0101" then
									bMinDecAux := "0000";
									bHourUnAux := std_logic_vector(unsigned(bHourUnAux) + 1);
									if bHourUnAux > "0100" and bHourDecAux = "0010" then
										bHourUnAux := "0000";
										bHourDecAux := "0000";
									elsif bHourUnAux > "1001" then
											bHourUnAux := "0000";
											bHourDecAux := std_logic_vector(unsigned(bHourDecAux) + 1);
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
				
				hourDec <= bHourDecAux;
				hourUn <= bHourUnAux;
				minDec <= bMinDecAux;
				minUn  <= bMinUnAux;
				secDec <= bSecDecAux;
				secUn  <= bSecUnAux;
			end if;
	end process;
	
	displayHourDec:	bin2dec port map (hourDec, hourDecAux);
	displaHouRUn: 		bin2dec port map (hourUn , hourUnAux);
	displayMinDec: 	bin2dec port map (minDec, minDecAux);
	displayMinUn: 		bin2dec port map (minUn, minUnAux);
	displaySecDec:		bin2dec port map (secDec, secDecAux);
	displaySecUn: 		bin2dec port map (secUn, secUnAux);
  
	hour_dec <= hourDecAux;
	hour_un <= hourUnAux;
	min_dec <= minDecAux;
	min_un <= minUnAux;
	sec_dec <= secDecAux;
	sec_un <= secUnAux;
					
end rtl;