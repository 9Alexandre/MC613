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

-- DATE "04/23/2018 15:38:07"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fsm_seq IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	w : IN std_logic;
	z : BUFFER std_logic
	);
END fsm_seq;

ARCHITECTURE structure OF fsm_seq IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_w : std_logic;
SIGNAL ww_z : std_logic;
SIGNAL \z~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \w~input_o\ : std_logic;
SIGNAL \y~14_combout\ : std_logic;
SIGNAL \y.B~q\ : std_logic;
SIGNAL \y~13_combout\ : std_logic;
SIGNAL \y.C~q\ : std_logic;
SIGNAL \y~12_combout\ : std_logic;
SIGNAL \y.D~q\ : std_logic;
SIGNAL \y~11_combout\ : std_logic;
SIGNAL \y.E~q\ : std_logic;
SIGNAL \ALT_INV_y.D~q\ : std_logic;
SIGNAL \ALT_INV_y.E~q\ : std_logic;
SIGNAL \ALT_INV_y.C~q\ : std_logic;
SIGNAL \ALT_INV_w~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_y.B~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_w <= w;
z <= ww_z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_y.D~q\ <= NOT \y.D~q\;
\ALT_INV_y.E~q\ <= NOT \y.E~q\;
\ALT_INV_y.C~q\ <= NOT \y.C~q\;
\ALT_INV_w~input_o\ <= NOT \w~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_y.B~q\ <= NOT \y.B~q\;

\z~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \y.E~q\,
	devoe => ww_devoe,
	o => \z~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\w~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_w,
	o => \w~input_o\);

\y~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \y~14_combout\ = (!\y.E~q\ & (!\reset~input_o\ & (!\w~input_o\ & !\y.C~q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_y.E~q\,
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_w~input_o\,
	datad => \ALT_INV_y.C~q\,
	combout => \y~14_combout\);

\y.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \y~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.B~q\);

\y~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \y~13_combout\ = (!\reset~input_o\ & (\w~input_o\ & \y.B~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000010000000100000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_reset~input_o\,
	datab => \ALT_INV_w~input_o\,
	datac => \ALT_INV_y.B~q\,
	combout => \y~13_combout\);

\y.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \y~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.C~q\);

\y~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \y~12_combout\ = (!\reset~input_o\ & (!\w~input_o\ & ((\y.C~q\) # (\y.E~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000011000000010000001100000001000000110000000100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_y.E~q\,
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_w~input_o\,
	datad => \ALT_INV_y.C~q\,
	combout => \y~12_combout\);

\y.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \y~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.D~q\);

\y~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \y~11_combout\ = (\y.D~q\ & (!\reset~input_o\ & \w~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000100000001000000010000000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_y.D~q\,
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_w~input_o\,
	combout => \y~11_combout\);

\y.E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \y~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.E~q\);

ww_z <= \z~output_o\;
END structure;


