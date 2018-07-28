library ieee;
use ieee.std_logic_1164.all;

entity ff_d is
	port (
			D : in std_logic;     
			Clk : in std_logic;
			Q : out std_logic;
			Q_n  : out std_logic;
			Preset : in std_logic;
			Clear : in std_logic
	);
end ff_d;

architecture structural of ff_d is
begin

	process
	variable x: std_logic;
	begin 
		wait until Clk'EVENT and Clk = '1';
		
		if Clear = '1' then
			x := '0';
		elsif Preset = '1' then
			x := '1';
		else  
			x := D;
		end if;
		
		Q <= x;
		Q_n <= not x;
	end process;
		
end structural;
