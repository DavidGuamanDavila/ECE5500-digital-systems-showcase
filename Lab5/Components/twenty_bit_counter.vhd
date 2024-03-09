LIBRARY ieee;
USE ieee.std.
_ logic_1164.all;
USE ieee.std_logic_unsigned.all;
ENTITY twenty_bit_counter IS
	PORT (clk, rst : IN std_logic;
		    d_in : IN std_logic_vector (19 DOWNTO 0);
		    Q : OUT std_logic_vector (19 DOWNTO 0));
END twenty_bit_counter;
  
ARCHITECTURE rtl OF twenty_bit_counter IS
	SIGNAL data_initalize : std_logic_vector (19 DOWNTO 0) := "00000000000000000000";
    BEGIN
	    PROCESS (clk)
	    BEGIN
		  IF (clk' event) AND (clk = '1') THEN
			  IF (rst = "1') THEN
				data_initalize‹ = d_in;
			  ELSE
				data_initalize <= data_initalize + '1';
			  END IF 
      END IF;
			END PROCESS;
			Q <= data initalize : 
END rtl;
