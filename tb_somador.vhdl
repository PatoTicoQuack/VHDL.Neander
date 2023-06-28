library ieee;
use ieee.std_logic_1164.all;

entity tb_somador is
end entity;

architecture somar of tb_somador is
    component somador_1_bit is
        port(
            x : in std_logic;
            y : in std_logic;
            cin : in std_logic;
        
            s : out std_logic;
            cout : out std_logic
        );
    end component;

    component mux_2x1 is
        port(
            add : in std_logic_vector(7 downto 0);
            subtr : in std_logic_vector(7 downto 0);
            op : in std_logic;
            z : out std_logic_vector(7 downto 0)
        );
    end component;

    component overflow is
        port(
            x : in std_logic;
            y : in std_logic;
            z : in std_logic;

            oflow : out std_logic
        );
    end component;

    -- Soma
    signal sx : std_logic_vector(7 downto 0);
    signal sy : std_logic_vector(7 downto 0);
    signal scin : std_logic;

    signal ss : std_logic_vector(7 downto 0);
    signal saux : std_logic_vector(7 downto 0);
    signal scout : std_logic;

    -- Subtracao
    signal ssubtr : std_logic_vector(7 downto 0);
    signal ssubtraux : std_logic_vector(7 downto 0);
    signal ssubtrcout : std_logic;

    -- Inversao do Y
    signal syc2 : std_logic_vector(7 downto 0);
    signal sonebit : std_logic_vector(7 downto 0);
    signal sc2cin : std_logic;
    signal sc2aux : std_logic_vector(7 downto 0);
    signal sc2cout : std_logic;
    signal sc2 : std_logic_vector(7 downto 0);

    -- Multiplexador com Duas Entradas
    signal sop : std_logic;
    signal sz : std_logic_vector (7 downto 0);

    -- Erros
    signal syCorreto : std_logic;
    signal soverflow : std_logic;

begin
    syCorreto <= sy(11) when sop <= '0' else sc2(11) when sop <= '1';
    u_oflow : overflow port map(sx(11), syCorreto, sz(11), soverflow);
    u_mux : mux_2x1 port map(ss, ssubtr, sop, sz);

    u_somador_bit : somador_1_bit port map(sx(0), sy(0), scin, ss(0), saux(0));
    u_somador_bit_1 : somador_1_bit port map(sx(1), sy(1), saux(0), ss(1), saux(1));
    u_somador_bit_2 : somador_1_bit port map(sx(2), sy(2), saux(1), ss(2), saux(2));
    u_somador_bit_3 : somador_1_bit port map(sx(3), sy(3), saux(2), ss(3), saux(3));
    u_somador_bit_4 : somador_1_bit port map(sx(4), sy(4), saux(3), ss(4), saux(4));
    u_somador_bit_5 : somador_1_bit port map(sx(5), sy(5), saux(4), ss(5), saux(5));
    u_somador_bit_6 : somador_1_bit port map(sx(6), sy(6), saux(5), ss(6), saux(6));
    u_somador_bit_7 : somador_1_bit port map(sx(7), sy(7), saux(6), ss(7), scout);

    syc2 <= not(sy); -- Invertido o Y em caso de ser uma subtracao
    sonebit <= "00000001"; -- Soma de um no inverso

    u_two_complement : somador_1_bit port map(syc2(0), sonebit(0), sc2cin, sc2(0), sc2aux(0));
    u_two_complement_1 : somador_1_bit port map(syc2(1), sonebit(1), sc2aux(0), sc2(1), sc2aux(1));
    u_two_complement_2 : somador_1_bit port map(syc2(2), sonebit(2), sc2aux(1), sc2(2), sc2aux(2));
    u_two_complement_3 : somador_1_bit port map(syc2(3), sonebit(3), sc2aux(2), sc2(3), sc2aux(3));
    u_two_complement_4 : somador_1_bit port map(syc2(4), sonebit(4), sc2aux(3), sc2(4), sc2aux(4));
    u_two_complement_5 : somador_1_bit port map(syc2(5), sonebit(5), sc2aux(4), sc2(5), sc2aux(5));
    u_two_complement_6 : somador_1_bit port map(syc2(6), sonebit(6), sc2aux(5), sc2(6), sc2aux(6));
    u_two_complement_7 : somador_1_bit port map(syc2(7), sonebit(7), sc2aux(6), sc2(7), sc2cout);

    -- Realizando a subtracao a partir da somas com C2

    u_subtr : somador_1_bit port map(sx(0), sc2(0), scin, ssubtr(0), ssubtraux(0));
    u_subtr_1 : somador_1_bit port map(sx(1), sc2(1), ssubtraux(0), ssubtr(1), ssubtraux(1));
    u_subtr_2 : somador_1_bit port map(sx(2), sc2(2), ssubtraux(1), ssubtr(2), ssubtraux(2));
    u_subtr_3 : somador_1_bit port map(sx(3), sc2(3), ssubtraux(2), ssubtr(3), ssubtraux(3));
    u_subtr_4 : somador_1_bit port map(sx(4), sc2(4), ssubtraux(3), ssubtr(4), ssubtraux(4));
    u_subtr_5 : somador_1_bit port map(sx(5), sc2(5), ssubtraux(4), ssubtr(5), ssubtraux(5));
    u_subtr_6 : somador_1_bit port map(sx(6), sc2(6), ssubtraux(5), ssubtr(6), ssubtraux(6));
    u_subtr_7 : somador_1_bit port map(sx(7), sc2(7), ssubtraux(6), ssubtr(7), ssubtrcout);

    u_tb : process
    begin
        sc2cout <= '0';
        sc2cin <= '0';

        sop <= '0';
        scin <= '0';
        sx <= "00000000";
        sy <= "11111111";
        wait for 192 ns;

        sop <= '1';
        sx <= "00000000000";
        sy <= "11111111111";
        wait for 192 ns;

        sop <= '0';
        sx <= "11111111";
        sy <= "00000001";
        wait for 192 ns;

        sop <= '1';
        sx <= "11111111";
        sy <= "00000001";
        wait for 192 ns;
        
        sop <= '0';
        sx <= "11111110";
        sy <= "11111110";
        wait for 192 ns;
        
        sop <= '0';
        sx <= "11111111";
        sy <= "11111111";
        wait for 192 ns;

        sop <= '0';
        sx <= "11111111";
        sy <= "11111111";
        wait for 192 ns;
        wait;
    end process;    
end architecture;
