library ieee;
use ieee.std_logic_1164.all;

entity three_bits_counter is
    port(
        clk, clear : in std_logic;
        q : out std_logic_vector (2 downto 0)
    );
end entity;

architecture counter of three_bits_counter is
    constant CLK_PERIOD : time := 10 ns;

    component ffjk is 
        port(
            j, k   : in  std_logic;
            clk  : in  std_logic;
            pr, cl : in  std_logic;
            q, nq  : out std_logic)
        ; 
    end component;

    
    component controlador is
        port(
            j : out std_logic_vector(2 downto 0);
            k : out std_logic_vector(2 downto 0);
            q : in std_logic_vector(2 downto 0)
        );
    end component;

    signal sj : std_logic_vector(2 downto 0);
    signal sk : std_logic_vector(2 downto 0);
    signal snq : std_logic_vector(2 downto 0);
    signal spr : std_logic := '1';

begin
    u_ffjk_0 : ffjk port map(sj(0), sk(0), clk, spr, clear, q(0), snq(0));
    u_ffjk_1 : ffjk port map(sj(1), sk(1), clk, spr, clear, q(1), snq(1));
    u_ffjk_2 : ffjk port map(sj(2), sk(2), clk, spr, clear, q(2), snq(2));

    u_controlador : controlador port map(sj, sk, q);
    
    tbp : process
    begin
        spr <= '1'; 
        wait;
    end process;     
end architecture counter;
