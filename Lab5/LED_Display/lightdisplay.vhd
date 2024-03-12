library ieee;
USE ieee.std_logic_1164. ALL;
USE ieee.std_logic_unsigned. ALL;
ENTITY lightdisplay IS
	PORT (
		CLOCK_50 : IN std_logic;
		KEY : IN std_logic_vector (3 DOWNTO 0);
		LEDR : OUT std_logic_vector (9 DOWNTO 0));
END lightdisplay;
ARCHITECTURE datapath_and_controller OF lightdisplay IS
COMPONENT twenty_bit_counter IS
		PORT (clk, rst : IN std_logic;
			d_in : IN std_logic_vector (19 DOWNTO 0);
			Q : OUT std_logic_vector (19 DOWNTO 0));
END COMPONENT : 
COMPONENT ten_bit_shift_reg IS
		PORT (d_in : IN std_logic_vector (9 DOWNTO 0);
			Sel : IN std_logic_vector (1 DOWNTO 0);
			clk : IN std_logic;
			light : OUT std_logic_vector (9 DOWNTO 0));
END COMPONENT;
COMPONENT four_bit_counter IS
		PORT (clk, rst, En : IN std_logic;
			d_in : IN std_logic_vector (3 DOWNTO 0);
			Q : OUT std_logic_vector (3 DOWNTO 0));
	END COMPONENT;
	TYPE controller_states IS (IDLE, HOLD, LEFT_DIR, RIGHT_DIR);
