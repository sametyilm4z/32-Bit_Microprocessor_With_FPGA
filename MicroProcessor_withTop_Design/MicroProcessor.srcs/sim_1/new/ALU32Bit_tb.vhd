LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU32Bit_tb IS
END ALU32Bit_tb;
 
ARCHITECTURE Behavioral OF ALU32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU32Bit
    PORT(
	A: in std_logic_vector (31 downto 0); --32-Bit input port A.
	B: in std_logic_vector (31 downto 0); --32-Bit input port B.
	ALUControl: in std_logic_vector (3 downto 0); --4-Bit input control bits to select an ALU operation.
-- OUTPUTS:
	ALUResult: out std_logic_vector (31 downto 0);  --32-Bit ALU result output.
	ZERO: out std_logic --1-Bit output flag. 
        );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUControl : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   signal ZERO : std_logic;
 
 --signal i:integer;
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU32Bit PORT MAP (
          A => A,
          B => B,
          ALUControl => ALUControl,
          ALUResult => ALUResult,
          ZERO => ZERO
        );

 

   -- Stimulus process
   stim_proc: process
   begin  
    A <="00010101010011110000001111101001";--00010101010011110000001111101001
    B <="00000000000000000000000000000101";
    ALUControl <= "0000";
    wait for 10 ns;
    ALUControl <= "0001";
    wait for 10 ns;
    ALUControl <= "0010";
    wait for 10 ns;
    ALUControl <= "0011";
    wait for 10 ns;
    ALUControl <= "0100";
    wait for 10 ns;
    ALUControl <= "0101";
    wait for 10 ns;
    ALUControl <= "0110";
    wait for 10 ns;
    ALUControl <= "0111";
    wait for 10 ns;
    ALUControl <= "1000";
    wait for 10 ns;
    ALUControl <= "1001";
    wait for 10 ns;
    ALUControl <= "1010";
    wait for 10 ns;
    ALUControl <= "1011";
    wait for 10 ns;
    ALUControl <= "1100";
    wait;
      -- hold reset state for 100 ns.
--      A <= x"0000000A";
--  B <= x"00000002";
--  ALUControl <= x"0";
  
--  for i in 0 to 15 loop 
--   ALUControl <= ALUControl + x"1";
--   wait for 100 ns;
--  end loop;
--      A <= x"000000F6";
--  B <= x"0000000A";
--      wait;
   end process;

END;