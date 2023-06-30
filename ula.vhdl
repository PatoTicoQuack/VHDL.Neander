library ieee;
use ieee.std_logic_1164.all;

entity ula is
    port(
        barramento : inout std_logic_vector(7 downto 0);
        acnrw : in std_logic;
        clock : in std_logic;
        sel : in std_logic_vector(2 downto 0);
        clear : in std_logic;
        MEM_nrw     : in std_logic;
        --bagui da memoria
        flagnz : out std_logic_vector(1 downto 0)
    );
end entity;

architecture math of ula is
    component modulo_ula is
    port(
        x : in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);    
        ula_op: in std_logic_vector(2 downto 0);
        nz : out std_logic_vector(1 downto 0);
        resultado: out std_logic_vector(7 downto 0)
    );
    end component;
      
    component reg_2_bits is
	    port(
		    d	: in std_logic_vector(1 downto 0);
		    clk	: in std_logic;
		    pr, cl	: in std_logic;
		    nrw	: in std_logic;
		    s	: out std_logic_vector(1 downto 0)
	    );
    end component;

    component reg_8_bits is
	    port(
		    d	: in std_logic_vector(7 downto 0);
		    clk	: in std_logic;
		    pr, cl	: in std_logic;
		    nrw	: in std_logic;
		    s	: out std_logic_vector(7 downto 0)
	    );
    end component;

    signal s_x : std_logic_vector(7 downto 0);
    signal s_nz : std_logic_vector(1 downto 0);
    signal s_resultado : std_logic_vector(7 downto 0);
    begin
    barramento <= s_x when MEM_nrw = '1' else (others => 'Z');
    ac : reg_8_bits port map(s_resultado, clock, '1', clear, acnrw, s_x);
    flags : reg_2_bits port map(s_nz, clock, '1', clear, acnrw, flagnz);
    p_ula : modulo_ula port map (s_x, barramento, sel, s_nz, s_resultado);
    s_nz(1) <= '1' when s_resultado(7) = '1' else '0';
    s_nz(0) <= '1' when s_resultado = "00000000" else '0';
end architecture;



