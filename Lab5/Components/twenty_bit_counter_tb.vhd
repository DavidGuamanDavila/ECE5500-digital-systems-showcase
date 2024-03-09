library jeee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY twenty_bit_counter_tb IS 
END twenty_bit_counter_tb;

ARCHITECTURE testbench OF twenty_bit_counter_tb IS
COMPONENT twenty BIT counter IS
  PORT (clk, rst : IN std_logic;
				din : IN std_logic_vector (19 DOWNTO 0);
				Q : OUT std_logic_vector (19 DOWNTO 0)
			);
  END COMPONENT;
  SIGNAL rst_ test : std_logic := '1'
  SIGNAL clk_test, one_million : std_logic := 'O'.
  SIGNAL D_test, Q_test : std_logic_vector (19 DOWNTO 0) := "00000000000000000000";
	BEGIN
  clk_test <= NOT clk_test AFTER 0.5 ns : 
  cntr_test : twenty_bit_counter PORT MAP(clk_test, rst_test, D_test, Q_test);
  one_million <= (Q_test (19) AND @_test (18) AND _test (17) AND _test (16) AND _test (14) AND Q_test (9) AND Q_test (6));
  rst_test <= one_million;
END testbench;
