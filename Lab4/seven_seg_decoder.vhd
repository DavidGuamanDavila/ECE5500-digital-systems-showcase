library ieee;
use ieee.std_logic_1164.all;

entity seven_seg_decoder is
port(SW: in std_logic_vector ( 9 downto 0 );
HEX0, HEX1: out std_logic_vector (6 downto 0));
end seven_seg_decoder;

architecture rtl of seven_seg_decoder is
begin

HEX0(6) <= (not SW(3) and not SW(2) and not SW(1)) or (not SW(3) and SW(2) and SW(1) and SW(0)) or (SW(3) and SW(2) and not SW(1) and not SW(0));
HEX0(5) <= (SW(3) and SW(2) and not SW(1) and SW(0)) or (not SW(3) and not SW(2) and SW(0)) or (not SW(3) and not SW(2) and SW(1)) or (not SW(3) and SW(1) and SW(0));
HEX0(4) <= (not SW(3) and SW(2) and not SW(1)) or (not SW(2) and not SW(1) and SW(0)) or (not SW(3) and SW(0));
HEX0(3) <= (not SW(3) and SW(2) and not SW(1) and not SW(0)) or (not SW(2) and not SW(1) and SW(0)) or (SW(2) and SW(1) and SW(0)) or (SW(3) and not SW(2) and SW(1) and not SW(0));
HEX0(2) <= (not SW(3) and not SW(2) and SW(1) and not SW(0))  or (SW(3) and SW(2) and not SW(0)) or (SW(3) and SW(2) and SW(1));
HEX0(1) <= (not SW(3) and SW(2) and not SW(1) and SW(0)) or (SW(3) and SW(2) and not SW(0)) or (SW(3) and SW(1) and SW(0)) or (SW(2) and SW(1) and not SW(0));
HEX0(0) <= (not SW(3) and SW(2) and not SW(1) and not SW(0)) or (not SW(3) and not SW(2) and not SW(1) and SW(0)) or (SW(3) and SW(2) and not SW(1) and SW(0)) or (SW(3) and not SW(2) and SW(1) and SW(0));

HEX1(6) <= (not SW(7) and not SW(6) and not SW(5)) or (not SW(7) and SW(6) and SW(5) and SW(4)) or (SW(7) and SW(6) and not SW(5) and not SW(4));
HEX1(5) <= (SW(7) and SW(6) and not SW(5) and SW(4)) or (not SW(7) and not SW(6) and SW(4)) or (not SW(7) and not SW(6) and SW(5)) or (not SW(7) and SW(5) and SW(4));
HEX1(4) <= (not SW(7) and SW(6) and not SW(5)) or (not SW(6) and not SW(5) and SW(4)) or (not SW(7) and SW(4));
HEX1(3) <= (not SW(7) and SW(6) and not SW(5) and not SW(4)) or (not SW(6) and not SW(5) and SW(4)) or (SW(6) and SW(5) and SW(4)) or (SW(7) and not SW(6) and SW(5) and not SW(4));
HEX1(2) <= (not SW(7) and not SW(6) and SW(5) and not SW(4))  or (SW(7) and SW(6) and not SW(4)) or (SW(7) and SW(6) and SW(5));
HEX1(1) <= (not SW(7) and SW(6) and not SW(5) and SW(4)) or (SW(7) and SW(6) and not SW(4)) or (SW(7) and SW(5) and SW(4)) or (SW(6) and SW(5) and not SW(4));
HEX1(0) <= (not SW(7) and SW(6) and not SW(5) and not SW(4)) or (not SW(7) and not SW(6) and not SW(5) and SW(4)) or (SW(7) and SW(6) and not SW(5) and SW(4)) or (SW(7) and not SW(6) and SW(5) and SW(4));


end rtl;
