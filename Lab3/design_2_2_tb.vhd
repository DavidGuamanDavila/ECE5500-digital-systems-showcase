entity design_2_2_test is
end design_2_2_test;

architecture test of design_2_2_test is
signal clock, input, o1, bout:bit;

component state_dia_design is
	port (CLK, X: in bit;
			output, Bo: out bit);
end component;

begin
	SMD: state_dia_design port map (clock, input, o1, bout);
	clock <= not clock after 10 ns;
	input <= bout;
end test;
	
