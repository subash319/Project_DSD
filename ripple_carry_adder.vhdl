library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------
entity Ripple_Carry_Adder is
Port ( 
	C_input_ripple_carry  : in STD_LOGIC_VECTOR (6 downto 0);
	cin_A7: in STD_LOGIC;
	S  : out STD_LOGIC_VECTOR (6 downto 0);
	C_output_ripple_carry : out STD_LOGIC
);
end Ripple_Carry_Adder;

architecture Behavioral of Ripple_Carry_Adder is

-- Half Adder VHDL Code Component Decalaration-----------------

component half_adder
  
Port (
         A : in STD_LOGIC;
         B : in STD_LOGIC;
         S : out STD_LOGIC;
         Cout : out STD_LOGIC
);

end component;

-- Intermediate Carry declaration-----------------------------

signal carry_HA1,carry_HA2,carry_HA3,carry_HA4,carry_HA5,carry_HA6: STD_LOGIC;

begin

-- Port Mapping Full Adder 7  times
HA1: half_adder port map( cin_A7, C_input_ripple_carry(0), S(0), carry_HA1 );
HA2: half_adder port map( carry_HA1, C_input_ripple_carry(1), S(1), carry_HA2 );
HA3: half_adder port map( carry_HA2, C_input_ripple_carry(2), S(2), carry_HA3 );
H44: half_adder port map( carry_HA3, C_input_ripple_carry(3), S(3), carry_HA4 );
HA5: half_adder port map( carry_HA4, C_input_ripple_carry(4), S(4), carry_HA5 );
HA6: half_adder port map( carry_HA5, C_input_ripple_carry(5), S(5), carry_HA6 );
HA7: half_adder port map( carry_HA6, C_input_ripple_carry(6), S(6), C_output_ripple_carry  );

end Behavioral;


