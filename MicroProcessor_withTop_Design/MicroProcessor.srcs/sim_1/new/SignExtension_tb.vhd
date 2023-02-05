library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SignExtension_tb is
end;

architecture behavioral of SignExtension_tb is

  component SignExtension
  PORT (
  A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
  SignImm: out STD_LOGIC_VECTOR(31 DOWNTO 0));
  end component;

  signal A: STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal SignImm: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

  uut: SignExtension port map ( 
    A       => A,
    SignImm => SignImm 
    );
process
  begin
    A <= "0010101010101010";
    wait for 10 ns;
    A <= "1010101010101010";
    wait;
end process;
end;
