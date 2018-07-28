library ieee;
use ieee.std_logic_1164.all;

entity two_comp_to_7seg is
  port (
    bin : in std_logic_vector(3 downto 0);
    segs : out std_logic_vector(6 downto 0);
    neg : out std_logic
  );
end two_comp_to_7seg;

architecture behavioral of two_comp_to_7seg is
	begin

		neg <= '1' WHEN bin(3) = '1' ELSE '0';

		process(bin)
			begin
 
				case bin is
					when "1000" => segs <= "0000000"; -- -8
					when "1001" => segs <= "1111000"; -- -7
					when "1010" => segs <= "0000010"; -- -6
					when "1011" => segs <= "0010010"; -- -5
					when "1100" => segs <= "0011001"; -- -4
					when "1101" => segs <= "0110000"; -- -3
					when "1110" => segs <= "0100100"; -- -2
					when "1111" => segs <= "1111001"; -- -1
					when "0000" => segs <= "1000000"; -- 0
					when "0001" => segs <= "1111001"; -- 1
					when "0010" => segs <= "0100100"; -- 2
					when "0011" => segs <= "0110000"; -- 3
					when "0100" => segs <= "0011001"; -- 4
					when "0101" => segs <= "0010010"; -- 5
					when "0110" => segs <= "0000010"; -- 6
					when "0111" => segs <= "1111000"; -- 7
			end case;
		end process;
 
end behavioral;
