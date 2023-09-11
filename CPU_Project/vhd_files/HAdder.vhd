library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end HAdder;

architecture Behavioral of HAdder is

begin
	
	Sum <= A xor B;
	Carry <= A and B;

end Behavioral;

