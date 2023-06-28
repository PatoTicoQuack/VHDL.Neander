library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
    port(
        add : in std_logic_vector(7 downto 0);
        subtr : in std_logic_vector(7 downto 0);
        op : in std_logic;
        z : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behaviour of mux_2x1 is
begin
    z <= add when op = '0' else subtr when op = '1';
end architecture;
