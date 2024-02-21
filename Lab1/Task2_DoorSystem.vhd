library ieee;
use ieee.std_logic_1164.all;

entity door_system is
	port(A, B, C, D, E, F: in std_logic;
			D1, D2, D3, D4, D5, D6, Alarm: out std_logic);
end door_system;

architecture dataflow_doors of door_system is
begin
	D1 <= ((not A) and (not B) and C)and E; --(A'^B'^C)^E
	D2 <= ((not A) and B and (not C)) and F; --(A'^B^C')^F
	D3 <= ((not A) and B and C and D) or ((not A) and B and (not C) and E); --(A'^B^C^D) or (A'^B^C'^E)
	D4 <= (A and (not B) and (not C)) and (D and E); --(A^B'^C')^D^E
	D5 <= (A and (not B) and C) and ((not D) and E); --(A^B'^C)^D'^E
	D6 <= (A and B and (not C)) and D; --(A^B^C')^D
	Alarm <= A and B and C; --(A^B^C)
end dataflow_doors;
