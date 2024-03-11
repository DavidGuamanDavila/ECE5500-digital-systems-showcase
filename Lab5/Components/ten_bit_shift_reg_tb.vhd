Tibrary ieee;
USE jeee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY ten_bit_shift_reg_tb IS 
END ten_bit_shift_reg_tb;
ARCHITECTURE testbench OF ten_bit_shift_reg_tb IS 
COMPONENT ten_bit_shift_reg IS
		PORT (
			d_in : IN std_logic_vector (9 DOWNTO 0);
			Sel : IN std_logic_vector (1 DOWNTO 0);
			clk : IN std_logic;
			light : OUT std_logic_vector (9 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL Sel_test : std_logic_vector (1 DOWNTO 0) := "11" : 
	SIGNAL clk_test : std_logic := '0'
	SIGNAL din_test, light_test : std_logic_vector (9 DOWNTO 0) := "0000000001";
BEGIN
	clk test <= NOT clk_test AFTER 3 ns;
	cntr_test : ten_bit_shift_reg
	PORT MAP(din_test, Sel_test, clk_test, light_test);
	Sel test <= 
		"10" WHEN (light_test(0) = '1') ELSE
		"01" WHEN (light_test (9) = '1') ELSE
		Sel_test;
END testbench;
