library ieee;
use ieee.std_logic_1164.all;

entity extra_logic is
  port(w3, w2, w1, w0 : in std_logic;
       y3, y2, y1, y0 : in std_logic;
       f : out std_logic);
end extra_logic;

architecture rtl of extra_logic is
	signal e1, e2, e3, e4 : std_logic;
	
begin
	e1 <= w0 and y0;
	e2 <= w1 and y1;
	e3 <= w2 and y2;
	e4 <= w3 and y3;
	f <= e1 or e2 or e3 or e4;
end rtl;