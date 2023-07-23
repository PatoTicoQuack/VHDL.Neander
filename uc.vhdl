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
            q : inout std_logic_vector (2 downto 0)
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

    component JMP is
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
    signal saidaJmp : std_logic_vector(10 downto 0);
    signal saidaJn : std_logic_vector(10 downto 0);
    signal saidaJz : std_logic_vector(10 downto 0);
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
    u_jmp : JMP port map(saidaCounter, saidaJmp);
    saidaJn <= saidaJmp when nz(1) = '1' else "11000100000";
    saidaJz <= saidaJmp when nz(0) = '1' else "11000100000";

    saidaMux <= saidaNop when dec2uc = "10000000000" else
                saidaSta when dec2uc = "01000000000" else
                saidaLda when dec2uc = "00100000000" else
                saidaAdd when dec2uc = "00010000000" else
                saidaOr when dec2uc = "00001000000" else
                saidaAnd when dec2uc = "00000100000" else
                saidaNot when dec2uc = "00000010000" else
                saidaJmp when dec2uc = "00000001000" else
                saidaJn  when dec2uc = "00000000100" else
                saidaJz  when dec2uc = "00000000010" else
                saidaHlt when dec2uc = "00000000001";
end architecture;
