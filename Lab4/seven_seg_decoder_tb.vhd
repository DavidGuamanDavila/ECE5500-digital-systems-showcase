LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

entity decoder_tb is
end decoder_tb ;

architecture rtl_tb of decoder_tb is

	component seven_seg_decoder is
		port( X3, X2, X1, X0 : in std_logic;
				D6, D5, D4, D3, D2, D1, D0 : out std_logic);
	end component;
	
	signal X3_in, X2_in, X1_in, X0_in: std_logic := '0';	
	signal D6_out, D5_out, D4_out, D3_out, D2_out, D1_out, D0_out: std_logic;
	
	begin
	
	dut: seven_seg_decoder port map(X3_in, X2_in, X1_in, X0_in, D6_out, D5_out, D4_out, D3_out, D2_out, D1_out, D0_out);
	
	
	X3_in <= not X3_in after 2 ns;
	X2_in <= not X2_in after 4 ns;
	X1_in <= not X1_in after 8 ns;
	X0_in <= not X0_in after 16 ns;

	
end rtl_tb;
