library ieee;
use ieee.std_logic_1164.ALL;


entity UpDownCounter_tb is
end UpDownCounter_tb;


architecture tb of UpDownCounter_tb is

   signal CLK_input: bit;
   signal EN_input: bit;
   signal X_input: bit;
   signal Q_output: bit_vector(1 downto 0);
	
	component UpDownCounter is
		Port(EN, X, CLK: in bit;
				Result_Count: out bit_vector(1 downto 0));
   end component;
  
   begin


   CLK_input <= not CLK_input after 2.5 ns;


   EN_input <= '0' after 5 ns,
           '1' after 9 ns,
           '0' after 50 ns,
           '1' after 60 ns,
           '0' after 95 ns;

   X_input <= '1' after 4 ns,
           '0' after 34 ns,
           '1' after 54 ns,
           '0' after 68 ns,
           '1' after 94 ns;
	up_down_counter: UpDownCounter port map(EN_input, X_input, CLK_input, Q_output);

end;
