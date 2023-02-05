library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity dataMemory_tb is
end;

architecture bench of dataMemory_tb is

  component dataMemory
    port(
      clk  : in std_logic;
      memWrite  : in std_logic;
      memRead   : in std_logic;
      address       : in std_logic_vector(31 downto 0);
      writeData     : in std_logic_vector(31 downto 0);
      readData      : out std_logic_vector(31 downto 0)
    );
  end component;

  signal clk_tb: std_logic;
  signal memWrite_tb: std_logic;
  signal memRead_tb: std_logic;
  signal address_tb: std_logic_vector(31 downto 0);
  signal writeData_tb: std_logic_vector(31 downto 0);
  signal readData_tb: std_logic_vector(31 downto 0) ;

  --constant clock_period: time := 10 ns;
  --signal stop_the_clock: boolean;

begin

  uut: dataMemory port map ( clk       => clk_tb,
                             memWrite  => memWrite_tb,
                             memRead   => memRead_tb,
                             address   => address_tb,
                             writeData => writeData_tb,
                             readData  => readData_tb );

  clocking: process
  begin
    clk_tb <= '0';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns ;
  end process;

process
 begin
--    readData_tb <= "00000000001100000000000000010101";
--    writeData_tb <= "00000000000000000000010000001101";
--    address_tb <= "11111000001111100000111110000011";
--    memWrite_tb <= '0';
--    wait for 25 ns;
--    memRead_tb <= '0';
--    wait for 20 ns;
 
--    wait for 20 ns;

--    wait;
    memRead_tb <= '0';
    address_tb   <= "00000000000000000000000000000101";
	writeData_tb <= x"11112222";
	memWrite_tb  <= '0';
	WAIT FOR 5 ns;
	memWrite_tb <= '1';
	WAIT FOR 10 ns;
	memWrite_tb <= '0';
	WAIT FOR 10 ns;
	address_tb   <= "00000000000000000000000000001101";
	writeData_tb <= x"33334444";
	memWrite_tb  <= '0';
	WAIT FOR 10 ns;
	memWrite_tb <= '1';
	WAIT FOR 10 ns;
	memWrite_tb <= '0';
	WAIT FOR 10 ns;
	-- read two memory locations
	address_tb <= "00000000000000000000000000000101";
	memRead_tb <= '0';
	WAIT FOR 10 ns;
	memRead_tb <= '1';
	WAIT FOR 10 ns;
	memRead_tb <= '0';
	WAIT FOR 10 ns;
	address_tb <= "00000000000000000000000000001101";
	memRead_tb <= '0';
	WAIT FOR 10 ns;
	memRead_tb <= '1';
	WAIT FOR 10 ns;
	memRead_tb <= '0';
	--WAIT FOR 10 ns;
	wait;
	--ASSERT false
	--REPORT "END"
	--	SEVERITY failure;

 end process;

end;