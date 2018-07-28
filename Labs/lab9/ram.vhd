library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity ram is
  port (
		Clock : in std_logic;
		Address : in std_logic_vector(9 downto 0);
		DataIn : in std_logic_vector(31 downto 0);
		DataOut : out std_logic_vector(31 downto 0);
		WrEn : in std_logic
  );
end ram;

architecture rtl of ram is
	SIGNAL dec3to8_output: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL out_aux1, out_aux2: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL rams_wren : std_logic_vector(1 downto 0);
	SIGNAL enw: STD_LOGIC_VECTOR (3 DOWNTO 0);
	
begin

	enw <= WrEn & Address(9 DOWNTO 7);
	WITH enw SELECT
		dec3to8_output <= "00000001" WHEN "1000",
								"00000010" WHEN "1001",
								"00000100" WHEN "1010",
								"00001000" WHEN "1011",
								"00010000" WHEN "1100",
								"00100000" WHEN "1101",
								"01000000" WHEN "1110",
								"10000000" WHEN "1111",
								"00000000" WHEN OTHERS;
	
	G1: FOR i IN 0 TO 3 GENERATE 
		line1: ram_block PORT MAP (Clock, Address(6 DOWNTO 0), DataIn((8*i+7) DOWNTO (8*i)),
											out_aux1((8*i+7) DOWNTO (8*i)), dec3to8_output(0));
	END GENERATE;
	
	G2: FOR i IN 0 TO 3 GENERATE 
		line2: ram_block PORT MAP (Clock, Address(6 DOWNTO 0), DataIn((8*i+7) DOWNTO 8*i),
											out_aux2((8*i+7) DOWNTO 8*i), dec3to8_output(1));
	END GENERATE;
	
	DataOut <= (OTHERS => 'Z') WHEN (Address(8) = '1' OR Address(9) = '1') ELSE
					out_aux1 WHEN dec3to8_output(0) = '1' ELSE
					out_aux2;

end rtl;