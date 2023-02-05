library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtension is

PORT (
A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
SignImm: out STD_LOGIC_VECTOR(31 DOWNTO 0)
);

end SignExtension;

architecture Behavioral of SignExtension is
begin
process(A)
begin
    if (A(15) = '0') then
        SignImm(15 downto 0)<=A(15 downto 0);
        SignImm(31 downto 16)<="0000000000000000";
    else
        SignImm(15 downto 0)<=A(15 downto 0);
        SignImm(31 downto 16)<="1111111111111111";
    end if;
end process;
end Behavioral;
