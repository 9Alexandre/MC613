library ieee;
use ieee.std_logic_1164.all;

entity xbar_gen is
  GENERIC(N : Integer:= 1);
  port(s: in std_logic_vector (N-1 downto 0);
       y1, y2: out std_logic);
end xbar_gen;

architecture rtl of xbar_gen is
	SIGNAL f1: std_logic_vector(0 to N);
	SIGNAL f2: std_logic_vector(0 to N);

	COMPONENT xbar_v3
		PORT (x1, x2, s : IN STD_LOGIC;
				y1, y2: OUT STD_LOGIC );
	END COMPONENT ;
	
begin
	f1(0) <= '1';
	f2(0) <= '0';
	
	gen: for i in 0 to N-1 GENERATE
	xbar: xbar_v3 port map(f1(i), f2(i), s(i), f1(i+1), f2(i+1));
	end GENERATE;
	
	y1 <= f1(N);
	y2 <= f2(N);

end rtl;

