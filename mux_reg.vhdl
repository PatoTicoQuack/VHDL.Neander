library ieee;
use ieee.std_logic_1164.all;

entity mux_reg is
    port(
        add : in std_logic;
        subtr : in std_logic;
        op : in std_logic;
        z : out std_logic
    );
end entity;

architecture behaviour of mux_reg is
begin
    z <= add when op = '0' else subtr when op = '1';
end architecture;
