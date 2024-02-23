entity state_design is
	port (CLK, X: in bit;
			output, Bo: out bit);
end state_design;

architecture behaviour of state_design is
	signal NeXta, NeXtb, A, an, B, bn: bit;
	
	component ff is
	port (D, CLK: in bit;
			Q, Qn: out bit);
	end component;
	begin

	DF0: ff port map (NeXta, CLK, A, an);
	DFF1: ff port map (NeXtb, CLK, B, bn);

	Bo<=B;
	NeXta <= B;
	NeXtb <= (not A);

	output <= A;
end behaviour;

entity ff is
	port (D, CLK: in bit;
			Q, Qn: out bit);
end ff;

architecture dataflowff of ff is 
begin
	process (CLK)
		begin
			if (CLK'event and CLK = '1') then
			Q <= D;
			Qn <= not D;
			end if;
	end process;
end dataflowff;
