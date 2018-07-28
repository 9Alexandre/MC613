library ieee;
use ieee.std_logic_1164.all;

entity fsm_seq is
	port (
			clock : in std_logic;
			reset : in std_logic;
			w 		: in std_logic;
			z		: out std_logic
  );
end fsm_seq;

architecture structural of fsm_seq is
	TYPE State_type IS (A, B, C, D, E);
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
							then y <= B;
							else y <= A;
						end if;
					when B =>
						if w = '0'
							then y <= B;
							else y <= C;
						end if;
					when C =>
						if w = '0'
							then y <= D;
							else y <= A;
						end if;
					when D =>
						if w = '0'
							then y <= B;
							else y <= E;
						end if;
					when E =>
						if w = '0'
							then y <= D;
							else y <= A;
						end if;
				end case;
			end if;
		end if;
	end process;
	
	z <= '1' when y = E else '0';

end structural;