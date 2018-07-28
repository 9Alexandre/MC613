LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY VGA;
USE VGA.ALL;
LIBRARY Mouse;
USE Mouse.ALL;
USE ieee.numeric_std.ALL;
LIBRARY WORK;
USE WORK.ALL;

ENTITY VGAcontrole IS
	PORT (
			SW									: IN STD_LOGIC_VECTOR(0 downto 0); -- modo
			KEY								: IN STD_LOGIC_VECTOR(1 downto 0); -- restart
			PS2_DAT 							: INOUT STD_LOGIC;	
			PS2_CLK							: INOUT STD_LOGIC;
			CLOCK_50							: IN STD_LOGIC;
			VGA_R, VGA_G, VGA_B			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			VGA_HS, VGA_VS					: OUT STD_LOGIC;
			VGA_BLANK_N, VGA_SYNC_N 	: OUT STD_LOGIC;
			VGA_CLK 							: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE behavior OF VGAcontrole IS

	COMPONENT vgacon IS
		GENERIC (
					NUM_HORZ_PIXELS : natural := 128;  -- Number of horizontal pixels
					NUM_VERT_PIXELS : natural := 96	  -- Number of vertical pixels
		);  
		PORT (	
				clk50M, rstn              : in  std_logic;
				write_clk, write_enable   : in  std_logic;
				write_addr                : in  integer range 0 to NUM_HORZ_PIXELS * NUM_VERT_PIXELS - 1;
				data_in                   : in  std_logic_vector(2 downto 0);
				vga_clk                   : out std_logic;      
				red, green, blue          : out std_logic_vector(7 downto 0);
				hsync, vsync              : out std_logic;
				sync, blank					  : out std_logic);
	END COMPONENT;
	
	COMPONENT ps2_mouse is
		PORT (
				CLOCK_50		: 		in			STD_LOGIC;											
				reset 		:		in			STD_LOGIC;				
				PS2_DAT 		:		inout		STD_LOGIC;	--	PS2 Data
				PS2_CLK		:		inout		STD_LOGIC;	--	PS2 Clock
				data_mouse	: 		out 		STD_LOGIC_VECTOR (15 downto 0);
				Click			: 		out 		STD_LOGIC
		);
	END COMPONENT;
	

	SIGNAL video_address			: INTEGER RANGE 0 TO (128 * 96 - 1);
	SIGNAL video_word				: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL cor						: STD_LOGIC_VECTOR (2 DOWNTO 0);
	
	SIGNAL switch, reset, clk50M, sync, blank : std_logic;
	
	signal x : integer range 0 to 127;  
	signal y : integer range 0 to 95;   
	
	SIGNAL data_mouse : STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL mouse_x : INTEGER range 0 to 127; 
	SIGNAL mouse_y : INTEGER range 0 to 95;  
	SIGNAL click	: STD_LOGIC;
	
	SIGNAL jogadas_p1, jogadas_p2		: std_logic_vector(9 downto 1);
	SIGNAL risco 							: std_logic_vector(3 downto 0);

	
BEGIN
	switch 	<= SW(0);
	reset		<= KEY(0);
	clk50M 	<= CLOCK_50;
	
	vga_component: vgacon
	GENERIC MAP (
						NUM_HORZ_PIXELS => 128,
						NUM_VERT_PIXELS => 96
	)
	PORT MAP (
					clk50M			=> clk50M,
					rstn				=> reset,
					write_clk		=> clk50M,
					write_enable	=> '1',
					write_addr     => video_address,
					vga_clk			=> VGA_CLK,
					data_in        => video_word,
					red				=> VGA_R,
					green				=> VGA_G,
					blue				=> VGA_B,
					hsync				=> VGA_HS,
					vsync				=> VGA_VS,
					sync				=> sync,
					blank				=> blank
	);
	
	VGA_SYNC_N <= NOT sync;
	VGA_BLANK_N <= NOT blank;
	
	-- Mouse
	Mouse: ps2_mouse PORT MAP(CLOCK_50, reset, PS2_DAT, PS2_CLK, data_mouse, click);
	mouse_x <= to_integer(unsigned(data_mouse(15 downto 8)));
	mouse_y <= 95 - to_integer(unsigned(data_mouse(7 downto 0)));
	
	-- Jogo
	jogo: logicaDoJogo PORT MAP (CLOCK_50, click, reset, switch, mouse_x, mouse_y, jogadas_p1, jogadas_p2, risco);
	
	DetectaVencedor: Vencedor PORT MAP (clock_50, reset, jogadas_p1, jogadas_p2, risco);

	PROCESS(CLOCK_50, x, y, mouse_x, mouse_y)
		-- quadrante:
	  --  > 00: nao usado
	  --  > 01: X escolhido
	  --  > 10: O escolhido
	  --  > 11: nao usado
	  variable quadrante_1 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_2 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_3 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_4 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_5 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_6 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_7 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_8 : std_logic_vector(1 downto 0) := "00";
	  variable quadrante_9 : std_logic_vector(1 downto 0) := "00";  
	BEGIN
		IF rising_edge(CLOCK_50) THEN
		
			-- Tabuleiro
			IF x = 47 THEN
				cor <= "001";
			ELSIF x = 80 THEN
				cor <= "001";
			ELSIF  y = 31 and x > 15 and x < 112 THEN
				cor <= "001";
			ELSIF  y = 64 and x > 15 and x < 112 THEN
				cor <= "001";
			ELSE
				cor <= "000";
			END IF;
			
			-- quadrante 1
			IF x > 22 AND x < 37 AND y > 8 AND y < 22 THEN
				IF quadrante_1 = "00" OR quadrante_1 = "11" THEN
					cor <= "000";
				ELSIF quadrante_1 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;

			-- quadrante 2
			IF x > 55 AND x < 70 AND y > 8 AND y < 22 THEN
				IF quadrante_2 = "00" OR quadrante_2 = "11" THEN
					cor <= "000";
				ELSIF quadrante_2 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;
			-- quadrante 3
			IF x > 88 AND x < 103 AND y > 8 AND y < 22 THEN
				IF quadrante_3 = "00" OR quadrante_3 = "11" THEN
					cor <= "000";
				ELSIF quadrante_3 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;
			-- quadrante 4
			IF x > 22 AND x < 37 AND y > 39 AND y < 54 THEN
				IF quadrante_4 = "00" OR quadrante_4 = "11" THEN
					cor <= "000";
				ELSIF quadrante_4 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;	
			
			-- quadrante 5
			IF x > 55 AND x < 70 AND y > 39 AND y < 54 THEN
				IF quadrante_5 = "00" OR quadrante_5 = "11" THEN
					cor <= "000";
				ELSIF quadrante_5 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;	
					
			-- quadrante 6
			IF x > 88 AND x < 103 AND y > 39 AND y < 54 THEN
				IF quadrante_6 = "00" OR quadrante_6 = "11" THEN
					cor <= "000";
				ELSIF quadrante_6 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;
			-- quadrante 7
			IF x > 22 AND x < 37 AND y > 72 AND y < 87 THEN
				IF quadrante_7 = "00" OR quadrante_7 = "11" THEN
					cor <= "000";
				ELSIF quadrante_7 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;	
			-- quadrante 8
			IF x > 55 AND x < 70 AND y > 72 AND y < 87 THEN
				IF quadrante_8 = "00" OR quadrante_8 = "11" THEN
					cor <= "000";
				ELSIF quadrante_8 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;	
			-- quadrante 9
			IF x > 88 AND x < 103 AND y > 72 AND y < 87 THEN
				IF quadrante_9 = "00" OR quadrante_9 = "11" THEN
					cor <= "000";
				ELSIF quadrante_9 = "01" THEN
					cor <= "100";
				ELSE
					cor <= "101";
				END IF;
			END IF;
		
			-- Jogadas
			IF jogadas_p1(1) = '1' THEN
				quadrante_1 := "01";
			END IF; 
			IF jogadas_p2(1) = '1' THEN
				quadrante_1 := "10";
			END IF;
			
			IF jogadas_p1(2) = '1' THEN
			  quadrante_2 := "01";
			END IF; 
			IF jogadas_p2(2) = '1' THEN
			  quadrante_2 := "10";
			END IF;
			
			IF jogadas_p1(3) = '1' THEN
			  quadrante_3 := "01";
			END IF;
			IF jogadas_p2(3) = '1' THEN
				quadrante_3 := "10";
			END IF;
			
			IF jogadas_p1(4) = '1' THEN
				quadrante_4 := "01";
			END IF; 
			IF jogadas_p2(4) = '1' THEN
				quadrante_4 := "10";
			END IF;
			
			IF jogadas_p1(5) = '1' THEN
				quadrante_5 := "01";
			END IF; 
			IF jogadas_p2(5) = '1' THEN
				quadrante_5 := "10";
			END IF;
			
			IF jogadas_p1(6) = '1' THEN
				quadrante_6 := "01";
			END IF; 
			IF jogadas_p2(6) = '1' THEN
				quadrante_6 := "10";
			END IF;
			
			IF jogadas_p1(7) = '1' THEN
				quadrante_7 := "01";
			END IF; 
			IF jogadas_p2(7) = '1' THEN
				quadrante_7 := "10";
			END IF;
			
			IF jogadas_p1(8) = '1' THEN
				quadrante_8 := "01";
			END IF; 
			IF jogadas_p2(8) = '1' THEN
				quadrante_8 := "10";
			END IF;
			
			IF jogadas_p1(9) = '1' THEN
				quadrante_9 := "01";
			END IF; 
			IF jogadas_p2(9) = '1' THEN
				quadrante_9 := "10";
			END IF;

			IF reset = '0' THEN
				quadrante_1 := "00";
				quadrante_2 := "00";
				quadrante_3 := "00";
				quadrante_4 := "00";
				quadrante_5 := "00";
				quadrante_6 := "00";
				quadrante_7 := "00";
				quadrante_8 := "00";
				quadrante_9 := "00";
			END IF;
		
			-- Risco de vitoria
			-- #1
			IF(risco = "0001") THEN
				IF x > 18 AND x < 109 AND y = 15 THEN
					cor <= "110";
				END IF;
			END IF;
			-- #2
			IF(risco = "0010") THEN
				IF x > 18 AND x < 109 AND y = 46 THEN
					cor <= "110";
				END IF;
			END IF;
			-- 3
			IF(risco = "0011") THEN
				IF x > 18 AND x < 109 AND y = 79 THEN
					cor <= "110";
				END IF;
			END IF;
			-- 4
			IF(risco = "0100") THEN
				IF y >= 3 AND y <= 92 AND x = 29 THEN
					cor <= "110";
				END IF;
			END IF;
			-- 5
			IF(risco = "0101") THEN
				IF y >= 3 AND y <= 92 AND x = 62 THEN
					cor <= "110";
				END IF;
			END IF;
			-- 6
			IF(risco = "0110") THEN
				IF y >= 3 AND y <= 92 AND x = 95 THEN
					cor <= "110";
				END IF;
			END IF;
			-- 7
			IF(risco = "0111") THEN
				FOR i IN 3 TO 92 LOOP
					IF x > 110-i AND x < 112-i AND y >= i AND y <= 1+i THEN
						cor <= "110";
					END IF;
				END LOOP;
			END IF;
			-- 8
			IF(risco = "1000") THEN
				FOR i IN 3 TO 93 LOOP
					IF x > 15+i AND x < 17+i AND y >= i AND y <= 1+i THEN
						cor <= "110";
					END IF;
				END LOOP;
			END IF;
			
			-- Mouse
			IF x = mouse_x AND y = mouse_y THEN
				cor <= "111";
			END IF;
		
		END IF;	
	END PROCESS;
	
	-- Percorre os endereços de video
	PROCESS(CLOCK_50)
	BEGIN
		IF CLOCK_50'EVENT AND CLOCK_50 = '1' THEN
			IF x = 127 THEN
				IF y = 95 THEN
					y <= 0;
				ELSE
					y <= y + 1;
				END IF;
				x <= 0;
			END IF;
			x <= x + 1;
		END IF;
	END PROCESS;
	
	video_address <= x + (y * 128);
	video_word	<= cor;
	
END behavior;