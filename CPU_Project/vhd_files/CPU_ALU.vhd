library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ALU is
    Port ( 
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        x : out STD_LOGIC_VECTOR (3 downto 0)
    );
end CPU_ALU;

architecture Behavioral of CPU_ALU is
begin
    x <= a xor b ;
end Behavioral;
