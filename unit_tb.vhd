-- multiplier_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity unit_tb is
--The entity is empty since the test bench is nothing but
-- a black box
end unit_tb;

architecture behave of unit_tb is

--Signal Declarations
signal sig_D_IN  : std_logic_vector (7 downto 0):= (others => '0');
signal sig_CLK   : std_logic:='0';
signal sig_LD    : std_logic:='1';
signal sig_CLR   : std_logic:='1';
signal sig_END_FLAG : std_logic:='0';
signal sig_D_OUT : std_logic_vector (15 downto 0);
signal sig_ctrl  : std_logic:='0';

constant CLK_PERIOD:time:=100ns;


component reg_twos_compliment is
port(
	D_IN  : in std_logic_vector (7 downto 0);
    CLK   : in std_logic;
    LD    : in std_logic;
    CLR   : in std_logic;
	END_FLAG_f:out std_logic;
    D_OUT : out std_logic_vector (15 downto 0)
    );

end component;

begin
	clk_generation : process
	begin
		sig_CLK <= '0';
		wait for CLK_PERIOD / 2;
		sig_CLK <= '1';
		wait for CLK_PERIOD / 2;
	end process clk_generation;
	
	load_gen : process
	begin
				sig_LD <= '1';
				wait for CLK_PERIOD / 2;
				sig_LD <= '0';
				wait for CLK_PERIOD / 2;
	end process load_gen;
	
	--Instantaion of the complete circuit
	dut:entity work.reg_twos_compliment
	port map(
			 D_IN 	=>	sig_D_IN, 
	         CLK    =>	sig_CLK,  
	         LD     =>	sig_LD,   
	         CLR    =>	sig_CLR,
			 END_FLAG_f=> sig_END_FLAG,
	         D_OUT  =>	sig_D_OUT
			);
	
	simulation:process
	begin
		sig_CLR <= '1';
		wait for CLK_PERIOD;
		--sig_LD	<=	'0';
		sig_CLR	<=	'0';
		for I in -127 to 127 loop
		--output_1 <= conv_std_logic_vector(input_1, output_1'length);
			sig_D_IN <= conv_std_logic_vector(I, sig_D_IN'length);--, conv_std_logic_vector((I+1), sig_Operand'length) after 20ns;
			wait for 100ns;
		end loop;
		sig_ctrl<='1';
	
	end process simulation;
end behave;