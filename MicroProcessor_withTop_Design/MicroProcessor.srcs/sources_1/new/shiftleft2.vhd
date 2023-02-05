library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftleft2 is
    generic(
        B: integer:=32;
        W: integer:=2
    );
	port (
		entry: in std_logic_vector(B-1 downto 0);
		exitt: out std_logic_vector(B-1 downto 0)
	);
end entity;

architecture behavioral of shiftleft2 is
	signal temp: std_logic_vector(B-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(entry), B));
	exitt <= std_logic_vector(shift_left(signed(temp), 2));
end behavioral;