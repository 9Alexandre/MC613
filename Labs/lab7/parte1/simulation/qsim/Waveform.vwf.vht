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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "04/17/2018 14:15:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          shift_register
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY shift_register_vhd_vec_tst IS
END shift_register_vhd_vec_tst;
ARCHITECTURE shift_register_arch OF shift_register_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL mode : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL par_in : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL par_out : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL ser_in : STD_LOGIC;
COMPONENT shift_register
	PORT (
	clk : IN STD_LOGIC;
	mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	par_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	par_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	ser_in : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : shift_register
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	mode => mode,
	par_in => par_in,
	par_out => par_out,
	ser_in => ser_in
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- mode[1]
t_prcs_mode_1: PROCESS
BEGIN
LOOP
	mode(1) <= '0';
	WAIT FOR 400000 ps;
	mode(1) <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_mode_1;
-- mode[0]
t_prcs_mode_0: PROCESS
BEGIN
LOOP
	mode(0) <= '0';
	WAIT FOR 200000 ps;
	mode(0) <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_mode_0;

-- ser_in
t_prcs_ser_in: PROCESS
BEGIN
LOOP
	ser_in <= '0';
	WAIT FOR 100000 ps;
	ser_in <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_ser_in;
-- par_in[5]
t_prcs_par_in_5: PROCESS
BEGIN
LOOP
	par_in(5) <= '0';
	WAIT FOR 400000 ps;
	par_in(5) <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_5;
-- par_in[4]
t_prcs_par_in_4: PROCESS
BEGIN
LOOP
	par_in(4) <= '0';
	WAIT FOR 200000 ps;
	par_in(4) <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_4;
-- par_in[3]
t_prcs_par_in_3: PROCESS
BEGIN
LOOP
	par_in(3) <= '0';
	WAIT FOR 100000 ps;
	par_in(3) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_3;
-- par_in[2]
t_prcs_par_in_2: PROCESS
BEGIN
LOOP
	par_in(2) <= '0';
	WAIT FOR 200000 ps;
	par_in(2) <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_2;
-- par_in[1]
t_prcs_par_in_1: PROCESS
BEGIN
LOOP
	par_in(1) <= '0';
	WAIT FOR 100000 ps;
	par_in(1) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_1;
-- par_in[0]
t_prcs_par_in_0: PROCESS
BEGIN
LOOP
	par_in(0) <= '0';
	WAIT FOR 100000 ps;
	par_in(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_par_in_0;
END shift_register_arch;
