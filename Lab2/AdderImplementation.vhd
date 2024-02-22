-- Top Level System Implementation
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top_level_system is
	port(A, B: in std_logic_vector(7 downto 0);
			OP: in std_logic_vector(1 downto 0);
			F: out std_logic_vector(7 downto 0);
			Overflow: out std_logic);
end top_level_system;

architecture data_flow_top_level_system of top_level_system is
	signal A_AND_B: std_logic_vector(7 downto 0);
	signal A_OR_B: std_logic_vector(7 downto 0);
	signal Result: std_logic_vector(7 downto 0);
	signal B_mux: std_logic_vector(7 downto 0);
	signal B_not: std_logic_vector(7 downto 0);
	signal cary_out: std_logic;


	component mux_four_to_one_eight_bits is 
		Port(sel: in std_logic_vector(1 downto 0);
			R, E, T, V: in  std_logic_vector(7 downto 0);
			L: out std_logic_vector(7 downto 0));
	end component;
	
	component mux_two_to_one_one_bit is
		Port(sel_one: in std_logic;
			K, M: in  std_logic;
			J: out std_logic);
	end component;
	
	component mux_two_to_one_eight_bits is
		Port(Sel_One: in std_logic;
			I, Y: in  std_logic_vector(7 downto 0);
			X: out std_logic_vector(7 downto 0));
	end component;
	
	component eight_bit_adder is
		Port(X,Y : in std_logic_vector(7 downto 0);
			Cary_in: in std_logic;
			Z: out std_logic_vector(7 downto 0);
			Cary_out: out std_logic);
	end component;

begin
	B_not <= not B;
	A_AND_B <= A and B;
	A_OR_B <= A or B;
	two_to_one_mux_8bit: mux_two_to_one_eight_bits port map (OP(0), B, B_not, B_mux);  
	adder_eight_bit: eight_bit_adder port map (A, B_mux, OP(0), Result, cary_out);
	four_to_one_mux: mux_four_to_one_eight_bits port map(OP, A_AND_B, A_OR_B, Result, Result, F);
	two_to_one_mux_1bit: mux_two_to_one_one_bit port map (OP(1), '0' , cary_out, Overflow);
	
end data_flow_top_level_system;


--Four to One Mux Implementation For 8 bit inputs
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_four_to_one_eight_bits is
	Port(sel: in std_logic_vector(1 downto 0);
		R, E, T, V: in  std_logic_vector(7 downto 0);
		L: out std_logic_vector(7 downto 0));
end mux_four_to_one_eight_bits;

architecture data_behaviour_mux_four_to_one_eight_bits of mux_four_to_one_eight_bits is
begin

	with sel select
	L <= R when "00",
			E when "01",
			T when "10",
			V when "11",
			"00000000" when others;
end data_behaviour_mux_four_to_one_eight_bits;


--Two to One Mux Implementation For 1 bit inputs
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_two_to_one_one_bit is
	Port(sel_one: in std_logic;
		K, M: in  std_logic;
		J: out std_logic);
end mux_two_to_one_one_bit;

architecture data_behaviour_mux_two_to_one_one_bit of mux_two_to_one_one_bit is
begin
	J <= K when (sel_one = '0') else M;
end data_behaviour_mux_two_to_one_one_bit;

--Two to One Mux Implementation For 8 bit inputs
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_two_to_one_eight_bits is
	Port(Sel_One: in std_logic;
		I, Y: in  std_logic_vector(7 downto 0);
		X: out std_logic_vector(7 downto 0));
end mux_two_to_one_eight_bits;

architecture data_behaviour_mux_two_to_one_eight_bits of mux_two_to_one_eight_bits is
begin
	X <= I when (Sel_One = '0') else Y;
end data_behaviour_mux_two_to_one_eight_bits;

		
-- Eight Bit Adder Implementation
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity eight_bit_adder is
	port(X,Y : in std_logic_vector(7 downto 0);
			Cary_in: in std_logic;
			Z: out std_logic_vector(7 downto 0);
			Cary_out: out std_logic);
end eight_bit_adder;


architecture dataflow_Full_Adder of eight_bit_adder is
	signal Cary: std_logic_vector(6 downto 0);

	component full_adder is
	port(A,B,C_in: in std_logic;
			Sum, C_out: out std_logic);
	end component;
	
begin
	adder0:full_adder port map(X(0),Y(0),Cary_in,Z(0),Cary(0));
	adder1:full_adder port map(X(1),Y(1),Cary(0),Z(1),Cary(1));
	adder2:full_adder port map(X(2),Y(2),Cary(1),Z(2),Cary(2));
	adder3:full_adder port map(X(3),Y(3),Cary(2),Z(3),Cary(3));
	adder4:full_adder port map(X(4),Y(4),Cary(3),Z(4),Cary(4));
	adder5:full_adder port map(X(5),Y(5),Cary(4),Z(5),Cary(5));
	adder6:full_adder port map(X(6),Y(6),Cary(5),Z(6),Cary(6));
	adder7:full_adder port map(X(7),Y(7),Cary(6),Z(7),Cary_out);
end dataflow_Full_Adder;


-- Full Adder Implementation
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity full_adder is
	port(A,B,C_in: in std_logic;
			Sum, C_out: out std_logic);
end full_adder;

architecture dataflow_fulladder of full_adder is
	signal A_xor_B: std_logic;
	signal C_in_and_A_xorB: std_logic;
	signal A_and_B: std_logic;
begin
	A_xor_B <= A xor B;
	C_in_and_A_xorB <= C_in and A_xor_B;
	A_and_B <= A and B;
	Sum <= C_in xor A_xor_B;
	C_out <= C_in_and_A_xorB or A_and_B;
end dataflow_fulladder;	
