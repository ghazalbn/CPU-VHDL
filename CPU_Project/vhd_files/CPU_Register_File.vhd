library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU_Register_File is
    Port ( 
        clk: in std_logic ;
        RegWrite : in STD_LOGIC_VECTOR (4 downto 0);
        write_data : in STD_LOGIC_VECTOR (3 downto 0);
        read_reg1 : in STD_LOGIC_VECTOR (4 downto 0);
        read_data1 : out STD_LOGIC_VECTOR (3 downto 0);
        read_reg2 : in STD_LOGIC_VECTOR (4 downto 0);
        read_data2 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end CPU_Register_File;

architecture Behavioral of CPU_Register_File is

type register_block is std_logic_vector(3 downto 0);
type register is array (0 to 31) of register_block;

signal register_block31: register_block := "00011111"
signal register_block30: register_block := "00011110"
signal register_block29: register_block := "00011101"
signal register_block28: register_block := "00011100"
signal register_block27: register_block := "00011011"
signal register_block26: register_block := "00011010"
signal register_block25: register_block := "00011001"
signal register_block24: register_block := "00011000"
signal register_block23: register_block := "00010111"
signal register_block22: register_block := "00010110"
signal register_block21: register_block := "00010101"
signal register_block20: register_block := "00010100"
signal register_block19: register_block := "00010011"
signal register_block18: register_block := "00010010"
signal register_block17: register_block := "00010001"
signal register_block16: register_block := "00010000"
signal register_block15: register_block := "00001111"
signal register_block14: register_block := "00001110"
signal register_block13: register_block := "00001101"
signal register_block12: register_block := "00001100"
signal register_block11: register_block := "00001011"
signal register_block10: register_block := "00001010"
signal register_block9: register_block := "00001001"
signal register_block8: register_block := "00001000"
signal register_block7: register_block := "00000111"
signal register_block6: register_block := "00000110"
signal register_block5: register_block := "00000101"
signal register_block4: register_block := "00000100"
signal register_block3: register_block := "00000011"
signal register_block2: register_block := "00000010"
signal register_block1: register_block := "00000001"
signal register_block0: register_block := "00000000"

signal RegisterFile: register := (
    register_block0,
    register_block1,
    register_block2,
    register_block3,
    register_block4,
    register_block5,
    register_block6,
    register_block7,
    register_block8,
    register_block9, 
    register_block10, 
    register_block11,
    register_block12,
    register_block13,
    register_block14,
    register_block15,
    register_block16,
    register_block17,
    register_block18, 
    register_block19,
    register_block20,
    register_block21,
    register_block22,
    register_block23,
    register_block24,
    register_block25,
    register_block26,
    register_block27,
    register_block28,
    register_block29,
    register_block30,
    register_block31,
);
begin
    read_data1 <= RegisterFile(
        to_integer(unsigned(read_reg1))
    );

    read_data2 <= RegisterFile(
        to_integer(unsigned(read_reg2))
    );

    process (clk)
    begin 

        if rising_edge(clk) then 
            RegisterFile(
                to_integer(unsigned(RegWrite))
            ) <= write_data ;
        end if;

    end process;
end Behavioral;
