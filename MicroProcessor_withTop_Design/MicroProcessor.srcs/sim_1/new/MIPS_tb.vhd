library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MIPS_tb is
end;

architecture bench of MIPS_tb is

  component MIPS
      port(
      clk : in std_logic;
      Reset: in std_logic;
      Mips_out: out std_logic_vector(31 downto 0)
      );
  end component;

  signal clk_tb: std_logic;
  signal Reset_tb: std_logic ;
  signal Mips_out_tb: std_logic_vector(31 downto 0);

begin

  uut: MIPS port map ( clk   => clk_tb,
                       Reset => Reset_tb,
                       Mips_out => Mips_out_tb );
 clocking: process
  begin
    clk_tb <= '0';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns ;
  end process;
  
process
begin
Reset_tb <= '0';
wait for 21 ns;
Reset_tb <= '1';
wait for 22 ns;
Reset_tb <= '0';


wait;
end process;


end;