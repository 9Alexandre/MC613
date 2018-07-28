library ieee;
use ieee.std_logic_1164.all;

entity alu is
  port (
    a, b : in std_logic_vector(3 downto 0);
    F : out std_logic_vector(3 downto 0);
    s0, s1 : in std_logic;
    Z, C, V, N : out std_logic
  );
end alu;

architecture behavioral of alu is

	component ripple_carry
		port (
				x,y : in std_logic_vector(3 downto 0);
				r : out std_logic_vector(3 downto 0);
				cin : in std_logic;
				cout : out std_logic;
				overflow : out std_logic
		);
	end component;
	
	signal soma, sub, aux : std_logic_vector(3 downto 0);
	signal s, r, p, q :  std_logic;

begin
	
	sm:	ripple_carry port map (a, b, soma, '0', s, r);
	su:	ripple_carry port map (a, not b, sub, '1', p, q);
		
	process(a, b, s0, s1)
	begin
	
		if(s0 = '0' and s1 = '0') then
			F <= soma;
			C <= s;
			V <= r;
			N <= soma(3) or '0';
			Z <= not (soma(3) or soma(2) or soma(1) or soma(0));
		elsif(s0 = '1' and s1 = '0') then
			F <= sub;
			C <= p;
			V <= q;
			N <= sub(3) or '0';
			Z <= not (sub(3) or sub(2) or sub(1) or sub(0));	
		elsif(s0 = '0' and s1 = '1') then
			aux <= a and b;
			F <= aux;
			C <= '0';
			V <= '0';
			N <= aux(3) or '0';
			Z <= not (aux(3) or aux(2) or aux(1) or aux(0));
		else
			aux <= a or b;
			F <= aux;
			C <= '0';
			V <= '0';
			N <= aux(3) or '0';
			Z <= not (aux(3) or aux(2) or aux(1) or aux(0));
		end if;
	end process;
		
end behavioral;
