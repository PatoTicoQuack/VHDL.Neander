library ieee;
use ieee.std_logic_1164.all;

entity neander is
end entity;

architecture computador of neander is
    signal clock_period : time := 20 ns;
    component ula is
    port(
        barramento : inout std_logic_vector(7 downto 0);
        acnrw : in std_logic;
        clock : in std_logic;
        sel : in std_logic_vector(2 downto 0);
        clear : in std_logic;
        MEM_nrw     : in std_logic;
        flagnz : out std_logic_vector(1 downto 0)
    );
    end component;

    
    component um is 
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
    end component;

    component PC is
        port(
            barramento : in std_logic_vector (7 downto 0);
            nBarInc : in std_logic;
            pcRW : in std_logic;
            clear, clock: in std_logic;
            endPC2MEM : out std_logic_vector (7 downto 0)
        );
    end component;
    
    component controle is
        port(
            barramento : in std_logic_vector (7 downto 0);
            clk, clear : in std_logic;
            nrw : in std_logic;
            nz : in std_logic_vector (1 downto 0);
            barramentoControle : out std_logic_vector (10 downto 0)
        );
    end component;
    
    signal s_PcG : std_logic_vector (7 downto 0);
    signal s_barramento : std_logic_vector(7 downto 0);
    signal s_clock : std_logic := '0';
    signal s_clear : std_logic;
    signal s_flagnz : std_logic_vector(1 downto 0);
    signal s_selUla : std_logic_vector(2 downto 0);
    signal s_nBarInc : std_logic;
    signal s_barramentoControle : std_logic_vector (10 downto 0);

    begin
        
        s_selUla(2) <= s_barramentoControle(8);
        s_selUla(1) <= s_barramentoControle(7);
        s_selUla(0) <= s_barramentoControle(6);
        s_clock <= not(s_clock) after clock_period/2;
        u_ula : ula port map(s_barramento, s_barramentoControle(4), s_clock, s_selUla, s_clear, s_barramentoControle(3), s_flagnz);
        u_pc : PC port map(s_barramento, s_barramentoControle(10), s_barramentoControle(5), s_clear, s_clock, s_PcG);
        u_um : um port map(s_PcG, s_barramento, s_barramento, s_barramentoControle(9), s_clock, s_clear, s_barramentoControle(2), s_barramentoControle(3), s_barramentoControle(1));
        u_controle : controle port map (s_barramento, s_clock, s_clear, s_barramentoControle(0), s_flagnz, s_barramentoControle);

    
        -- barrControle(10) = notBarInc
        -- barrControle(9) = notBarPc 
        -- barrControle(8) = ula(2) 
        -- barrControle(7) = ula(1) 
        -- barrControle(6) = ula(0) 
        -- barrControle(5) = pcNRW 
        -- barrControle(4) = acNRW 
        -- barrControle(3) = memNRW 
        -- barrControle(2) = remNRW 
        -- barrControle(1) = rdmNRW 
        -- barrControle(0) = riNRW

        p_neander : process
        begin
            s_clear <= '0';
            wait for clock_period;
            
            s_clear <= '1';
            wait;
        end process;
end architecture;
