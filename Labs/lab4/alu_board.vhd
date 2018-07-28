library ieee;
use ieee.std_logic_1164.all;

entity alu_board is
  port (
    SW : in std_logic_vector(9 downto 0);
    HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(3 downto 0)
  );
end alu_board;

architecture behavioral of alu_board is

	component alu
		port (
				a, b : in std_logic_vector(3 downto 0);
				F : out std_logic_vector(3 downto 0);
				s0, s1 : in std_logic;
				Z, C, V, N : out std_logic
		);
	end component;
		
	component bin2hex
		port (
				SW: in std_logic_vector(3 downto 0);
				HEX0: out std_logic_vector(6 downto 0)
		);
	end component;
		
	component bin2dec 
		port (
				SW: in std_logic_vector(3 downto 0);
				HEX0: out std_logic_vector(6 downto 0)
		);
	end component;
		
		SIGNAL ahex, bhex, adec, bdec, Fhex, Fdec : std_logic_vector(6 downto 0);
		SIGNAL Fd, Fh : std_logic_vector(3 downto 0);
		SIGNAL Z, C, V, N : std_logic;
		SIGNAL p, q, r, s : std_logic;
		
begin

	alud: alu port map(SW(7 downto 4), SW(3 downto 0), Fd, SW(9), SW(8), Z, C, V, N);
	aluh:	alu port map(SW(7 downto 4), SW(3 downto 0), Fh, SW(9), SW(8), p, q, r, s);
	
	f_dec: bin2dec port map(Fd, Fdec);
	f_hex: bin2hex port map(Fh, Fhex);
	
	a_dec: bin2dec port map(SW(7 downto 4), adec);
	b_dec: bin2dec port map(SW(3 downto 0), bdec);
	
	a_hex: bin2hex port map(SW(7 downto 4), ahex);
	b_hex: bin2hex port map(SW(3 downto 0), bhex);
	
	process(SW)
	begin
		if((SW(9) = '0' and SW(8) = '0') or (SW(9) = '1' and SW(8) = '0')) then
		HEX0 <= Fdec;
		if(N= '1') then
			HEX1 <= "0111111";
		else
			HEX1 <= "1111111";
		end if;
		
		HEX2 <= bdec;
		if(SW(3) = '1') then
			HEX3 <= "0111111";
		else
			HEX3 <= "1111111";
		end if;	
		
		HEX4 <= adec;
		if(SW(7) = '1') then
			HEX5 <= "0111111";
		else
			HEX5 <= "1111111";
		end if;
		
		LEDR(3) <= Z;
		LEDR(2) <= C;
		LEDR(1) <= V;
		LEDR(0) <= N;
		
		else
			HEX1 <= "1111111";
			HEX3 <= "1111111";
			HEX5 <= "1111111";
			
			HEX0 <= Fhex;
			HEX4 <= bhex;
			HEX2 <= ahex;
			
			LEDR(3) <= '0';
			LEDR(2) <= '0';
			LEDR(1) <= '0';
			LEDR(0) <= '0';
		
		end if;
		end process;
	
end behavioral;
