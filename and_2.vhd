library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_2 is
    Port ( IN1 : in  STD_LOGIC;    -- AND gate input
           IN2 : in  STD_LOGIC;    -- AND gate input
           OA   : out STD_LOGIC    -- AND gate output
		);	
end and_2;

architecture Behavioral of and_2 is
begin
    OA <= IN1 and IN2;    -- 2 input AND gate
end Behavioral;