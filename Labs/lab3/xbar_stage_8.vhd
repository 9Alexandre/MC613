library ieee;
use ieee.std_logic_1164.all;

entity xbar_stage_8 is
	GENERIC(N : Integer:= 8);
  port(SW  : in std_logic_vector (7 downto 0);
       LEDR: out std_logic_vector(0 downto 0));
end xbar_stage_8;

architecture rtl of xbar_stage_8 is
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
	xbar: xbar_v3 port map(f1(i), f2(i), SW(i), f1(i+1), f2(i+1));
	end GENERATE;
	
	LEDR(0) <= f1(N);
end rtl;

