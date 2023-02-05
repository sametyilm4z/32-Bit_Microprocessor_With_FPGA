library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile_tb is
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is

signal ReadRegister1_tb: std_logic_vector(4 downto 0);
signal ReadRegister2_tb: std_logic_vector(4 downto 0);
signal WriteRegister_tb: std_logic_vector(4 downto 0);
signal WriteData_tb: std_logic_vector(31 downto 0);
signal RegWrite_tb: std_logic;
signal clk_tb: std_logic;
    
signal ReadData1_tb: std_logic_vector(31 downto 0);
signal ReadData2_tb: std_logic_vector(31 downto 0);

component RegisterFile is
port(
    ReadRegister1: in std_logic_vector(4 downto 0);
    ReadRegister2: in std_logic_vector(4 downto 0);
    WriteRegister: in std_logic_vector(4 downto 0);
    WriteData: in std_logic_vector(31 downto 0);
    RegWrite: in std_logic;
    clk: in std_logic;
    
    ReadData1: out std_logic_vector(31 downto 0);
    ReadData2: out std_logic_vector(31 downto 0)
);
end component;
begin

UUT: RegisterFile port map(
    ReadRegister1 => ReadRegister1_tb,
    ReadRegister2 => ReadRegister2_tb,
    WriteRegister => WriteRegister_tb,
    WriteData => WriteData_tb,
    RegWrite => RegWrite_tb,
    clk => clk_tb,
    ReadData1 => ReadData1_tb,
    ReadData2 => ReadData2_tb
);
----------------
  process
  begin
    clk_tb <= '0';
    wait for 10 ns;
    clk_tb <= '1';
    wait for 10 ns ;
  end process;
 ---------------
 
 process
 begin
    ReadRegister1_tb <= "00011";
    ReadRegister2_tb <= "00100";
    WriteData_tb <= "00000000001100000000000000001101";
    WriteRegister_tb <= "00000";
    RegWrite_tb <= '0';
    wait for 25 ns;
    RegWrite_tb <= '1';
    wait for 20 ns;
    WriteRegister_tb <= "00011";
    wait for 20 ns;
    WriteRegister_tb <= "00100";
    wait;
 end process;


end Behavioral;