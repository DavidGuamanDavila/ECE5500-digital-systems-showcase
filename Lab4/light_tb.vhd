LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

entity lighttest is
end lighttest;

architecture test of lighttest is

	component light is
		PORT(x1, x2 : IN STD_LOGIC ;
		f : OUT STD_LOGIC);
	end component;
	
	signal x1_input, x2_input: std_logic := '0';	
	signal f_output: std_logic;
	
	begin
	
	l0: light port map(x1_input, x2_input, f_output);
	
	
	x1_input <= '0',  '1' after 5 ns, 
			'0' after 10 ns,
			'1' after 15 ns;
			
	x2_input <= '0','1' after 10 ns;
	
end test;
	
	
