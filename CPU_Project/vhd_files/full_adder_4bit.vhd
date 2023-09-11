library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder4Bit is
    Port ( clk : in  STD_LOGIC;
			  A : in  STD_LOGIC_Vector(3 downto 0);
           B : in  STD_LOGIC_Vector(3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC_Vector(3 downto 0)
			  );
end FullAdder4Bit;

architecture Behavioral of FullAdder4Bit is
			
signal c1, c2, c3: std_logic;
begin

	F1: entity work.FullAdder1Bit
		port map(
			clk => clk,
			A => A(0),
			B => B(0),
			Sum => S(0),
			Cin => Cin,
			Cout => c1
		);
		
	F2: entity work.FullAdder1Bit
		port map(
			clk => clk,
			A => A(1),
			B => B(1),
			Sum => S(1),
			Cin => c1,
			Cout => c2
		);
		
	F3: entity work.FullAdder1Bit
		port map(
			clk => clk,
			A => A(2),
			B => B(2),
			Sum => S(2),
			Cin => c2,
			Cout => c3
		);
		
	F4: entity work.FullAdder1Bit
		port map(
			clk => clk,
			A => A(3),
			B => B(3),
			Sum => S(3),
			Cin => c3,
			Cout => Cout
		);

end Behavioral;



