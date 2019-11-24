--------------------------------------------------------
--- desinging 1s compliment for the given 8bits --------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

------------------------------------------------------------------
--type data is array (7 down to 0) of integer ; --vector of 8 bits 
------------------------------------------------------------------
entity exor_2s_compliment is
port(
 	A : in std_logic_vector (7 downto 0);
	C : out std_logic_vector(6 downto 0) 
); 

end exor_2s_compliment;
architecture structural of exor_2s_compliment is 

component exor_gate is
port(
    a,b : in  std_logic;
    c   : out std_logic);
end component;

signal c_sig :std_logic_vector(7 downto 0);

begin
--Gate1 : exor_gate port map ( A(7),A(7),c(7) );
Gate2 : exor_gate port map ( A(7),A(6),c(6) );
Gate3 : exor_gate port map ( A(7),A(5),c(5) ); 	
Gate4 : exor_gate port map ( A(7),A(4),c(4) );
Gate5 : exor_gate port map ( A(7),A(3),c(3) );
Gate6 : exor_gate port map ( A(7),A(2),c(2) );
Gate7 : exor_gate port map ( A(7),A(1),c(1) );
Gate8 : exor_gate port map ( A(7),A(0),c(0) );
end  structural;

