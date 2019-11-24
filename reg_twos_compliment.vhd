library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity reg_twos_compliment is
port(
        D_IN  : in std_logic_vector (7 downto 0);
        CLK   : in std_logic;
        LD 	  : in std_logic;
        CLR   : in std_logic;
		END_FLAG_f:inout std_logic;
        D_OUT : out std_logic_vector (15 downto 0)
        );

end reg_twos_compliment;

architecture struct of reg_twos_compliment is

--------- component declaration for register--------

component register_8bit is
port(
        DATA_IN  : in std_logic_vector (7 downto 0);
        CLOCK    : in std_logic;
        LOAD     : in std_logic;
        CLEAR    : in std_logic;
		END_FLAG : out std_logic;
        DATA_OUT : out std_logic_vector (7 downto 0)
        );

end component;
-------component declaration for twos_compliment----

component twos_compliment  is
port(
        input_compliment : in std_logic_vector (7 downto 0);
        output_compliment : out std_logic_vector(6 downto 0)
);
end component;


component multipler is
	port(
		Operand :	in std_logic_vector(6 downto 0);
		--Result	:	out std_logic_vector(13 downto 0)
		Result	:	out std_logic_vector(15 downto 0)
		);
end component;

component Ripple_Carry_Adder_14bits is
Port (
        A_input_ripple_carry  : in  STD_LOGIC_VECTOR (15 downto 0);
       -- B_input_ripple_carry  : in STD_LOGIC_VECTOR (13 downto 0) := "11111111111111";
		cin 		      	  : in  STD_LOGIC := '0';
        S  		      		  : out STD_LOGIC_VECTOR (15 downto 0);
        C_output_ripple_carry : out STD_LOGIC
);
end component;

signal sig_DATA_OUT_reg : std_logic_vector (7 downto 0);
signal sig_output_comp  : std_logic_vector (6 downto 0);
signal sig_input_RCA    : std_logic_vector (15 downto 0);
signal sig_output_carry_RCA : std_logic ;
--signal sig_DATA_OUT:std_logic_vector(15 downto 0);

begin


--register
reg_map : register_8bit port map (
									DATA_IN  => D_IN,
									CLOCK    => CLK,
									LOAD     => LD,
									CLEAR    => CLR,
									END_FLAG => END_FLAG_f,
									DATA_OUT => sig_DATA_OUT_reg);

--2's compliment block									
twos_map :twos_compliment port map ( 
									input_compliment  => sig_DATA_OUT_reg,
									output_compliment => sig_output_comp);

--Squarer block
multiplier_map :multipler port map (
									Operand => sig_output_comp,
									Result	=> sig_input_RCA
									);

									
--Minus 1 block is done by this block
RCA_map : Ripple_Carry_Adder_14bits port map (
											  A_input_ripple_carry  => sig_input_RCA,
								              cin 		      	    => '0',
								              S  		      		=> D_OUT, 
								              C_output_ripple_carry => sig_output_carry_RCA
											 );
end struct;




