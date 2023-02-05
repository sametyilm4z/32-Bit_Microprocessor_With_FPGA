library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ProgramCounter_tb is
end;

architecture Behavioral of ProgramCounter_tb is

  component ProgramCounter is  
  PORT(
  Address: IN STD_LOGIC_VECTOR(31 downto 0):=x"00000000";
  Reset : IN STD_LOGIC;
  Clk : IN STD_LOGIC;
  PCResult: OUT STD_LOGIC_VECTOR(31 downto 0)
  );
  end component;

  signal Address: STD_LOGIC_VECTOR(31 downto 0);
  signal Reset: STD_LOGIC;
  signal Clk: STD_LOGIC;
  signal PCResult: STD_LOGIC_VECTOR(31 downto 0) ;

  constant clock_period: time := 5 ns;
begin
  uut: ProgramCounter port map ( Address  => Address,
                     Reset    => Reset,
                     Clk      => Clk,
                     PCResult => PCResult );
  stimulus: process
  begin
  Clk <= '0';
  wait for clock_period*2;
  Clk <= '1';
  wait for clock_period*2;
  end process;
  
process
begin
    Address <= "11111000001111100000111110000011";
    Reset <= '0';
    wait for clock_period*5;
    Reset <= '1';
    wait for clock_period*4;
    Reset <= '0';    
    --wait for clock_period*5;


    wait;
  end process;

--  clocking: process
--  begin
--    while not stop_the_clock loop
--      Clk <= '0', '1' after clock_period / 2;
--      wait for clock_period;
--    end loop;
--    wait;
--  end process;

end Behavioral;