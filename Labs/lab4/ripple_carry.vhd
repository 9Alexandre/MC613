library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry is
  generic (
    N : integer := 4
  );
  port (
    x,y : in std_logic_vector(N-1 downto 0);
    r : out std_logic_vector(N-1 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    overflow : out std_logic
  );
end ripple_carry;

architecture rtl of ripple_carry is
	SIGNAL c : std_logic_vector(1 TO 4);
	
	component full_adder
		port (x, y : in std_logic;
				r : out std_logic;
				cin : in std_logic;
				cout : out std_logic);
	end component;
	
begin
	stage0: full_adder PORT MAP (x(0), y(0), r(0), cin, c(1));
	stage1: full_adder PORT MAP (x(1), y(1), r(1), c(1), c(2));
	stage2: full_adder PORT MAP (x(2), y(2), r(2), c(2), c(3));
	stage3: full_adder PORT MAP (x(3), y(3), r(3), c(3), c(4));
	overflow <= c(3) xor c(4);
	cout <= C(4);
end rtl;