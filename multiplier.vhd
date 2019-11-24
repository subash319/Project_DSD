library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity multipler is
	port(
		Operand :	in std_logic_vector(6 downto 0);
		--Result	:	out std_logic_vector(13 downto 0)
		Result	:	out std_logic_vector(15 downto 0)
		);
end multipler;

architecture structural of multipler is

component partial_prodouct_generator is
	port(
			input_vector 		   : in std_logic_vector(6 downto 0);
			Partial_prodouct_vector: out std_logic_vector(48 downto 0)
		);
end component;

component half_adder is
Port (
         A : in STD_LOGIC;
         B : in STD_LOGIC;
         S : out STD_LOGIC;
         Cout : out STD_LOGIC
	);
end component;
component full_adder is
Port (
	 A : in STD_LOGIC;
	 B : in STD_LOGIC;
	 Cin : in STD_LOGIC;
	 S : out STD_LOGIC;
	 Cout : out STD_LOGIC
	);
end component;
signal sig_partial_prod_vec	: std_logic_vector(48 downto 0);
signal sig_c2,sig_c3				: std_logic;
signal sig_s41,sig_s42,	sig_c41,sig_c42	,sig_s51,sig_c51,sig_c52,sig_s61,sig_c61,sig_s62,
			sig_c62,sig_c63,sig_s71,sig_c71,sig_s72,sig_c72,sig_c73,sig_s81,sig_c81,sig_s82,sig_c82,sig_c83,
				sig_s91,sig_c91,sig_s92,sig_c92,sig_s101,sig_c101,sig_c102,sig_c111 : std_logic;

begin
PPR:partial_prodouct_generator port map(input_vector=>Operand,
										Partial_prodouct_vector=>sig_partial_prod_vec);
Result(0)<=Operand(0);
Result(1)<='0';
R2:half_adder port map(sig_partial_prod_vec(7),sig_partial_prod_vec(8),Result(2),sig_c2);
R3:half_adder port map(sig_c2,sig_partial_prod_vec(14),Result(3),sig_c3);
R41:full_adder port map(sig_partial_prod_vec(9),sig_partial_prod_vec(16),sig_partial_prod_vec(21),sig_s41,sig_c41);
R42:half_adder port map(sig_s41,sig_c3,Result(4),sig_c42);

R51:full_adder port map(sig_partial_prod_vec(22),sig_partial_prod_vec(4),sig_c41,sig_s51,sig_c51);
R52:half_adder port map(sig_c42,sig_s51,Result(5),sig_c52);

R61:full_adder port map(sig_partial_prod_vec(17),sig_partial_prod_vec(29),sig_partial_prod_vec(35),sig_s61,sig_c61);
R62:full_adder port map(sig_partial_prod_vec(24),sig_c51,sig_s61,sig_s62,sig_c62);
R63:half_adder port map(sig_c52,sig_s62,Result(6),sig_c63);

R71:full_adder port map(sig_partial_prod_vec(18),sig_partial_prod_vec(12),sig_partial_prod_vec(42),sig_s71,sig_c71);
R72:full_adder port map(sig_s71,sig_c61,sig_c62,sig_s72,sig_c72);
R73:half_adder port map(sig_c63,sig_s72,Result(7),sig_c73);

R81:full_adder port map(sig_partial_prod_vec(25),sig_partial_prod_vec(19),sig_partial_prod_vec(13),sig_s81,sig_c81);
R82:full_adder port map(sig_s81,sig_c71,sig_partial_prod_vec(32),sig_s82,sig_c82);
R83:full_adder port map(sig_c73,sig_c72,sig_s82,Result(8),sig_c83);

R91:full_adder port map(sig_partial_prod_vec(20),sig_partial_prod_vec(26),sig_c81,sig_s91,sig_c91);
R92:full_adder port map(sig_s91,sig_c82,sig_c83,Result(9),sig_c92);

R101:full_adder port map(sig_partial_prod_vec(27),sig_partial_prod_vec(33),sig_partial_prod_vec(40),sig_s101,sig_c101);
R102:full_adder port map(sig_s101,sig_c91,sig_c92,Result(10),sig_c102);

R111:full_adder port map(sig_partial_prod_vec(34),sig_c101,sig_c102,Result(11),sig_c111);

R121:full_adder port map(sig_partial_prod_vec(41),sig_partial_prod_vec(48),sig_c111,Result(12),Result(13));
Result(14)<='0';
Result(15)<='0';


end structural;