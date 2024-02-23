library ieee;
use ieee.std_logic_1164.all;

entity jk_ff_tb is
end jk_ff_tb;
architecture test of jk_ff_tb is

	component j_k_ff is
		Port ( CLK, J_input, K_input, CLR, PRESET: in bit;
		Q,Qn : out bit);
	end component;
	
	signal preset: bit;
	signal clear: bit;
	signal J_input: bit;
	signal K_input: bit;
	signal CLK_input: bit := '1';
	signal Q_output: bit;
	signal QN_output: bit;
	
	begin
	jk_flip_flop: j_k_ff port map (CLK_input, J_input, K_input, clear, preset, Q_output, QN_output);
	CLK_input <= not CLK_input after 2.5 ns;
	
	preset <= '0' after 5 ns,
					'1' after 15 ns,
					'0' after 30 ns, 
					'1' after 50 ns;
					
	clear <= '1' after 5 ns,
					'0' after 15 ns,
					'1' after 45 ns,
					'1' after 100 ns;
					
	J_input <= '0' after 5 ns,
				'1' after 15 ns,
				'0' after 25 ns, 
				'1' after 30 ns, 
				'0' after 35 ns, 
				'1' after 40 ns, 
				'0' after 70 ns, 
				'1' after 80 ns,
				'0' after 90 ns,
				'1' after 92.5 ns;
				
	K_input <= '0' after 5 ns,
				'1' after 15 ns,
				'0' after 20 ns, 
				'1' after 25 ns, 
				'0' after 30 ns, 
				'1' after 35 ns, 
				'0' after 75 ns,
				'1' after 85 ns,
				'0' after 90 ns,
				'1' after 92.5 ns;
end;
