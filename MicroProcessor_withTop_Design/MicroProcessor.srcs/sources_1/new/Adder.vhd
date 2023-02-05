library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Adder is
    port(
        signal X, M : in std_logic_vector(31 downto 0);
        signal SUM : out std_logic_vector(31 downto 0)
    );
end entity Adder;


architecture Behavioral of Adder is
    begin
        SUM <= std_logic_vector(signed(X) + signed(M));
end architecture Behavioral;