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
-- Generated on "04/11/2018 13:33:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          latches_ffs
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY latches_ffs_vhd_vec_tst IS
END latches_ffs_vhd_vec_tst;
ARCHITECTURE latches_ffs_arch OF latches_ffs_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL clear : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL preset : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(1 TO 6);
COMPONENT latches_ffs
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	clear : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	preset : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(1 TO 6)
	);
END COMPONENT;
BEGIN
	i1 : latches_ffs
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	clear => clear,
	clock => clock,
	preset => preset,
	Q => Q
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		clock <= '0';
		WAIT FOR 100000 ps;
		clock <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	clock <= '0';
	WAIT FOR 100000 ps;
	clock <= '1';
WAIT;
END PROCESS t_prcs_clock;

-- A
t_prcs_A: PROCESS
BEGIN
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 40000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 30000 ps;
	A <= '1';
	WAIT FOR 50000 ps;
	A <= '0';
	WAIT FOR 50000 ps;
	A <= '1';
	WAIT FOR 20000 ps;
	A <= '0';
	WAIT FOR 30000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 40000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 20000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 9
	LOOP
		A <= '0';
		WAIT FOR 10000 ps;
		A <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	A <= '0';
	WAIT FOR 30000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 6
	LOOP
		A <= '0';
		WAIT FOR 10000 ps;
		A <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	A <= '0';
WAIT;
END PROCESS t_prcs_A;

-- B
t_prcs_B: PROCESS
BEGIN
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 70000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 20000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 30000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 80000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 15000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 37
	LOOP
		B <= '0';
		WAIT FOR 5000 ps;
		B <= '1';
		WAIT FOR 5000 ps;
	END LOOP;
	B <= '0';
WAIT;
END PROCESS t_prcs_B;

-- clear
t_prcs_clear: PROCESS
BEGIN
	clear <= '1';
	WAIT FOR 10000 ps;
	clear <= '0';
	WAIT FOR 130000 ps;
	clear <= '1';
	WAIT FOR 10000 ps;
	clear <= '0';
WAIT;
END PROCESS t_prcs_clear;

-- preset
t_prcs_preset: PROCESS
BEGIN
	preset <= '1';
	WAIT FOR 10000 ps;
	preset <= '0';
	WAIT FOR 80000 ps;
	preset <= '1';
	WAIT FOR 10000 ps;
	preset <= '0';
	WAIT FOR 20000 ps;
	preset <= '1';
	WAIT FOR 10000 ps;
	preset <= '0';
WAIT;
END PROCESS t_prcs_preset;
END latches_ffs_arch;
