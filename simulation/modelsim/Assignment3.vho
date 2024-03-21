-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "12/20/2022 20:32:31"

-- 
-- Device: Altera EP2C5Q208C8 Package PQFP208
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Keyboard IS
    PORT (
	clk : IN std_logic;
	col : IN std_logic_vector(3 DOWNTO 0);
	row : OUT std_logic_vector(3 DOWNTO 0);
	num : OUT std_logic_vector(3 DOWNTO 0);
	pressed : OUT std_logic;
	toggle : OUT std_logic
	);
END Keyboard;

-- Design Ports Information
-- row[0]	=>  Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- row[1]	=>  Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- row[2]	=>  Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- row[3]	=>  Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- num[0]	=>  Location: PIN_197,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- num[1]	=>  Location: PIN_193,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- num[2]	=>  Location: PIN_11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- num[3]	=>  Location: PIN_195,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pressed	=>  Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- toggle	=>  Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- col[1]	=>  Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- col[2]	=>  Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- col[3]	=>  Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- col[0]	=>  Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Keyboard IS
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
SIGNAL ww_col : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_row : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_num : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_pressed : std_logic;
SIGNAL ww_toggle : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|clk_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \myScanner|keyboard_clk_filter|clk_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \myDebouncer|toggle_clk_filter|clk_out~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \myScanner|pcheck[1]~2_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[3]~38_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[19]~70_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[21]~74_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[22]~76_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[24]~80_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[3]~38_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[8]~48_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[12]~56_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[30]~93\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[31]~94_combout\ : std_logic;
SIGNAL \myCoder|Equal0~0_combout\ : std_logic;
SIGNAL \myCoder|Equal0~1_combout\ : std_logic;
SIGNAL \myCoder|Equal10~0_combout\ : std_logic;
SIGNAL \myCoder|Equal12~2_combout\ : std_logic;
SIGNAL \myCoder|Equal4~0_combout\ : std_logic;
SIGNAL \myCoder|Equal14~0_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~1_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~8_combout\ : std_logic;
SIGNAL \myScanner|Mux32~2_combout\ : std_logic;
SIGNAL \myScanner|Mux32~3_combout\ : std_logic;
SIGNAL \myScanner|Mux34~0_combout\ : std_logic;
SIGNAL \myScanner|Mux34~1_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \myDebouncer|key_reg1[1]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[1]~feeder_combout\ : std_logic;
SIGNAL \myScanner|keyboard_clk_filter|clk_out~0_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[0]~32_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[0]~33\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[1]~34_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[1]~35\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[2]~36_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[2]~37\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[3]~39\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[4]~40_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[4]~41\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[5]~43\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[6]~45\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[7]~46_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[7]~47\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[8]~49\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[9]~50_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[9]~51\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[10]~53\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[11]~54_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[11]~55\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[12]~57\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[13]~58_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[13]~59\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[14]~60_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[14]~61\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[15]~62_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[15]~63\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[16]~64_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[16]~65\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[17]~66_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[17]~67\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[18]~68_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[18]~69\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[19]~71\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[20]~72_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[20]~73\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[21]~75\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[22]~77\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[23]~78_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[23]~79\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[24]~81\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[25]~82_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[25]~83\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[26]~85\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[27]~86_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[27]~87\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[28]~89\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[29]~90_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[29]~91\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[30]~92_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[30]~93\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[31]~94_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[26]~84_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~2_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[28]~88_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~3_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~0_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~4_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[8]~48_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[10]~52_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[12]~56_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~5_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[6]~44_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|i[5]~42_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~6_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~7_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|LessThan0~9_combout\ : std_logic;
SIGNAL \myScanner|keyboard_clk_filter|clk_out~regout\ : std_logic;
SIGNAL \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \myScanner|state.s0~0_combout\ : std_logic;
SIGNAL \myScanner|state.s0~regout\ : std_logic;
SIGNAL \myScanner|state.s1~0_combout\ : std_logic;
SIGNAL \myScanner|state.s1~regout\ : std_logic;
SIGNAL \myScanner|state.s2~regout\ : std_logic;
SIGNAL \myScanner|state.s3~regout\ : std_logic;
SIGNAL \myScanner|key[0]~1_combout\ : std_logic;
SIGNAL \myScanner|key[0]~0_combout\ : std_logic;
SIGNAL \myScanner|key[8]~4_combout\ : std_logic;
SIGNAL \myScanner|key[8]~5_combout\ : std_logic;
SIGNAL \myScanner|key[11]~13_combout\ : std_logic;
SIGNAL \myScanner|Mux29~0_combout\ : std_logic;
SIGNAL \myScanner|key[10]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[10]~feeder_combout\ : std_logic;
SIGNAL \myScanner|Decoder0~0_combout\ : std_logic;
SIGNAL \myScanner|key[12]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[15]~2_combout\ : std_logic;
SIGNAL \myScanner|key[15]~3_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[12]~feeder_combout\ : std_logic;
SIGNAL \myScanner|Mux30~0_combout\ : std_logic;
SIGNAL \myScanner|key[9]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[9]~feeder_combout\ : std_logic;
SIGNAL \myCoder|Equal10~1_combout\ : std_logic;
SIGNAL \myCoder|Equal10~2_combout\ : std_logic;
SIGNAL \myCoder|Equal9~0_combout\ : std_logic;
SIGNAL \myCoder|Equal8~0_combout\ : std_logic;
SIGNAL \myScanner|WideOr0~0_combout\ : std_logic;
SIGNAL \myScanner|key[0]~6_combout\ : std_logic;
SIGNAL \myScanner|key[0]~7_combout\ : std_logic;
SIGNAL \myScanner|key[3]~9_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[3]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[8]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[8]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[13]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[13]~feeder_combout\ : std_logic;
SIGNAL \myCoder|Equal9~1_combout\ : std_logic;
SIGNAL \myScanner|key[15]~8_combout\ : std_logic;
SIGNAL \myScanner|key[0]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[0]~feeder_combout\ : std_logic;
SIGNAL \myCoder|Equal2~1_combout\ : std_logic;
SIGNAL \myCoder|Equal2~2_combout\ : std_logic;
SIGNAL \myCoder|Equal3~0_combout\ : std_logic;
SIGNAL \myCoder|Equal0~2_combout\ : std_logic;
SIGNAL \myScanner|key[14]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[14]~feeder_combout\ : std_logic;
SIGNAL \myCoder|Equal0~3_combout\ : std_logic;
SIGNAL \myCoder|WideOr3~0_combout\ : std_logic;
SIGNAL \myScanner|key[5]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[4]~10_combout\ : std_logic;
SIGNAL \myScanner|key[4]~11_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[5]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[2]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[2]~feeder_combout\ : std_logic;
SIGNAL \myScanner|key[6]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[6]~feeder_combout\ : std_logic;
SIGNAL \myCoder|Equal2~0_combout\ : std_logic;
SIGNAL \myScanner|key[7]~12_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[7]~feeder_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~0_combout\ : std_logic;
SIGNAL \myCoder|Equal6~0_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~1_combout\ : std_logic;
SIGNAL \myCoder|Equal12~3_combout\ : std_logic;
SIGNAL \myCoder|WideOr3~combout\ : std_logic;
SIGNAL \myCoder|Equal3~1_combout\ : std_logic;
SIGNAL \myScanner|key[4]~feeder_combout\ : std_logic;
SIGNAL \myDebouncer|key_reg1[4]~feeder_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~3_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~4_combout\ : std_logic;
SIGNAL \myCoder|Equal2~3_combout\ : std_logic;
SIGNAL \myCoder|Equal13~0_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~2_combout\ : std_logic;
SIGNAL \myCoder|WideOr2~5_combout\ : std_logic;
SIGNAL \myCoder|Equal11~0_combout\ : std_logic;
SIGNAL \myCoder|Equal11~1_combout\ : std_logic;
SIGNAL \myCoder|WideOr1~2_combout\ : std_logic;
SIGNAL \myCoder|WideOr1~3_combout\ : std_logic;
SIGNAL \myCoder|WideOr1~0_combout\ : std_logic;
SIGNAL \myCoder|WideOr1~1_combout\ : std_logic;
SIGNAL \myCoder|WideOr1~combout\ : std_logic;
SIGNAL \myCoder|Equal7~0_combout\ : std_logic;
SIGNAL \myCoder|Equal7~1_combout\ : std_logic;
SIGNAL \myCoder|WideOr0~0_combout\ : std_logic;
SIGNAL \myCoder|WideOr0~combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[0]~32_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[0]~33\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[1]~34_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[1]~35\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[2]~36_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[2]~37\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[3]~39\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[4]~40_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[4]~41\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[5]~43\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[6]~45\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[7]~46_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[7]~47\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[8]~49\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[9]~50_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[9]~51\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[10]~53\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[11]~54_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[11]~55\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[12]~57\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[13]~58_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[13]~59\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[14]~60_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[14]~61\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[15]~62_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[15]~63\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[16]~64_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[16]~65\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[17]~66_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[17]~67\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[18]~68_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[6]~44_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[5]~42_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~5_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[10]~52_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~6_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~4_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~7_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[18]~69\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[19]~71\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[20]~72_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[20]~73\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[21]~75\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[22]~77\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[23]~78_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[23]~79\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[24]~81\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[25]~82_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[25]~83\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[26]~85\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[27]~86_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[27]~87\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[28]~88_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[28]~89\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[29]~90_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[29]~91\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[30]~92_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~2_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[19]~70_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[22]~76_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[21]~74_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~0_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[24]~80_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|i[26]~84_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~1_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~3_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|LessThan0~8_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|clk_out~0_combout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|clk_out~regout\ : std_logic;
SIGNAL \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \myScanner|Mux32~0_combout\ : std_logic;
SIGNAL \myScanner|Mux33~0_combout\ : std_logic;
SIGNAL \myScanner|pcheck[2]~1_combout\ : std_logic;
SIGNAL \myScanner|Mux32~1_combout\ : std_logic;
SIGNAL \myScanner|pcheck[3]~0_combout\ : std_logic;
SIGNAL \myScanner|pcheck[0]~3_combout\ : std_logic;
SIGNAL \myScanner|pressed~0_combout\ : std_logic;
SIGNAL \myDebouncer|pressed_reg1~regout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|clk_out~0_combout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|clk_out~regout\ : std_logic;
SIGNAL \myDebouncer|toggle_clk_filter|clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \myDebouncer|Selector0~0_combout\ : std_logic;
SIGNAL \myDebouncer|monostable_state.steady~regout\ : std_logic;
SIGNAL \myDebouncer|monostable_state~7_combout\ : std_logic;
SIGNAL \myDebouncer|monostable_state.temporary~regout\ : std_logic;
SIGNAL \myDebouncer|toggle~regout\ : std_logic;
SIGNAL \col~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \myDebouncer|toggle_clk_filter|i\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \myScanner|pcheck\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \myScanner|key\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \myDebouncer|key_reg1\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \myDebouncer|debounce_clk_filter|i\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\ : std_logic;
SIGNAL \myScanner|ALT_INV_state.s1~regout\ : std_logic;
SIGNAL \myScanner|ALT_INV_state.s2~regout\ : std_logic;
SIGNAL \myScanner|ALT_INV_state.s3~regout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_col <= col;
row <= ww_row;
num <= ww_num;
pressed <= ww_pressed;
toggle <= ww_toggle;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\myDebouncer|debounce_clk_filter|clk_out~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \myDebouncer|debounce_clk_filter|clk_out~regout\);

\myScanner|keyboard_clk_filter|clk_out~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \myScanner|keyboard_clk_filter|clk_out~regout\);

\myDebouncer|toggle_clk_filter|clk_out~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \myDebouncer|toggle_clk_filter|clk_out~regout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\ <= NOT \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\;
\myScanner|ALT_INV_state.s1~regout\ <= NOT \myScanner|state.s1~regout\;
\myScanner|ALT_INV_state.s2~regout\ <= NOT \myScanner|state.s2~regout\;
\myScanner|ALT_INV_state.s3~regout\ <= NOT \myScanner|state.s3~regout\;

-- Location: LCFF_X6_Y11_N13
\myScanner|key[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[1]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s3~regout\,
	ena => \myScanner|key[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(1));

-- Location: LCFF_X5_Y5_N17
\myScanner|pcheck[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|pcheck[1]~2_combout\,
	sdata => \myScanner|pcheck\(1),
	sload => \myScanner|state.s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|pcheck\(1));

-- Location: LCFF_X2_Y3_N7
\myDebouncer|toggle_clk_filter|i[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[19]~70_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(19));

-- Location: LCFF_X2_Y3_N11
\myDebouncer|toggle_clk_filter|i[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[21]~74_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(21));

-- Location: LCFF_X2_Y3_N13
\myDebouncer|toggle_clk_filter|i[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[22]~76_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(22));

-- Location: LCFF_X2_Y3_N17
\myDebouncer|toggle_clk_filter|i[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[24]~80_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(24));

-- Location: LCFF_X2_Y4_N7
\myDebouncer|toggle_clk_filter|i[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[3]~38_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(3));

-- Location: LCFF_X10_Y9_N31
\myDebouncer|debounce_clk_filter|i[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[31]~94_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(31));

-- Location: LCFF_X10_Y10_N17
\myDebouncer|debounce_clk_filter|i[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[8]~48_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(8));

-- Location: LCFF_X10_Y10_N25
\myDebouncer|debounce_clk_filter|i[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[12]~56_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(12));

-- Location: LCCOMB_X5_Y5_N16
\myScanner|pcheck[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|pcheck[1]~2_combout\ = (\myScanner|Mux34~1_combout\ & (\myScanner|Mux34~0_combout\)) # (!\myScanner|Mux34~1_combout\ & ((\myScanner|Mux32~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Mux34~0_combout\,
	datab => \myScanner|Mux34~1_combout\,
	datad => \myScanner|Mux32~3_combout\,
	combout => \myScanner|pcheck[1]~2_combout\);

-- Location: LCCOMB_X2_Y4_N6
\myDebouncer|toggle_clk_filter|i[3]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[3]~38_combout\ = (\myDebouncer|toggle_clk_filter|i\(3) & (!\myDebouncer|toggle_clk_filter|i[2]~37\)) # (!\myDebouncer|toggle_clk_filter|i\(3) & ((\myDebouncer|toggle_clk_filter|i[2]~37\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[3]~39\ = CARRY((!\myDebouncer|toggle_clk_filter|i[2]~37\) # (!\myDebouncer|toggle_clk_filter|i\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(3),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[2]~37\,
	combout => \myDebouncer|toggle_clk_filter|i[3]~38_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[3]~39\);

-- Location: LCCOMB_X2_Y3_N6
\myDebouncer|toggle_clk_filter|i[19]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[19]~70_combout\ = (\myDebouncer|toggle_clk_filter|i\(19) & (!\myDebouncer|toggle_clk_filter|i[18]~69\)) # (!\myDebouncer|toggle_clk_filter|i\(19) & ((\myDebouncer|toggle_clk_filter|i[18]~69\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[19]~71\ = CARRY((!\myDebouncer|toggle_clk_filter|i[18]~69\) # (!\myDebouncer|toggle_clk_filter|i\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(19),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[18]~69\,
	combout => \myDebouncer|toggle_clk_filter|i[19]~70_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[19]~71\);

-- Location: LCCOMB_X2_Y3_N10
\myDebouncer|toggle_clk_filter|i[21]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[21]~74_combout\ = (\myDebouncer|toggle_clk_filter|i\(21) & (!\myDebouncer|toggle_clk_filter|i[20]~73\)) # (!\myDebouncer|toggle_clk_filter|i\(21) & ((\myDebouncer|toggle_clk_filter|i[20]~73\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[21]~75\ = CARRY((!\myDebouncer|toggle_clk_filter|i[20]~73\) # (!\myDebouncer|toggle_clk_filter|i\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(21),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[20]~73\,
	combout => \myDebouncer|toggle_clk_filter|i[21]~74_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[21]~75\);

-- Location: LCCOMB_X2_Y3_N12
\myDebouncer|toggle_clk_filter|i[22]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[22]~76_combout\ = (\myDebouncer|toggle_clk_filter|i\(22) & (\myDebouncer|toggle_clk_filter|i[21]~75\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(22) & (!\myDebouncer|toggle_clk_filter|i[21]~75\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[22]~77\ = CARRY((\myDebouncer|toggle_clk_filter|i\(22) & !\myDebouncer|toggle_clk_filter|i[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(22),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[21]~75\,
	combout => \myDebouncer|toggle_clk_filter|i[22]~76_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[22]~77\);

-- Location: LCCOMB_X2_Y3_N16
\myDebouncer|toggle_clk_filter|i[24]~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[24]~80_combout\ = (\myDebouncer|toggle_clk_filter|i\(24) & (\myDebouncer|toggle_clk_filter|i[23]~79\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(24) & (!\myDebouncer|toggle_clk_filter|i[23]~79\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[24]~81\ = CARRY((\myDebouncer|toggle_clk_filter|i\(24) & !\myDebouncer|toggle_clk_filter|i[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(24),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[23]~79\,
	combout => \myDebouncer|toggle_clk_filter|i[24]~80_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[24]~81\);

-- Location: LCFF_X10_Y10_N7
\myDebouncer|debounce_clk_filter|i[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[3]~38_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(3));

-- Location: LCCOMB_X10_Y10_N6
\myDebouncer|debounce_clk_filter|i[3]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[3]~38_combout\ = (\myDebouncer|debounce_clk_filter|i\(3) & (!\myDebouncer|debounce_clk_filter|i[2]~37\)) # (!\myDebouncer|debounce_clk_filter|i\(3) & ((\myDebouncer|debounce_clk_filter|i[2]~37\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[3]~39\ = CARRY((!\myDebouncer|debounce_clk_filter|i[2]~37\) # (!\myDebouncer|debounce_clk_filter|i\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(3),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[2]~37\,
	combout => \myDebouncer|debounce_clk_filter|i[3]~38_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[3]~39\);

-- Location: LCCOMB_X10_Y10_N16
\myDebouncer|debounce_clk_filter|i[8]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[8]~48_combout\ = (\myDebouncer|debounce_clk_filter|i\(8) & (\myDebouncer|debounce_clk_filter|i[7]~47\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(8) & (!\myDebouncer|debounce_clk_filter|i[7]~47\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[8]~49\ = CARRY((\myDebouncer|debounce_clk_filter|i\(8) & !\myDebouncer|debounce_clk_filter|i[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(8),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[7]~47\,
	combout => \myDebouncer|debounce_clk_filter|i[8]~48_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[8]~49\);

-- Location: LCCOMB_X10_Y10_N24
\myDebouncer|debounce_clk_filter|i[12]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[12]~56_combout\ = (\myDebouncer|debounce_clk_filter|i\(12) & (\myDebouncer|debounce_clk_filter|i[11]~55\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(12) & (!\myDebouncer|debounce_clk_filter|i[11]~55\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[12]~57\ = CARRY((\myDebouncer|debounce_clk_filter|i\(12) & !\myDebouncer|debounce_clk_filter|i[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(12),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[11]~55\,
	combout => \myDebouncer|debounce_clk_filter|i[12]~56_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[12]~57\);

-- Location: LCCOMB_X10_Y9_N28
\myDebouncer|debounce_clk_filter|i[30]~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[30]~92_combout\ = (\myDebouncer|debounce_clk_filter|i\(30) & (\myDebouncer|debounce_clk_filter|i[29]~91\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(30) & (!\myDebouncer|debounce_clk_filter|i[29]~91\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[30]~93\ = CARRY((\myDebouncer|debounce_clk_filter|i\(30) & !\myDebouncer|debounce_clk_filter|i[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(30),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[29]~91\,
	combout => \myDebouncer|debounce_clk_filter|i[30]~92_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[30]~93\);

-- Location: LCCOMB_X10_Y9_N30
\myDebouncer|debounce_clk_filter|i[31]~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[31]~94_combout\ = \myDebouncer|debounce_clk_filter|i[30]~93\ $ (\myDebouncer|debounce_clk_filter|i\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \myDebouncer|debounce_clk_filter|i\(31),
	cin => \myDebouncer|debounce_clk_filter|i[30]~93\,
	combout => \myDebouncer|debounce_clk_filter|i[31]~94_combout\);

-- Location: LCFF_X6_Y11_N23
\myDebouncer|key_reg1[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(1));

-- Location: LCCOMB_X7_Y12_N18
\myCoder|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal0~0_combout\ = (\myDebouncer|key_reg1\(0) & \myDebouncer|key_reg1\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|key_reg1\(0),
	datad => \myDebouncer|key_reg1\(7),
	combout => \myCoder|Equal0~0_combout\);

-- Location: LCCOMB_X7_Y12_N6
\myCoder|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal0~1_combout\ = (\myDebouncer|key_reg1\(3) & (\myCoder|Equal0~0_combout\ & (\myDebouncer|key_reg1\(8) & \myCoder|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(3),
	datab => \myCoder|Equal0~0_combout\,
	datac => \myDebouncer|key_reg1\(8),
	datad => \myCoder|Equal2~0_combout\,
	combout => \myCoder|Equal0~1_combout\);

-- Location: LCCOMB_X7_Y12_N16
\myCoder|Equal10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal10~0_combout\ = (\myDebouncer|key_reg1\(14) & (\myDebouncer|key_reg1\(1) & (\myDebouncer|key_reg1\(15) & \myCoder|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(14),
	datab => \myDebouncer|key_reg1\(1),
	datac => \myDebouncer|key_reg1\(15),
	datad => \myCoder|Equal0~1_combout\,
	combout => \myCoder|Equal10~0_combout\);

-- Location: LCCOMB_X7_Y11_N8
\myCoder|Equal12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal12~2_combout\ = (\myDebouncer|key_reg1\(11) & !\myDebouncer|key_reg1\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|key_reg1\(11),
	datad => \myDebouncer|key_reg1\(13),
	combout => \myCoder|Equal12~2_combout\);

-- Location: LCCOMB_X5_Y12_N14
\myCoder|Equal4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal4~0_combout\ = (\myDebouncer|key_reg1\(4) & (!\myDebouncer|key_reg1\(5) & (\myDebouncer|key_reg1\(2) & \myDebouncer|key_reg1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(4),
	datab => \myDebouncer|key_reg1\(5),
	datac => \myDebouncer|key_reg1\(2),
	datad => \myDebouncer|key_reg1\(6),
	combout => \myCoder|Equal4~0_combout\);

-- Location: LCCOMB_X7_Y12_N12
\myCoder|Equal14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal14~0_combout\ = (\myCoder|Equal0~1_combout\ & (\myCoder|Equal2~3_combout\ & (!\myDebouncer|key_reg1\(15) & \myDebouncer|key_reg1\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal0~1_combout\,
	datab => \myCoder|Equal2~3_combout\,
	datac => \myDebouncer|key_reg1\(15),
	datad => \myDebouncer|key_reg1\(14),
	combout => \myCoder|Equal14~0_combout\);

-- Location: LCCOMB_X1_Y3_N16
\myDebouncer|toggle_clk_filter|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~1_combout\ = (!\myDebouncer|toggle_clk_filter|i\(19) & (!\myDebouncer|toggle_clk_filter|i\(20) & (!\myDebouncer|toggle_clk_filter|i\(21) & !\myDebouncer|toggle_clk_filter|i\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(19),
	datab => \myDebouncer|toggle_clk_filter|i\(20),
	datac => \myDebouncer|toggle_clk_filter|i\(21),
	datad => \myDebouncer|toggle_clk_filter|i\(22),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~1_combout\);

-- Location: LCCOMB_X1_Y3_N20
\myDebouncer|toggle_clk_filter|LessThan0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~8_combout\ = (!\myDebouncer|toggle_clk_filter|i\(13)) # (!\myDebouncer|toggle_clk_filter|i\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|toggle_clk_filter|i\(14),
	datad => \myDebouncer|toggle_clk_filter|i\(13),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~8_combout\);

-- Location: LCCOMB_X5_Y5_N12
\myScanner|Mux32~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux32~2_combout\ = (\myScanner|pcheck\(2) & !\myScanner|state.s3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myScanner|pcheck\(2),
	datad => \myScanner|state.s3~regout\,
	combout => \myScanner|Mux32~2_combout\);

-- Location: LCCOMB_X5_Y5_N28
\myScanner|Mux32~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux32~3_combout\ = (!\myScanner|state.s2~regout\ & (\myScanner|pcheck\(1) & !\myScanner|state.s3~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|pcheck\(1),
	datad => \myScanner|state.s3~regout\,
	combout => \myScanner|Mux32~3_combout\);

-- Location: LCCOMB_X5_Y5_N10
\myScanner|Mux34~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux34~0_combout\ = (\myScanner|state.s2~regout\ & ((\myScanner|Decoder0~0_combout\) # (!\col~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Decoder0~0_combout\,
	datab => \col~combout\(0),
	datad => \myScanner|state.s2~regout\,
	combout => \myScanner|Mux34~0_combout\);

-- Location: LCCOMB_X5_Y5_N0
\myScanner|Mux34~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux34~1_combout\ = (\myScanner|state.s0~regout\ & !\myScanner|state.s1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myScanner|state.s0~regout\,
	datac => \myScanner|state.s1~regout\,
	combout => \myScanner|Mux34~1_combout\);

-- Location: PIN_132,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G6
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X6_Y11_N22
\myDebouncer|key_reg1[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[1]~feeder_combout\ = \myScanner|key\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(1),
	combout => \myDebouncer|key_reg1[1]~feeder_combout\);

-- Location: LCCOMB_X6_Y11_N12
\myScanner|key[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[1]~feeder_combout\ = \myScanner|Mux30~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myScanner|Mux30~0_combout\,
	combout => \myScanner|key[1]~feeder_combout\);

-- Location: LCCOMB_X1_Y3_N24
\myScanner|keyboard_clk_filter|clk_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|keyboard_clk_filter|clk_out~0_combout\ = !\myScanner|keyboard_clk_filter|clk_out~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myScanner|keyboard_clk_filter|clk_out~regout\,
	combout => \myScanner|keyboard_clk_filter|clk_out~0_combout\);

-- Location: LCCOMB_X2_Y4_N0
\myDebouncer|toggle_clk_filter|i[0]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[0]~32_combout\ = \myDebouncer|toggle_clk_filter|i\(0) $ (VCC)
-- \myDebouncer|toggle_clk_filter|i[0]~33\ = CARRY(\myDebouncer|toggle_clk_filter|i\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(0),
	datad => VCC,
	combout => \myDebouncer|toggle_clk_filter|i[0]~32_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[0]~33\);

-- Location: LCFF_X2_Y4_N1
\myDebouncer|toggle_clk_filter|i[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[0]~32_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(0));

-- Location: LCCOMB_X2_Y4_N2
\myDebouncer|toggle_clk_filter|i[1]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[1]~34_combout\ = (\myDebouncer|toggle_clk_filter|i\(1) & (!\myDebouncer|toggle_clk_filter|i[0]~33\)) # (!\myDebouncer|toggle_clk_filter|i\(1) & ((\myDebouncer|toggle_clk_filter|i[0]~33\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[1]~35\ = CARRY((!\myDebouncer|toggle_clk_filter|i[0]~33\) # (!\myDebouncer|toggle_clk_filter|i\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(1),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[0]~33\,
	combout => \myDebouncer|toggle_clk_filter|i[1]~34_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[1]~35\);

-- Location: LCFF_X2_Y4_N3
\myDebouncer|toggle_clk_filter|i[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[1]~34_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(1));

-- Location: LCCOMB_X2_Y4_N4
\myDebouncer|toggle_clk_filter|i[2]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[2]~36_combout\ = (\myDebouncer|toggle_clk_filter|i\(2) & (\myDebouncer|toggle_clk_filter|i[1]~35\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(2) & (!\myDebouncer|toggle_clk_filter|i[1]~35\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[2]~37\ = CARRY((\myDebouncer|toggle_clk_filter|i\(2) & !\myDebouncer|toggle_clk_filter|i[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(2),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[1]~35\,
	combout => \myDebouncer|toggle_clk_filter|i[2]~36_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[2]~37\);

-- Location: LCFF_X2_Y4_N5
\myDebouncer|toggle_clk_filter|i[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[2]~36_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(2));

-- Location: LCCOMB_X2_Y4_N8
\myDebouncer|toggle_clk_filter|i[4]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[4]~40_combout\ = (\myDebouncer|toggle_clk_filter|i\(4) & (\myDebouncer|toggle_clk_filter|i[3]~39\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(4) & (!\myDebouncer|toggle_clk_filter|i[3]~39\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[4]~41\ = CARRY((\myDebouncer|toggle_clk_filter|i\(4) & !\myDebouncer|toggle_clk_filter|i[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(4),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[3]~39\,
	combout => \myDebouncer|toggle_clk_filter|i[4]~40_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[4]~41\);

-- Location: LCFF_X2_Y4_N9
\myDebouncer|toggle_clk_filter|i[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[4]~40_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(4));

-- Location: LCCOMB_X2_Y4_N10
\myDebouncer|toggle_clk_filter|i[5]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[5]~42_combout\ = (\myDebouncer|toggle_clk_filter|i\(5) & (!\myDebouncer|toggle_clk_filter|i[4]~41\)) # (!\myDebouncer|toggle_clk_filter|i\(5) & ((\myDebouncer|toggle_clk_filter|i[4]~41\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[5]~43\ = CARRY((!\myDebouncer|toggle_clk_filter|i[4]~41\) # (!\myDebouncer|toggle_clk_filter|i\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(5),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[4]~41\,
	combout => \myDebouncer|toggle_clk_filter|i[5]~42_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[5]~43\);

-- Location: LCCOMB_X2_Y4_N12
\myDebouncer|toggle_clk_filter|i[6]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[6]~44_combout\ = (\myDebouncer|toggle_clk_filter|i\(6) & (\myDebouncer|toggle_clk_filter|i[5]~43\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(6) & (!\myDebouncer|toggle_clk_filter|i[5]~43\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[6]~45\ = CARRY((\myDebouncer|toggle_clk_filter|i\(6) & !\myDebouncer|toggle_clk_filter|i[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(6),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[5]~43\,
	combout => \myDebouncer|toggle_clk_filter|i[6]~44_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[6]~45\);

-- Location: LCCOMB_X2_Y4_N14
\myDebouncer|toggle_clk_filter|i[7]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[7]~46_combout\ = (\myDebouncer|toggle_clk_filter|i\(7) & (!\myDebouncer|toggle_clk_filter|i[6]~45\)) # (!\myDebouncer|toggle_clk_filter|i\(7) & ((\myDebouncer|toggle_clk_filter|i[6]~45\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[7]~47\ = CARRY((!\myDebouncer|toggle_clk_filter|i[6]~45\) # (!\myDebouncer|toggle_clk_filter|i\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(7),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[6]~45\,
	combout => \myDebouncer|toggle_clk_filter|i[7]~46_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[7]~47\);

-- Location: LCFF_X2_Y4_N15
\myDebouncer|toggle_clk_filter|i[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[7]~46_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(7));

-- Location: LCCOMB_X2_Y4_N16
\myDebouncer|toggle_clk_filter|i[8]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[8]~48_combout\ = (\myDebouncer|toggle_clk_filter|i\(8) & (\myDebouncer|toggle_clk_filter|i[7]~47\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(8) & (!\myDebouncer|toggle_clk_filter|i[7]~47\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[8]~49\ = CARRY((\myDebouncer|toggle_clk_filter|i\(8) & !\myDebouncer|toggle_clk_filter|i[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(8),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[7]~47\,
	combout => \myDebouncer|toggle_clk_filter|i[8]~48_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[8]~49\);

-- Location: LCCOMB_X2_Y4_N18
\myDebouncer|toggle_clk_filter|i[9]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[9]~50_combout\ = (\myDebouncer|toggle_clk_filter|i\(9) & (!\myDebouncer|toggle_clk_filter|i[8]~49\)) # (!\myDebouncer|toggle_clk_filter|i\(9) & ((\myDebouncer|toggle_clk_filter|i[8]~49\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[9]~51\ = CARRY((!\myDebouncer|toggle_clk_filter|i[8]~49\) # (!\myDebouncer|toggle_clk_filter|i\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(9),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[8]~49\,
	combout => \myDebouncer|toggle_clk_filter|i[9]~50_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[9]~51\);

-- Location: LCFF_X2_Y4_N19
\myDebouncer|toggle_clk_filter|i[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[9]~50_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(9));

-- Location: LCCOMB_X2_Y4_N20
\myDebouncer|toggle_clk_filter|i[10]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[10]~52_combout\ = (\myDebouncer|toggle_clk_filter|i\(10) & (\myDebouncer|toggle_clk_filter|i[9]~51\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(10) & (!\myDebouncer|toggle_clk_filter|i[9]~51\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[10]~53\ = CARRY((\myDebouncer|toggle_clk_filter|i\(10) & !\myDebouncer|toggle_clk_filter|i[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(10),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[9]~51\,
	combout => \myDebouncer|toggle_clk_filter|i[10]~52_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[10]~53\);

-- Location: LCCOMB_X2_Y4_N22
\myDebouncer|toggle_clk_filter|i[11]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[11]~54_combout\ = (\myDebouncer|toggle_clk_filter|i\(11) & (!\myDebouncer|toggle_clk_filter|i[10]~53\)) # (!\myDebouncer|toggle_clk_filter|i\(11) & ((\myDebouncer|toggle_clk_filter|i[10]~53\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[11]~55\ = CARRY((!\myDebouncer|toggle_clk_filter|i[10]~53\) # (!\myDebouncer|toggle_clk_filter|i\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(11),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[10]~53\,
	combout => \myDebouncer|toggle_clk_filter|i[11]~54_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[11]~55\);

-- Location: LCFF_X2_Y4_N23
\myDebouncer|toggle_clk_filter|i[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[11]~54_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(11));

-- Location: LCCOMB_X2_Y4_N24
\myDebouncer|toggle_clk_filter|i[12]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[12]~56_combout\ = (\myDebouncer|toggle_clk_filter|i\(12) & (\myDebouncer|toggle_clk_filter|i[11]~55\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(12) & (!\myDebouncer|toggle_clk_filter|i[11]~55\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[12]~57\ = CARRY((\myDebouncer|toggle_clk_filter|i\(12) & !\myDebouncer|toggle_clk_filter|i[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(12),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[11]~55\,
	combout => \myDebouncer|toggle_clk_filter|i[12]~56_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[12]~57\);

-- Location: LCCOMB_X2_Y4_N26
\myDebouncer|toggle_clk_filter|i[13]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[13]~58_combout\ = (\myDebouncer|toggle_clk_filter|i\(13) & (!\myDebouncer|toggle_clk_filter|i[12]~57\)) # (!\myDebouncer|toggle_clk_filter|i\(13) & ((\myDebouncer|toggle_clk_filter|i[12]~57\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[13]~59\ = CARRY((!\myDebouncer|toggle_clk_filter|i[12]~57\) # (!\myDebouncer|toggle_clk_filter|i\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(13),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[12]~57\,
	combout => \myDebouncer|toggle_clk_filter|i[13]~58_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[13]~59\);

-- Location: LCFF_X1_Y3_N31
\myDebouncer|toggle_clk_filter|i[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \myDebouncer|toggle_clk_filter|i[13]~58_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(13));

-- Location: LCCOMB_X2_Y4_N28
\myDebouncer|toggle_clk_filter|i[14]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[14]~60_combout\ = (\myDebouncer|toggle_clk_filter|i\(14) & (\myDebouncer|toggle_clk_filter|i[13]~59\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(14) & (!\myDebouncer|toggle_clk_filter|i[13]~59\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[14]~61\ = CARRY((\myDebouncer|toggle_clk_filter|i\(14) & !\myDebouncer|toggle_clk_filter|i[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(14),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[13]~59\,
	combout => \myDebouncer|toggle_clk_filter|i[14]~60_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[14]~61\);

-- Location: LCFF_X2_Y4_N29
\myDebouncer|toggle_clk_filter|i[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[14]~60_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(14));

-- Location: LCCOMB_X2_Y4_N30
\myDebouncer|toggle_clk_filter|i[15]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[15]~62_combout\ = (\myDebouncer|toggle_clk_filter|i\(15) & (!\myDebouncer|toggle_clk_filter|i[14]~61\)) # (!\myDebouncer|toggle_clk_filter|i\(15) & ((\myDebouncer|toggle_clk_filter|i[14]~61\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[15]~63\ = CARRY((!\myDebouncer|toggle_clk_filter|i[14]~61\) # (!\myDebouncer|toggle_clk_filter|i\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(15),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[14]~61\,
	combout => \myDebouncer|toggle_clk_filter|i[15]~62_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[15]~63\);

-- Location: LCFF_X1_Y3_N3
\myDebouncer|toggle_clk_filter|i[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \myDebouncer|toggle_clk_filter|i[15]~62_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(15));

-- Location: LCCOMB_X2_Y3_N0
\myDebouncer|toggle_clk_filter|i[16]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[16]~64_combout\ = (\myDebouncer|toggle_clk_filter|i\(16) & (\myDebouncer|toggle_clk_filter|i[15]~63\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(16) & (!\myDebouncer|toggle_clk_filter|i[15]~63\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[16]~65\ = CARRY((\myDebouncer|toggle_clk_filter|i\(16) & !\myDebouncer|toggle_clk_filter|i[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(16),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[15]~63\,
	combout => \myDebouncer|toggle_clk_filter|i[16]~64_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[16]~65\);

-- Location: LCFF_X2_Y3_N1
\myDebouncer|toggle_clk_filter|i[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[16]~64_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(16));

-- Location: LCCOMB_X2_Y3_N2
\myDebouncer|toggle_clk_filter|i[17]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[17]~66_combout\ = (\myDebouncer|toggle_clk_filter|i\(17) & (!\myDebouncer|toggle_clk_filter|i[16]~65\)) # (!\myDebouncer|toggle_clk_filter|i\(17) & ((\myDebouncer|toggle_clk_filter|i[16]~65\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[17]~67\ = CARRY((!\myDebouncer|toggle_clk_filter|i[16]~65\) # (!\myDebouncer|toggle_clk_filter|i\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(17),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[16]~65\,
	combout => \myDebouncer|toggle_clk_filter|i[17]~66_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[17]~67\);

-- Location: LCFF_X2_Y3_N3
\myDebouncer|toggle_clk_filter|i[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[17]~66_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(17));

-- Location: LCCOMB_X2_Y3_N4
\myDebouncer|toggle_clk_filter|i[18]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[18]~68_combout\ = (\myDebouncer|toggle_clk_filter|i\(18) & (\myDebouncer|toggle_clk_filter|i[17]~67\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(18) & (!\myDebouncer|toggle_clk_filter|i[17]~67\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[18]~69\ = CARRY((\myDebouncer|toggle_clk_filter|i\(18) & !\myDebouncer|toggle_clk_filter|i[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(18),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[17]~67\,
	combout => \myDebouncer|toggle_clk_filter|i[18]~68_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[18]~69\);

-- Location: LCFF_X2_Y3_N5
\myDebouncer|toggle_clk_filter|i[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[18]~68_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(18));

-- Location: LCCOMB_X2_Y3_N8
\myDebouncer|toggle_clk_filter|i[20]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[20]~72_combout\ = (\myDebouncer|toggle_clk_filter|i\(20) & (\myDebouncer|toggle_clk_filter|i[19]~71\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(20) & (!\myDebouncer|toggle_clk_filter|i[19]~71\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[20]~73\ = CARRY((\myDebouncer|toggle_clk_filter|i\(20) & !\myDebouncer|toggle_clk_filter|i[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(20),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[19]~71\,
	combout => \myDebouncer|toggle_clk_filter|i[20]~72_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[20]~73\);

-- Location: LCFF_X2_Y3_N9
\myDebouncer|toggle_clk_filter|i[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[20]~72_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(20));

-- Location: LCCOMB_X2_Y3_N14
\myDebouncer|toggle_clk_filter|i[23]~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[23]~78_combout\ = (\myDebouncer|toggle_clk_filter|i\(23) & (!\myDebouncer|toggle_clk_filter|i[22]~77\)) # (!\myDebouncer|toggle_clk_filter|i\(23) & ((\myDebouncer|toggle_clk_filter|i[22]~77\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[23]~79\ = CARRY((!\myDebouncer|toggle_clk_filter|i[22]~77\) # (!\myDebouncer|toggle_clk_filter|i\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(23),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[22]~77\,
	combout => \myDebouncer|toggle_clk_filter|i[23]~78_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[23]~79\);

-- Location: LCFF_X2_Y3_N15
\myDebouncer|toggle_clk_filter|i[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[23]~78_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(23));

-- Location: LCCOMB_X2_Y3_N18
\myDebouncer|toggle_clk_filter|i[25]~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[25]~82_combout\ = (\myDebouncer|toggle_clk_filter|i\(25) & (!\myDebouncer|toggle_clk_filter|i[24]~81\)) # (!\myDebouncer|toggle_clk_filter|i\(25) & ((\myDebouncer|toggle_clk_filter|i[24]~81\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[25]~83\ = CARRY((!\myDebouncer|toggle_clk_filter|i[24]~81\) # (!\myDebouncer|toggle_clk_filter|i\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(25),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[24]~81\,
	combout => \myDebouncer|toggle_clk_filter|i[25]~82_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[25]~83\);

-- Location: LCFF_X2_Y3_N19
\myDebouncer|toggle_clk_filter|i[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[25]~82_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(25));

-- Location: LCCOMB_X2_Y3_N20
\myDebouncer|toggle_clk_filter|i[26]~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[26]~84_combout\ = (\myDebouncer|toggle_clk_filter|i\(26) & (\myDebouncer|toggle_clk_filter|i[25]~83\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(26) & (!\myDebouncer|toggle_clk_filter|i[25]~83\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[26]~85\ = CARRY((\myDebouncer|toggle_clk_filter|i\(26) & !\myDebouncer|toggle_clk_filter|i[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(26),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[25]~83\,
	combout => \myDebouncer|toggle_clk_filter|i[26]~84_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[26]~85\);

-- Location: LCCOMB_X2_Y3_N22
\myDebouncer|toggle_clk_filter|i[27]~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[27]~86_combout\ = (\myDebouncer|toggle_clk_filter|i\(27) & (!\myDebouncer|toggle_clk_filter|i[26]~85\)) # (!\myDebouncer|toggle_clk_filter|i\(27) & ((\myDebouncer|toggle_clk_filter|i[26]~85\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[27]~87\ = CARRY((!\myDebouncer|toggle_clk_filter|i[26]~85\) # (!\myDebouncer|toggle_clk_filter|i\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(27),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[26]~85\,
	combout => \myDebouncer|toggle_clk_filter|i[27]~86_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[27]~87\);

-- Location: LCFF_X2_Y3_N23
\myDebouncer|toggle_clk_filter|i[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[27]~86_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(27));

-- Location: LCCOMB_X2_Y3_N24
\myDebouncer|toggle_clk_filter|i[28]~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[28]~88_combout\ = (\myDebouncer|toggle_clk_filter|i\(28) & (\myDebouncer|toggle_clk_filter|i[27]~87\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(28) & (!\myDebouncer|toggle_clk_filter|i[27]~87\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[28]~89\ = CARRY((\myDebouncer|toggle_clk_filter|i\(28) & !\myDebouncer|toggle_clk_filter|i[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(28),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[27]~87\,
	combout => \myDebouncer|toggle_clk_filter|i[28]~88_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[28]~89\);

-- Location: LCCOMB_X2_Y3_N26
\myDebouncer|toggle_clk_filter|i[29]~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[29]~90_combout\ = (\myDebouncer|toggle_clk_filter|i\(29) & (!\myDebouncer|toggle_clk_filter|i[28]~89\)) # (!\myDebouncer|toggle_clk_filter|i\(29) & ((\myDebouncer|toggle_clk_filter|i[28]~89\) # (GND)))
-- \myDebouncer|toggle_clk_filter|i[29]~91\ = CARRY((!\myDebouncer|toggle_clk_filter|i[28]~89\) # (!\myDebouncer|toggle_clk_filter|i\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(29),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[28]~89\,
	combout => \myDebouncer|toggle_clk_filter|i[29]~90_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[29]~91\);

-- Location: LCFF_X2_Y3_N27
\myDebouncer|toggle_clk_filter|i[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[29]~90_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(29));

-- Location: LCCOMB_X2_Y3_N28
\myDebouncer|toggle_clk_filter|i[30]~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[30]~92_combout\ = (\myDebouncer|toggle_clk_filter|i\(30) & (\myDebouncer|toggle_clk_filter|i[29]~91\ $ (GND))) # (!\myDebouncer|toggle_clk_filter|i\(30) & (!\myDebouncer|toggle_clk_filter|i[29]~91\ & VCC))
-- \myDebouncer|toggle_clk_filter|i[30]~93\ = CARRY((\myDebouncer|toggle_clk_filter|i\(30) & !\myDebouncer|toggle_clk_filter|i[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|toggle_clk_filter|i\(30),
	datad => VCC,
	cin => \myDebouncer|toggle_clk_filter|i[29]~91\,
	combout => \myDebouncer|toggle_clk_filter|i[30]~92_combout\,
	cout => \myDebouncer|toggle_clk_filter|i[30]~93\);

-- Location: LCFF_X2_Y3_N29
\myDebouncer|toggle_clk_filter|i[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[30]~92_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(30));

-- Location: LCCOMB_X2_Y3_N30
\myDebouncer|toggle_clk_filter|i[31]~94\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|i[31]~94_combout\ = \myDebouncer|toggle_clk_filter|i[30]~93\ $ (\myDebouncer|toggle_clk_filter|i\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \myDebouncer|toggle_clk_filter|i\(31),
	cin => \myDebouncer|toggle_clk_filter|i[30]~93\,
	combout => \myDebouncer|toggle_clk_filter|i[31]~94_combout\);

-- Location: LCFF_X2_Y3_N31
\myDebouncer|toggle_clk_filter|i[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[31]~94_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(31));

-- Location: LCFF_X2_Y3_N21
\myDebouncer|toggle_clk_filter|i[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[26]~84_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(26));

-- Location: LCCOMB_X1_Y3_N22
\myDebouncer|toggle_clk_filter|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~2_combout\ = (!\myDebouncer|toggle_clk_filter|i\(24) & (!\myDebouncer|toggle_clk_filter|i\(25) & (!\myDebouncer|toggle_clk_filter|i\(23) & !\myDebouncer|toggle_clk_filter|i\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(24),
	datab => \myDebouncer|toggle_clk_filter|i\(25),
	datac => \myDebouncer|toggle_clk_filter|i\(23),
	datad => \myDebouncer|toggle_clk_filter|i\(26),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~2_combout\);

-- Location: LCFF_X2_Y3_N25
\myDebouncer|toggle_clk_filter|i[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[28]~88_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(28));

-- Location: LCCOMB_X1_Y3_N14
\myDebouncer|toggle_clk_filter|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~3_combout\ = (!\myDebouncer|toggle_clk_filter|i\(29) & (!\myDebouncer|toggle_clk_filter|i\(27) & (!\myDebouncer|toggle_clk_filter|i\(28) & !\myDebouncer|toggle_clk_filter|i\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(29),
	datab => \myDebouncer|toggle_clk_filter|i\(27),
	datac => \myDebouncer|toggle_clk_filter|i\(28),
	datad => \myDebouncer|toggle_clk_filter|i\(30),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~3_combout\);

-- Location: LCCOMB_X1_Y3_N26
\myDebouncer|toggle_clk_filter|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~0_combout\ = (!\myDebouncer|toggle_clk_filter|i\(17) & (!\myDebouncer|toggle_clk_filter|i\(15) & (!\myDebouncer|toggle_clk_filter|i\(16) & !\myDebouncer|toggle_clk_filter|i\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(17),
	datab => \myDebouncer|toggle_clk_filter|i\(15),
	datac => \myDebouncer|toggle_clk_filter|i\(16),
	datad => \myDebouncer|toggle_clk_filter|i\(18),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~0_combout\);

-- Location: LCCOMB_X1_Y3_N8
\myDebouncer|toggle_clk_filter|LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~4_combout\ = (\myDebouncer|toggle_clk_filter|LessThan0~1_combout\ & (\myDebouncer|toggle_clk_filter|LessThan0~2_combout\ & (\myDebouncer|toggle_clk_filter|LessThan0~3_combout\ & 
-- \myDebouncer|toggle_clk_filter|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|LessThan0~1_combout\,
	datab => \myDebouncer|toggle_clk_filter|LessThan0~2_combout\,
	datac => \myDebouncer|toggle_clk_filter|LessThan0~3_combout\,
	datad => \myDebouncer|toggle_clk_filter|LessThan0~0_combout\,
	combout => \myDebouncer|toggle_clk_filter|LessThan0~4_combout\);

-- Location: LCFF_X2_Y4_N17
\myDebouncer|toggle_clk_filter|i[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[8]~48_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(8));

-- Location: LCFF_X2_Y4_N21
\myDebouncer|toggle_clk_filter|i[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[10]~52_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(10));

-- Location: LCFF_X2_Y4_N25
\myDebouncer|toggle_clk_filter|i[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[12]~56_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(12));

-- Location: LCCOMB_X1_Y3_N4
\myDebouncer|toggle_clk_filter|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~5_combout\ = (!\myDebouncer|toggle_clk_filter|i\(9) & (!\myDebouncer|toggle_clk_filter|i\(10) & (!\myDebouncer|toggle_clk_filter|i\(12) & !\myDebouncer|toggle_clk_filter|i\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(9),
	datab => \myDebouncer|toggle_clk_filter|i\(10),
	datac => \myDebouncer|toggle_clk_filter|i\(12),
	datad => \myDebouncer|toggle_clk_filter|i\(11),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~5_combout\);

-- Location: LCFF_X2_Y4_N13
\myDebouncer|toggle_clk_filter|i[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[6]~44_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(6));

-- Location: LCFF_X2_Y4_N11
\myDebouncer|toggle_clk_filter|i[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|i[5]~42_combout\,
	sclr => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|i\(5));

-- Location: LCCOMB_X1_Y3_N28
\myDebouncer|toggle_clk_filter|LessThan0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~6_combout\ = (!\myDebouncer|toggle_clk_filter|i\(6) & (((!\myDebouncer|toggle_clk_filter|i\(3) & !\myDebouncer|toggle_clk_filter|i\(4))) # (!\myDebouncer|toggle_clk_filter|i\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(3),
	datab => \myDebouncer|toggle_clk_filter|i\(6),
	datac => \myDebouncer|toggle_clk_filter|i\(4),
	datad => \myDebouncer|toggle_clk_filter|i\(5),
	combout => \myDebouncer|toggle_clk_filter|LessThan0~6_combout\);

-- Location: LCCOMB_X1_Y3_N18
\myDebouncer|toggle_clk_filter|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~7_combout\ = (\myDebouncer|toggle_clk_filter|LessThan0~5_combout\ & (((\myDebouncer|toggle_clk_filter|LessThan0~6_combout\) # (!\myDebouncer|toggle_clk_filter|i\(8))) # (!\myDebouncer|toggle_clk_filter|i\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|i\(7),
	datab => \myDebouncer|toggle_clk_filter|i\(8),
	datac => \myDebouncer|toggle_clk_filter|LessThan0~5_combout\,
	datad => \myDebouncer|toggle_clk_filter|LessThan0~6_combout\,
	combout => \myDebouncer|toggle_clk_filter|LessThan0~7_combout\);

-- Location: LCCOMB_X1_Y3_N0
\myDebouncer|toggle_clk_filter|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|LessThan0~9_combout\ = (\myDebouncer|toggle_clk_filter|i\(31)) # (((!\myDebouncer|toggle_clk_filter|LessThan0~8_combout\ & !\myDebouncer|toggle_clk_filter|LessThan0~7_combout\)) # 
-- (!\myDebouncer|toggle_clk_filter|LessThan0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|toggle_clk_filter|LessThan0~8_combout\,
	datab => \myDebouncer|toggle_clk_filter|i\(31),
	datac => \myDebouncer|toggle_clk_filter|LessThan0~4_combout\,
	datad => \myDebouncer|toggle_clk_filter|LessThan0~7_combout\,
	combout => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\);

-- Location: LCFF_X1_Y3_N25
\myScanner|keyboard_clk_filter|clk_out\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myScanner|keyboard_clk_filter|clk_out~0_combout\,
	ena => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|keyboard_clk_filter|clk_out~regout\);

-- Location: CLKCTRL_G2
\myScanner|keyboard_clk_filter|clk_out~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\);

-- Location: LCCOMB_X5_Y11_N12
\myScanner|state.s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|state.s0~0_combout\ = !\myScanner|state.s3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|state.s3~regout\,
	combout => \myScanner|state.s0~0_combout\);

-- Location: LCFF_X5_Y11_N13
\myScanner|state.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myScanner|state.s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|state.s0~regout\);

-- Location: LCCOMB_X5_Y11_N16
\myScanner|state.s1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|state.s1~0_combout\ = !\myScanner|state.s0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myScanner|state.s0~regout\,
	combout => \myScanner|state.s1~0_combout\);

-- Location: LCFF_X5_Y11_N17
\myScanner|state.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myScanner|state.s1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|state.s1~regout\);

-- Location: LCFF_X5_Y11_N1
\myScanner|state.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\,
	sdata => \myScanner|state.s1~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|state.s2~regout\);

-- Location: LCFF_X5_Y11_N9
\myScanner|state.s3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|clk_out~clkctrl_outclk\,
	sdata => \myScanner|state.s2~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|state.s3~regout\);

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\col[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_col(3),
	combout => \col~combout\(3));

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\col[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_col(2),
	combout => \col~combout\(2));

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\col[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_col(1),
	combout => \col~combout\(1));

-- Location: LCCOMB_X5_Y11_N4
\myScanner|key[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[0]~1_combout\ = (\col~combout\(0) & ((\col~combout\(2) & (\col~combout\(3) $ (!\col~combout\(1)))) # (!\col~combout\(2) & ((!\col~combout\(1)) # (!\col~combout\(3)))))) # (!\col~combout\(0) & (((!\col~combout\(1)) # (!\col~combout\(3))) # 
-- (!\col~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(0),
	datab => \col~combout\(2),
	datac => \col~combout\(3),
	datad => \col~combout\(1),
	combout => \myScanner|key[0]~1_combout\);

-- Location: LCCOMB_X5_Y11_N2
\myScanner|key[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[0]~0_combout\ = (!\myScanner|state.s1~regout\ & (!\myScanner|state.s2~regout\ & (!\myScanner|state.s3~regout\ & \myScanner|state.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s1~regout\,
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|state.s3~regout\,
	datad => \myScanner|state.s0~regout\,
	combout => \myScanner|key[0]~0_combout\);

-- Location: LCCOMB_X5_Y11_N26
\myScanner|key[8]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[8]~4_combout\ = (\myScanner|key[0]~0_combout\) # ((\myScanner|state.s1~regout\ & (\myScanner|key[0]~1_combout\ & \myScanner|state.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s1~regout\,
	datab => \myScanner|key[0]~1_combout\,
	datac => \myScanner|state.s0~regout\,
	datad => \myScanner|key[0]~0_combout\,
	combout => \myScanner|key[8]~4_combout\);

-- Location: LCCOMB_X5_Y11_N18
\myScanner|key[8]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[8]~5_combout\ = (!\myScanner|key[8]~4_combout\ & ((\myScanner|WideOr0~0_combout\) # ((\myScanner|state.s1~regout\ & \myScanner|state.s0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|WideOr0~0_combout\,
	datab => \myScanner|state.s1~regout\,
	datac => \myScanner|state.s0~regout\,
	datad => \myScanner|key[8]~4_combout\,
	combout => \myScanner|key[8]~5_combout\);

-- Location: LCCOMB_X7_Y11_N14
\myScanner|key[11]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[11]~13_combout\ = (\myScanner|key[8]~5_combout\ & (((\col~combout\(3))) # (!\myScanner|state.s1~regout\))) # (!\myScanner|key[8]~5_combout\ & (((\myScanner|key\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s1~regout\,
	datab => \col~combout\(3),
	datac => \myScanner|key\(11),
	datad => \myScanner|key[8]~5_combout\,
	combout => \myScanner|key[11]~13_combout\);

-- Location: LCFF_X7_Y11_N15
\myScanner|key[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[11]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(11));

-- Location: LCFF_X7_Y11_N9
\myDebouncer|key_reg1[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	sdata => \myScanner|key\(11),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(11));

-- Location: LCCOMB_X8_Y11_N6
\myScanner|Mux29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux29~0_combout\ = (\col~combout\(2)) # (!\col~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \col~combout\(3),
	datad => \col~combout\(2),
	combout => \myScanner|Mux29~0_combout\);

-- Location: LCCOMB_X8_Y11_N2
\myScanner|key[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[10]~feeder_combout\ = \myScanner|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Mux29~0_combout\,
	combout => \myScanner|key[10]~feeder_combout\);

-- Location: LCFF_X8_Y11_N3
\myScanner|key[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[10]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s1~regout\,
	ena => \myScanner|key[8]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(10));

-- Location: LCCOMB_X8_Y11_N8
\myDebouncer|key_reg1[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[10]~feeder_combout\ = \myScanner|key\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(10),
	combout => \myDebouncer|key_reg1[10]~feeder_combout\);

-- Location: LCFF_X8_Y11_N9
\myDebouncer|key_reg1[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(10));

-- Location: LCCOMB_X8_Y11_N16
\myScanner|Decoder0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Decoder0~0_combout\ = ((!\col~combout\(1)) # (!\col~combout\(3))) # (!\col~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \col~combout\(2),
	datac => \col~combout\(3),
	datad => \col~combout\(1),
	combout => \myScanner|Decoder0~0_combout\);

-- Location: LCCOMB_X6_Y12_N28
\myScanner|key[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[12]~feeder_combout\ = \myScanner|Decoder0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Decoder0~0_combout\,
	combout => \myScanner|key[12]~feeder_combout\);

-- Location: LCCOMB_X5_Y11_N0
\myScanner|key[15]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[15]~2_combout\ = (!\myScanner|state.s1~regout\ & !\myScanner|state.s0~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myScanner|state.s1~regout\,
	datad => \myScanner|state.s0~regout\,
	combout => \myScanner|key[15]~2_combout\);

-- Location: LCCOMB_X6_Y12_N24
\myScanner|key[15]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[15]~3_combout\ = (!\myScanner|key[0]~0_combout\ & ((\myScanner|key[15]~2_combout\ & ((!\myScanner|key[0]~1_combout\))) # (!\myScanner|key[15]~2_combout\ & (\myScanner|WideOr0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|WideOr0~0_combout\,
	datab => \myScanner|key[0]~1_combout\,
	datac => \myScanner|key[15]~2_combout\,
	datad => \myScanner|key[0]~0_combout\,
	combout => \myScanner|key[15]~3_combout\);

-- Location: LCFF_X6_Y12_N29
\myScanner|key[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[12]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|state.s0~regout\,
	ena => \myScanner|key[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(12));

-- Location: LCCOMB_X6_Y12_N18
\myDebouncer|key_reg1[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[12]~feeder_combout\ = \myScanner|key\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(12),
	combout => \myDebouncer|key_reg1[12]~feeder_combout\);

-- Location: LCFF_X6_Y12_N19
\myDebouncer|key_reg1[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(12));

-- Location: LCCOMB_X5_Y11_N8
\myScanner|Mux30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux30~0_combout\ = ((\col~combout\(1)) # (!\col~combout\(2))) # (!\col~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(3),
	datab => \col~combout\(2),
	datad => \col~combout\(1),
	combout => \myScanner|Mux30~0_combout\);

-- Location: LCCOMB_X8_Y11_N28
\myScanner|key[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[9]~feeder_combout\ = \myScanner|Mux30~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Mux30~0_combout\,
	combout => \myScanner|key[9]~feeder_combout\);

-- Location: LCFF_X8_Y11_N29
\myScanner|key[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[9]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s1~regout\,
	ena => \myScanner|key[8]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(9));

-- Location: LCCOMB_X8_Y11_N30
\myDebouncer|key_reg1[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[9]~feeder_combout\ = \myScanner|key\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(9),
	combout => \myDebouncer|key_reg1[9]~feeder_combout\);

-- Location: LCFF_X8_Y11_N31
\myDebouncer|key_reg1[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(9));

-- Location: LCCOMB_X7_Y11_N22
\myCoder|Equal10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal10~1_combout\ = (\myCoder|Equal10~0_combout\ & (\myDebouncer|key_reg1\(10) & (\myDebouncer|key_reg1\(12) & \myDebouncer|key_reg1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~0_combout\,
	datab => \myDebouncer|key_reg1\(10),
	datac => \myDebouncer|key_reg1\(12),
	datad => \myDebouncer|key_reg1\(9),
	combout => \myCoder|Equal10~1_combout\);

-- Location: LCCOMB_X7_Y11_N16
\myCoder|Equal10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal10~2_combout\ = (\myDebouncer|key_reg1\(13) & (!\myDebouncer|key_reg1\(11) & \myCoder|Equal10~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(13),
	datac => \myDebouncer|key_reg1\(11),
	datad => \myCoder|Equal10~1_combout\,
	combout => \myCoder|Equal10~2_combout\);

-- Location: LCCOMB_X7_Y11_N30
\myCoder|Equal9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal9~0_combout\ = (\myDebouncer|key_reg1\(13) & (\myDebouncer|key_reg1\(11) & \myDebouncer|key_reg1\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(13),
	datab => \myDebouncer|key_reg1\(11),
	datac => \myDebouncer|key_reg1\(12),
	combout => \myCoder|Equal9~0_combout\);

-- Location: LCCOMB_X7_Y11_N4
\myCoder|Equal8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal8~0_combout\ = (\myCoder|Equal10~0_combout\ & (\myCoder|Equal9~0_combout\ & (\myDebouncer|key_reg1\(10) & !\myDebouncer|key_reg1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~0_combout\,
	datab => \myCoder|Equal9~0_combout\,
	datac => \myDebouncer|key_reg1\(10),
	datad => \myDebouncer|key_reg1\(9),
	combout => \myCoder|Equal8~0_combout\);

-- Location: LCCOMB_X5_Y11_N24
\myScanner|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|WideOr0~0_combout\ = (\col~combout\(0) & ((\col~combout\(2) & (\col~combout\(3) $ (\col~combout\(1)))) # (!\col~combout\(2) & (\col~combout\(3) & \col~combout\(1))))) # (!\col~combout\(0) & (\col~combout\(2) & (\col~combout\(3) & 
-- \col~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(0),
	datab => \col~combout\(2),
	datac => \col~combout\(3),
	datad => \col~combout\(1),
	combout => \myScanner|WideOr0~0_combout\);

-- Location: LCCOMB_X5_Y11_N28
\myScanner|key[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[0]~6_combout\ = (\myScanner|key[0]~0_combout\) # ((\myScanner|key[0]~1_combout\ & (\myScanner|state.s3~regout\ & \myScanner|state.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|key[0]~1_combout\,
	datab => \myScanner|state.s3~regout\,
	datac => \myScanner|state.s0~regout\,
	datad => \myScanner|key[0]~0_combout\,
	combout => \myScanner|key[0]~6_combout\);

-- Location: LCCOMB_X5_Y11_N30
\myScanner|key[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[0]~7_combout\ = (!\myScanner|key[0]~6_combout\ & ((\myScanner|WideOr0~0_combout\) # ((\myScanner|state.s0~regout\ & \myScanner|state.s3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s0~regout\,
	datab => \myScanner|WideOr0~0_combout\,
	datac => \myScanner|state.s3~regout\,
	datad => \myScanner|key[0]~6_combout\,
	combout => \myScanner|key[0]~7_combout\);

-- Location: LCCOMB_X5_Y11_N22
\myScanner|key[3]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[3]~9_combout\ = (\myScanner|key[0]~7_combout\ & ((\col~combout\(3)) # ((!\myScanner|state.s3~regout\)))) # (!\myScanner|key[0]~7_combout\ & (((\myScanner|key\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(3),
	datab => \myScanner|state.s3~regout\,
	datac => \myScanner|key\(3),
	datad => \myScanner|key[0]~7_combout\,
	combout => \myScanner|key[3]~9_combout\);

-- Location: LCFF_X5_Y11_N23
\myScanner|key[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(3));

-- Location: LCCOMB_X6_Y11_N0
\myDebouncer|key_reg1[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[3]~feeder_combout\ = \myScanner|key\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(3),
	combout => \myDebouncer|key_reg1[3]~feeder_combout\);

-- Location: LCFF_X6_Y11_N1
\myDebouncer|key_reg1[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(3));

-- Location: LCCOMB_X8_Y11_N12
\myScanner|key[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[8]~feeder_combout\ = \myScanner|Decoder0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Decoder0~0_combout\,
	combout => \myScanner|key[8]~feeder_combout\);

-- Location: LCFF_X8_Y11_N13
\myScanner|key[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[8]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s1~regout\,
	ena => \myScanner|key[8]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(8));

-- Location: LCCOMB_X8_Y11_N22
\myDebouncer|key_reg1[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[8]~feeder_combout\ = \myScanner|key\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(8),
	combout => \myDebouncer|key_reg1[8]~feeder_combout\);

-- Location: LCFF_X8_Y11_N23
\myDebouncer|key_reg1[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(8));

-- Location: LCCOMB_X6_Y12_N16
\myScanner|key[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[13]~feeder_combout\ = \myScanner|Mux30~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Mux30~0_combout\,
	combout => \myScanner|key[13]~feeder_combout\);

-- Location: LCFF_X6_Y12_N17
\myScanner|key[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[13]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|state.s0~regout\,
	ena => \myScanner|key[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(13));

-- Location: LCCOMB_X6_Y12_N26
\myDebouncer|key_reg1[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[13]~feeder_combout\ = \myScanner|key\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myScanner|key\(13),
	combout => \myDebouncer|key_reg1[13]~feeder_combout\);

-- Location: LCFF_X6_Y12_N27
\myDebouncer|key_reg1[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(13));

-- Location: LCCOMB_X7_Y11_N0
\myCoder|Equal9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal9~1_combout\ = (\myDebouncer|key_reg1\(12) & (\myDebouncer|key_reg1\(9) & (\myDebouncer|key_reg1\(11) & \myDebouncer|key_reg1\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(12),
	datab => \myDebouncer|key_reg1\(9),
	datac => \myDebouncer|key_reg1\(11),
	datad => \myDebouncer|key_reg1\(13),
	combout => \myCoder|Equal9~1_combout\);

-- Location: LCCOMB_X7_Y12_N14
\myScanner|key[15]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[15]~8_combout\ = (\myScanner|key[15]~3_combout\ & ((\col~combout\(3)) # ((\myScanner|state.s0~regout\)))) # (!\myScanner|key[15]~3_combout\ & (((\myScanner|key\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(3),
	datab => \myScanner|state.s0~regout\,
	datac => \myScanner|key\(15),
	datad => \myScanner|key[15]~3_combout\,
	combout => \myScanner|key[15]~8_combout\);

-- Location: LCFF_X7_Y12_N15
\myScanner|key[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[15]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(15));

-- Location: LCFF_X7_Y12_N25
\myDebouncer|key_reg1[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	sdata => \myScanner|key\(15),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(15));

-- Location: LCCOMB_X6_Y11_N28
\myScanner|key[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[0]~feeder_combout\ = \myScanner|Decoder0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Decoder0~0_combout\,
	combout => \myScanner|key[0]~feeder_combout\);

-- Location: LCFF_X6_Y11_N29
\myScanner|key[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[0]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s3~regout\,
	ena => \myScanner|key[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(0));

-- Location: LCCOMB_X6_Y11_N24
\myDebouncer|key_reg1[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[0]~feeder_combout\ = \myScanner|key\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(0),
	combout => \myDebouncer|key_reg1[0]~feeder_combout\);

-- Location: LCFF_X6_Y11_N25
\myDebouncer|key_reg1[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(0));

-- Location: LCCOMB_X7_Y12_N2
\myCoder|Equal2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal2~1_combout\ = (\myDebouncer|key_reg1\(1) & (\myDebouncer|key_reg1\(0) & \myDebouncer|key_reg1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(1),
	datac => \myDebouncer|key_reg1\(0),
	datad => \myDebouncer|key_reg1\(10),
	combout => \myCoder|Equal2~1_combout\);

-- Location: LCCOMB_X7_Y12_N30
\myCoder|Equal2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal2~2_combout\ = (\myDebouncer|key_reg1\(14) & (\myCoder|Equal9~1_combout\ & (\myDebouncer|key_reg1\(15) & \myCoder|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(14),
	datab => \myCoder|Equal9~1_combout\,
	datac => \myDebouncer|key_reg1\(15),
	datad => \myCoder|Equal2~1_combout\,
	combout => \myCoder|Equal2~2_combout\);

-- Location: LCCOMB_X6_Y12_N20
\myCoder|Equal3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal3~0_combout\ = (\myDebouncer|key_reg1\(7) & (\myDebouncer|key_reg1\(3) & (\myDebouncer|key_reg1\(8) & \myCoder|Equal2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(7),
	datab => \myDebouncer|key_reg1\(3),
	datac => \myDebouncer|key_reg1\(8),
	datad => \myCoder|Equal2~2_combout\,
	combout => \myCoder|Equal3~0_combout\);

-- Location: LCCOMB_X7_Y12_N26
\myCoder|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal0~2_combout\ = (!\myDebouncer|key_reg1\(1) & (\myCoder|Equal9~1_combout\ & \myDebouncer|key_reg1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(1),
	datab => \myCoder|Equal9~1_combout\,
	datad => \myDebouncer|key_reg1\(10),
	combout => \myCoder|Equal0~2_combout\);

-- Location: LCCOMB_X6_Y12_N22
\myScanner|key[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[14]~feeder_combout\ = \myScanner|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Mux29~0_combout\,
	combout => \myScanner|key[14]~feeder_combout\);

-- Location: LCFF_X6_Y12_N23
\myScanner|key[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[14]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|state.s0~regout\,
	ena => \myScanner|key[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(14));

-- Location: LCCOMB_X6_Y12_N12
\myDebouncer|key_reg1[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[14]~feeder_combout\ = \myScanner|key\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(14),
	combout => \myDebouncer|key_reg1[14]~feeder_combout\);

-- Location: LCFF_X6_Y12_N13
\myDebouncer|key_reg1[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(14));

-- Location: LCCOMB_X7_Y12_N24
\myCoder|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal0~3_combout\ = (\myCoder|Equal0~1_combout\ & (\myCoder|Equal0~2_combout\ & (\myDebouncer|key_reg1\(15) & \myDebouncer|key_reg1\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal0~1_combout\,
	datab => \myCoder|Equal0~2_combout\,
	datac => \myDebouncer|key_reg1\(15),
	datad => \myDebouncer|key_reg1\(14),
	combout => \myCoder|Equal0~3_combout\);

-- Location: LCCOMB_X6_Y12_N10
\myCoder|WideOr3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr3~0_combout\ = (\myCoder|Equal8~0_combout\) # ((\myCoder|Equal0~3_combout\) # ((\myCoder|Equal4~0_combout\ & \myCoder|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal4~0_combout\,
	datab => \myCoder|Equal8~0_combout\,
	datac => \myCoder|Equal3~0_combout\,
	datad => \myCoder|Equal0~3_combout\,
	combout => \myCoder|WideOr3~0_combout\);

-- Location: LCCOMB_X4_Y11_N12
\myScanner|key[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[5]~feeder_combout\ = \myScanner|Mux30~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myScanner|Mux30~0_combout\,
	combout => \myScanner|key[5]~feeder_combout\);

-- Location: LCCOMB_X5_Y11_N6
\myScanner|key[4]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[4]~10_combout\ = (\myScanner|key[0]~0_combout\) # ((\myScanner|key[0]~1_combout\ & (\myScanner|state.s2~regout\ & \myScanner|state.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|key[0]~1_combout\,
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|state.s0~regout\,
	datad => \myScanner|key[0]~0_combout\,
	combout => \myScanner|key[4]~10_combout\);

-- Location: LCCOMB_X5_Y11_N10
\myScanner|key[4]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[4]~11_combout\ = (!\myScanner|key[4]~10_combout\ & ((\myScanner|WideOr0~0_combout\) # ((\myScanner|state.s2~regout\ & \myScanner|state.s0~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|WideOr0~0_combout\,
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|state.s0~regout\,
	datad => \myScanner|key[4]~10_combout\,
	combout => \myScanner|key[4]~11_combout\);

-- Location: LCFF_X4_Y11_N13
\myScanner|key[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[5]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s2~regout\,
	ena => \myScanner|key[4]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(5));

-- Location: LCCOMB_X4_Y11_N10
\myDebouncer|key_reg1[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[5]~feeder_combout\ = \myScanner|key\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(5),
	combout => \myDebouncer|key_reg1[5]~feeder_combout\);

-- Location: LCFF_X4_Y11_N11
\myDebouncer|key_reg1[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(5));

-- Location: LCCOMB_X6_Y11_N30
\myScanner|key[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[2]~feeder_combout\ = \myScanner|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myScanner|Mux29~0_combout\,
	combout => \myScanner|key[2]~feeder_combout\);

-- Location: LCFF_X6_Y11_N31
\myScanner|key[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[2]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s3~regout\,
	ena => \myScanner|key[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(2));

-- Location: LCCOMB_X6_Y11_N26
\myDebouncer|key_reg1[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[2]~feeder_combout\ = \myScanner|key\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(2),
	combout => \myDebouncer|key_reg1[2]~feeder_combout\);

-- Location: LCFF_X6_Y11_N27
\myDebouncer|key_reg1[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(2));

-- Location: LCCOMB_X4_Y11_N28
\myScanner|key[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[6]~feeder_combout\ = \myScanner|Mux29~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Mux29~0_combout\,
	combout => \myScanner|key[6]~feeder_combout\);

-- Location: LCFF_X4_Y11_N29
\myScanner|key[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[6]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s2~regout\,
	ena => \myScanner|key[4]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(6));

-- Location: LCCOMB_X4_Y11_N22
\myDebouncer|key_reg1[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[6]~feeder_combout\ = \myScanner|key\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(6),
	combout => \myDebouncer|key_reg1[6]~feeder_combout\);

-- Location: LCFF_X4_Y11_N23
\myDebouncer|key_reg1[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(6));

-- Location: LCCOMB_X5_Y12_N12
\myCoder|Equal2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal2~0_combout\ = (\myDebouncer|key_reg1\(4) & (\myDebouncer|key_reg1\(5) & (\myDebouncer|key_reg1\(2) & \myDebouncer|key_reg1\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(4),
	datab => \myDebouncer|key_reg1\(5),
	datac => \myDebouncer|key_reg1\(2),
	datad => \myDebouncer|key_reg1\(6),
	combout => \myCoder|Equal2~0_combout\);

-- Location: LCCOMB_X5_Y11_N14
\myScanner|key[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[7]~12_combout\ = (\myScanner|key[4]~11_combout\ & (((\col~combout\(3))) # (!\myScanner|state.s2~regout\))) # (!\myScanner|key[4]~11_combout\ & (((\myScanner|key\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|key[4]~11_combout\,
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|key\(7),
	datad => \col~combout\(3),
	combout => \myScanner|key[7]~12_combout\);

-- Location: LCFF_X5_Y11_N15
\myScanner|key[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[7]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(7));

-- Location: LCCOMB_X6_Y11_N10
\myDebouncer|key_reg1[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[7]~feeder_combout\ = \myScanner|key\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(7),
	combout => \myDebouncer|key_reg1[7]~feeder_combout\);

-- Location: LCFF_X6_Y11_N11
\myDebouncer|key_reg1[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(7));

-- Location: LCCOMB_X7_Y12_N28
\myCoder|WideOr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~0_combout\ = (!\myDebouncer|key_reg1\(3) & (\myCoder|Equal2~0_combout\ & (\myDebouncer|key_reg1\(8) & \myDebouncer|key_reg1\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(3),
	datab => \myCoder|Equal2~0_combout\,
	datac => \myDebouncer|key_reg1\(8),
	datad => \myDebouncer|key_reg1\(7),
	combout => \myCoder|WideOr2~0_combout\);

-- Location: LCCOMB_X6_Y12_N0
\myCoder|Equal6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal6~0_combout\ = (\myCoder|Equal2~0_combout\ & (\myDebouncer|key_reg1\(3) & (\myDebouncer|key_reg1\(8) & !\myDebouncer|key_reg1\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal2~0_combout\,
	datab => \myDebouncer|key_reg1\(3),
	datac => \myDebouncer|key_reg1\(8),
	datad => \myDebouncer|key_reg1\(7),
	combout => \myCoder|Equal6~0_combout\);

-- Location: LCCOMB_X7_Y12_N20
\myCoder|WideOr2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~1_combout\ = (!\myCoder|Equal14~0_combout\ & (((!\myCoder|WideOr2~0_combout\ & !\myCoder|Equal6~0_combout\)) # (!\myCoder|Equal2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal14~0_combout\,
	datab => \myCoder|WideOr2~0_combout\,
	datac => \myCoder|Equal6~0_combout\,
	datad => \myCoder|Equal2~2_combout\,
	combout => \myCoder|WideOr2~1_combout\);

-- Location: LCCOMB_X7_Y11_N26
\myCoder|Equal12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal12~3_combout\ = (!\myDebouncer|key_reg1\(13) & (\myDebouncer|key_reg1\(11) & \myCoder|Equal10~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(13),
	datac => \myDebouncer|key_reg1\(11),
	datad => \myCoder|Equal10~1_combout\,
	combout => \myCoder|Equal12~3_combout\);

-- Location: LCCOMB_X7_Y11_N12
\myCoder|WideOr3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr3~combout\ = (\myCoder|Equal10~2_combout\) # ((\myCoder|WideOr3~0_combout\) # ((\myCoder|Equal12~3_combout\) # (!\myCoder|WideOr2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~2_combout\,
	datab => \myCoder|WideOr3~0_combout\,
	datac => \myCoder|WideOr2~1_combout\,
	datad => \myCoder|Equal12~3_combout\,
	combout => \myCoder|WideOr3~combout\);

-- Location: LCCOMB_X5_Y12_N0
\myCoder|Equal3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal3~1_combout\ = (\myDebouncer|key_reg1\(2) & (\myDebouncer|key_reg1\(5) & \myCoder|Equal3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|key_reg1\(2),
	datac => \myDebouncer|key_reg1\(5),
	datad => \myCoder|Equal3~0_combout\,
	combout => \myCoder|Equal3~1_combout\);

-- Location: LCCOMB_X4_Y11_N30
\myScanner|key[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|key[4]~feeder_combout\ = \myScanner|Decoder0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|Decoder0~0_combout\,
	combout => \myScanner|key[4]~feeder_combout\);

-- Location: LCFF_X4_Y11_N31
\myScanner|key[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|key[4]~feeder_combout\,
	sdata => VCC,
	sload => \myScanner|ALT_INV_state.s2~regout\,
	ena => \myScanner|key[4]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|key\(4));

-- Location: LCCOMB_X4_Y11_N0
\myDebouncer|key_reg1[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|key_reg1[4]~feeder_combout\ = \myScanner|key\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \myScanner|key\(4),
	combout => \myDebouncer|key_reg1[4]~feeder_combout\);

-- Location: LCFF_X4_Y11_N1
\myDebouncer|key_reg1[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|key_reg1[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|key_reg1\(4));

-- Location: LCCOMB_X5_Y12_N10
\myCoder|WideOr2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~3_combout\ = (!\myDebouncer|key_reg1\(2) & (\myDebouncer|key_reg1\(5) & \myCoder|Equal3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|key_reg1\(2),
	datac => \myDebouncer|key_reg1\(5),
	datad => \myCoder|Equal3~0_combout\,
	combout => \myCoder|WideOr2~3_combout\);

-- Location: LCCOMB_X5_Y12_N16
\myCoder|WideOr2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~4_combout\ = (\myDebouncer|key_reg1\(4) & ((\myDebouncer|key_reg1\(6) & ((\myCoder|WideOr2~3_combout\))) # (!\myDebouncer|key_reg1\(6) & (\myCoder|Equal3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(6),
	datab => \myCoder|Equal3~1_combout\,
	datac => \myDebouncer|key_reg1\(4),
	datad => \myCoder|WideOr2~3_combout\,
	combout => \myCoder|WideOr2~4_combout\);

-- Location: LCCOMB_X7_Y12_N0
\myCoder|Equal2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal2~3_combout\ = (\myDebouncer|key_reg1\(1) & (\myCoder|Equal9~1_combout\ & \myDebouncer|key_reg1\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(1),
	datab => \myCoder|Equal9~1_combout\,
	datad => \myDebouncer|key_reg1\(10),
	combout => \myCoder|Equal2~3_combout\);

-- Location: LCCOMB_X7_Y12_N8
\myCoder|Equal13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal13~0_combout\ = (\myCoder|Equal0~1_combout\ & (\myCoder|Equal2~3_combout\ & (\myDebouncer|key_reg1\(15) & !\myDebouncer|key_reg1\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal0~1_combout\,
	datab => \myCoder|Equal2~3_combout\,
	datac => \myDebouncer|key_reg1\(15),
	datad => \myDebouncer|key_reg1\(14),
	combout => \myCoder|Equal13~0_combout\);

-- Location: LCCOMB_X7_Y11_N6
\myCoder|WideOr2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~2_combout\ = (\myCoder|Equal13~0_combout\) # ((\myCoder|Equal10~0_combout\ & (!\myDebouncer|key_reg1\(10) & \myCoder|Equal9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~0_combout\,
	datab => \myCoder|Equal13~0_combout\,
	datac => \myDebouncer|key_reg1\(10),
	datad => \myCoder|Equal9~1_combout\,
	combout => \myCoder|WideOr2~2_combout\);

-- Location: LCCOMB_X7_Y11_N10
\myCoder|WideOr2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr2~5_combout\ = (\myCoder|WideOr2~4_combout\) # (((\myCoder|Equal10~2_combout\) # (\myCoder|WideOr2~2_combout\)) # (!\myCoder|WideOr2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|WideOr2~4_combout\,
	datab => \myCoder|WideOr2~1_combout\,
	datac => \myCoder|Equal10~2_combout\,
	datad => \myCoder|WideOr2~2_combout\,
	combout => \myCoder|WideOr2~5_combout\);

-- Location: LCCOMB_X7_Y11_N18
\myCoder|Equal11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal11~0_combout\ = (\myDebouncer|key_reg1\(13) & (\myDebouncer|key_reg1\(11) & !\myDebouncer|key_reg1\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(13),
	datab => \myDebouncer|key_reg1\(11),
	datac => \myDebouncer|key_reg1\(12),
	combout => \myCoder|Equal11~0_combout\);

-- Location: LCCOMB_X7_Y11_N24
\myCoder|Equal11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal11~1_combout\ = (\myCoder|Equal10~0_combout\ & (\myCoder|Equal11~0_combout\ & (\myDebouncer|key_reg1\(10) & \myDebouncer|key_reg1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~0_combout\,
	datab => \myCoder|Equal11~0_combout\,
	datac => \myDebouncer|key_reg1\(10),
	datad => \myDebouncer|key_reg1\(9),
	combout => \myCoder|Equal11~1_combout\);

-- Location: LCCOMB_X7_Y12_N10
\myCoder|WideOr1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr1~2_combout\ = ((\myDebouncer|key_reg1\(15) $ (!\myDebouncer|key_reg1\(14))) # (!\myCoder|Equal2~3_combout\)) # (!\myCoder|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal0~1_combout\,
	datab => \myCoder|Equal2~3_combout\,
	datac => \myDebouncer|key_reg1\(15),
	datad => \myDebouncer|key_reg1\(14),
	combout => \myCoder|WideOr1~2_combout\);

-- Location: LCCOMB_X7_Y11_N20
\myCoder|WideOr1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr1~3_combout\ = (!\myCoder|Equal11~1_combout\ & (\myCoder|WideOr1~2_combout\ & ((!\myCoder|Equal10~1_combout\) # (!\myCoder|Equal12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal12~2_combout\,
	datab => \myCoder|Equal11~1_combout\,
	datac => \myCoder|WideOr1~2_combout\,
	datad => \myCoder|Equal10~1_combout\,
	combout => \myCoder|WideOr1~3_combout\);

-- Location: LCCOMB_X6_Y12_N30
\myCoder|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr1~0_combout\ = (\myCoder|Equal4~0_combout\ & ((\myCoder|Equal3~0_combout\) # ((\myCoder|Equal6~0_combout\ & \myCoder|Equal2~2_combout\)))) # (!\myCoder|Equal4~0_combout\ & (\myCoder|Equal6~0_combout\ & ((\myCoder|Equal2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal4~0_combout\,
	datab => \myCoder|Equal6~0_combout\,
	datac => \myCoder|Equal3~0_combout\,
	datad => \myCoder|Equal2~2_combout\,
	combout => \myCoder|WideOr1~0_combout\);

-- Location: LCCOMB_X5_Y12_N30
\myCoder|WideOr1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr1~1_combout\ = (\myCoder|WideOr1~0_combout\) # ((\myCoder|Equal3~1_combout\ & (\myDebouncer|key_reg1\(6) $ (\myDebouncer|key_reg1\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(6),
	datab => \myCoder|Equal3~1_combout\,
	datac => \myDebouncer|key_reg1\(4),
	datad => \myCoder|WideOr1~0_combout\,
	combout => \myCoder|WideOr1~1_combout\);

-- Location: LCCOMB_X4_Y12_N20
\myCoder|WideOr1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr1~combout\ = (\myCoder|WideOr1~1_combout\) # (!\myCoder|WideOr1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myCoder|WideOr1~3_combout\,
	datad => \myCoder|WideOr1~1_combout\,
	combout => \myCoder|WideOr1~combout\);

-- Location: LCCOMB_X7_Y12_N4
\myCoder|Equal7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal7~0_combout\ = (\myDebouncer|key_reg1\(3) & (!\myDebouncer|key_reg1\(8) & \myCoder|Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(3),
	datac => \myDebouncer|key_reg1\(8),
	datad => \myCoder|Equal2~0_combout\,
	combout => \myCoder|Equal7~0_combout\);

-- Location: LCCOMB_X7_Y12_N22
\myCoder|Equal7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|Equal7~1_combout\ = (\myDebouncer|key_reg1\(7) & (\myCoder|Equal7~0_combout\ & \myCoder|Equal2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|key_reg1\(7),
	datac => \myCoder|Equal7~0_combout\,
	datad => \myCoder|Equal2~2_combout\,
	combout => \myCoder|Equal7~1_combout\);

-- Location: LCCOMB_X7_Y11_N28
\myCoder|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr0~0_combout\ = (\myCoder|Equal10~0_combout\ & (\myCoder|Equal9~0_combout\ & (\myDebouncer|key_reg1\(10) $ (\myDebouncer|key_reg1\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~0_combout\,
	datab => \myCoder|Equal9~0_combout\,
	datac => \myDebouncer|key_reg1\(10),
	datad => \myDebouncer|key_reg1\(9),
	combout => \myCoder|WideOr0~0_combout\);

-- Location: LCCOMB_X7_Y11_N2
\myCoder|WideOr0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myCoder|WideOr0~combout\ = (\myCoder|Equal10~2_combout\) # ((\myCoder|Equal7~1_combout\) # ((\myCoder|WideOr0~0_combout\) # (!\myCoder|WideOr1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myCoder|Equal10~2_combout\,
	datab => \myCoder|Equal7~1_combout\,
	datac => \myCoder|WideOr1~3_combout\,
	datad => \myCoder|WideOr0~0_combout\,
	combout => \myCoder|WideOr0~combout\);

-- Location: LCCOMB_X10_Y10_N0
\myDebouncer|debounce_clk_filter|i[0]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[0]~32_combout\ = \myDebouncer|debounce_clk_filter|i\(0) $ (VCC)
-- \myDebouncer|debounce_clk_filter|i[0]~33\ = CARRY(\myDebouncer|debounce_clk_filter|i\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(0),
	datad => VCC,
	combout => \myDebouncer|debounce_clk_filter|i[0]~32_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[0]~33\);

-- Location: LCFF_X10_Y10_N1
\myDebouncer|debounce_clk_filter|i[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[0]~32_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(0));

-- Location: LCCOMB_X10_Y10_N2
\myDebouncer|debounce_clk_filter|i[1]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[1]~34_combout\ = (\myDebouncer|debounce_clk_filter|i\(1) & (!\myDebouncer|debounce_clk_filter|i[0]~33\)) # (!\myDebouncer|debounce_clk_filter|i\(1) & ((\myDebouncer|debounce_clk_filter|i[0]~33\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[1]~35\ = CARRY((!\myDebouncer|debounce_clk_filter|i[0]~33\) # (!\myDebouncer|debounce_clk_filter|i\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(1),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[0]~33\,
	combout => \myDebouncer|debounce_clk_filter|i[1]~34_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[1]~35\);

-- Location: LCFF_X10_Y10_N3
\myDebouncer|debounce_clk_filter|i[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[1]~34_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(1));

-- Location: LCCOMB_X10_Y10_N4
\myDebouncer|debounce_clk_filter|i[2]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[2]~36_combout\ = (\myDebouncer|debounce_clk_filter|i\(2) & (\myDebouncer|debounce_clk_filter|i[1]~35\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(2) & (!\myDebouncer|debounce_clk_filter|i[1]~35\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[2]~37\ = CARRY((\myDebouncer|debounce_clk_filter|i\(2) & !\myDebouncer|debounce_clk_filter|i[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(2),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[1]~35\,
	combout => \myDebouncer|debounce_clk_filter|i[2]~36_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[2]~37\);

-- Location: LCFF_X10_Y10_N5
\myDebouncer|debounce_clk_filter|i[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[2]~36_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(2));

-- Location: LCCOMB_X10_Y10_N8
\myDebouncer|debounce_clk_filter|i[4]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[4]~40_combout\ = (\myDebouncer|debounce_clk_filter|i\(4) & (\myDebouncer|debounce_clk_filter|i[3]~39\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(4) & (!\myDebouncer|debounce_clk_filter|i[3]~39\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[4]~41\ = CARRY((\myDebouncer|debounce_clk_filter|i\(4) & !\myDebouncer|debounce_clk_filter|i[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(4),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[3]~39\,
	combout => \myDebouncer|debounce_clk_filter|i[4]~40_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[4]~41\);

-- Location: LCFF_X10_Y10_N9
\myDebouncer|debounce_clk_filter|i[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[4]~40_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(4));

-- Location: LCCOMB_X10_Y10_N10
\myDebouncer|debounce_clk_filter|i[5]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[5]~42_combout\ = (\myDebouncer|debounce_clk_filter|i\(5) & (!\myDebouncer|debounce_clk_filter|i[4]~41\)) # (!\myDebouncer|debounce_clk_filter|i\(5) & ((\myDebouncer|debounce_clk_filter|i[4]~41\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[5]~43\ = CARRY((!\myDebouncer|debounce_clk_filter|i[4]~41\) # (!\myDebouncer|debounce_clk_filter|i\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(5),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[4]~41\,
	combout => \myDebouncer|debounce_clk_filter|i[5]~42_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[5]~43\);

-- Location: LCCOMB_X10_Y10_N12
\myDebouncer|debounce_clk_filter|i[6]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[6]~44_combout\ = (\myDebouncer|debounce_clk_filter|i\(6) & (\myDebouncer|debounce_clk_filter|i[5]~43\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(6) & (!\myDebouncer|debounce_clk_filter|i[5]~43\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[6]~45\ = CARRY((\myDebouncer|debounce_clk_filter|i\(6) & !\myDebouncer|debounce_clk_filter|i[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(6),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[5]~43\,
	combout => \myDebouncer|debounce_clk_filter|i[6]~44_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[6]~45\);

-- Location: LCCOMB_X10_Y10_N14
\myDebouncer|debounce_clk_filter|i[7]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[7]~46_combout\ = (\myDebouncer|debounce_clk_filter|i\(7) & (!\myDebouncer|debounce_clk_filter|i[6]~45\)) # (!\myDebouncer|debounce_clk_filter|i\(7) & ((\myDebouncer|debounce_clk_filter|i[6]~45\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[7]~47\ = CARRY((!\myDebouncer|debounce_clk_filter|i[6]~45\) # (!\myDebouncer|debounce_clk_filter|i\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(7),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[6]~45\,
	combout => \myDebouncer|debounce_clk_filter|i[7]~46_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[7]~47\);

-- Location: LCFF_X10_Y10_N15
\myDebouncer|debounce_clk_filter|i[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[7]~46_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(7));

-- Location: LCCOMB_X10_Y10_N18
\myDebouncer|debounce_clk_filter|i[9]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[9]~50_combout\ = (\myDebouncer|debounce_clk_filter|i\(9) & (!\myDebouncer|debounce_clk_filter|i[8]~49\)) # (!\myDebouncer|debounce_clk_filter|i\(9) & ((\myDebouncer|debounce_clk_filter|i[8]~49\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[9]~51\ = CARRY((!\myDebouncer|debounce_clk_filter|i[8]~49\) # (!\myDebouncer|debounce_clk_filter|i\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(9),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[8]~49\,
	combout => \myDebouncer|debounce_clk_filter|i[9]~50_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[9]~51\);

-- Location: LCFF_X10_Y10_N19
\myDebouncer|debounce_clk_filter|i[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[9]~50_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(9));

-- Location: LCCOMB_X10_Y10_N20
\myDebouncer|debounce_clk_filter|i[10]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[10]~52_combout\ = (\myDebouncer|debounce_clk_filter|i\(10) & (\myDebouncer|debounce_clk_filter|i[9]~51\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(10) & (!\myDebouncer|debounce_clk_filter|i[9]~51\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[10]~53\ = CARRY((\myDebouncer|debounce_clk_filter|i\(10) & !\myDebouncer|debounce_clk_filter|i[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(10),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[9]~51\,
	combout => \myDebouncer|debounce_clk_filter|i[10]~52_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[10]~53\);

-- Location: LCCOMB_X10_Y10_N22
\myDebouncer|debounce_clk_filter|i[11]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[11]~54_combout\ = (\myDebouncer|debounce_clk_filter|i\(11) & (!\myDebouncer|debounce_clk_filter|i[10]~53\)) # (!\myDebouncer|debounce_clk_filter|i\(11) & ((\myDebouncer|debounce_clk_filter|i[10]~53\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[11]~55\ = CARRY((!\myDebouncer|debounce_clk_filter|i[10]~53\) # (!\myDebouncer|debounce_clk_filter|i\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(11),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[10]~53\,
	combout => \myDebouncer|debounce_clk_filter|i[11]~54_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[11]~55\);

-- Location: LCFF_X10_Y10_N23
\myDebouncer|debounce_clk_filter|i[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[11]~54_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(11));

-- Location: LCCOMB_X10_Y10_N26
\myDebouncer|debounce_clk_filter|i[13]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[13]~58_combout\ = (\myDebouncer|debounce_clk_filter|i\(13) & (!\myDebouncer|debounce_clk_filter|i[12]~57\)) # (!\myDebouncer|debounce_clk_filter|i\(13) & ((\myDebouncer|debounce_clk_filter|i[12]~57\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[13]~59\ = CARRY((!\myDebouncer|debounce_clk_filter|i[12]~57\) # (!\myDebouncer|debounce_clk_filter|i\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(13),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[12]~57\,
	combout => \myDebouncer|debounce_clk_filter|i[13]~58_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[13]~59\);

-- Location: LCFF_X9_Y10_N25
\myDebouncer|debounce_clk_filter|i[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \myDebouncer|debounce_clk_filter|i[13]~58_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(13));

-- Location: LCCOMB_X10_Y10_N28
\myDebouncer|debounce_clk_filter|i[14]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[14]~60_combout\ = (\myDebouncer|debounce_clk_filter|i\(14) & (\myDebouncer|debounce_clk_filter|i[13]~59\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(14) & (!\myDebouncer|debounce_clk_filter|i[13]~59\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[14]~61\ = CARRY((\myDebouncer|debounce_clk_filter|i\(14) & !\myDebouncer|debounce_clk_filter|i[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(14),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[13]~59\,
	combout => \myDebouncer|debounce_clk_filter|i[14]~60_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[14]~61\);

-- Location: LCFF_X9_Y10_N29
\myDebouncer|debounce_clk_filter|i[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \myDebouncer|debounce_clk_filter|i[14]~60_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(14));

-- Location: LCCOMB_X10_Y10_N30
\myDebouncer|debounce_clk_filter|i[15]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[15]~62_combout\ = (\myDebouncer|debounce_clk_filter|i\(15) & (!\myDebouncer|debounce_clk_filter|i[14]~61\)) # (!\myDebouncer|debounce_clk_filter|i\(15) & ((\myDebouncer|debounce_clk_filter|i[14]~61\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[15]~63\ = CARRY((!\myDebouncer|debounce_clk_filter|i[14]~61\) # (!\myDebouncer|debounce_clk_filter|i\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(15),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[14]~61\,
	combout => \myDebouncer|debounce_clk_filter|i[15]~62_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[15]~63\);

-- Location: LCFF_X9_Y10_N17
\myDebouncer|debounce_clk_filter|i[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \myDebouncer|debounce_clk_filter|i[15]~62_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(15));

-- Location: LCCOMB_X10_Y9_N0
\myDebouncer|debounce_clk_filter|i[16]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[16]~64_combout\ = (\myDebouncer|debounce_clk_filter|i\(16) & (\myDebouncer|debounce_clk_filter|i[15]~63\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(16) & (!\myDebouncer|debounce_clk_filter|i[15]~63\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[16]~65\ = CARRY((\myDebouncer|debounce_clk_filter|i\(16) & !\myDebouncer|debounce_clk_filter|i[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(16),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[15]~63\,
	combout => \myDebouncer|debounce_clk_filter|i[16]~64_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[16]~65\);

-- Location: LCFF_X10_Y9_N1
\myDebouncer|debounce_clk_filter|i[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[16]~64_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(16));

-- Location: LCCOMB_X10_Y9_N2
\myDebouncer|debounce_clk_filter|i[17]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[17]~66_combout\ = (\myDebouncer|debounce_clk_filter|i\(17) & (!\myDebouncer|debounce_clk_filter|i[16]~65\)) # (!\myDebouncer|debounce_clk_filter|i\(17) & ((\myDebouncer|debounce_clk_filter|i[16]~65\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[17]~67\ = CARRY((!\myDebouncer|debounce_clk_filter|i[16]~65\) # (!\myDebouncer|debounce_clk_filter|i\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(17),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[16]~65\,
	combout => \myDebouncer|debounce_clk_filter|i[17]~66_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[17]~67\);

-- Location: LCFF_X10_Y9_N3
\myDebouncer|debounce_clk_filter|i[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[17]~66_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(17));

-- Location: LCCOMB_X10_Y9_N4
\myDebouncer|debounce_clk_filter|i[18]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[18]~68_combout\ = (\myDebouncer|debounce_clk_filter|i\(18) & (\myDebouncer|debounce_clk_filter|i[17]~67\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(18) & (!\myDebouncer|debounce_clk_filter|i[17]~67\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[18]~69\ = CARRY((\myDebouncer|debounce_clk_filter|i\(18) & !\myDebouncer|debounce_clk_filter|i[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(18),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[17]~67\,
	combout => \myDebouncer|debounce_clk_filter|i[18]~68_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[18]~69\);

-- Location: LCFF_X10_Y9_N5
\myDebouncer|debounce_clk_filter|i[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[18]~68_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(18));

-- Location: LCFF_X10_Y10_N13
\myDebouncer|debounce_clk_filter|i[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[6]~44_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(6));

-- Location: LCFF_X10_Y10_N11
\myDebouncer|debounce_clk_filter|i[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[5]~42_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(5));

-- Location: LCCOMB_X9_Y10_N14
\myDebouncer|debounce_clk_filter|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~5_combout\ = ((!\myDebouncer|debounce_clk_filter|i\(7) & (!\myDebouncer|debounce_clk_filter|i\(6) & !\myDebouncer|debounce_clk_filter|i\(5)))) # (!\myDebouncer|debounce_clk_filter|i\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(8),
	datab => \myDebouncer|debounce_clk_filter|i\(7),
	datac => \myDebouncer|debounce_clk_filter|i\(6),
	datad => \myDebouncer|debounce_clk_filter|i\(5),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~5_combout\);

-- Location: LCFF_X10_Y10_N21
\myDebouncer|debounce_clk_filter|i[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[10]~52_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(10));

-- Location: LCCOMB_X9_Y10_N20
\myDebouncer|debounce_clk_filter|LessThan0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~6_combout\ = (!\myDebouncer|debounce_clk_filter|i\(12) & (!\myDebouncer|debounce_clk_filter|i\(10) & (!\myDebouncer|debounce_clk_filter|i\(9) & !\myDebouncer|debounce_clk_filter|i\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(12),
	datab => \myDebouncer|debounce_clk_filter|i\(10),
	datac => \myDebouncer|debounce_clk_filter|i\(9),
	datad => \myDebouncer|debounce_clk_filter|i\(11),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~6_combout\);

-- Location: LCCOMB_X9_Y10_N2
\myDebouncer|debounce_clk_filter|LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~4_combout\ = (((!\myDebouncer|debounce_clk_filter|i\(13) & !\myDebouncer|debounce_clk_filter|i\(14))) # (!\myDebouncer|debounce_clk_filter|i\(16))) # (!\myDebouncer|debounce_clk_filter|i\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(13),
	datab => \myDebouncer|debounce_clk_filter|i\(14),
	datac => \myDebouncer|debounce_clk_filter|i\(15),
	datad => \myDebouncer|debounce_clk_filter|i\(16),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~4_combout\);

-- Location: LCCOMB_X9_Y10_N8
\myDebouncer|debounce_clk_filter|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~7_combout\ = (\myDebouncer|debounce_clk_filter|LessThan0~4_combout\) # ((!\myDebouncer|debounce_clk_filter|i\(14) & (\myDebouncer|debounce_clk_filter|LessThan0~5_combout\ & 
-- \myDebouncer|debounce_clk_filter|LessThan0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(14),
	datab => \myDebouncer|debounce_clk_filter|LessThan0~5_combout\,
	datac => \myDebouncer|debounce_clk_filter|LessThan0~6_combout\,
	datad => \myDebouncer|debounce_clk_filter|LessThan0~4_combout\,
	combout => \myDebouncer|debounce_clk_filter|LessThan0~7_combout\);

-- Location: LCCOMB_X10_Y9_N6
\myDebouncer|debounce_clk_filter|i[19]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[19]~70_combout\ = (\myDebouncer|debounce_clk_filter|i\(19) & (!\myDebouncer|debounce_clk_filter|i[18]~69\)) # (!\myDebouncer|debounce_clk_filter|i\(19) & ((\myDebouncer|debounce_clk_filter|i[18]~69\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[19]~71\ = CARRY((!\myDebouncer|debounce_clk_filter|i[18]~69\) # (!\myDebouncer|debounce_clk_filter|i\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(19),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[18]~69\,
	combout => \myDebouncer|debounce_clk_filter|i[19]~70_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[19]~71\);

-- Location: LCCOMB_X10_Y9_N8
\myDebouncer|debounce_clk_filter|i[20]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[20]~72_combout\ = (\myDebouncer|debounce_clk_filter|i\(20) & (\myDebouncer|debounce_clk_filter|i[19]~71\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(20) & (!\myDebouncer|debounce_clk_filter|i[19]~71\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[20]~73\ = CARRY((\myDebouncer|debounce_clk_filter|i\(20) & !\myDebouncer|debounce_clk_filter|i[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(20),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[19]~71\,
	combout => \myDebouncer|debounce_clk_filter|i[20]~72_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[20]~73\);

-- Location: LCFF_X10_Y9_N9
\myDebouncer|debounce_clk_filter|i[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[20]~72_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(20));

-- Location: LCCOMB_X10_Y9_N10
\myDebouncer|debounce_clk_filter|i[21]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[21]~74_combout\ = (\myDebouncer|debounce_clk_filter|i\(21) & (!\myDebouncer|debounce_clk_filter|i[20]~73\)) # (!\myDebouncer|debounce_clk_filter|i\(21) & ((\myDebouncer|debounce_clk_filter|i[20]~73\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[21]~75\ = CARRY((!\myDebouncer|debounce_clk_filter|i[20]~73\) # (!\myDebouncer|debounce_clk_filter|i\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(21),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[20]~73\,
	combout => \myDebouncer|debounce_clk_filter|i[21]~74_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[21]~75\);

-- Location: LCCOMB_X10_Y9_N12
\myDebouncer|debounce_clk_filter|i[22]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[22]~76_combout\ = (\myDebouncer|debounce_clk_filter|i\(22) & (\myDebouncer|debounce_clk_filter|i[21]~75\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(22) & (!\myDebouncer|debounce_clk_filter|i[21]~75\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[22]~77\ = CARRY((\myDebouncer|debounce_clk_filter|i\(22) & !\myDebouncer|debounce_clk_filter|i[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(22),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[21]~75\,
	combout => \myDebouncer|debounce_clk_filter|i[22]~76_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[22]~77\);

-- Location: LCCOMB_X10_Y9_N14
\myDebouncer|debounce_clk_filter|i[23]~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[23]~78_combout\ = (\myDebouncer|debounce_clk_filter|i\(23) & (!\myDebouncer|debounce_clk_filter|i[22]~77\)) # (!\myDebouncer|debounce_clk_filter|i\(23) & ((\myDebouncer|debounce_clk_filter|i[22]~77\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[23]~79\ = CARRY((!\myDebouncer|debounce_clk_filter|i[22]~77\) # (!\myDebouncer|debounce_clk_filter|i\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(23),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[22]~77\,
	combout => \myDebouncer|debounce_clk_filter|i[23]~78_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[23]~79\);

-- Location: LCFF_X10_Y9_N15
\myDebouncer|debounce_clk_filter|i[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[23]~78_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(23));

-- Location: LCCOMB_X10_Y9_N16
\myDebouncer|debounce_clk_filter|i[24]~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[24]~80_combout\ = (\myDebouncer|debounce_clk_filter|i\(24) & (\myDebouncer|debounce_clk_filter|i[23]~79\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(24) & (!\myDebouncer|debounce_clk_filter|i[23]~79\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[24]~81\ = CARRY((\myDebouncer|debounce_clk_filter|i\(24) & !\myDebouncer|debounce_clk_filter|i[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(24),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[23]~79\,
	combout => \myDebouncer|debounce_clk_filter|i[24]~80_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[24]~81\);

-- Location: LCCOMB_X10_Y9_N18
\myDebouncer|debounce_clk_filter|i[25]~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[25]~82_combout\ = (\myDebouncer|debounce_clk_filter|i\(25) & (!\myDebouncer|debounce_clk_filter|i[24]~81\)) # (!\myDebouncer|debounce_clk_filter|i\(25) & ((\myDebouncer|debounce_clk_filter|i[24]~81\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[25]~83\ = CARRY((!\myDebouncer|debounce_clk_filter|i[24]~81\) # (!\myDebouncer|debounce_clk_filter|i\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(25),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[24]~81\,
	combout => \myDebouncer|debounce_clk_filter|i[25]~82_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[25]~83\);

-- Location: LCFF_X10_Y9_N19
\myDebouncer|debounce_clk_filter|i[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[25]~82_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(25));

-- Location: LCCOMB_X10_Y9_N20
\myDebouncer|debounce_clk_filter|i[26]~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[26]~84_combout\ = (\myDebouncer|debounce_clk_filter|i\(26) & (\myDebouncer|debounce_clk_filter|i[25]~83\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(26) & (!\myDebouncer|debounce_clk_filter|i[25]~83\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[26]~85\ = CARRY((\myDebouncer|debounce_clk_filter|i\(26) & !\myDebouncer|debounce_clk_filter|i[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(26),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[25]~83\,
	combout => \myDebouncer|debounce_clk_filter|i[26]~84_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[26]~85\);

-- Location: LCCOMB_X10_Y9_N22
\myDebouncer|debounce_clk_filter|i[27]~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[27]~86_combout\ = (\myDebouncer|debounce_clk_filter|i\(27) & (!\myDebouncer|debounce_clk_filter|i[26]~85\)) # (!\myDebouncer|debounce_clk_filter|i\(27) & ((\myDebouncer|debounce_clk_filter|i[26]~85\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[27]~87\ = CARRY((!\myDebouncer|debounce_clk_filter|i[26]~85\) # (!\myDebouncer|debounce_clk_filter|i\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(27),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[26]~85\,
	combout => \myDebouncer|debounce_clk_filter|i[27]~86_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[27]~87\);

-- Location: LCFF_X10_Y9_N23
\myDebouncer|debounce_clk_filter|i[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[27]~86_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(27));

-- Location: LCCOMB_X10_Y9_N24
\myDebouncer|debounce_clk_filter|i[28]~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[28]~88_combout\ = (\myDebouncer|debounce_clk_filter|i\(28) & (\myDebouncer|debounce_clk_filter|i[27]~87\ $ (GND))) # (!\myDebouncer|debounce_clk_filter|i\(28) & (!\myDebouncer|debounce_clk_filter|i[27]~87\ & VCC))
-- \myDebouncer|debounce_clk_filter|i[28]~89\ = CARRY((\myDebouncer|debounce_clk_filter|i\(28) & !\myDebouncer|debounce_clk_filter|i[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(28),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[27]~87\,
	combout => \myDebouncer|debounce_clk_filter|i[28]~88_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[28]~89\);

-- Location: LCFF_X10_Y9_N25
\myDebouncer|debounce_clk_filter|i[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[28]~88_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(28));

-- Location: LCCOMB_X10_Y9_N26
\myDebouncer|debounce_clk_filter|i[29]~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|i[29]~90_combout\ = (\myDebouncer|debounce_clk_filter|i\(29) & (!\myDebouncer|debounce_clk_filter|i[28]~89\)) # (!\myDebouncer|debounce_clk_filter|i\(29) & ((\myDebouncer|debounce_clk_filter|i[28]~89\) # (GND)))
-- \myDebouncer|debounce_clk_filter|i[29]~91\ = CARRY((!\myDebouncer|debounce_clk_filter|i[28]~89\) # (!\myDebouncer|debounce_clk_filter|i\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \myDebouncer|debounce_clk_filter|i\(29),
	datad => VCC,
	cin => \myDebouncer|debounce_clk_filter|i[28]~89\,
	combout => \myDebouncer|debounce_clk_filter|i[29]~90_combout\,
	cout => \myDebouncer|debounce_clk_filter|i[29]~91\);

-- Location: LCFF_X10_Y9_N27
\myDebouncer|debounce_clk_filter|i[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[29]~90_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(29));

-- Location: LCFF_X10_Y9_N29
\myDebouncer|debounce_clk_filter|i[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[30]~92_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(30));

-- Location: LCCOMB_X9_Y10_N26
\myDebouncer|debounce_clk_filter|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~2_combout\ = (!\myDebouncer|debounce_clk_filter|i\(27) & (!\myDebouncer|debounce_clk_filter|i\(28) & (!\myDebouncer|debounce_clk_filter|i\(29) & !\myDebouncer|debounce_clk_filter|i\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(27),
	datab => \myDebouncer|debounce_clk_filter|i\(28),
	datac => \myDebouncer|debounce_clk_filter|i\(29),
	datad => \myDebouncer|debounce_clk_filter|i\(30),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~2_combout\);

-- Location: LCFF_X10_Y9_N7
\myDebouncer|debounce_clk_filter|i[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[19]~70_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(19));

-- Location: LCFF_X10_Y9_N13
\myDebouncer|debounce_clk_filter|i[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[22]~76_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(22));

-- Location: LCFF_X10_Y9_N11
\myDebouncer|debounce_clk_filter|i[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[21]~74_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(21));

-- Location: LCCOMB_X9_Y10_N4
\myDebouncer|debounce_clk_filter|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~0_combout\ = (!\myDebouncer|debounce_clk_filter|i\(20) & (!\myDebouncer|debounce_clk_filter|i\(19) & (!\myDebouncer|debounce_clk_filter|i\(22) & !\myDebouncer|debounce_clk_filter|i\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(20),
	datab => \myDebouncer|debounce_clk_filter|i\(19),
	datac => \myDebouncer|debounce_clk_filter|i\(22),
	datad => \myDebouncer|debounce_clk_filter|i\(21),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~0_combout\);

-- Location: LCFF_X10_Y9_N17
\myDebouncer|debounce_clk_filter|i[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[24]~80_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(24));

-- Location: LCFF_X10_Y9_N21
\myDebouncer|debounce_clk_filter|i[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|i[26]~84_combout\,
	sclr => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|i\(26));

-- Location: LCCOMB_X9_Y10_N30
\myDebouncer|debounce_clk_filter|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~1_combout\ = (!\myDebouncer|debounce_clk_filter|i\(23) & (!\myDebouncer|debounce_clk_filter|i\(24) & (!\myDebouncer|debounce_clk_filter|i\(26) & !\myDebouncer|debounce_clk_filter|i\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(23),
	datab => \myDebouncer|debounce_clk_filter|i\(24),
	datac => \myDebouncer|debounce_clk_filter|i\(26),
	datad => \myDebouncer|debounce_clk_filter|i\(25),
	combout => \myDebouncer|debounce_clk_filter|LessThan0~1_combout\);

-- Location: LCCOMB_X9_Y10_N22
\myDebouncer|debounce_clk_filter|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~3_combout\ = (!\myDebouncer|debounce_clk_filter|i\(31) & (\myDebouncer|debounce_clk_filter|LessThan0~2_combout\ & (\myDebouncer|debounce_clk_filter|LessThan0~0_combout\ & 
-- \myDebouncer|debounce_clk_filter|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(31),
	datab => \myDebouncer|debounce_clk_filter|LessThan0~2_combout\,
	datac => \myDebouncer|debounce_clk_filter|LessThan0~0_combout\,
	datad => \myDebouncer|debounce_clk_filter|LessThan0~1_combout\,
	combout => \myDebouncer|debounce_clk_filter|LessThan0~3_combout\);

-- Location: LCCOMB_X9_Y10_N12
\myDebouncer|debounce_clk_filter|LessThan0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|LessThan0~8_combout\ = ((\myDebouncer|debounce_clk_filter|i\(17) & (\myDebouncer|debounce_clk_filter|i\(18) & !\myDebouncer|debounce_clk_filter|LessThan0~7_combout\))) # 
-- (!\myDebouncer|debounce_clk_filter|LessThan0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myDebouncer|debounce_clk_filter|i\(17),
	datab => \myDebouncer|debounce_clk_filter|i\(18),
	datac => \myDebouncer|debounce_clk_filter|LessThan0~7_combout\,
	datad => \myDebouncer|debounce_clk_filter|LessThan0~3_combout\,
	combout => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\);

-- Location: LCCOMB_X9_Y10_N6
\myDebouncer|debounce_clk_filter|clk_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|debounce_clk_filter|clk_out~0_combout\ = \myDebouncer|debounce_clk_filter|clk_out~regout\ $ (\myDebouncer|debounce_clk_filter|LessThan0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|debounce_clk_filter|clk_out~regout\,
	datad => \myDebouncer|debounce_clk_filter|LessThan0~8_combout\,
	combout => \myDebouncer|debounce_clk_filter|clk_out~0_combout\);

-- Location: LCFF_X9_Y10_N7
\myDebouncer|debounce_clk_filter|clk_out\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|debounce_clk_filter|clk_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|debounce_clk_filter|clk_out~regout\);

-- Location: CLKCTRL_G0
\myDebouncer|debounce_clk_filter|clk_out~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\);

-- Location: LCCOMB_X5_Y11_N20
\myScanner|Mux32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux32~0_combout\ = (!\myScanner|state.s3~regout\ & (!\myScanner|state.s2~regout\ & ((\myScanner|Decoder0~0_combout\) # (!\col~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \col~combout\(0),
	datab => \myScanner|Decoder0~0_combout\,
	datac => \myScanner|state.s3~regout\,
	datad => \myScanner|state.s2~regout\,
	combout => \myScanner|Mux32~0_combout\);

-- Location: LCCOMB_X5_Y5_N22
\myScanner|Mux33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux33~0_combout\ = (\myScanner|state.s1~regout\ & (((\myScanner|Mux32~0_combout\)))) # (!\myScanner|state.s1~regout\ & (\myScanner|pcheck\(2) & ((\myScanner|state.s2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s1~regout\,
	datab => \myScanner|pcheck\(2),
	datac => \myScanner|Mux32~0_combout\,
	datad => \myScanner|state.s2~regout\,
	combout => \myScanner|Mux33~0_combout\);

-- Location: LCCOMB_X5_Y5_N14
\myScanner|pcheck[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|pcheck[2]~1_combout\ = (\myScanner|state.s0~regout\ & ((\myScanner|Mux33~0_combout\))) # (!\myScanner|state.s0~regout\ & (\myScanner|Mux32~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Mux32~2_combout\,
	datab => \myScanner|state.s0~regout\,
	datad => \myScanner|Mux33~0_combout\,
	combout => \myScanner|pcheck[2]~1_combout\);

-- Location: LCFF_X5_Y5_N15
\myScanner|pcheck[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|pcheck[2]~1_combout\,
	sdata => \myScanner|pcheck\(2),
	sload => \myScanner|state.s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|pcheck\(2));

-- Location: LCCOMB_X5_Y5_N26
\myScanner|Mux32~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|Mux32~1_combout\ = (\myScanner|pcheck\(3) & ((\myScanner|state.s1~regout\ & ((!\myScanner|state.s3~regout\))) # (!\myScanner|state.s1~regout\ & (\myScanner|state.s2~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|state.s1~regout\,
	datab => \myScanner|state.s2~regout\,
	datac => \myScanner|pcheck\(3),
	datad => \myScanner|state.s3~regout\,
	combout => \myScanner|Mux32~1_combout\);

-- Location: LCCOMB_X5_Y5_N24
\myScanner|pcheck[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|pcheck[3]~0_combout\ = (\myScanner|state.s0~regout\ & ((\myScanner|Mux32~1_combout\))) # (!\myScanner|state.s0~regout\ & (\myScanner|Mux32~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Mux32~0_combout\,
	datab => \myScanner|state.s0~regout\,
	datad => \myScanner|Mux32~1_combout\,
	combout => \myScanner|pcheck[3]~0_combout\);

-- Location: LCFF_X5_Y5_N25
\myScanner|pcheck[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|pcheck[3]~0_combout\,
	sdata => \myScanner|pcheck\(3),
	sload => \myScanner|state.s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|pcheck\(3));

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\col[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_col(0),
	combout => \col~combout\(0));

-- Location: LCCOMB_X5_Y5_N20
\myScanner|pcheck[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|pcheck[0]~3_combout\ = (\myScanner|state.s3~regout\ & ((\myScanner|Decoder0~0_combout\) # ((!\col~combout\(0))))) # (!\myScanner|state.s3~regout\ & (((\myScanner|pcheck\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|Decoder0~0_combout\,
	datab => \col~combout\(0),
	datac => \myScanner|pcheck\(0),
	datad => \myScanner|state.s3~regout\,
	combout => \myScanner|pcheck[0]~3_combout\);

-- Location: LCFF_X5_Y5_N21
\myScanner|pcheck[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myScanner|keyboard_clk_filter|ALT_INV_clk_out~clkctrl_outclk\,
	datain => \myScanner|pcheck[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myScanner|pcheck\(0));

-- Location: LCCOMB_X5_Y5_N30
\myScanner|pressed~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myScanner|pressed~0_combout\ = (\myScanner|pcheck\(1)) # ((\myScanner|pcheck\(2)) # ((\myScanner|pcheck\(3)) # (\myScanner|pcheck\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myScanner|pcheck\(1),
	datab => \myScanner|pcheck\(2),
	datac => \myScanner|pcheck\(3),
	datad => \myScanner|pcheck\(0),
	combout => \myScanner|pressed~0_combout\);

-- Location: LCFF_X5_Y5_N31
\myDebouncer|pressed_reg1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|debounce_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myScanner|pressed~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|pressed_reg1~regout\);

-- Location: LCCOMB_X1_Y3_N12
\myDebouncer|toggle_clk_filter|clk_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|toggle_clk_filter|clk_out~0_combout\ = !\myDebouncer|toggle_clk_filter|clk_out~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|toggle_clk_filter|clk_out~regout\,
	combout => \myDebouncer|toggle_clk_filter|clk_out~0_combout\);

-- Location: LCFF_X1_Y3_N13
\myDebouncer|toggle_clk_filter|clk_out\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \myDebouncer|toggle_clk_filter|clk_out~0_combout\,
	ena => \myDebouncer|toggle_clk_filter|LessThan0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle_clk_filter|clk_out~regout\);

-- Location: CLKCTRL_G3
\myDebouncer|toggle_clk_filter|clk_out~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \myDebouncer|toggle_clk_filter|clk_out~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \myDebouncer|toggle_clk_filter|clk_out~clkctrl_outclk\);

-- Location: LCCOMB_X4_Y5_N4
\myDebouncer|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|Selector0~0_combout\ = (\myDebouncer|monostable_state.temporary~regout\) # (\myDebouncer|pressed_reg1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|monostable_state.temporary~regout\,
	datad => \myDebouncer|pressed_reg1~regout\,
	combout => \myDebouncer|Selector0~0_combout\);

-- Location: LCFF_X4_Y5_N5
\myDebouncer|monostable_state.steady\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|toggle_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|Selector0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|monostable_state.steady~regout\);

-- Location: LCCOMB_X4_Y5_N14
\myDebouncer|monostable_state~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \myDebouncer|monostable_state~7_combout\ = (!\myDebouncer|monostable_state.steady~regout\ & \myDebouncer|pressed_reg1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \myDebouncer|monostable_state.steady~regout\,
	datad => \myDebouncer|pressed_reg1~regout\,
	combout => \myDebouncer|monostable_state~7_combout\);

-- Location: LCFF_X4_Y5_N15
\myDebouncer|monostable_state.temporary\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|toggle_clk_filter|clk_out~clkctrl_outclk\,
	datain => \myDebouncer|monostable_state~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|monostable_state.temporary~regout\);

-- Location: LCFF_X4_Y5_N21
\myDebouncer|toggle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \myDebouncer|toggle_clk_filter|clk_out~clkctrl_outclk\,
	sdata => \myDebouncer|monostable_state.temporary~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \myDebouncer|toggle~regout\);

-- Location: PIN_34,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\row[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myScanner|ALT_INV_state.s3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_row(0));

-- Location: PIN_33,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\row[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myScanner|ALT_INV_state.s2~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_row(1));

-- Location: PIN_32,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\row[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myScanner|ALT_INV_state.s1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_row(2));

-- Location: PIN_31,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\row[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myScanner|state.s0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_row(3));

-- Location: PIN_197,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\num[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myCoder|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_num(0));

-- Location: PIN_193,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\num[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myCoder|WideOr2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_num(1));

-- Location: PIN_11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\num[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myCoder|WideOr1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_num(2));

-- Location: PIN_195,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\num[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myCoder|WideOr0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_num(3));

-- Location: PIN_37,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pressed~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myDebouncer|pressed_reg1~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pressed);

-- Location: PIN_36,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\toggle~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \myDebouncer|toggle~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_toggle);
END structure;


