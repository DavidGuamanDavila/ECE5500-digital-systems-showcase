library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity four_bit_counter_tb is
end four_bit_counter_tb;

architecture tb of four_bit_counter_tb is
component four_bit_counter is
  port (clk, rst, En: in std_logic; 
        d_in: in std_logic_vector (3 downto 0);
        Q: out std_logic_vector (3 downto 0));
  end component;
  signal rst_test, en_test: std_logic := '1';
  signal clk_test: std_logic:="0';
  signal D_test, Q_test: std_logic_vector (3 downto 0):= "0000";
  begin
  clk test <= not clk_test after 3 ns;
  counter_test : four_bit_counter port map (clk_test, rst_test, en_test, D_test, O_test);
  rst_test <= Q_test (3);
  en test <="or after 9 ns, '1' after 19 ns;
end tb;
