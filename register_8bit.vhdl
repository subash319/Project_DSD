library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity register_8bit is 
port(
	DATA_IN  : in std_logic_vector (7 downto 0):="00000000";
	CLOCK    : in std_logic;
	LOAD     : in std_logic;
	CLEAR    : in std_logic;
	END_FLAG : out std_logic:='0';
	DATA_OUT : out std_logic_vector (7 downto 0)
	);
	
end register_8bit;
architecture behav of register_8bit is 
signal count   : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin 
    process (clock,clear)
    begin
    if clear = '1' then
        DATA_OUT <= "00000000";
    elsif  clock'event and clock = '1' and falling_edge(load) then
    --Here is one doubt, since load and clock are generated similarly the register can't be set senstive to the posedge of clock and neg edge of load
    --if load = '0' then
        --if falling_edge(load) then
            DATA_OUT <= DATA_IN;
			count <=count+'1';
			END_FLAG<='1';
    end if;
	if count =  X"FF" then
				END_FLAG <= '0';
	end if;
    end process;
end behav;




