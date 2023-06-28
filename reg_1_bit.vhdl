library ieee;
use ieee.std_logic_1164.all; 
entity reg_1_bit is
    port(
    nrw : in std_logic;
    din : in std_logic;
    clear, clock : in std_logic;
    dout : out std_logic
    );
end entity;
architecture storage of reg_1_bit is
    component ffd is
        port(
            d : in std_logic;
            clk : in std_logic;
            pr, cl : in std_logic;
            q, nq : out std_logic
        );
    end component;
    
    component mux_reg is
        port(
            add : in std_logic;
            subtr : in std_logic;
            op : in std_logic;
            z : out std_logic
        );
    end component;

    signal muxSaida : std_logic;
    signal sdout : std_logic;
    begin
    dout <= sdout;
    --u_ffd2 : ffd port map (din(2), clock, '1', clear, dout(2));
    --u_ffd1 : ffd port map (din(1), clock, '1', clear, dout(1));
    --u_ffd0 : ffd port map (din(0), clock, '1', clear, dout(0));
     m : mux_reg port map(sdout, din, nrw, muxSaida);
     r : ffd port map(muxSaida, clock, '1', clear, sdout);
end architecture;
