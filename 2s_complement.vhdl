---------- designig 2's complement by port mapping 
-------------------- 1. ex-or implementations , 2. ripple carry adder ----
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity twos_compliment  is
port(
        input_compliment : in std_logic_vector (7 downto 0);
        output_compliment : out std_logic_vector(6 downto 0)
);
end twos_compliment;

architecture structural of twos_compliment is

--- component of exor-1s-compliment---------
component exor_2s_compliment is
port(
        A : in std_logic_vector (7 downto 0);
        C : out std_logic_vector(6 downto 0)
);

end component;
------ component of ripple carry half adder----
component Ripple_Carry_Adder is
Port (
        C_input_ripple_carry  : in STD_LOGIC_VECTOR (6 downto 0);
        cin_A7: in STD_LOGIC;
        S  : out STD_LOGIC_VECTOR (6 downto 0);
        C_output_ripple_carry : out STD_LOGIC
);
end component;

signal exor_output : std_logic_vector(6 downto 0);
signal sig_A7 : std_logic_vector(7 downto 0);
signal sig_sign_bit,sig_carry_out:std_logic;

begin 

sig_sign_bit<=input_compliment(7);
mapping_exor : exor_2s_compliment port map(
					A => input_compliment,
					C => exor_output
					); 
mapping_RCA : Ripple_Carry_Adder port map(
				C_input_ripple_carry 	=> 	exor_output,
				cin_A7 		     		=> 	sig_sign_bit,
				S      		     		=> 	output_compliment,
				C_output_ripple_carry   =>	sig_carry_out
				);

end structural;
