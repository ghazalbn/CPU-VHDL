library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdder1Bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
			  clk : in  STD_LOGIC;
           Sum : out  STD_LOGIC);
end FullAdder1Bit;

architecture Behavioral of FullAdder1Bit is
			
signal s1, c1, c2: std_logic;
begin

	H1: entity work.HAdder
		port map(
			A => A,
			B => B,
			Sum => s1,
			Carry => c1
		);
		
	H2: entity work.HAdder
		port map(
			A => s1,
			B => Cin,
			Sum => Sum,
			Carry => c2
		);
	
	Cout <= c1 or c2;

end Behavioral;