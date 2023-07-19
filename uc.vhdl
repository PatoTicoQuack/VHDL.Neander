library ieee;
use ieee.std_logic_1164.all;
entity uc is    
    port(
        dec2uc : in std_logic_vector (10 downto 0);
        nz : in std_logic_vector (1 downto 0);
        clock, clr : in std_logic;
        saidaMux : out std_logic_vector (10 downto 0)
    );
end entity;
architecture algo of uc is
    component three_bits_counter is
        port(
            clk, clear : in std_logic;
            q : out std_logic_vector (2 downto 0)
        );
    end component;

    component NOP is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component STA is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component LDA is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component ADD is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component AND_UC is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component OR_UC is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component NOT_UC is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    component HLT is
        port(
            counter : in std_logic_vector (2 downto 0);
            s : out std_logic_vector (10 downto 0)
        );
    end component;   

    signal saidaCounter : std_logic_vector(2 downto 0);
    signal saidaNop : std_logic_vector(10 downto 0);
    signal saidaSta: std_logic_vector(10 downto 0);
    signal saidaLda : std_logic_vector(10 downto 0);
    signal saidaAdd : std_logic_vector(10 downto 0);
    signal saidaAnd : std_logic_vector(10 downto 0);
    signal saidaOr : std_logic_vector(10 downto 0);
    signal saidaNot : std_logic_vector(10 downto 0);
    signal saidaHlt : std_logic_vector(10 downto 0);
begin    
    u_contador : three_bits_counter port map(clock, clr, saidaCounter);
    u_nop : NOP port map(saidaCounter, saidaNop);
    u_sta : STA port map(saidaCounter, saidaSta);
    u_lda : LDA port map(saidaCounter, saidaLda);
    u_add : ADD port map(saidaCounter, saidaAdd);
    u_and : AND_UC port map(saidaCounter, saidaAnd);
    u_or : OR_UC port map(saidaCounter, saidaOr);
    u_not : NOT_UC port map(saidaCounter, saidaNot);
    u_hlt : HLT port map(saidaCounter, saidaHlt);
end architecture;
