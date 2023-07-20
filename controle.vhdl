library ieee;
use ieee.std_logic_1164.all;
entity controle is
    port(
        barramento : in std_logic_vector (7 downto 0);
        clk, clear : in std_logic;
        nrw : in std_logic;
        nz : in std_logic_vector (1 downto 0);
        barramentoControle : out std_logic_vector (10 downto 0)
    );
end entity;
architecture controlar of controle is
    component reg_8_bits is
        port(
		    d	: in std_logic_vector(7 downto 0);
		    clk	: in std_logic;
		    pr, cl	: in std_logic;
		    nrw	: in std_logic;
		    s	: out std_logic_vector(7 downto 0)
	    );
    end component;

    component uc is    
    port(
        dec2uc : in std_logic_vector (10 downto 0);
        nz : in std_logic_vector (1 downto 0);
        clock, clr : in std_logic;
        saidaMux : out std_logic_vector (10 downto 0)
    );
    end component;

    component decod_8bits is
        port(
            instr_in : in std_logic_vector (7 downto 0);
            instr_out : out std_logic_vector (10 downto 0)    
        );
    end component;

    signal RI_out : std_logic_vector (7 downto 0);
    signal DC_out : std_logic_vector (10 downto 0);
begin
    u_reg8bits : reg_8_bits port map (barramento, clk, '1', clear, nrw, RI_out);
    u_decod8bits : decod_8bits port map (RI_out, DC_out);
    u_UC : uc port map (DC_out, nz, clk, clear, barramentoControle);
end architecture;
