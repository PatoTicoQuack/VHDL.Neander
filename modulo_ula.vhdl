library ieee;
use ieee.std_logic_1164.all;

entity modulo_ula is
    port(
        x : in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);    
        ula_op: in std_logic_vector(2 downto 0);
        resultado: out std_logic_vector(7 downto 0)
    );
end entity;

architecture comportamento of modulo_ula is
    component mux_5x8 is
        port(
            notOp : in std_logic_vector(7 downto 0);
            andOp : in std_logic_vector(7 downto 0);
            orOp : in std_logic_vector(7 downto 0);
            addOp : in std_logic_vector(7 downto 0);
            ldaOp : in std_logic_vector(7 downto 0);
            op : in std_logic_vector(2 downto 0);
            z : out std_logic_vector(7 downto 0)
        );
    end component;


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


    component detectorNz is
        port(
            e : in std_logic_vector(7 downto 0);
            s : out std_logic_vector(1 downto 0)
        );
    end component;
    
    signal s_soma : std_logic_vector(7 downto 0);
    signal s_not : std_logic_vector(7 downto 0);
    signal s_and : std_logic_vector(7 downto 0);
    signal s_or : std_logic_vector(7 downto 0);
    signal s_saidaMux : std_logic_vector(7 downto 0);

    begin
    s_not <= not(x);
    s_and <= x and y;
    s_or <= x or y;
    somador : somador_8_bits port map (x, y, '0', s_soma);
    mux : mux_5x8 port map (s_not, s_and, s_or, s_soma, y, ula_op, s_saidaMux);
    resultado <= s_saidaMux;
end architecture;
