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
        --bagui da memoria
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
            fioNrw : in std_logic
        );
    end component;

    signal s_barramento : std_logic_vector(7 downto 0);
    signal s_acnrw : std_logic;
    signal s_clock : std_logic := '0';
    signal s_clear : std_logic;
    signal s_flagnz : std_logic_vector(1 downto 0);
    signal s_selUla : std_logic_vector(2 downto 0);    

    begin
        
        s_clock <= not(s_clock) after clock_period/2;
        u_ula : ula port map(s_barramento, s_acnrw, s_clock, s_selUla, s_clear, s_flagnz);
        u_um : um port map(, , s_barramento, , s_clock, s_clear, s_acnrw);
    
        p_neander : process
        begin

            s_clear <= '0';
            wait for clock_period;
            
            s_clear <= '1';
            s_acnrw <= '0';
            s_barramento <= "11111111";
            s_selUla <= "100";
            wait for clock_period;
            s_selUla <= "011";
            wait for clock_period;
            s_selUla <= "010";
            wait for clock_period;
            s_selUla <= "001";
            wait for clock_period;
            s_selUla <= "000";
            wait for clock_period;
            wait;
        end process;
end architecture;
