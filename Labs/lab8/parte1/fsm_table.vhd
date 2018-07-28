library ieee;
use ieee.std_logic_1164.all;

entity fsm_table is
	port (
			clock : in std_logic;
			reset : in std_logic;
			w 		: in std_logic;
			z		: out std_logic
  );
end fsm_table;

architecture structural of fsm_table is
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
							then y <= C;
							else y <= B;
						end if;
					when B =>
						if w = '0'
							then y <= D;
							else y <= C;
						end if;
					when C =>
						if w = '0'
							then y <= B;
							else y <= C;
						end if;
					when D =>
						if w = '0'
							then y <= A;
							else y <= C;
						end if;
				end case;
			end if;
		end if;
	end process;
	
	process(y,w)
	begin
		case y is
			when A => 
				z <= '1';
			when B => 
				if w = '0' then
					z <= '1';
				else
					z <= '0';
				end if;
			when C =>
				z <= '0';
			when D => 
				if w = '0' then
					z <= '0';
				else
					z <= '1';
				end if;
			end case;
		end process;
					
			
end structural;