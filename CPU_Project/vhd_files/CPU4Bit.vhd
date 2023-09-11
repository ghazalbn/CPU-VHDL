library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CPU_4Bit is
end CPU_4Bit;

architecture Behavioral of CPU_4Bit is
    
    Component CPU_ALU is
    Port ( 
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        x : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end Component;

    Component FullAdder4Bit is
    Port ( 
        clk : in  STD_LOGIC;
	    A : in  STD_LOGIC_Vector(3 downto 0);
        B : in  STD_LOGIC_Vector(3 downto 0);
        Cin : in  STD_LOGIC;
        Cout : out  STD_LOGIC;
        S : out  STD_LOGIC_Vector(3 downto 0)
	);
    end Component;

    Component CPU_Instruction_Mem is
        Port ( 
            address : in STD_LOGIC_VECTOR (4 downto 0);
            instruction : out STD_LOGIC_VECTOR (14 downto 0)
        );
    end Component;
    
    Component CPU_Register_File is
        Port ( 
            clk: in std_logic;
            RegWrite : in STD_LOGIC_VECTOR (4 downto 0);
            write_data : in STD_LOGIC_VECTOR (3 downto 0));
            read_reg1 : in STD_LOGIC_VECTOR (4 downto 0);
            read_data1 : out STD_LOGIC_VECTOR (3 downto 0);
            read_reg2 : in STD_LOGIC_VECTOR (4 downto 0);
            read_data2 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end Component;


    signal clk: std_logic := '0';
    Signal PC: integer := 0;
    signal instruction : std_logic_vector(14 downto 0);
    signal read_reg1, read_reg2, RegWrite : std_logic_vector(4 downto 0);
    signal read_data1, read_data2, write_data: std_logic_vector(3 downto 0);

begin

    I_M: CPU_Instruction_Mem port map( 
        address <= std_logic_vector(to_unsigned(PC, 5)), 
        instruction <= instruction 
    );

    -- split
    read_reg1 <= instruction(14 downto 10) ; 
    read_reg2 <= instruction(9 downto 5) ; 
    RegWrite <= instruction(4 downto 0);

    R_F: CPU_Register_File port map(
        clk => clk 
        RegWrite => RegWrite, 
        write_data => write_data,    
        read_reg1 => read_reg1, 
        read_data1 => read_data1, 
        read_reg2 => read_reg2, 
        read_data2= > read_data2,
    );

    A_L: CPU_ALU port map(
        a => read_data1, 
        b => read_data2, 
        c => write_data
    );

    process (clk)
    begin
        if rising_edge(clk) then
            if PC == 0 then
                F1: FullAdder4Bit Port map( 
                    clk <= clk,
                    A <= to_unsigned(PC, 5),
                    B <= '00011',
                    Cin <= '0',
                    Cout <= None,
                    S <= PC
                );
                --PC <= PC + 3;
                
            elsif PC < 15 then
                F1: FullAdder4Bit Port map( 
                    clk <= clk,
                    A <= to_unsigned(PC % 15, 5),
                    B <= '00011',
                    Cin <= '0',
                    Cout <= None,
                    S <= PC
                );
                --PC <= PC + 4;
            else
                PC <= 0;
            end if;
        end if;
    end process;
    clock_process: process
    begin
        clk <= 0;
        wait for 5 ns;
        clk <= 0;
        wait for 5 ns;
        wait; 
    end process;
end Behavioral;
