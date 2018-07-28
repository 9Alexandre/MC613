-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "03/28/2018 17:06:21"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	cla_8bits IS
    PORT (
	x : IN std_logic_vector(7 DOWNTO 0);
	y : IN std_logic_vector(7 DOWNTO 0);
	cin : IN std_logic;
	sum : OUT std_logic_vector(7 DOWNTO 0);
	cout : OUT std_logic
	);
END cla_8bits;

ARCHITECTURE structure OF cla_8bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_x : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_y : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_sum : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL \sum[0]~output_o\ : std_logic;
SIGNAL \sum[1]~output_o\ : std_logic;
SIGNAL \sum[2]~output_o\ : std_logic;
SIGNAL \sum[3]~output_o\ : std_logic;
SIGNAL \sum[4]~output_o\ : std_logic;
SIGNAL \sum[5]~output_o\ : std_logic;
SIGNAL \sum[6]~output_o\ : std_logic;
SIGNAL \sum[7]~output_o\ : std_logic;
SIGNAL \cout~output_o\ : std_logic;
SIGNAL \x[0]~input_o\ : std_logic;
SIGNAL \y[0]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \sum~0_combout\ : std_logic;
SIGNAL \x[1]~input_o\ : std_logic;
SIGNAL \y[1]~input_o\ : std_logic;
SIGNAL \sum~1_combout\ : std_logic;
SIGNAL \x[2]~input_o\ : std_logic;
SIGNAL \y[2]~input_o\ : std_logic;
SIGNAL \sum~2_combout\ : std_logic;
SIGNAL \sum~3_combout\ : std_logic;
SIGNAL \x[3]~input_o\ : std_logic;
SIGNAL \y[3]~input_o\ : std_logic;
SIGNAL \sum~4_combout\ : std_logic;
SIGNAL \x[4]~input_o\ : std_logic;
SIGNAL \y[4]~input_o\ : std_logic;
SIGNAL \sum~5_combout\ : std_logic;
SIGNAL \sum~6_combout\ : std_logic;
SIGNAL \x[5]~input_o\ : std_logic;
SIGNAL \y[5]~input_o\ : std_logic;
SIGNAL \sum~7_combout\ : std_logic;
SIGNAL \x[6]~input_o\ : std_logic;
SIGNAL \y[6]~input_o\ : std_logic;
SIGNAL \sum~8_combout\ : std_logic;
SIGNAL \sum~9_combout\ : std_logic;
SIGNAL \x[7]~input_o\ : std_logic;
SIGNAL \y[7]~input_o\ : std_logic;
SIGNAL \sum~10_combout\ : std_logic;
SIGNAL \cout~0_combout\ : std_logic;
SIGNAL P : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_y[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_y[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_y[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_x[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_sum~9_combout\ : std_logic;
SIGNAL ALT_INV_P : std_logic_vector(6 DOWNTO 4);
SIGNAL \ALT_INV_sum~6_combout\ : std_logic;
SIGNAL \ALT_INV_sum~2_combout\ : std_logic;

BEGIN

ww_x <= x;
ww_y <= y;
ww_cin <= cin;
sum <= ww_sum;
cout <= ww_cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_y[7]~input_o\ <= NOT \y[7]~input_o\;
\ALT_INV_x[7]~input_o\ <= NOT \x[7]~input_o\;
\ALT_INV_y[6]~input_o\ <= NOT \y[6]~input_o\;
\ALT_INV_x[6]~input_o\ <= NOT \x[6]~input_o\;
\ALT_INV_y[5]~input_o\ <= NOT \y[5]~input_o\;
\ALT_INV_x[5]~input_o\ <= NOT \x[5]~input_o\;
\ALT_INV_y[4]~input_o\ <= NOT \y[4]~input_o\;
\ALT_INV_x[4]~input_o\ <= NOT \x[4]~input_o\;
\ALT_INV_y[3]~input_o\ <= NOT \y[3]~input_o\;
\ALT_INV_x[3]~input_o\ <= NOT \x[3]~input_o\;
\ALT_INV_y[2]~input_o\ <= NOT \y[2]~input_o\;
\ALT_INV_x[2]~input_o\ <= NOT \x[2]~input_o\;
\ALT_INV_y[1]~input_o\ <= NOT \y[1]~input_o\;
\ALT_INV_x[1]~input_o\ <= NOT \x[1]~input_o\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_y[0]~input_o\ <= NOT \y[0]~input_o\;
\ALT_INV_x[0]~input_o\ <= NOT \x[0]~input_o\;
\ALT_INV_sum~9_combout\ <= NOT \sum~9_combout\;
ALT_INV_P(6) <= NOT P(6);
\ALT_INV_sum~6_combout\ <= NOT \sum~6_combout\;
ALT_INV_P(4) <= NOT P(4);
\ALT_INV_sum~2_combout\ <= NOT \sum~2_combout\;

\sum[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~0_combout\,
	devoe => ww_devoe,
	o => \sum[0]~output_o\);

\sum[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~1_combout\,
	devoe => ww_devoe,
	o => \sum[1]~output_o\);

\sum[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~3_combout\,
	devoe => ww_devoe,
	o => \sum[2]~output_o\);

\sum[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~4_combout\,
	devoe => ww_devoe,
	o => \sum[3]~output_o\);

\sum[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~5_combout\,
	devoe => ww_devoe,
	o => \sum[4]~output_o\);

\sum[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~7_combout\,
	devoe => ww_devoe,
	o => \sum[5]~output_o\);

\sum[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~8_combout\,
	devoe => ww_devoe,
	o => \sum[6]~output_o\);

\sum[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sum~10_combout\,
	devoe => ww_devoe,
	o => \sum[7]~output_o\);

\cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cout~0_combout\,
	devoe => ww_devoe,
	o => \cout~output_o\);

\x[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(0),
	o => \x[0]~input_o\);

\y[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(0),
	o => \y[0]~input_o\);

\cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

\sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~0_combout\ = !\x[0]~input_o\ $ (!\y[0]~input_o\ $ (\cin~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[0]~input_o\,
	datab => \ALT_INV_y[0]~input_o\,
	datac => \ALT_INV_cin~input_o\,
	combout => \sum~0_combout\);

\x[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(1),
	o => \x[1]~input_o\);

\y[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(1),
	o => \y[1]~input_o\);

\sum~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~1_combout\ = ( \y[1]~input_o\ & ( !\x[1]~input_o\ $ (((!\x[0]~input_o\ & (\y[0]~input_o\ & \cin~input_o\)) # (\x[0]~input_o\ & ((\cin~input_o\) # (\y[0]~input_o\))))) ) ) # ( !\y[1]~input_o\ & ( !\x[1]~input_o\ $ (((!\x[0]~input_o\ & 
-- ((!\y[0]~input_o\) # (!\cin~input_o\))) # (\x[0]~input_o\ & (!\y[0]~input_o\ & !\cin~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000111010000001011100010111111010001110100000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[0]~input_o\,
	datab => \ALT_INV_y[0]~input_o\,
	datac => \ALT_INV_cin~input_o\,
	datad => \ALT_INV_x[1]~input_o\,
	datae => \ALT_INV_y[1]~input_o\,
	combout => \sum~1_combout\);

\x[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(2),
	o => \x[2]~input_o\);

\y[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(2),
	o => \y[2]~input_o\);

\sum~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~2_combout\ = ( \y[1]~input_o\ & ( ((!\x[0]~input_o\ & (\y[0]~input_o\ & \cin~input_o\)) # (\x[0]~input_o\ & ((\cin~input_o\) # (\y[0]~input_o\)))) # (\x[1]~input_o\) ) ) # ( !\y[1]~input_o\ & ( (\x[1]~input_o\ & ((!\x[0]~input_o\ & (\y[0]~input_o\ & 
-- \cin~input_o\)) # (\x[0]~input_o\ & ((\cin~input_o\) # (\y[0]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[0]~input_o\,
	datab => \ALT_INV_y[0]~input_o\,
	datac => \ALT_INV_cin~input_o\,
	datad => \ALT_INV_x[1]~input_o\,
	datae => \ALT_INV_y[1]~input_o\,
	combout => \sum~2_combout\);

\sum~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~3_combout\ = !\x[2]~input_o\ $ (!\y[2]~input_o\ $ (\sum~2_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[2]~input_o\,
	datab => \ALT_INV_y[2]~input_o\,
	datac => \ALT_INV_sum~2_combout\,
	combout => \sum~3_combout\);

\x[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(3),
	o => \x[3]~input_o\);

\y[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(3),
	o => \y[3]~input_o\);

\sum~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~4_combout\ = ( \y[3]~input_o\ & ( !\x[3]~input_o\ $ (((!\x[2]~input_o\ & (\y[2]~input_o\ & \sum~2_combout\)) # (\x[2]~input_o\ & ((\sum~2_combout\) # (\y[2]~input_o\))))) ) ) # ( !\y[3]~input_o\ & ( !\x[3]~input_o\ $ (((!\x[2]~input_o\ & 
-- ((!\y[2]~input_o\) # (!\sum~2_combout\))) # (\x[2]~input_o\ & (!\y[2]~input_o\ & !\sum~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000111010000001011100010111111010001110100000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[2]~input_o\,
	datab => \ALT_INV_y[2]~input_o\,
	datac => \ALT_INV_sum~2_combout\,
	datad => \ALT_INV_x[3]~input_o\,
	datae => \ALT_INV_y[3]~input_o\,
	combout => \sum~4_combout\);

\x[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(4),
	o => \x[4]~input_o\);

\y[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(4),
	o => \y[4]~input_o\);

\P[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- P(4) = !\x[4]~input_o\ $ (!\y[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[4]~input_o\,
	datab => \ALT_INV_y[4]~input_o\,
	combout => P(4));

\sum~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~5_combout\ = ( \y[3]~input_o\ & ( P(4) & ( (!\x[3]~input_o\ & ((!\x[2]~input_o\ & ((!\y[2]~input_o\) # (!\sum~2_combout\))) # (\x[2]~input_o\ & (!\y[2]~input_o\ & !\sum~2_combout\)))) ) ) ) # ( !\y[3]~input_o\ & ( P(4) & ( (!\x[3]~input_o\) # 
-- ((!\x[2]~input_o\ & ((!\y[2]~input_o\) # (!\sum~2_combout\))) # (\x[2]~input_o\ & (!\y[2]~input_o\ & !\sum~2_combout\))) ) ) ) # ( \y[3]~input_o\ & ( !P(4) & ( ((!\x[2]~input_o\ & (\y[2]~input_o\ & \sum~2_combout\)) # (\x[2]~input_o\ & ((\sum~2_combout\) 
-- # (\y[2]~input_o\)))) # (\x[3]~input_o\) ) ) ) # ( !\y[3]~input_o\ & ( !P(4) & ( (\x[3]~input_o\ & ((!\x[2]~input_o\ & (\y[2]~input_o\ & \sum~2_combout\)) # (\x[2]~input_o\ & ((\sum~2_combout\) # (\y[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111111111111111010001110100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[2]~input_o\,
	datab => \ALT_INV_y[2]~input_o\,
	datac => \ALT_INV_sum~2_combout\,
	datad => \ALT_INV_x[3]~input_o\,
	datae => \ALT_INV_y[3]~input_o\,
	dataf => ALT_INV_P(4),
	combout => \sum~5_combout\);

\sum~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~6_combout\ = ( \y[3]~input_o\ & ( ((!\x[2]~input_o\ & (\y[2]~input_o\ & \sum~2_combout\)) # (\x[2]~input_o\ & ((\sum~2_combout\) # (\y[2]~input_o\)))) # (\x[3]~input_o\) ) ) # ( !\y[3]~input_o\ & ( (\x[3]~input_o\ & ((!\x[2]~input_o\ & 
-- (\y[2]~input_o\ & \sum~2_combout\)) # (\x[2]~input_o\ & ((\sum~2_combout\) # (\y[2]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[2]~input_o\,
	datab => \ALT_INV_y[2]~input_o\,
	datac => \ALT_INV_sum~2_combout\,
	datad => \ALT_INV_x[3]~input_o\,
	datae => \ALT_INV_y[3]~input_o\,
	combout => \sum~6_combout\);

\x[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(5),
	o => \x[5]~input_o\);

\y[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(5),
	o => \y[5]~input_o\);

\sum~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~7_combout\ = ( \y[5]~input_o\ & ( !\x[5]~input_o\ $ (((!\x[4]~input_o\ & (\y[4]~input_o\ & \sum~6_combout\)) # (\x[4]~input_o\ & ((\sum~6_combout\) # (\y[4]~input_o\))))) ) ) # ( !\y[5]~input_o\ & ( !\x[5]~input_o\ $ (((!\x[4]~input_o\ & 
-- ((!\y[4]~input_o\) # (!\sum~6_combout\))) # (\x[4]~input_o\ & (!\y[4]~input_o\ & !\sum~6_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000111010000001011100010111111010001110100000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[4]~input_o\,
	datab => \ALT_INV_y[4]~input_o\,
	datac => \ALT_INV_sum~6_combout\,
	datad => \ALT_INV_x[5]~input_o\,
	datae => \ALT_INV_y[5]~input_o\,
	combout => \sum~7_combout\);

\x[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(6),
	o => \x[6]~input_o\);

\y[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(6),
	o => \y[6]~input_o\);

\P[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- P(6) = !\x[6]~input_o\ $ (!\y[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[6]~input_o\,
	datab => \ALT_INV_y[6]~input_o\,
	combout => P(6));

\sum~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~8_combout\ = ( \y[5]~input_o\ & ( P(6) & ( (!\x[5]~input_o\ & ((!\x[4]~input_o\ & ((!\y[4]~input_o\) # (!\sum~6_combout\))) # (\x[4]~input_o\ & (!\y[4]~input_o\ & !\sum~6_combout\)))) ) ) ) # ( !\y[5]~input_o\ & ( P(6) & ( (!\x[5]~input_o\) # 
-- ((!\x[4]~input_o\ & ((!\y[4]~input_o\) # (!\sum~6_combout\))) # (\x[4]~input_o\ & (!\y[4]~input_o\ & !\sum~6_combout\))) ) ) ) # ( \y[5]~input_o\ & ( !P(6) & ( ((!\x[4]~input_o\ & (\y[4]~input_o\ & \sum~6_combout\)) # (\x[4]~input_o\ & ((\sum~6_combout\) 
-- # (\y[4]~input_o\)))) # (\x[5]~input_o\) ) ) ) # ( !\y[5]~input_o\ & ( !P(6) & ( (\x[5]~input_o\ & ((!\x[4]~input_o\ & (\y[4]~input_o\ & \sum~6_combout\)) # (\x[4]~input_o\ & ((\sum~6_combout\) # (\y[4]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111111111111111010001110100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[4]~input_o\,
	datab => \ALT_INV_y[4]~input_o\,
	datac => \ALT_INV_sum~6_combout\,
	datad => \ALT_INV_x[5]~input_o\,
	datae => \ALT_INV_y[5]~input_o\,
	dataf => ALT_INV_P(6),
	combout => \sum~8_combout\);

\sum~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~9_combout\ = ( \y[5]~input_o\ & ( ((!\x[4]~input_o\ & (\y[4]~input_o\ & \sum~6_combout\)) # (\x[4]~input_o\ & ((\sum~6_combout\) # (\y[4]~input_o\)))) # (\x[5]~input_o\) ) ) # ( !\y[5]~input_o\ & ( (\x[5]~input_o\ & ((!\x[4]~input_o\ & 
-- (\y[4]~input_o\ & \sum~6_combout\)) # (\x[4]~input_o\ & ((\sum~6_combout\) # (\y[4]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[4]~input_o\,
	datab => \ALT_INV_y[4]~input_o\,
	datac => \ALT_INV_sum~6_combout\,
	datad => \ALT_INV_x[5]~input_o\,
	datae => \ALT_INV_y[5]~input_o\,
	combout => \sum~9_combout\);

\x[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(7),
	o => \x[7]~input_o\);

\y[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(7),
	o => \y[7]~input_o\);

\sum~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \sum~10_combout\ = ( \y[7]~input_o\ & ( !\x[7]~input_o\ $ (((!\x[6]~input_o\ & (\y[6]~input_o\ & \sum~9_combout\)) # (\x[6]~input_o\ & ((\sum~9_combout\) # (\y[6]~input_o\))))) ) ) # ( !\y[7]~input_o\ & ( !\x[7]~input_o\ $ (((!\x[6]~input_o\ & 
-- ((!\y[6]~input_o\) # (!\sum~9_combout\))) # (\x[6]~input_o\ & (!\y[6]~input_o\ & !\sum~9_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000111010000001011100010111111010001110100000010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[6]~input_o\,
	datab => \ALT_INV_y[6]~input_o\,
	datac => \ALT_INV_sum~9_combout\,
	datad => \ALT_INV_x[7]~input_o\,
	datae => \ALT_INV_y[7]~input_o\,
	combout => \sum~10_combout\);

\cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cout~0_combout\ = ( \y[7]~input_o\ & ( ((!\x[6]~input_o\ & (\y[6]~input_o\ & \sum~9_combout\)) # (\x[6]~input_o\ & ((\sum~9_combout\) # (\y[6]~input_o\)))) # (\x[7]~input_o\) ) ) # ( !\y[7]~input_o\ & ( (\x[7]~input_o\ & ((!\x[6]~input_o\ & 
-- (\y[6]~input_o\ & \sum~9_combout\)) # (\x[6]~input_o\ & ((\sum~9_combout\) # (\y[6]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_x[6]~input_o\,
	datab => \ALT_INV_y[6]~input_o\,
	datac => \ALT_INV_sum~9_combout\,
	datad => \ALT_INV_x[7]~input_o\,
	datae => \ALT_INV_y[7]~input_o\,
	combout => \cout~0_combout\);

ww_sum(0) <= \sum[0]~output_o\;

ww_sum(1) <= \sum[1]~output_o\;

ww_sum(2) <= \sum[2]~output_o\;

ww_sum(3) <= \sum[3]~output_o\;

ww_sum(4) <= \sum[4]~output_o\;

ww_sum(5) <= \sum[5]~output_o\;

ww_sum(6) <= \sum[6]~output_o\;

ww_sum(7) <= \sum[7]~output_o\;

ww_cout <= \cout~output_o\;
END structure;


