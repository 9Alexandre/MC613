Library IEEE;
use IEEE.std_logic_1164.all;

entity dec2bin is
	port (
			display: in std_logic_vector(6 downto 0);
			binario: out std_logic_vector(3 downto 0)
	);
end dec2bin;

architecture Behavior of dec2bin is
begin
 
	process(display)
	begin
		case display is
			when "1000000" => binario <= "0000"; -- 0
			when "1111001" => binario <= "0001"; -- 1
			when "0100100" => binario <= "0010"; -- 2
			when "0110000" => binario <= "0011"; -- 3
			when "0011001" => binario <= "0100"; -- 4
			when "0010010" => binario <= "0101"; -- 5
			when "0000010" => binario <= "0110"; -- 6
			when "1111000" => binario <= "0111"; -- 7
			when "0000000" => binario <= "1000"; -- 8
			when "0010000" => binario <= "1001"; -- 9
			when others => binario <= null;
		end case;
	end process;
 
end Behavior;