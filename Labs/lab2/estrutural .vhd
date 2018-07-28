library ieee;
use ieee.std_logic_1164.all;

Entity estrutural IS 
	Port (A, B, C, D, E : IN std_logic;
			F : OUT std_logic);
End estrutural;

Architecture behavior OF estrutural IS
	signal i0, i2, i5, i8, i13, i15, i18, i21, i24, i29, i31  : std_logic;
		
Begin
	i0 <= not E and not D and not C and not B and not A;
	i2 <= not E and not D and not C and B and not A;
	i5 <= not E and not D and C and not B and A;
	i8 <= not E and D and not C and not B and not A;
	i13 <= not E and D and C and not B and A;
	i15 <= not E and D and C and B and A;
	i18 <= E and not D and not C and B and not A;
	i21 <= E and not D and C and not B and A;
	i24 <= E and D and not C and not B and not A;
	i29 <= E and D and C and not B and A;
   i31 <= E and D and C and B and A;
	F <= i0 or i2 or i5 or i8 or i13 or i15 or i18 or i21 or i24 or i29 or i31;
 
End behavior;