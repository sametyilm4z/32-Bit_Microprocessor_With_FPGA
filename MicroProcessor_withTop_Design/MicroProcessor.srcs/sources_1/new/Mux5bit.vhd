library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5bit is
    Port ( SS : in STD_LOGIC;
           AA : in STD_LOGIC_VECTOR (4 downto 0);
           BB : in STD_LOGIC_VECTOR (4 downto 0);
           YY : out STD_LOGIC_VECTOR (4 downto 0));
end Mux5bit;

architecture Behavioral of Mux5bit is
begin
    process(AA, BB, SS)
    begin
    if(SS = '1') then
        YY <= AA;
    else
        YY <= BB;
    end if;
    end process;
end Behavioral;
