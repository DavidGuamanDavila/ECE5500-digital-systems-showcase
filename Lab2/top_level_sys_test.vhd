library ieee;
use ieee.math_real.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity top_level_sys_test is
end top_level_sys_test;

library ieee;
use ieee.math_real.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity random_generator_one is port(random_number_one: out std_logic_vector(7 downto 0) := "00000000");
end random_generator_one;

architecture behavior_one_random_generator of random_generator_one is

begin

process
    variable seed_a, seed_b: positive;
    variable random_real_num: real;
    variable range_of_random : real := 255.0;
begin
		-- Generate a random number
    uniform(seed_a, seed_b, random_real_num);
	  -- Rescale to 0..1000 and convertion of integer
    random_number_one <= std_logic_vector(to_unsigned(integer(random_real_num*range_of_random),8)); 
    wait for 5 ns;
end process;

end behavior_one_random_generator;

library ieee;
use ieee.math_real.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity random_generator_two is port(random_number_two: out std_logic_vector(7 downto 0) := "00000000");
end random_generator_two;

architecture behavior_two_random_generator of random_generator_two is

begin

process
    variable seed_a, seed_b: positive;
    variable random_real_num: real;
    variable range_of_random : real := 255.0; 
begin
seed_b := seed_a;
seed_a := seed_b;
	-- Generate a random number
    uniform(seed_a, seed_b, random_real_num); 
	-- Rescale to 0..1000 and convertion of integer	 
    random_number_two <= std_logic_vector(to_unsigned(integer(random_real_num*range_of_random),8)); 
    wait for 5 ns;
end process;

end behavior_two_random_generator;

architecture test_sys of top_level_sys_test is


component top_level_system is port(A, B: in std_logic_vector(7 downto 0);
												OP: in std_logic_vector(1 downto 0);
												F: out std_logic_vector(7 downto 0);
												Overflow: out std_logic);
end component;

component random_generator_one is port (random_number_one: out std_logic_vector(7 downto 0) := "00000000");
end component;

component random_generator_two is port (random_number_two: out std_logic_vector(7 downto 0) := "00000000");
end component;

signal Input_A_test, Input_B_test, f_test: std_logic_vector(7 downto 0);
signal Sel_OP_test: std_logic_vector(1 downto 0) := "00";
signal Overflow_test: std_logic;

begin

ArithmeticLogicUnit: top_level_system port map (Input_A_test, Input_B_test, Sel_OP_test, f_test, Overflow_test);
random_num_one: random_generator_one port map (Input_A_test);
random_num_two: random_generator_two port map (Input_B_test);

Sel_OP_test <= Sel_OP_test+"1" after 5 ns;

end test_sys;
