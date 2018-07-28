library ieee;
use ieee.std_logic_1164.all;

entity dec3_to_8 is
	Port ( 
			s : in STD_LOGIC_VECTOR (2 downto 0);
			y : out STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is
begin

	with s select
		y <= 	"00000001" when "000",
				"00000010" when "001",
				"00000100" when "010",
				"00001000" when "011",
				"00010000" when "100",
				"00100000" when "101",
				"01000000" when "110",
				"10000000" when "111",
				"00000000" when others;
				
end Behavioral;