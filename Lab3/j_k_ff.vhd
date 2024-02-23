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
