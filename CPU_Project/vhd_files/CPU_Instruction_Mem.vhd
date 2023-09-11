library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU_Instruction_Mem is
    Port ( 
        address : in STD_LOGIC_VECTOR (4 downto 0);
        instruction : out STD_LOGIC_VECTOR (14 downto 0)
    );
end CPU_Instruction_Mem;

architecture Behavioral of CPU_Instruction_Mem is

type mem_block is std_logic_vector(14 downto 0);
type mem_array is array(0 to 15) of mem_block;

signal mem_block_0: mem_block := "101100000110111";
signal mem_block_1: mem_block := "101100000110111";
signal mem_block_2: mem_block := "101100000110111";
signal mem_block_3: mem_block := "101100000110111";
signal mem_block_4: mem_block := "101100000110111";
signal mem_block_5: mem_block := "101100000110111";
signal mem_block_6: mem_block := "101100000110111";
signal mem_block_7: mem_block := "101100000110111";
signal mem_block_8: mem_block := "101100000110111";
signal mem_block_9: mem_block := "101100000110111";
signal mem_block_10: mem_block := "101100000110111";
signal mem_block_11: mem_block := "101100000110111";
signal mem_block_12: mem_block := "101100000110111";
signal mem_block_13: mem_block := "101100000110111";
signal mem_block_14: mem_block := "101100000110111";


signal memory : mem_array := (
    mem_block_0,
    mem_block_1,
    mem_block_2,
    mem_block_3,
    mem_block_4,
    mem_block_5,
    mem_block_6,
    mem_block_7,
    mem_block_8,
    mem_block_9,
    mem_block_10,
    mem_block_11,
    mem_block_12,
    mem_block_13,
    mem_block_14
);

begin
    instruction <= memory(
        to_integer(unsigned(address))
    );
end Behavioral;
