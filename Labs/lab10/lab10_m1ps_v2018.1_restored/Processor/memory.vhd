LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY memory IS
		GENERIC (
			WORDSIZE		: NATURAL	:= 8;
			BITS_OF_ADDR	: NATURAL	:= 16;
			MIF_FILE		: STRING	:= ""
		);
		PORT (
			clock   : IN	STD_LOGIC;
			we      : IN	STD_LOGIC;
			address : IN	STD_LOGIC_VECTOR(BITS_OF_ADDR-1 DOWNTO 0);
			datain  : IN	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0);
			dataout : OUT	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0)
		);
	END;
	
