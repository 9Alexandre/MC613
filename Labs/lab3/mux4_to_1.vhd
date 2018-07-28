library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
  port(d3, d2, d1, d0 : in std_logic;
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic);
end mux4_to_1;

architecture rtl of mux4_to_1 is
begin
	WITH sel SELECT

	output <= d0 when "00",
		  d1 when "01",
		  d2 when "10",
		  d3 when "11";
end rtl;	
