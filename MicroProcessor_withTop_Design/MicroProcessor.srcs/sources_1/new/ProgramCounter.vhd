LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ProgramCounter IS 
PORT(
Address: IN STD_LOGIC_VECTOR(31 downto 0); -- input
Reset : IN STD_LOGIC; -- async. clear.
Clk : IN STD_LOGIC; -- clock.
PCResult: OUT STD_LOGIC_VECTOR(31 downto 0) -- output.
);
END ProgramCounter;

ARCHITECTURE Behavioral of ProgramCounter is
BEGIN
process(Clk, Reset)
begin
if rising_edge(Clk) then
    if Reset = '1' then
    PCResult <= x"00000000";
    else -- rising_edge(Clk) then
    PCResult <= Address;
    end if;
end if;
--        if ld = '1' then
--            PCResult <= Address;
--        end if;

end process;
end Behavioral;