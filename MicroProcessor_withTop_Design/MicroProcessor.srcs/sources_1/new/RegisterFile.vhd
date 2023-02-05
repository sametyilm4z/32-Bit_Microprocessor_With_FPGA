library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is 
port(
    ReadRegister1: in std_logic_vector(4 downto 0);
    ReadRegister2: in std_logic_vector(4 downto 0);
    WriteRegister: in std_logic_vector(4 downto 0);
    WriteData: in std_logic_vector(31 downto 0);
    RegWrite: in std_logic;
    clk: in std_logic;
    
    ReadData1: out std_logic_vector(31 downto 0):=x"00000000";
    ReadData2: out std_logic_vector(31 downto 0):=x"00000000"
);
end RegisterFile;

architecture Behavioral of RegisterFile is

signal register0: std_logic_vector(31 downto 0):= x"00000000";
signal register1: std_logic_vector(31 downto 0):= x"00000000";
signal register2: std_logic_vector(31 downto 0):= x"00000000";
signal register3: std_logic_vector(31 downto 0):= x"00000000";
signal register4: std_logic_vector(31 downto 0):= x"00000000";
signal register5: std_logic_vector(31 downto 0):= x"00000000";
signal register6: std_logic_vector(31 downto 0):= x"00000000";
signal register7: std_logic_vector(31 downto 0):= x"00000000";
signal register8: std_logic_vector(31 downto 0):= x"00000000";
signal register9: std_logic_vector(31 downto 0):= x"00000000";
signal register10: std_logic_vector(31 downto 0):= x"00000000";
signal register11: std_logic_vector(31 downto 0):= x"00000000";
signal register12: std_logic_vector(31 downto 0):= x"00000000";
signal register13: std_logic_vector(31 downto 0):= x"00000000";
signal register14: std_logic_vector(31 downto 0):= x"00000000";
signal register15: std_logic_vector(31 downto 0):= x"00000000";
signal register16: std_logic_vector(31 downto 0):= x"00000000";
signal register17: std_logic_vector(31 downto 0):= x"00000000";
signal register18: std_logic_vector(31 downto 0):= x"00000000";
signal register19: std_logic_vector(31 downto 0):= x"00000000";
signal register20: std_logic_vector(31 downto 0):= x"00000000";
signal register21: std_logic_vector(31 downto 0):= x"00000000";
signal register22: std_logic_vector(31 downto 0):= x"00000000";
signal register23: std_logic_vector(31 downto 0):= x"00000000";
signal register24: std_logic_vector(31 downto 0):= x"00000000";
signal register25: std_logic_vector(31 downto 0):= x"00000000";
signal register26: std_logic_vector(31 downto 0):= x"00000000";
signal register27: std_logic_vector(31 downto 0):= x"00000000";
signal register28: std_logic_vector(31 downto 0):= x"00000000";
signal register29: std_logic_vector(31 downto 0):= x"00000000";
signal register30: std_logic_vector(31 downto 0):= x"00000000";
signal register31: std_logic_vector(31 downto 0):= x"00000000";

begin

    process(clk, WriteRegister)
    begin
        if RegWrite = '1' then
            if rising_edge(clk) then
                case WriteRegister is
                    when "00000" => register0 <= WriteData;
                    when "00001" => register1 <= WriteData;
                    when "00010" => register2 <= WriteData;
                    when "00011" => register3 <= WriteData;
                    when "00100" => register4 <= WriteData;
                    when "00101" => register5 <= WriteData;
                    when "00110" => register6 <= WriteData;
                    when "00111" => register7 <= WriteData;
                    when "01000" => register8 <= WriteData;
                    when "01001" => register9 <= WriteData;
                    when "01010" => register10 <= WriteData;
                    when "01011" => register11 <= WriteData;
                    when "01100" => register12 <= WriteData;
                    when "01101" => register13 <= WriteData;
                    when "01110" => register14 <= WriteData;
                    when "01111" => register15 <= WriteData;
                    when "10000" => register16 <= WriteData;
                    when "10001" => register17 <= WriteData;
                    when "10010" => register18 <= WriteData;
                    when "10011" => register19 <= WriteData;
                    when "10100" => register20 <= WriteData;
                    when "10101" => register21 <= WriteData;
                    when "10110" => register22 <= WriteData;
                    when "10111" => register23 <= WriteData;
                    when "11000" => register24 <= WriteData;
                    when "11001" => register25 <= WriteData;
                    when "11010" => register26 <= WriteData;
                    when "11011" => register27 <= WriteData;
                    when "11100" => register28 <= WriteData;
                    when "11101" => register29 <= WriteData;
                    when "11110" => register30 <= WriteData;
                    when "11111" => register31 <= WriteData;
                    when others => register31 <= WriteData;
                end case;    
        end if;
      end if;
    end process;
    
    process(clk,ReadRegister1, ReadRegister2)
    begin
        if falling_edge(clk) then
            case ReadRegister1 is
                when "00000" => ReadData1 <= register0 ;
                when "00001" => ReadData1 <= register1 ;
                when "00010" => ReadData1 <= register2 ;
                when "00011" => ReadData1 <= register3 ;
                when "00100" => ReadData1 <= register4 ;
                when "00101" => ReadData1 <= register5 ;
                when "00110" => ReadData1 <= register6 ;
                when "00111" => ReadData1 <= register7 ;
                when "01000" => ReadData1 <= register8 ;
                when "01001" => ReadData1 <= register9 ;
                when "01010" => ReadData1 <= register10 ;
                when "01011" => ReadData1 <= register11 ;
                when "01100" => ReadData1 <= register12 ;
                when "01101" => ReadData1 <= register13 ;
                when "01110" => ReadData1 <= register14 ;
                when "01111" => ReadData1 <= register15 ;
                when "10000" => ReadData1 <= register16 ;
                when "10001" => ReadData1 <= register17 ;
                when "10010" => ReadData1 <= register18 ;
                when "10011" => ReadData1 <= register19 ;
                when "10100" => ReadData1 <= register20 ;
                when "10101" => ReadData1 <= register21 ;
                when "10110" => ReadData1 <= register22 ;
                when "10111" => ReadData1 <= register23 ;
                when "11000" => ReadData1 <= register24 ;
                when "11001" => ReadData1 <= register25 ;
                when "11010" => ReadData1 <= register26 ;
                when "11011" => ReadData1 <= register27 ;
                when "11100" => ReadData1 <= register28 ;
                when "11101" => ReadData1 <= register29 ;
                when "11110" => ReadData1 <= register30 ;
                when "11111" => ReadData1 <= register31 ;
                when others => ReadData1 <= register31 ;
            end case;
            case ReadRegister2 is
                    when "00000" => ReadData2 <= register0 ;
                    when "00001" => ReadData2 <= register1 ;
                    when "00010" => ReadData2 <= register2 ;
                    when "00011" => ReadData2 <= register3 ;
                    when "00100" => ReadData2 <= register4 ;
                    when "00101" => ReadData2 <= register5 ;
                    when "00110" => ReadData2 <= register6 ;
                    when "00111" => ReadData2 <= register7 ;
                    when "01000" => ReadData2 <= register8 ;
                    when "01001" => ReadData2 <= register9 ;
                    when "01010" => ReadData2 <= register10 ;
                    when "01011" => ReadData2 <= register11 ;
                    when "01100" => ReadData2 <= register12 ;
                    when "01101" => ReadData2 <= register13 ;
                    when "01110" => ReadData2 <= register14 ;
                    when "01111" => ReadData2 <= register15 ;
                    when "10000" => ReadData2 <= register16 ;
                    when "10001" => ReadData2 <= register17 ;
                    when "10010" => ReadData2 <= register18 ;
                    when "10011" => ReadData2 <= register19 ;
                    when "10100" => ReadData2 <= register20 ;
                    when "10101" => ReadData2 <= register21 ;
                    when "10110" => ReadData2 <= register22 ;
                    when "10111" => ReadData2 <= register23 ;
                    when "11000" => ReadData2 <= register24 ;
                    when "11001" => ReadData2 <= register25 ;
                    when "11010" => ReadData2 <= register26 ;
                    when "11011" => ReadData2 <= register27 ;
                    when "11100" => ReadData2 <= register28 ;
                    when "11101" => ReadData2 <= register29 ;
                    when "11110" => ReadData2 <= register30 ;
                    when "11111" => ReadData2 <= register31 ;
                    when others => ReadData2 <= register31 ;
                end case;
        end if;
    end process;



end Behavioral;