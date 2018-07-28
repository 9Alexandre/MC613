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
-- Generated on "03/28/2018 14:04:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          barrel_shifter
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY barrel_shifter_vhd_vec_tst IS
END barrel_shifter_vhd_vec_tst;
ARCHITECTURE barrel_shifter_arch OF barrel_shifter_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL s : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL w : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL y : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT barrel_shifter
	PORT (
	s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	w : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	y : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : barrel_shifter
	PORT MAP (
-- list connections between master ports and signals
	s => s,
	w => w,
	y => y
	);
-- s[1]
t_prcs_s_1: PROCESS
BEGIN
LOOP
	s(1) <= '0';
	WAIT FOR 25000 ps;
	s(1) <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 400000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_s_1;
-- s[0]
t_prcs_s_0: PROCESS
BEGIN
LOOP
	s(0) <= '0';
	WAIT FOR 50000 ps;
	s(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 400000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_s_0;
-- w[3]
t_prcs_w_3: PROCESS
BEGIN
	w(3) <= '0';
	WAIT FOR 200000 ps;
	w(3) <= '1';
WAIT;
END PROCESS t_prcs_w_3;
-- w[2]
t_prcs_w_2: PROCESS
BEGIN
	w(2) <= '0';
	WAIT FOR 100000 ps;
	w(2) <= '1';
	WAIT FOR 100000 ps;
	w(2) <= '0';
	WAIT FOR 100000 ps;
	w(2) <= '1';
WAIT;
END PROCESS t_prcs_w_2;
-- w[1]
t_prcs_w_1: PROCESS
BEGIN
LOOP
	w(1) <= '0';
	WAIT FOR 50000 ps;
	w(1) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 400000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_w_1;
-- w[0]
t_prcs_w_0: PROCESS
BEGIN
LOOP
	w(0) <= '0';
	WAIT FOR 25000 ps;
	w(0) <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 400000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_w_0;
END barrel_shifter_arch;
