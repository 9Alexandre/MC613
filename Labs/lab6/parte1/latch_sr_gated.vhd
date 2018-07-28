library ieee;
use ieee.std_logic_1164.all;

entity latch_sr_gated is
	port (
			S : in std_logic;
			R : in std_logic;
			Clk : in std_logic;
			Q : out std_logic;
			Q_n : out std_logic	
	);
end latch_sr_gated;

architecture structural of latch_sr_gated is
	
	component latch_sr_nand 
		port (
				S_n : in std_logic;
				R_n : in std_logic;
				Qa : out std_logic;
				Qb	: out std_logic
		);
	end component;
	
	SIGNAL S1, R1 : std_logic;
begin

	S1 <= S AND Clk;
	R1 <= R AND Clk;
	
	sr_geted: latch_sr_nand  port map(not S1, not R1, Q, Q_n); 

end structural;


