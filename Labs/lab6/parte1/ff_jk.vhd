library ieee;
use ieee.std_logic_1164.all;

entity ff_jk is
	port (
			J : in std_logic;    
			K : in std_logic;    
			Clk : in std_logic;   
			Q : out std_logic;    
			Q_n : out std_logic;   
			Preset : in std_logic; 
			Clear : in std_logic 	
	);
end ff_jk;

architecture structural of ff_jk is


begin

	process
		variable x: std_logic;
	begin
		wait until Clk'EVENT and Clk = '1';
	
		if Clear = '1' then
			x := '0';
		elsif Preset = '1' then
			x := '1';
		
		elsif(J='0' and K='0')then
			x:=x;
		elsif(J='1' and K='1')then
			x:= not x;
		elsif(J='0' and K='1')then
			x:='0';
		else
			x:='1';
		end if;
	
		Q <= x;
		Q_n <= not x;
	end process;
	
end structural;




