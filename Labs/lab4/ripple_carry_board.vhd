library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_board is
  port (
    SW : in std_logic_vector(7 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(0 downto 0)
    );
end ripple_carry_board;

architecture rtl of ripple_carry_board is

	component ripple_carry
		port (
				x,y : in std_logic_vector(3 downto 0);
				r : out std_logic_vector(3 downto 0);
				cin : in std_logic;
				cout : out std_logic;
				overflow : out std_logic);
	end component;
	
		component bin2hex
			port (
					SW: in std_logic_vector(3 downto 0);
					HEX0: out std_logic_vector(6 downto 0)
			);
		end component;
		
		SIGNAL C, S : std_logic;
		SIGNAL HEX : std_logic_vector(3 downto 0);

begin

	X1: bin2hex port map(SW(7 downto 4), HEX4);
	y2: bin2hex port map(SW(3 downto 0), HEX2);
	
	op: ripple_carry port map(SW(7 downto 4), SW(3 downto 0), HEX, '0', C, S);
	
	LEDR(0) <= S;
	
	R1: bin2hex port map(HEX, HEX0);
	
end rtl;