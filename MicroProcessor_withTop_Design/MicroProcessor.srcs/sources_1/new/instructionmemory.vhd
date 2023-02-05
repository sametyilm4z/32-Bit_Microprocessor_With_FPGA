library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instructionmemory is
---------//ports//--------------------------------------
PORT (address: in STD_LOGIC_VECTOR(31 DOWNTO 0);
 	   instruction: out STD_LOGIC_VECTOR(31 DOWNTO 0));
-----------------------------------------------
end instructionmemory;

architecture Behavioralx of instructionmemory is
--------//signals//------------------------
  type vector_of_mem is array(0 to 127) of std_logic_vector (31 downto 0);
  signal memory : vector_of_mem := ( 
"00100000000100000000000000001110", --x"2010000e",	
"00100000000100010000000000001111", --x"2011000f",
"00100000000100100000000000011101",	--x"2012001d",
"00100000000100111111111111110001", --x"2013fff1", 
"00000010001100100100000000100000", --x"02324020", --00000010001100100100000000100000	
"00000010010100000100000000100100",--memory(5) = x"02504024", --	
"01110010000100010100000000000010",--memory(6) = x"72114002",	
"00000010010100000100000000100101",--memory(7) = x"02504025",	
"00110110000010000000000000010000",--memory(8) = x"36080010",	
"00000010000100100100000000100010",--memory(9) = x"02124022",	
"01110010011000000100000000100001",--memory(10) = x"72604021",	
"01110010010000000100000000100000",--memory(11) = x"72404020",	
"00000010000100010100000000101010",--memory(12) = x"0211402a",	
"00000010001100000100000000101010",--memory(13) = x"0230402a",	
"00000000000100010100000010000000",--memory(14) = x"00114080",	
"00000000000100100100000011000010",--memory(15) = x"001240c2"
others => "00000000000000000000000000000000"
 );	

begin

--data<=memory(CONV_INTEGER(address));-- 'data' output will carry the 32b instuction from location specified by 'address'. 
    instruction <= memory(CONV_INTEGER(address(8 downto 2)));
-------------------------------------------------------------------------------
end Behavioralx;