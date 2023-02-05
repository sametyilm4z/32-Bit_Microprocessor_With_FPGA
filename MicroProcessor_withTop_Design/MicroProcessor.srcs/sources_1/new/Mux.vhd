library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0));
end Mux;

architecture Behavioral of Mux is
begin
    process(A, B, S)
    begin
    if(S = '1') then
        Y <= A;
    else
        Y <= B;
    end if;
    end process;
end Behavioral;
