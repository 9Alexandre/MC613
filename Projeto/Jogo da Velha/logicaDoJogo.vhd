LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY logicaDoJogo IS
	PORT (
			CLOCK_50						: IN STD_LOGIC;
			click							: IN STD_LOGIC;
			reset 						: IN STD_LOGIC;
			modo_de_jogo				: IN STD_LOGIC;
			x								: IN INTEGER range 0 to 127;
			y								: IN INTEGER range 0 to 95;
			jogador1, jogador2		: OUT std_logic_vector(9 downto 1);
			risco							: IN STD_LOGIC_vector(3 downto 0)	
	);
END ENTITY;

ARCHITECTURE behavior OF logicaDoJogo  IS

	TYPE State_type IS (inicio, P1, P2, CPU, Vitoria);
	SIGNAL Q : State_type;

	SIGNAL jogadas_p1, jogadas_p2	:	std_logic_vector(9 downto 1);
	
	SIGNAL click_q : std_logic;
	
	SIGNAL x_aux								: INTEGER range 0 to 127;
	SIGNAL y_aux								: INTEGER range 0 to 95;
	
BEGIN

	PROCESS(CLOCK_50, reset)
	BEGIN
		IF reset = '0' THEN
			click_q <= '0';
		ELSIF RISING_EDGE(CLOCK_50) THEN
			click_q <= click;
		END IF;
	END PROCESS;
	
	PROCESS(CLOCK_50, reset)
	BEGIN
		IF reset = '0' THEN
			x_aux <= 0;
			y_aux <= 0;
		ELSIF RISING_EDGE(CLOCK_50) THEN
			IF click = '1' and click_q = '0' THEN
				x_aux <= x;
				y_aux <= y;
			END IF;			
		END IF;
	END PROCESS;
	
	PROCESS(CLOCK_50, reset)
	BEGIN
		IF reset = '0' THEN
			Q <= inicio;
		ELSIF RISING_EDGE(CLOCK_50) THEN
			CASE Q IS
				WHEN inicio =>
					Q <= P1;
				WHEN P1 =>
					IF modo_de_jogo = '0' THEN
						IF click = '1' and click_q = '0' and risco = "0000" THEN
							Q <= P2;
						ELSE
							IF risco = "0000" THEN
								Q <= P1;
							ELSE
								Q <= Vitoria;
							END IF;
						END IF;
					ELSE
						IF click = '1' and click_q = '0' and risco = "0000"  THEN
							Q <= CPU;
						else
							IF risco = "0000" THEN
								Q <= P1;
							ELSE
								Q <= Vitoria;
							END IF;
						end if;
					END IF;
				WHEN P2 =>
					IF click = '1' and click_q = '0' and risco = "0000" THEN
						Q <= P1;
					ELSE
						IF risco = "0000" THEN
							Q <= P2;
						ELSE
							Q <= Vitoria;
						END IF;
					END IF;
				WHEN CPU =>
						IF risco = "0000" THEN
							Q <= P1;
						ELSE
							Q <= Vitoria;
						END IF;
				WHEN Vitoria =>
					Q <= Vitoria;
								
			END CASE;
		END IF;
	END PROCESS;
		
	PROCESS(CLOCK_50, reset)
	BEGIN
		if (rising_edge(CLOCK_50)) then
			CASE Q IS
				WHEN Inicio =>
					jogadas_p1 <= "000000000";
					jogadas_p2 <= "000000000";
				
				WHEN Vitoria =>
			
				WHEN P1 =>
					--#1
					IF x_aux > 15 AND x_aux < 47 AND y_aux >= 0 AND y_aux < 31 THEN
						IF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' THEN
							jogadas_p1(1) <= '1';
						END IF;
					END IF;
					
					-- #2
					IF x_aux > 47 AND x_aux < 80 AND y_aux >= 0 AND y_aux < 31 THEN	
						IF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' THEN
							jogadas_p1(2) <= '1';
						END IF;
					END IF;
					
					-- #3	
					IF x_aux > 80 AND x_aux < 111 AND y_aux >= 0 AND y_aux < 31 THEN
						IF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' THEN
							jogadas_p1(3) <= '1';
						END IF;
					END IF;
				
				--#4
					IF x_aux > 15 AND x_aux < 47 AND y_aux > 31 AND y_aux < 64 THEN
						IF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' THEN
							jogadas_p1(4) <= '1';
						END IF;
					END IF;
					
					-- #5
					IF x_aux > 47 AND x_aux < 80 AND y_aux > 31 AND y_aux < 64 THEN	
						IF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' THEN
							jogadas_p1(5) <= '1';
						END IF;
					END IF;
					
					-- #6
					IF x_aux > 80 AND x_aux < 111 AND y_aux > 31 AND y_aux < 64 THEN
						IF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' THEN
							jogadas_p1(6) <= '1';
						END IF;
					END IF;
					
					--#7
					IF x_aux > 15 AND x_aux < 47 AND y_aux > 64 AND y_aux < 95 THEN
						IF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' THEN
							jogadas_p1(7) <= '1';
						END IF;
					END IF;
					
					-- #8
					IF x_aux > 47 AND x_aux < 80 AND y_aux > 64 AND y_aux < 95 THEN	
						IF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' THEN
							jogadas_p1(8) <= '1';
						END IF;
					END IF;
					
					-- #9	
					IF x_aux > 80 AND x_aux < 111 AND y_aux > 64 AND y_aux < 95 THEN
						IF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' THEN
							jogadas_p1(9) <= '1';
						END IF;
					END IF;
				
				
				WHEN P2 =>
					--#1
					IF x_aux > 15 AND x_aux < 47 AND y_aux >= 0 AND y_aux < 31 THEN
						IF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' THEN
							jogadas_p2(1) <= '1';
						END IF;
					END IF;
					
					-- #2
					IF x_aux > 47 AND x_aux < 80 AND y_aux >= 0 AND y_aux < 31 THEN		
						IF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' THEN
							jogadas_p2(2) <= '1';
						END IF;
					end if;
						
					
					-- #3	
					IF x_aux > 80 AND x_aux < 111 AND y_aux >= 0 AND y_aux < 31 THEN
						IF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' THEN
							jogadas_p2(3) <= '1';
						END IF;
					END IF;
					
					--#4
					IF x_aux > 15 AND x_aux < 47 AND y_aux > 31 AND y_aux < 64 THEN
						IF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' THEN
							jogadas_p2(4) <= '1';
						END IF;
					END IF;
					
					-- #5
					IF x_aux > 47 AND x_aux < 80 AND y_aux > 31 AND y_aux < 64 THEN	
						IF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' THEN
							jogadas_p2(5) <= '1';	
						END IF;
					END IF;
					
					-- #6
					IF x_aux > 80 AND x_aux < 111 AND y_aux > 31 AND y_aux < 64 THEN
						IF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' THEN
							jogadas_p2(6) <= '1';
						END IF;
					END IF;
					
					--#7
					IF x_aux > 15 AND x_aux < 47 AND y_aux > 64 AND y_aux < 95 THEN
						IF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' THEN
							jogadas_p2(7) <= '1';
						END IF;
					END IF;
					
					-- #8
					IF x_aux > 47 AND x_aux < 80 AND y_aux > 64 AND y_aux < 95 THEN	
						IF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' THEN
							jogadas_p2(8) <= '1';
						END IF;
					END IF;
					
					-- #9	
					IF x_aux > 80 AND x_aux < 111 AND y_aux > 64 AND y_aux < 95 THEN
						IF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' THEN
							jogadas_p2(9) <= '1';
						END IF;
					END IF;
					
				WHEN CPU =>
					--1. VITORIA
					--Risco 1
						IF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(2) = '1' THEN
							jogadas_p2(3) <= '1';
						ELSIF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(3) = '1' THEN
							jogadas_p2(2) <= '1';
						ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p2(2) = '1' and jogadas_p2(3) = '1' THEN
							jogadas_p2(1) <= '1';
							
						--Risco 2
							ELSIF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' AND jogadas_p2(4) = '1' and jogadas_p2(5) = '1' THEN
								jogadas_p2(6) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p2(4) = '1' and jogadas_p2(6) = '1' THEN
								jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' AND jogadas_p2(5) = '1' and jogadas_p2(6) = '1' THEN
								jogadas_p2(4) <= '1';
							
						--Risco 3
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p2(7) = '1' and jogadas_p2(8) = '1' THEN
								jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' AND jogadas_p2(7) = '1' and jogadas_p2(9) = '1' THEN
								jogadas_p2(8) <= '1';
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p2(8) = '1' and jogadas_p2(9) = '1' THEN
								jogadas_p2(7) <= '1';
							
						--Risco 4
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(4) = '1' THEN
								jogadas_p2(7) <= '1';
							ELSIF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(7) = '1' THEN
								jogadas_p2(4) <= '1';
							ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p2(4) = '1' and jogadas_p2(7) = '1' THEN
								jogadas_p2(1) <= '1';
							
						--Risco 5
							ELSIF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' AND jogadas_p2(2) = '1' and jogadas_p2(5) = '1' THEN						
								jogadas_p2(8) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p2(2) = '1' and jogadas_p2(8) = '1' THEN
								jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' AND jogadas_p2(5) = '1' and jogadas_p2(8) = '1' THEN
								jogadas_p2(2) <= '1';
							
						--Risco 6
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p2(3) = '1' and jogadas_p2(6) = '1' THEN						
									jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0'AND jogadas_p2(3) = '1' and jogadas_p2(9) = '1' THEN
									jogadas_p2(6) <= '1';
							ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p2(6) = '1' and jogadas_p2(9) = '1' THEN
									jogadas_p2(3) <= '1';
							
						--Risco 7
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p2(3) = '1' and jogadas_p2(5) = '1' THEN
								jogadas_p2(7) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p2(3) = '1' and jogadas_p2(7) = '1' THEN							
								jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p2(5) = '1' and jogadas_p2(7) = '1' THEN
								jogadas_p2(3) <= '1';
							
						--Risco 8
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(5) = '1' THEN
								jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p2(1) = '1' and jogadas_p2(9) = '1' THEN
								jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p2(5) = '1' and jogadas_p2(9) = '1' THEN
								jogadas_p2(1) <= '1';
						
						--2.BLOQUEIO
					--Risco 1
							ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p1(1) = '1' and jogadas_p1(2) = '1' THEN
									jogadas_p2(3) <= '1';
							ELSIF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' AND jogadas_p1(1) = '1' and jogadas_p1(3) = '1'  THEN
									jogadas_p2(2) <= '1';
							ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p1(2) = '1' and jogadas_p1(3) = '1' THEN
									jogadas_p2(1) <= '1';
							
						--Risco 2
							ELSIF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' AND jogadas_p1(4) = '1' and jogadas_p1(5) = '1' THEN								
								jogadas_p2(6) <= '1';							
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p1(4) = '1' and jogadas_p1(6) = '1'THEN						
								jogadas_p2(5) <= '1';								
							ELSIF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' AND jogadas_p1(5) = '1' and jogadas_p1(6) = '1'THEN				
								jogadas_p2(4) <= '1';							
							
						--Risco 3
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p1(7) = '1' and jogadas_p1(8) = '1' THEN
								jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0'  AND jogadas_p1(7) = '1' and jogadas_p1(9) = '1' THEN
								jogadas_p2(8) <= '1';
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p1(8) = '1' and jogadas_p1(9) = '1' THEN
								jogadas_p2(7) <= '1';
							
						--Risco 4
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p1(1) = '1' and jogadas_p1(4) = '1'  THEN
								jogadas_p2(7) <= '1';							
							ELSIF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' AND jogadas_p1(1) = '1' and jogadas_p1(7) = '1'  THEN						
								jogadas_p2(4) <= '1';
							ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p1(4) = '1' and jogadas_p1(7) = '1' THEN
								jogadas_p2(1) <= '1';

						--Risco 5
							ELSIF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' AND jogadas_p1(2) = '1' and jogadas_p1(5) = '1'THEN
								jogadas_p2(8) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p1(2) = '1' and jogadas_p1(8) = '1'THEN						
								jogadas_p2(5) <= '1';	
							ELSIF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' AND jogadas_p1(5) = '1' and jogadas_p1(8) = '1' THEN
								jogadas_p2(2) <= '1';
								
						--Risco 6
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p1(3) = '1' and jogadas_p1(6) = '1' THEN
								jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' AND jogadas_p1(3) = '1' and jogadas_p1(9) = '1' THEN
								jogadas_p2(6) <= '1';
							ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND  jogadas_p1(6) = '1' and jogadas_p1(9) = '1' THEN
								jogadas_p2(3) <= '1';
							
						--Risco 7
							ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p1(3) = '1' and jogadas_p1(5) = '1' THEN
								jogadas_p2(7) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p1(3) = '1' and jogadas_p1(7) = '1'THEN
								jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p1(5) = '1' and jogadas_p1(7) = '1' THEN
								jogadas_p2(3) <= '1';
							
						--Risco 8
							ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND  jogadas_p1(1) = '1' and jogadas_p1(5) = '1'THEN
									jogadas_p2(9) <= '1';
							ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' AND jogadas_p1(1) = '1' and jogadas_p1(9) = '1'THEN
									jogadas_p2(5) <= '1';
							ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p1(5) = '1' and jogadas_p1(9) = '1' THEN
									jogadas_p2(1) <= '1';
						
					--3.CENTRO
						ELSIF jogadas_p1(5) = '0' AND jogadas_p2(5) = '0' THEN
							jogadas_p2(5) <= '1';
						
					--4.CANTO OPOSTO
						ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' AND jogadas_p1(1) = '1' THEN
							jogadas_p2(9) <= '1';
						ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' AND jogadas_p1(3) = '1' THEN	
							jogadas_p2(7) <= '1';
						ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' AND jogadas_p1(7) = '1' THEN
							jogadas_p2(3) <= '1';		
						ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' AND jogadas_p1(9) = '1' THEN						
							jogadas_p2(1) <= '1';
							

					--5.CANTO
						ELSIF jogadas_p1(1) = '0' AND jogadas_p2(1) = '0' THEN
								jogadas_p2(1) <= '1';
						ELSIF jogadas_p1(3) = '0' AND jogadas_p2(3) = '0' THEN
								jogadas_p2(3) <= '1';
						ELSIF jogadas_p1(7) = '0' AND jogadas_p2(7) = '0' THEN
								jogadas_p2(7) <= '1';
						ELSIF jogadas_p1(9) = '0' AND jogadas_p2(9) = '0' THEN
								jogadas_p2(9) <= '1';
						
					--6.LADO
						ELSIF jogadas_p1(2) = '0' AND jogadas_p2(2) = '0' THEN
								jogadas_p2(2) <= '1';
						ELSIF jogadas_p1(4) = '0' AND jogadas_p2(4) = '0' THEN
								jogadas_p2(4) <= '1';
						ELSIF jogadas_p1(6) = '0' AND jogadas_p2(6) = '0' THEN
								jogadas_p2(6) <= '1';
						ELSIF jogadas_p1(8) = '0' AND jogadas_p2(8) = '0' THEN
								jogadas_p2(8) <= '1';
				
					END IF;
				END CASE;
		END IF;
	END PROCESS;
	
	jogador1 <= jogadas_p1;
	jogador2 <= jogadas_p2;
			
END behavior;	