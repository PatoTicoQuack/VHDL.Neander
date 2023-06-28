library ieee;
use ieee.std_logic_1164.all;

entity somador_8_bits is    
    port(
        -- Soma
        sx : in std_logic_vector(7 downto 0);
        sy : in std_logic_vector(7 downto 0);
        scin : in std_logic;

        ss : out std_logic_vector(7 downto 0);
        scout : out std_logic
    );
end entity;

architecture somar of somador_8_bits is
    component somador_1_bit is
        port(
            x : in std_logic;
            y : in std_logic;
            cin : in std_logic;
        
            s : out std_logic;
            cout : out std_logic
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

    -- Multiplexador com Duas Entradas
    signal sop : std_logic;
    signal sz : std_logic_vector (7 downto 0);

    -- Erros
    signal soverflow : std_logic;
    signal saux : std_logic_vector(7 downto 0);
begin
    u_oflow : overflow port map(sx(7), sy(7), sz(7), soverflow);

    u_somador_bit : somador_1_bit port map(sx(0), sy(0), scin, ss(0), saux(0));
    u_somador_bit_1 : somador_1_bit port map(sx(1), sy(1), saux(0), ss(1), saux(1));
    u_somador_bit_2 : somador_1_bit port map(sx(2), sy(2), saux(1), ss(2), saux(2));
    u_somador_bit_3 : somador_1_bit port map(sx(3), sy(3), saux(2), ss(3), saux(3));
    u_somador_bit_4 : somador_1_bit port map(sx(4), sy(4), saux(3), ss(4), saux(4));
    u_somador_bit_5 : somador_1_bit port map(sx(5), sy(5), saux(4), ss(5), saux(5));
    u_somador_bit_6 : somador_1_bit port map(sx(6), sy(6), saux(5), ss(6), saux(6));
    u_somador_bit_7 : somador_1_bit port map(sx(7), sy(7), saux(6), ss(7), scout);

end architecture;
