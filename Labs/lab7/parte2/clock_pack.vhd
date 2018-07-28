library ieee;
use ieee.std_logic_1164.all;

package clock_pack is

	component clk_div is
		port (
				clk : in std_logic;
				clk_hz : out std_logic
		);
	end component;
  
	component bin2dec is
		port (
				binario: in std_logic_vector(3 downto 0);
				display: out std_logic_vector(6 downto 0)
		);
	end component;

	component dec2bin is
		port (
				display: in std_logic_vector(6 downto 0);
				binario: out std_logic_vector(3 downto 0)
		);
	end component;
	
end clock_pack;