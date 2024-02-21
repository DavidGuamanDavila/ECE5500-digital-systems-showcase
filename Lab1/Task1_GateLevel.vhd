library ieee;
use ieee.std_logic_1164.all;
entity lab1gate is
	port (A, B, D: in std_logic;
		E: out std_logic);
end lab1gate;
library ieee;
use ieee.std_logic_1164.all;
entity or_gate is 
	port(A, B: in std_logic;
	C: out std_logic);
end or_gate;
architecture OR_gate_arch of or_gate is
begin
	C<= A or B;
end OR_gate_arch;
library ieee;
use ieee.std_logic_1164.all;
entity and_gate is 
	port(A, B: in std_logic;
	C: out std_logic);
end and_gate;
architecture AND_gate_arch of and_gate is
begin
	C<= A and B;
end AND_gate_arch;
architecture gateintegration of lab1gate is
component and_gate is
	port(A, B: in std_logic;
	C: out std_logic);
end component;
component or_gate is
	port(A, B: in std_logic;
	C: out std_logic);
end component;
signal C: std_logic;
begin
	AND_1: and_gate port map(A, B, C);
	OR_1: or_gate port map(C, D, E);

end gateintegration;
