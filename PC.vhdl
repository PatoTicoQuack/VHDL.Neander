library ieee;
use ieee.std_logic_1164.all; 

entity PC is
    port(
        barramento : in std_logic_vector (7 downto 0);
        nBarInc : in std_logic;
        pcRW : in std_logic;
        clear, clock: in std_logic;
        endPC2MEM : out std_logic_vector (7 downto 0)
    );
end entity;
architecture contar of PC is
    component somador_8_bits is
        port(
        -- Soma
            sx : in std_logic_vector(7 downto 0);
            sy : in std_logic_vector(7 downto 0);
            scin : in std_logic;

            ss : out std_logic_vector(7 downto 0);
            scout : out std_logic
        );
    end component;

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

    signal s_add : std_logic_vector (7 downto 0);
    signal s_mux2pc : std_logic_vector (7 downto 0);
    signal s_pcAtual : std_logic_vector (7 downto 0);
    
begin

    u_somador : somador_8_bits port map ("00000001", s_pcAtual, '0', s_add);
    --u_mux_2x8 : mux_2x8 port map (barramento, s_add, nBarInc, s_mux2pc);
    s_mux2pc <= barramento when pcRW = '0' else s_add;
    u_reg8bits : reg_8_bits port map (s_mux2pc, clock, '1', clear, pcRW, s_pcAtual);
    endPC2MEM <= s_pcAtual;
end architecture;

