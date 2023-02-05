library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Controller is
---------//ports//---------
PORT (
Op: in STD_LOGIC_VECTOR(5 DOWNTO 0);--The opcode from the current instruction
Funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
--which select specific data paths depending on the instruction
MemRead: out std_logic;
MemtoReg: out STD_LOGIC;
MemWrite: out STD_LOGIC;
ALUControl: out STD_LOGIC_VECTOR(3 DOWNTO 0);
ALUSrc: out STD_LOGIC;
RegDst: out STD_LOGIC;
RegWrite: out STD_LOGIC;
PCSrc: out std_logic
);
---------------------------
end Controller;

architecture Behavioral of Controller is
----------//signals//------------
signal outputVector: std_logic_vector(6 downto 0);
---------------------------------
begin
---------//code//----------------

----------ALUControl--ALUOp--------------------------
process(Op, Funct)
begin
case Op is
    when "000000" => case Funct is 
                        when "100000" => ALUControl <= "0000"; -- add
                                       outputVector <= "0110000";
                        when "100010" => ALUControl <= "0001"; -- sub
                                       outputVector <= "0110000";
                        when "100100" => ALUControl <= "0011";-- and
                                       outputVector <= "0110000";
                        when "100101" => ALUControl <= "0100"; -- or
                                       outputVector <= "0110000";
                        when "101010" => ALUControl <= "0101"; -- set less than
                                       outputVector <= "0110000";
                        when "111001" => ALUControl <= "0110"; -- set equal
                                       outputVector <= "0110000";
                        when "111010" => ALUControl <= "0111"; -- set not equal than
                                       outputVector <= "0110000";
                        when "000000" => ALUControl <= "1000"; -- shift left
                                       outputVector <= "1110000";
                        when "000010" => ALUControl <= "1001"; -- shift right
                                       outputVector <= "1110000";
                        when "000110" => ALUControl <= "1010"; -- rotate right
                                       outputVector <= "0110000"; --ilk bite bir daha bak
                        when others => ALUControl <= "0000";
                                     outputVector <= "0110000";
                      end case;
    when "011100" => case Funct is
                        when "100001" => ALUControl <= "1011"; -- clo 
                                       outputVector <= "0110000";
                        when "100000" => ALUControl <= "1100"; -- clz
                                       outputVector <= "0110000";
                        when "000010" => ALUControl <= "0010"; -- mul
                                       outputVector <= "0110000";
                        when others => ALUControl <= "0000";
                                     outputVector <= "0110000";
                     end case;
    when "001000" => ALUControl <= "0000"; -- add immediate
                   outputVector <= "1010000";
    when "001101" => ALUControl <= "0100"; -- or immediate
                   outputVector <= "1010000";
    when others => ALUControl <="0000";
                   outputVector <= "0110000";
end case;
end process;

ALUSrc <= outputVector(6);
RegDst <= outputVector(5);
RegWrite <= outputVector(4);
MemRead <= outputVector(3);
MemWrite <= outputVector(2);
MemtoReg <= outputVector(1);
PCSrc <= outputVector(0);
end Behavioral;

