library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;


entity ALU32Bit is 
  Port ( 	
 
	A: in std_logic_vector (31 downto 0); --32-Bit input port A.
	B: in std_logic_vector (31 downto 0); --32-Bit input port B.
	ALUControl: in std_logic_vector (3 downto 0); --4-Bit input control bits to select an ALU operation.
	ALUResult: out std_logic_vector (31 downto 0);  --32-Bit ALU result output.
	ZERO: out std_logic --1-Bit output flag. 
);
end ALU32Bit;

architecture Behavioral of ALU32Bit is
signal operationResult: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal shiftleft: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal shiftright: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal shiftAmount: STD_LOGIC_VECTOR(4 DOWNTO 0);


begin

--process(ALUControl)
--begin
--if(ALUControl = "1000") then
--    shiftAmount <= B(10 downto 6);
--end if;

--if(ALUControl = "1001") then
--    shiftAmount <= B(10 downto 6);
--end if;
--end process;
shiftAmount <= B(10 downto 6);
process(shiftAmount)
begin
case shiftAmount is 
         when "00000" => shiftleft <= A;
         when "00001" => shiftleft <= A(30 DOWNTO 0) & '0';
         when "00010" => shiftleft <= A(29 DOWNTO 0) & "00";
         when "00011" => shiftleft <= A(28 DOWNTO 0) & "000";
         when "00100" => shiftleft <= A(27 DOWNTO 0) & "0000";
         when "00101" => shiftleft <= A(26 DOWNTO 0) & "00000";
         when "00110" => shiftleft <= A(25 DOWNTO 0) & "000000";
         when "00111" => shiftleft <= A(24 DOWNTO 0) & "0000000";
         when "01000" => shiftleft <= A(23 DOWNTO 0) & "00000000";
         when "01001" => shiftleft <= A(22 DOWNTO 0) & "000000000";
         when "01010" => shiftleft <= A(21 DOWNTO 0) & "0000000000";
         when "01011" => shiftleft <= A(20 DOWNTO 0) & "00000000000";
         when "01100" => shiftleft <= A(19 DOWNTO 0) & "000000000000";
         when "01101" => shiftleft <= A(18 DOWNTO 0) & "0000000000000";
         when "01110" => shiftleft <= A(17 DOWNTO 0) & "00000000000000";
         when "01111" => shiftleft <= A(16 DOWNTO 0) & "000000000000000";
         when "10000" => shiftleft <= A(15 DOWNTO 0) & "0000000000000000";
         when "10001" => shiftleft <= A(14 DOWNTO 0) & "00000000000000000";
         when "10010" => shiftleft <= A(13 DOWNTO 0) & "000000000000000000";
         when "10011" => shiftleft <= A(12 DOWNTO 0) & "0000000000000000000";
         when "10100" => shiftleft <= A(11 DOWNTO 0) & "00000000000000000000";
         when "10101" => shiftleft <= A(10 DOWNTO 0) & "000000000000000000000";
         when "10110" => shiftleft <= A(9 DOWNTO 0) & "0000000000000000000000";
         when "10111" => shiftleft <= A(8 DOWNTO 0) & "00000000000000000000000";
         when "11000" => shiftleft <= A(7 DOWNTO 0) & "000000000000000000000000";
         when "11001" => shiftleft <= A(6 DOWNTO 0) & "0000000000000000000000000";
         when "11010" => shiftleft <= A(5 DOWNTO 0) & "00000000000000000000000000";
         when "11011" => shiftleft <= A(4 DOWNTO 0) & "000000000000000000000000000";
         when "11100" => shiftleft <= A(3 DOWNTO 0) & "0000000000000000000000000000";
         when "11101" => shiftleft <= A(2 DOWNTO 0) & "00000000000000000000000000000";
         when "11110" => shiftleft <= A(1 DOWNTO 0) & "000000000000000000000000000000";
         when "11111" => shiftleft <= A(0) & "0000000000000000000000000000000";
         when others => shiftleft <= A(0) & "0000000000000000000000000000000";
     end case;
     case shiftAmount is 
         when "00000" => shiftright <= A;
         when "00001" => shiftright <= '0' & A(31 DOWNTO 1);
         when "00010" => shiftright <= "00" & A(31 DOWNTO 2);
         when "00011" => shiftright <= "000" & A(31 DOWNTO 3);
         when "00100" => shiftright <= "0000" & A(31 DOWNTO 4);
         when "00101" => shiftright <= "00000" & A(31 DOWNTO 5);
         when "00110" => shiftright <= "000000" & A(31 DOWNTO 6);
         when "00111" => shiftright <= "0000000" & A(31 DOWNTO 7);
         when "01000" => shiftright <= "00000000" & A(31 DOWNTO 8);
         when "01001" => shiftright <= "000000000" & A(31 DOWNTO 9);
         when "01010" => shiftright <= "0000000000" & A(31 DOWNTO 10);
         when "01011" => shiftright <= "00000000000" & A(31 DOWNTO 11);
         when "01100" => shiftright <= "000000000000" & A(31 DOWNTO 12);
         when "01101" => shiftright <= "0000000000000" & A(31 DOWNTO 13);
         when "01110" => shiftright <= "00000000000000" & A(31 DOWNTO 14);
         when "01111" => shiftright <= "000000000000000" & A(31 DOWNTO 15);
         when "10000" => shiftright <= "0000000000000000" & A(31 DOWNTO 16);
         when "10001" => shiftright <= "00000000000000000" & A(31 DOWNTO 17);
         when "10010" => shiftright <= "000000000000000000" & A(31 DOWNTO 18);
         when "10011" => shiftright <= "0000000000000000000" & A(31 DOWNTO 19);
         when "10100" => shiftright <= "00000000000000000000" & A(31 DOWNTO 20);
         when "10101" => shiftright <= "000000000000000000000" & A(31 DOWNTO 21);
         when "10110" => shiftright <= "0000000000000000000000" & A(31 DOWNTO 22);
         when "10111" => shiftright <= "00000000000000000000000" & A(31 DOWNTO 23);
         when "11000" => shiftright <= "000000000000000000000000" & A(31 DOWNTO 24);
         when "11001" => shiftright <= "0000000000000000000000000" & A(31 DOWNTO 25);
         when "11010" => shiftright <= "00000000000000000000000000" & A(31 DOWNTO 26);
         when "11011" => shiftright <= "000000000000000000000000000" & A(31 DOWNTO 27);
         when "11100" => shiftright <= "0000000000000000000000000000" & A(31 DOWNTO 28);
         when "11101" => shiftright <= "00000000000000000000000000000" & A(31 DOWNTO 29);
         when "11110" => shiftright <= "000000000000000000000000000000" & A(31 DOWNTO 30);
         when "11111" => shiftright <= "0000000000000000000000000000000" & A(31);
         when others => shiftright <=  "00000000000000000000000000000000";
     end case;
end process;


    process(A,B, ALUControl)
	variable count : unsigned(31 downto 0) := x"00000000";
	variable z: STD_LOGIC_VECTOR(63 DOWNTO 0):= x"0000000000000000";
	--variable shiftAmount: STD_LOGIC_VECTOR(4 DOWNTO 0);
	begin
	
	
		case ALUControl is
			when "0000" => operationResult <= A + B; --addition
			when "0001" => operationResult <= A - B; --subtraction
			when "0010" => z := (A * B); --multiplication
                operationResult <= z(31 downto 0); 			 
			when "0011" => operationResult <= A and B; --and
			when "0100" => operationResult <= A or B; --or
			when "0101" => -- Less than comparison
               if(A<B) then
                operationResult <= x"00000001" ;
               else
                operationResult <= x"00000000" ;
               end if; 
			when "0110" => -- Equal comparison   
               if(A=B) then
                operationResult <= x"00000001" ;
               else
                operationResult <= x"00000000" ;
               end if;
			when "0111" => -- Not equal comparison
               if(A /= B) then
                operationResult <= x"00000001" ;
               else
                operationResult <= x"00000000" ;
               end if; 
			when "1000" => operationResult <= shiftleft;
			when "1001" => operationResult <= shiftright;                          
			when "1010" => operationResult <= std_logic_vector(unsigned(A) ror to_integer(unsigned(B)));
            when "1011" =>
                count := x"00000000";
                for i in 0 to 31 loop   --check for all the bits.
                    if(A(i) = '1') then --check if the bit is '1'
                        count := count + 1; --if its one, increment the count.
                    end if;
                end loop;
                operationResult <= std_logic_vector(count);
            when "1100" =>
                count := x"00000000";
                for i in 0 to 31 loop   --check for all the bits.
                    if(A(i) = '0') then --check if the bit is '0'
                        count := count + 1; --if its zero, increment the count.
                    end if;
                end loop;
                operationResult <= std_logic_vector(count); 
			when others => NULL; 
		end case;

	end process;
	
process(operationResult)
begin		
		if operationResult = 0 then
		  ZERO <= '1';
		else
		  ZERO <= '0';
		end if;
		
end process;

ALUResult <= operationResult;
end Behavioral;