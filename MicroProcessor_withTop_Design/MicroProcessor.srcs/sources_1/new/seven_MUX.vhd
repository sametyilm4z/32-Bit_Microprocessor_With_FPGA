library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_MUX is
    Port ( S : in std_logic_vector(3 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           A: in std_logic_vector (31 downto 0);
           Y : out STD_LOGIC_VECTOR (31 downto 0):= x"00000000"
           );
end seven_MUX;

architecture Behavioral of seven_MUX is

signal Hold: std_logic_vector(6 downto 0);
begin
 
 process(S)
 begin
     if S = "1001" then
        Y <= B;
     else 
        Y <= A;
     end if;
end process;
    
end Behavioral;