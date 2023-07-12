library ieee;
use ieee.std_logic_1164.all;
entity uc is    
    port(
        dec2uc : in std_logic_vector (10 downto 0);
        nz : in std_logic_vector (1 downto 0);
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

    
begin    

end architecture;

