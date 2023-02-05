
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PCAdder_tb is
end PCAdder_tb;

architecture Behavioral of PCAdder_tb is
signal PCResult_tb: std_logic_vector (31 downto 0);
signal PCAddResult_tb: std_logic_vector (31 downto 0);

component PCAdder is 
    port(
        PCResult: in std_logic_vector (31 downto 0);
        PCAddResult: out std_logic_vector(31 downto 0)
    );
end component;
begin
UUT: PCAdder port map(
    PCResult => PCResult_tb,
    PCAddResult => PCAddResult_tb
);
process begin
    PCResult_tb <= "11111111111111111111111111111100";
    wait for 10 ns;
    PCResult_tb <= "00000000000000000000000000100000";
    wait for 10 ns;
    PCResult_tb <= "00001010001111000110000000100000";
    wait for 10 ns;
    PCResult_tb <= "00100110110000000000111111010100";
    wait;
end process;
end Behavioral;
