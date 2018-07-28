-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_4bits is
  port(
    x    : in  std_logic_vector(3 downto 0);
    y    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
  );
end cla_4bits;

architecture rtl of cla_4bits is

	SIGNAL c1,c2,c3: STD_LOGIC;
	SIGNAL P,G: STD_LOGIC_VECTOR(3 downto 0);
	
begin
 
	sum(0) <= x(0) xor y(0) xor cin;
	P(0) <= x(0) xor y(0);
	G(0) <= x(0) and y(0);
	
	sum(1) <= x(1) xor y(1) xor c1;
	P(1) <= x(1) xor y(1);
	G(1) <= x(1) and y(1);
	
	sum(2) <= x(2) xor y(2) xor c2;
	P(2) <= x(2) xor y(2);
	G(2) <= x(2) and y(2);
	
	sum(3) <= x(3) xor y(3) xor c3;
	P(3) <= x(3) xor y(3);
	G(3) <= x(3) and y(3);
	
	c1 <= G(0) OR (P(0) AND cin);
	c2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND cin);
	c3 <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND cin);
	cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND cin);
  
end rtl;

