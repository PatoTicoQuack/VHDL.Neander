library ieee;
use ieee.std_logic_1164.all;

entity um is 
    port(
        end_PcG : in std_logic_vector(7 downto 0);
        end_BarrG : in std_logic_vector(7 downto 0);
        barramento : inout std_logic_vector(7 downto 0);
        barrPC : in std_logic;
        clock : in std_logic;
        clear : in std_logic;
        REM_nrw : in std_logic;
        MEM_nrw : in std_logic;
        RDM_nrw : in std_logic
    );
end entity;

architecture comportamento of um is
    component mux_2x8 is
        port(
            end_PC : in std_logic_vector(7 downto 0);
            end_Barr : in std_logic_vector(7 downto 0);
            op : in std_logic;
            z : out std_logic_vector(7 downto 0)
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

    component as_ram is
	    port(
		    addr  : in    std_logic_vector(7 downto 0);
		    data  : inout std_logic_vector(7 downto 0);
		    notrw : in    std_logic;
		    reset : in    std_logic
	    );
    end component;


    signal s_muxSaida : std_logic_vector(7 downto 0);
    signal s_rem2mem : std_logic_vector(7 downto 0);
    signal s_mem2rdm : std_logic_vector(7 downto 0);
    signal s_rdm2barr : std_logic_vector(7 downto 0);
    
    begin
    barramento <= s_rdm2barr when MEM_nrw = '0' else (others => 'Z');
    s_mem2rdm <= barramento when MEM_nrw = '1' else (others => 'Z');

    u_mux : mux_2x8 port map(end_PcG, end_BarrG, barrPC, s_muxSaida);
    remMar : reg_8_bits port map(s_muxSaida, clock, '1', clear, REM_nrw, s_rem2mem);
    uMem : as_ram port map(s_rem2mem, s_mem2rdm, MEM_nrw, clear);
    rdmMbr : reg_8_bits port map(s_mem2rdm, clock, '1', clear, RDM_nrw, s_rdm2barr);
end architecture;
