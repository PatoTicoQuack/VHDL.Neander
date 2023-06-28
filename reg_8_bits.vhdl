library ieee;
use ieee.std_logic_1164.all;

entity reg_8_bits is
	port(
		d	: in std_logic_vector(7 downto 0);
		clk	: in std_logic;
		pr, cl	: in std_logic;
		nrw	: in std_logic;
		s	: out std_logic_vector(7 downto 0)
	);
end reg_8_bits;

architecture reg8bit of reg_8_bits is
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
	u_reg2 : reg_1_bit port map(nrw, d(2), clk, cl, s(2));
	u_reg3 : reg_1_bit port map(nrw, d(3), clk, cl, s(3));
	u_reg4 : reg_1_bit port map(nrw, d(4), clk, cl, s(4));
	u_reg5 : reg_1_bit port map(nrw, d(5), clk, cl, s(5));
	u_reg6 : reg_1_bit port map(nrw, d(6), clk, cl, s(6));
	u_reg7 : reg_1_bit port map(nrw, d(7), clk, cl, s(7));
	
end architecture;
