library ieee;
use ieee.std_logic_1164.all;

entity reg_2_bits is
	port(
		d	: in std_logic_vector(1 downto 0);
		clk	: in std_logic;
		pr, cl	: in std_logic;
		nrw	: in std_logic;
		s	: out std_logic_vector(1 downto 0)
	);
end reg_2_bits;

architecture reg2bit of reg_2_bits is
	component reg_1_bit is
    port(
        nrw : in std_logic;
        din : in std_logic;
        clear, clock : in std_logic;
        dout : out std_logic
    );
	end component;
	
begin
	u_reg0 : reg_1_bit port map(nrw, d(0), clk, cl,  s(0));
	u_reg1 : reg_1_bit port map(nrw, d(1), clk, cl, s(1));
	
end architecture;
