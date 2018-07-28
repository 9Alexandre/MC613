library ieee;
use ieee.std_logic_1164.all;

entity latch_sr_nand is
	port (
			S_n : in std_logic;
			R_n : in std_logic;
			Qa : out std_logic;
			Qb	: out std_logic
	);
end latch_sr_nand;

architecture structural of latch_sr_nand is
	SIGNAL Q, notQ : std_logic;
begin

	Q <= S_n nand notQ;
	Qa <= Q;
	notQ <= R_n nand Q;
	Qb <= notQ;

end structural;




 