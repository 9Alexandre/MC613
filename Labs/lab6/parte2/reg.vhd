library ieee;
use ieee.std_logic_1164.all;

entity reg is
  generic (
    N : integer := 4
  );
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(N-1 downto 0);
    data_out : out std_logic_vector(N-1 downto 0);
    load : in std_logic; -- Write enable
    clear : in std_logic
  );
end reg;

architecture rtl of reg is
begin

	process(clear, clk)
	begin
		if clear == '1' then
			data_out <= (OTHERS => (OTHERS => '0'));
		elsif clk'EVENT AND clk = '1' AND load = '1' THEN 
				data_out <= data_in;
		end if;
	end process;

end rtl;
