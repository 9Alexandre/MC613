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

-- DATE "04/17/2018 14:15:10"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
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

ENTITY 	shift_register IS
    PORT (
	clk : IN std_logic;
	mode : IN std_logic_vector(1 DOWNTO 0);
	ser_in : IN std_logic;
	par_in : IN std_logic_vector(5 DOWNTO 0);
	par_out : OUT std_logic_vector(5 DOWNTO 0)
	);
END shift_register;

ARCHITECTURE structure OF shift_register IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_mode : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ser_in : std_logic;
SIGNAL ww_par_in : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_par_out : std_logic_vector(5 DOWNTO 0);
SIGNAL \par_out[0]~output_o\ : std_logic;
SIGNAL \par_out[1]~output_o\ : std_logic;
SIGNAL \par_out[2]~output_o\ : std_logic;
SIGNAL \par_out[3]~output_o\ : std_logic;
SIGNAL \par_out[4]~output_o\ : std_logic;
SIGNAL \par_out[5]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \ser_in~input_o\ : std_logic;
SIGNAL \par_in[5]~input_o\ : std_logic;
SIGNAL \mode[1]~input_o\ : std_logic;
SIGNAL \mode[0]~input_o\ : std_logic;
SIGNAL \temp~5_combout\ : std_logic;
SIGNAL \par_in[4]~input_o\ : std_logic;
SIGNAL \temp~4_combout\ : std_logic;
SIGNAL \par_in[3]~input_o\ : std_logic;
SIGNAL \temp~3_combout\ : std_logic;
SIGNAL \par_in[2]~input_o\ : std_logic;
SIGNAL \temp~2_combout\ : std_logic;
SIGNAL \par_in[1]~input_o\ : std_logic;
SIGNAL \temp~1_combout\ : std_logic;
SIGNAL \par_in[0]~input_o\ : std_logic;
SIGNAL \temp~0_combout\ : std_logic;
SIGNAL \par_out[0]~reg0_q\ : std_logic;
SIGNAL \par_out[1]~reg0_q\ : std_logic;
SIGNAL \par_out[2]~reg0_q\ : std_logic;
SIGNAL \par_out[3]~reg0_q\ : std_logic;
SIGNAL \par_out[4]~reg0_q\ : std_logic;
SIGNAL \par_out[5]~reg0_q\ : std_logic;
SIGNAL temp : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_par_in[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_par_in[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_par_in[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_par_in[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_par_in[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_mode[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_mode[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_par_in[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ser_in~input_o\ : std_logic;
SIGNAL ALT_INV_temp : std_logic_vector(5 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_mode <= mode;
ww_ser_in <= ser_in;
ww_par_in <= par_in;
par_out <= ww_par_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_par_in[5]~input_o\ <= NOT \par_in[5]~input_o\;
\ALT_INV_par_in[4]~input_o\ <= NOT \par_in[4]~input_o\;
\ALT_INV_par_in[3]~input_o\ <= NOT \par_in[3]~input_o\;
\ALT_INV_par_in[2]~input_o\ <= NOT \par_in[2]~input_o\;
\ALT_INV_par_in[1]~input_o\ <= NOT \par_in[1]~input_o\;
\ALT_INV_mode[0]~input_o\ <= NOT \mode[0]~input_o\;
\ALT_INV_mode[1]~input_o\ <= NOT \mode[1]~input_o\;
\ALT_INV_par_in[0]~input_o\ <= NOT \par_in[0]~input_o\;
\ALT_INV_ser_in~input_o\ <= NOT \ser_in~input_o\;
ALT_INV_temp(5) <= NOT temp(5);
ALT_INV_temp(4) <= NOT temp(4);
ALT_INV_temp(3) <= NOT temp(3);
ALT_INV_temp(2) <= NOT temp(2);
ALT_INV_temp(1) <= NOT temp(1);
ALT_INV_temp(0) <= NOT temp(0);

\par_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[0]~output_o\);

\par_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[1]~output_o\);

\par_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[2]~output_o\);

\par_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[3]~output_o\);

\par_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[4]~output_o\);

\par_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \par_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => \par_out[5]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(0));

\ser_in~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ser_in,
	o => \ser_in~input_o\);

\par_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(5),
	o => \par_in[5]~input_o\);

\mode[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mode(1),
	o => \mode[1]~input_o\);

\mode[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mode(0),
	o => \mode[0]~input_o\);

\temp~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~5_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[5]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \ser_in~input_o\ ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( temp(4) ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(5),
	datab => ALT_INV_temp(4),
	datac => \ALT_INV_ser_in~input_o\,
	datad => \ALT_INV_par_in[5]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~5_combout\);

\temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(5));

\par_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(4),
	o => \par_in[4]~input_o\);

\temp~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~4_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[4]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( temp(5) ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( temp(3) ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(4),
	datab => ALT_INV_temp(3),
	datac => ALT_INV_temp(5),
	datad => \ALT_INV_par_in[4]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~4_combout\);

\temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(4));

\par_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(3),
	o => \par_in[3]~input_o\);

\temp~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~3_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[3]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( temp(4) ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( temp(2) ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(3),
	datab => ALT_INV_temp(2),
	datac => ALT_INV_temp(4),
	datad => \ALT_INV_par_in[3]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~3_combout\);

\temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(3));

\par_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(2),
	o => \par_in[2]~input_o\);

\temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~2_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[2]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( temp(3) ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( temp(1) ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(2),
	datab => ALT_INV_temp(1),
	datac => ALT_INV_temp(3),
	datad => \ALT_INV_par_in[2]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~2_combout\);

\temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(2));

\par_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(1),
	o => \par_in[1]~input_o\);

\temp~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~1_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[1]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( temp(2) ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( temp(0) ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(1),
	datab => ALT_INV_temp(0),
	datac => ALT_INV_temp(2),
	datad => \ALT_INV_par_in[1]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~1_combout\);

\temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(1));

\par_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_par_in(0),
	o => \par_in[0]~input_o\);

\temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~0_combout\ = ( \mode[1]~input_o\ & ( \mode[0]~input_o\ & ( \par_in[0]~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( \mode[0]~input_o\ & ( temp(1) ) ) ) # ( \mode[1]~input_o\ & ( !\mode[0]~input_o\ & ( \ser_in~input_o\ ) ) ) # ( !\mode[1]~input_o\ & ( 
-- !\mode[0]~input_o\ & ( temp(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_temp(0),
	datab => \ALT_INV_ser_in~input_o\,
	datac => ALT_INV_temp(1),
	datad => \ALT_INV_par_in[0]~input_o\,
	datae => \ALT_INV_mode[1]~input_o\,
	dataf => \ALT_INV_mode[0]~input_o\,
	combout => \temp~0_combout\);

\par_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[0]~reg0_q\);

\par_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[1]~reg0_q\);

\par_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[2]~reg0_q\);

\par_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[3]~reg0_q\);

\par_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[4]~reg0_q\);

\par_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \temp~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \par_out[5]~reg0_q\);

ww_par_out(0) <= \par_out[0]~output_o\;

ww_par_out(1) <= \par_out[1]~output_o\;

ww_par_out(2) <= \par_out[2]~output_o\;

ww_par_out(3) <= \par_out[3]~output_o\;

ww_par_out(4) <= \par_out[4]~output_o\;

ww_par_out(5) <= \par_out[5]~output_o\;
END structure;


