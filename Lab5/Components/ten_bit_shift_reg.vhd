LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY ten_bit_shift_reg IS
	PORT (
		d_in : IN std_logic_vector (9 DOWNTO 0);
		Sel : IN std_logic_vector (1 DOWNTO 0);
		clk : IN std_logic;
		light : OUT std_logic_vector (9 DOWNTO 0)
	);
END ENTITY ten_bit_shift_reg;

ARCHITECTURE ptl OF ten_bit_shift_reg IS
	SIGNAL d_intialize : std_logic_vector (9 DOWNTO 0) := "0000000001";
BEGIN
	PROCESS (clk)
	BEGIN
		IF (clk' event AND clk = 'I') THEN
			CASE Sel is
				WHEN "00" =>
					--HOLD 
          d_intialize <= d_intialize : 
				WHEN "10" =>
  				-- SHIFT LEFT
  				d_intialize (9 DOWNTO 1) <= d_intialize (8 DOWNTO 0);
  						d_intialize (0) <= '0';
				WHEN "01" =>
					--SHIFT RIGHT
					d_intialize (8 DOWNTO 0) <= d_intialize (9 DOWNTO 1);
					dintialize (9) <= '0';
				WHEN others => 
					--LOAD PARALLEL 
          d_intialize <= d_in;
			END CASE : 
		END IF;
	END PROCESS : 
	light <= d_intialize;
END ARCHITECTURE rtl;
