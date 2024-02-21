library ieee;
use ieee.std_logic_1164.all;

entity lab1 is
	port(A, B, D: in std_logic;
		E: out std_logic);
end lab1;

architecture dataflow of lab1 is
	signal C: std_logic;
begin
	C <= A and B;
	E <= C or D;
end dataflow;  
