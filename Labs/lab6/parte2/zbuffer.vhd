LIBRARY iee;
    USE ieee.std_logic_1164.ALL;

entity zbuffer IS
	GENERIC ( N : INTEGER := 4 ) ;
	port (X : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			E : IN STD_LOGIC ;
			F : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	end zbuffer;
	
ARCHITECTURE Behavior OF zbuffer IS
BEGIN
	F <= (OTHERS => 'Z') WHEN E = '0' ELSE X ;
END Behavior ;