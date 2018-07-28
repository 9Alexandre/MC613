-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_8bits is
  port(
    x    : in  std_logic_vector(7 downto 0);
    y    : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end cla_8bits;

architecture rtl of cla_8bits is

	SIGNAL P,G, c: STD_LOGIC_VECTOR(7 downto 0);
	
begin

	sum(0) <= x(0) xor y(0) xor cin;
	P(0) <= x(0) xor y(0);
	G(0) <= x(0) and y(0);
	
	sum(1) <= x(1) xor y(1) xor c(1);
	P(1) <= x(1) xor y(1);
	G(1) <= x(1) and y(1);
	
	sum(2) <= x(2) xor y(2) xor c(2);
	P(2) <= x(2) xor y(2);
	G(2) <= x(2) and y(2);
	
	sum(3) <= x(3) xor y(3) xor c(3);
	P(3) <= x(3) xor y(3);
	G(3) <= x(3) and y(3);
	
	sum(4) <= x(4) xor y(4) xor c(4);
	P(4) <= x(4) xor y(4);
	G(4) <= x(4) and y(4);
	
	sum(5) <= x(5) xor y(5) xor c(5);
	P(5) <= x(5) xor y(5);
	G(5) <= x(5) and y(5);
	
	sum(6) <= x(6) xor y(6) xor c(6);
	P(6) <= x(6) xor y(6);
	G(6) <= x(6) and y(6);
	
	sum(7) <= x(7) xor y(7) xor c(7);
	P(7) <= x(7) xor y(7);
	G(7) <= x(7) and y(7);
	
	c(1) <= G(0) OR (P(0) AND cin);
	c(2) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND cin);
	c(3) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND cin);
	c(4) <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND cin);
	c(5) <= G(4) OR (P(4) AND G(3)) OR (P(4) AND P(3) AND G(2)) OR (P(4) AND P(3) AND P(2) AND G(1)) OR (P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND cin);
	c(6) <= G(5) OR (P(5) AND G(4)) OR (P(5) AND P(4) AND G(3)) OR (P(5) AND P(4) AND P(3) AND G(2)) OR (P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND cin);
	c(7) <= G(6) OR (P(6) AND G(5)) OR (P(6) AND P(5) AND G(4)) OR (P(6) AND P(5) AND P(4) AND G(3)) OR (P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND cin);
	cout <= G(7) OR (P(7) AND G(6)) OR (P(7) AND P(6) AND G(5)) OR (P(7) AND P(6) AND P(5) AND G(4)) OR (P(7) AND P(6) AND P(5) AND P(4) AND G(3)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0)) OR (P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0) AND cin);
	
end rtl;

