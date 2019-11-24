library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------
entity Ripple_Carry_Adder_14bits is
Port (
        A_input_ripple_carry  : in  STD_LOGIC_VECTOR (15 downto 0);
        --B_input_ripple_carry  : in STD_LOGIC_VECTOR (13 downto 0) := "11111111111111";--2's complement of '1',if we add 2's complement which is equivalent to subtraction
		cin 		      	  : in  STD_LOGIC := '0';
        S  		      		  : out STD_LOGIC_VECTOR (15 downto 0);
        C_output_ripple_carry : out STD_LOGIC
);
end Ripple_Carry_Adder_14bits;

architecture structural of Ripple_Carry_Adder_14bits is

-- full Adder VHDL Code Component Decalaration-----------------

component full_adder is
Port (
         A : in STD_LOGIC;
         B : in STD_LOGIC;
         Cin : in STD_LOGIC;
         S : out STD_LOGIC;
         Cout : out STD_LOGIC
);

end component;


-- Intermediate Carry declaration-----------------------------

signal C_output_ripple_carry_FA1,C_output_ripple_carry_FA2,C_output_ripple_carry_FA3,C_output_ripple_carry_FA4,C_output_ripple_carry_FA5,C_output_ripple_carry_FA6,
	C_output_ripple_carry_FA7,C_output_ripple_carry_FA8,C_output_ripple_carry_FA9,C_output_ripple_carry_FA10,C_output_ripple_carry_FA11,C_output_ripple_carry_FA12,
	C_output_ripple_carry_FA13,C_output_ripple_carry_FA14,C_output_ripple_carry_FA15 : STD_LOGIC;
signal sig_B_input_ripple_carry:std_logic_vector(15 downto 0) := "1111111111111111";

begin

-- Port Mapping Full Adder 14 times

FA1:  full_adder port map(A_input_ripple_carry(0),sig_B_input_ripple_carry(0),'0',S(0),C_output_ripple_carry_FA1);
FA2:  full_adder port map(A_input_ripple_carry(1),sig_B_input_ripple_carry(1),C_output_ripple_carry_FA1,S(1),C_output_ripple_carry_FA2);
FA3:  full_adder port map(A_input_ripple_carry(2),sig_B_input_ripple_carry(2),C_output_ripple_carry_FA2,S(2),C_output_ripple_carry_FA3);
FA4:  full_adder port map(A_input_ripple_carry(3),sig_B_input_ripple_carry(3),C_output_ripple_carry_FA3,S(3),C_output_ripple_carry_FA4);
FA5:  full_adder port map(A_input_ripple_carry(4),sig_B_input_ripple_carry(4),C_output_ripple_carry_FA4,S(4),C_output_ripple_carry_FA5);
FA6:  full_adder port map(A_input_ripple_carry(5),sig_B_input_ripple_carry(5),C_output_ripple_carry_FA5,S(5),C_output_ripple_carry_FA6);
FA7:  full_adder port map(A_input_ripple_carry(6),sig_B_input_ripple_carry(6),C_output_ripple_carry_FA6,S(6),C_output_ripple_carry_FA7);
FA8:  full_adder port map(A_input_ripple_carry(7),sig_B_input_ripple_carry(7),C_output_ripple_carry_FA7,S(7),C_output_ripple_carry_FA8);
FA9:  full_adder port map(A_input_ripple_carry(8),sig_B_input_ripple_carry(8),C_output_ripple_carry_FA8,S(8),C_output_ripple_carry_FA9);
FA10: full_adder port map(A_input_ripple_carry(9),sig_B_input_ripple_carry(9),C_output_ripple_carry_FA9,S(9),C_output_ripple_carry_FA10);
FA11: full_adder port map(A_input_ripple_carry(10),sig_B_input_ripple_carry(10),C_output_ripple_carry_FA10,S(10),C_output_ripple_carry_FA11);
FA12: full_adder port map(A_input_ripple_carry(11),sig_B_input_ripple_carry(11),C_output_ripple_carry_FA11,S(11),C_output_ripple_carry_FA12);
FA13: full_adder port map(A_input_ripple_carry(12),sig_B_input_ripple_carry(12),C_output_ripple_carry_FA12,S(12),C_output_ripple_carry_FA13);
FA14: full_adder port map(A_input_ripple_carry(13),sig_B_input_ripple_carry(13),C_output_ripple_carry_FA13,S(13),C_output_ripple_carry_FA14);
FA15: full_adder port map(A_input_ripple_carry(14),sig_B_input_ripple_carry(14),C_output_ripple_carry_FA14,S(14),C_output_ripple_carry_FA15);
FA16: full_adder port map(A_input_ripple_carry(15),sig_B_input_ripple_carry(15),C_output_ripple_carry_FA15,S(15),C_output_ripple_carry);


end structural;
