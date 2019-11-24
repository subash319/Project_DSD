library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity partial_prodouct_generator is
	port(
			input_vector 		   : in std_logic_vector(6 downto 0);
			Partial_prodouct_vector: out std_logic_vector(48 downto 0)
		);
end partial_prodouct_generator;	
			
architecture structural of partial_prodouct_generator is
component and_2 is
    Port ( IN1 : in  STD_LOGIC;    -- AND gate input
           IN2 : in  STD_LOGIC;    -- AND gate input
           OA   : out STD_LOGIC    -- AND gate output
		);	
	end component;
begin
   GEN_PP1: 
   for I in 0 to 6 generate
   begin
		GEN_PP2:
		for J in 0 to 6 generate
		begin
		PP_I: and_2 port map(input_vector(J), input_vector(I), Partial_prodouct_vector((7*I)+J));
		--for every bit the partial prodouct is generated with all other
		--bits so there are two for loops.
		--Saving of the result is done by incrementing every time 1.
		end generate GEN_PP2;
   end generate GEN_PP1;
end structural;