library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all;

entity register_bank is
  port (
    clk : in std_logic;
    data_in : in std_logic_vector(3 downto 0);
    data_out : out std_logic_vector(3 downto 0);
    reg_rd : in std_logic_vector(2 downto 0);
    reg_wr : in std_logic_vector(2 downto 0);
    we : in std_logic;
    clear : in std_logic
  );
end register_bank;

architecture structural of register_bank is

	SIGNAL D2R, R2D: STD_LOGIC_VECTOR(7 DOWNTO 0);

	SIGNAL out_reg1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg2: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg3: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg4: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg5: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg6: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg7: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL out_reg8: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
begin

	write_decoder: dec3_to_8 PORT MAP(reg_rd, we, D2R);
	read_decoder: dec3_to_8 PORT MAP(reg_wr, we, R2D);
	
	register1: reg PORT MAP (clk, data_in, out_reg1, D2R(0), clear);
	register2: reg PORT MAP (clk, data_in, out_reg1, D2R(1), clear);
	register3: reg PORT MAP (clk, data_in, out_reg1, D2R(2), clear);
	register4: reg PORT MAP (clk, data_in, out_reg1, D2R(3), clear);
	register5: reg PORT MAP (clk, data_in, out_reg1, D2R(4), clear);
	register6: reg PORT MAP (clk, data_in, out_reg1, D2R(5), clear);
	register7: reg PORT MAP (clk, data_in, out_reg1, D2R(6), clear);
	register8: reg PORT MAP (clk, data_in, out_reg1, D2R(7), clear);
 
	buffer1: zbuffer PORT MAP (out_reg1, R2D(0), data_out);
	buffer2: zbuffer PORT MAP (out_reg2, R2D(1), data_out);
	buffer3: zbuffer PORT MAP (out_reg3, R2D(2), data_out);
	buffer4: zbuffer PORT MAP (out_reg4, R2D(3), data_out);
	buffer5: zbuffer PORT MAP (out_reg5, R2D(4), data_out);
	buffer6: zbuffer PORT MAP (out_reg6, R2D(5), data_out);
	buffer7: zbuffer PORT MAP (out_reg7, R2D(6), data_out);
	buffer8: zbuffer PORT MAP (out_reg8, R2D(7), data_out);
 
end structural;

	
