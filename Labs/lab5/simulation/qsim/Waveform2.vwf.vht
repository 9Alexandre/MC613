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
-- Generated on "03/28/2018 16:57:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          cla_8bits
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY cla_8bits_vhd_vec_tst IS
END cla_8bits_vhd_vec_tst;
ARCHITECTURE cla_8bits_arch OF cla_8bits_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cin : STD_LOGIC;
SIGNAL cout : STD_LOGIC;
SIGNAL sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL x : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL y : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT cla_8bits
	PORT (
	cin : IN STD_LOGIC;
	cout : OUT STD_LOGIC;
	sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	y : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : cla_8bits
	PORT MAP (
-- list connections between master ports and signals
	cin => cin,
	cout => cout,
	sum => sum,
	x => x,
	y => y
	);
-- x[7]
t_prcs_x_7: PROCESS
BEGIN
LOOP
	x(7) <= '0';
	WAIT FOR 400000 ps;
	x(7) <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_x_7;
-- x[6]
t_prcs_x_6: PROCESS
BEGIN
	x(6) <= '0';
	WAIT FOR 350000 ps;
	x(6) <= '1';
	WAIT FOR 350000 ps;
	x(6) <= '0';
WAIT;
END PROCESS t_prcs_x_6;
-- x[5]
t_prcs_x_5: PROCESS
BEGIN
	x(5) <= '0';
	WAIT FOR 300000 ps;
	x(5) <= '1';
	WAIT FOR 300000 ps;
	x(5) <= '0';
WAIT;
END PROCESS t_prcs_x_5;
-- x[4]
t_prcs_x_4: PROCESS
BEGIN
	x(4) <= '0';
	WAIT FOR 250000 ps;
	x(4) <= '1';
	WAIT FOR 250000 ps;
	x(4) <= '0';
	WAIT FOR 250000 ps;
	x(4) <= '1';
WAIT;
END PROCESS t_prcs_x_4;
-- x[3]
t_prcs_x_3: PROCESS
BEGIN
LOOP
	x(3) <= '0';
	WAIT FOR 200000 ps;
	x(3) <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_x_3;
-- x[2]
t_prcs_x_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		x(2) <= '0';
		WAIT FOR 150000 ps;
		x(2) <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	x(2) <= '0';
	WAIT FOR 150000 ps;
	x(2) <= '1';
WAIT;
END PROCESS t_prcs_x_2;
-- x[1]
t_prcs_x_1: PROCESS
BEGIN
LOOP
	x(1) <= '0';
	WAIT FOR 100000 ps;
	x(1) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_x_1;
-- x[0]
t_prcs_x_0: PROCESS
BEGIN
LOOP
	x(0) <= '0';
	WAIT FOR 50000 ps;
	x(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_x_0;
-- y[7]
t_prcs_y_7: PROCESS
BEGIN
LOOP
	y(7) <= '0';
	WAIT FOR 50000 ps;
	y(7) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_y_7;
-- y[6]
t_prcs_y_6: PROCESS
BEGIN
LOOP
	y(6) <= '0';
	WAIT FOR 100000 ps;
	y(6) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_y_6;
-- y[5]
t_prcs_y_5: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		y(5) <= '0';
		WAIT FOR 150000 ps;
		y(5) <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	y(5) <= '0';
	WAIT FOR 150000 ps;
	y(5) <= '1';
WAIT;
END PROCESS t_prcs_y_5;
-- y[4]
t_prcs_y_4: PROCESS
BEGIN
LOOP
	y(4) <= '0';
	WAIT FOR 200000 ps;
	y(4) <= '1';
	WAIT FOR 200000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_y_4;
-- y[3]
t_prcs_y_3: PROCESS
BEGIN
	y(3) <= '0';
	WAIT FOR 250000 ps;
	y(3) <= '1';
	WAIT FOR 250000 ps;
	y(3) <= '0';
	WAIT FOR 250000 ps;
	y(3) <= '1';
WAIT;
END PROCESS t_prcs_y_3;
-- y[2]
t_prcs_y_2: PROCESS
BEGIN
	y(2) <= '0';
	WAIT FOR 300000 ps;
	y(2) <= '1';
	WAIT FOR 300000 ps;
	y(2) <= '0';
WAIT;
END PROCESS t_prcs_y_2;
-- y[1]
t_prcs_y_1: PROCESS
BEGIN
	y(1) <= '0';
	WAIT FOR 350000 ps;
	y(1) <= '1';
	WAIT FOR 350000 ps;
	y(1) <= '0';
WAIT;
END PROCESS t_prcs_y_1;
-- y[0]
t_prcs_y_0: PROCESS
BEGIN
LOOP
	y(0) <= '0';
	WAIT FOR 400000 ps;
	y(0) <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_y_0;

-- cin
t_prcs_cin: PROCESS
BEGIN
	cin <= '0';
WAIT;
END PROCESS t_prcs_cin;
END cla_8bits_arch;
