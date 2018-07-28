library ieee;
use ieee.std_logic_1164.all;

entity fsm_diag is
	port (
			clock : in std_logic;
			reset : in std_logic;
			w 		: in std_logic;
			z		: out std_logic
  );
end fsm_diag;

architecture structural of fsm_diag is
	TYPE State_type IS (A, B, C, D);
	SIGNAL y : State_type;
begin

	process(clock, reset)
	begin
		if clock'EVENT AND clock = '1' then
			if reset = '1' then
				y <= A;
			else
				case y is
					when A =>
						if  w = '0' 
							then y <= A;
							else y <= B;
						end if;
					when B =>
						if w = '0'
							then y <= C;
							else y <= B;
						end if;
					when C =>
						if w = '0'
							then y <= C;
							else y <= D;
						end if;
					when D =>
						if w = '0'
							then y <= A;
							else y <= D;
						end if;
				end case;
			end if;
		end if;
	end process;
		
	z <= '1' when y = B else '0';
					
end structural;