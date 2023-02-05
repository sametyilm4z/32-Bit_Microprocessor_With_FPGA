library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Controller_tb is
end;

architecture bench of Controller_tb is

  component Controller
  PORT (
  Op: in STD_LOGIC_VECTOR(5 DOWNTO 0);
  Funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
  
  MemRead: out std_logic;
  MemtoReg: out STD_LOGIC;
  MemWrite: out STD_LOGIC;
  ALUControl: out STD_LOGIC_VECTOR(3 DOWNTO 0);
  ALUSrc: out STD_LOGIC;
  RegDst: out STD_LOGIC;
  RegWrite: out STD_LOGIC;
  PCSrc: out std_logic
  );
  end component;

  signal Op: STD_LOGIC_VECTOR(5 DOWNTO 0);
  signal Funct: STD_LOGIC_VECTOR(5 DOWNTO 0);
  signal MemRead: std_logic;
  signal MemtoReg: STD_LOGIC;
  signal MemWrite: STD_LOGIC;
  signal ALUControl: STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal ALUSrc: STD_LOGIC;
  signal RegDst: STD_LOGIC;
  signal RegWrite: STD_LOGIC;
  signal PCSrc: std_logic ;

begin

  uut: Controller port map ( Op         => Op,
                             Funct      => Funct,
                             MemRead    => MemRead,
                             MemtoReg   => MemtoReg,
                             MemWrite   => MemWrite,
                             ALUControl => ALUControl,
                             ALUSrc     => ALUSrc,
                             RegDst     => RegDst,
                             RegWrite   => RegWrite,
                             PCSrc      => PCSrc );

  stimulus: process
  begin
  Op <= "000000";
  Funct <= "100000";
  wait for 10 ns;
  Funct <= "100010";
  wait for 10 ns;
  Funct <= "100100";
  wait for 10 ns;
  Funct <= "100101";
  wait for 10 ns;
  Funct <= "101010";
  wait for 10 ns;
  Funct <= "111001";
  wait for 10 ns;
  Funct <= "111010";
  wait for 10 ns;
  Funct <= "000000";
  wait for 10 ns;
  Funct <= "000010";
  wait for 10 ns;
  Op <= "011100";
  Funct <= "100001";
  wait for 10 ns;
  Funct <= "100000";
  wait for 10 ns;
  Funct <= "000010";
  wait for 10 ns;
  Op <= "001000";
  wait for 10 ns;
  Op <= "001101";
  wait for 10 ns;
  Op <= "000000";
  Funct <= "000110";
  wait;
  
  end process;


end;
