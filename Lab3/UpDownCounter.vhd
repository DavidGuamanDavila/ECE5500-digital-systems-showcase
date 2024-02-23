library ieee;
use ieee.std_logic_1164.ALL;

entity UpDownCounter is
	Port(EN, X, CLK: in bit;
			Result_Count: out bit_vector(1 downto 0));
end UpDownCounter;

architecture behavior of UpDownCounter is
	signal J_and_K_input_JK_FF2: bit;
	signal Q_output: bit_vector(1 downto 0);
	signal Qn_output: bit_vector(1 downto 0);
	signal Preset, CLR: bit:='1';
	
	component j_k_ff is
		Port (CLK, J_input, K_input, CLR, PRESET: in bit;
		Q,Qn : out bit);
	end component;
	begin
	
	J_and_K_input_JK_FF2 <= EN and (X xnor Q_output(0));

	JK_FF2: j_k_ff port map(CLK, J_and_K_input_JK_FF2, J_and_K_input_JK_FF2, CLR, Preset, Q_output(1), Qn_output(1));
	JK_FF1: j_k_ff port map(CLK, EN, EN, CLR, Preset, Q_output(0), Qn_output(0));

	Result_Count <= Q_output;
	
end behavior;
	
library ieee;
use ieee.std_logic_1164.ALL;

entity j_k_ff is
		Port (CLK, J_input, K_input, CLR, PRESET: in bit;
		Q,Qn : out bit);
end j_k_ff;


architecture behavior_jk_ff of j_k_ff is
begin

	process(CLR,PRESET,CLK)
	variable qinput,qinput_a: bit;
begin

	qinput_a:=(J_input and (not qinput)) or ((not K_input) and qinput);

	if(CLR='0' and PRESET='0') then 
		qinput:='1';
		Qn<='1';
	elsif CLR='0' then 
		qinput:='0';
		Qn<='1';
	elsif PRESET='0' then 
		qinput:='1';
		Qn<='0';
	else
		qinput:=qinput_a;
		Qn<=not qinput_a;
	end if;
	Q<=qinput;

end process;
end behavior_jk_ff;


