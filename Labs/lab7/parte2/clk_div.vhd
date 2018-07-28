library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  port (
    clk : in std_logic;
    clk_hz : out std_logic
  );
end clk_div;

architecture behavioral of clk_div is
	signal count: integer:=1;
	signal tmp : std_logic;
begin

	process(clk)
	begin
		if clk'event and clk='1' then
			count <= count+1;
			if count = 50000000 then
				tmp <= '1';
				count <= 0;
			elsif tmp = '1' then
				tmp <= '0';
			end if;
		end if;
		clk_hz <= tmp;
	end process;
 	
end behavioral;




 
 

