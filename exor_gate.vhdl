---  exor gate ----
-- this is designed to implement 2' complement for the given 8 bit number ----
-- SUCCESS --- 
 
library ieee;
use ieee.std_logic_1164.all;
entity exor_gate is
port(
    a,b : in  std_logic;
    c   : out std_logic);
end exor_gate;

architecture behave of exor_gate is
begin
  
  c <=  a xor b;
end behave;