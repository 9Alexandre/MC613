LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Vencedor IS
	PORT (
			clock_50						: IN std_logic;
			reset							: IN std_logic;
			jogadas_p1, jogadas_p2	: IN std_logic_vector(9 downto 1);
			risco							: OUT std_logic_vector(3 downto 0)									
	);
END ENTITY;

ARCHITECTURE behavior OF Vencedor IS
BEGIN

	PROCESS(CLOCK_50, reset, jogadas_p1, jogadas_p2)
	BEGIN
		IF RISING_EDGE(CLOCK_50) THEN
			IF reset = '0' THEN
				risco <= "0000";
			END IF;
			-- #1
			IF (jogadas_p1(1) = '1' and jogadas_p1(2) = '1' and jogadas_p1(3) = '1') OR
				(jogadas_p2(1) = '1' and jogadas_p2(2) = '1' and jogadas_p2(3) = '1') THEN
					risco <= "0001";
			END IF;			
			-- #2
			IF (jogadas_p1(4) = '1' and jogadas_p1(5) = '1' and jogadas_p1(6) = '1') OR
				(jogadas_p2(4) = '1' and jogadas_p2(5) = '1' and jogadas_p2(6) = '1') THEN
					risco <= "0010";
			END IF;		
			-- #3
			IF (jogadas_p1(7) = '1' and jogadas_p1(8) = '1' and jogadas_p1(9) = '1') OR
				(jogadas_p2(7) = '1' and jogadas_p2(8) = '1' and jogadas_p2(9) = '1') THEN
					risco <= "0011";
			END IF;			
			-- #4
			IF (jogadas_p1(1) = '1' and jogadas_p1(4) = '1' and jogadas_p1(7) = '1') OR
				(jogadas_p2(1) = '1' and jogadas_p2(4) = '1' and jogadas_p2(7) = '1') THEN
					risco <= "0100";
			END IF;			
			-- #5
			IF (jogadas_p1(2) = '1' and jogadas_p1(5) = '1' and jogadas_p1(8) = '1') OR
				(jogadas_p2(2) = '1' and jogadas_p2(5) = '1' and jogadas_p2(8) = '1') THEN
					risco <= "0101";
			END IF;			
			-- #6
			IF (jogadas_p1(3) = '1' and jogadas_p1(6) = '1' and jogadas_p1(9) = '1') OR
				(jogadas_p2(3) = '1' and jogadas_p2(6) = '1' and jogadas_p2(9) = '1') THEN
					risco <= "0110";
			END IF;
			-- #7
			IF (jogadas_p1(3) = '1' and jogadas_p1(5) = '1' and jogadas_p1(7) = '1') OR
				(jogadas_p2(3) = '1' and jogadas_p2(5) = '1' and jogadas_p2(7) = '1') THEN
					risco <= "0111";
			END IF;
			-- #8
			IF (jogadas_p1(1) = '1' and jogadas_p1(5) = '1' and jogadas_p1(9) = '1') OR
				(jogadas_p2(1) = '1' and jogadas_p2(5) = '1' and jogadas_p2(9) = '1') THEN
					risco <= "1000";
			END IF;
		END IF;
	END PROCESS;
END behavior;