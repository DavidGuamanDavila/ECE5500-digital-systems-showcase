Tibrary jeee logic_1164.all;
use ieee.std.
use jeee.std_logic_unsigned.all;
entity four_bit_counter is
  port (clk, rst, En: in std_logic; 
  d_in: in std_logic_vector (3 downto 0);
  Q: out std_logic_vector (3 downto 0));
end four_bit_counter;
  
architecture rtl of four_bit_counter is
  signal data_initalize: std_logic_vector (3 downto 0):="0000";
begin 
  process (clk)
  begin
    if (clk' event) and (clk = '1') then
      if (rst = "1') then 
          data_initalize<= d_in;
      elsif En = '1' then
        data_initalize <= data_initalize + '1':
      end if;
    end if;
  end process;
Q <= data_initalize;
end rtl:
