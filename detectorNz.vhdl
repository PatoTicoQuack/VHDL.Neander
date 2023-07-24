library ieee;
use ieee.std_logic_1164.all;

entity detectorNz is
    port(
        e : in std_logic_vector(7 downto 0);
        s : out std_logic_vector(1 downto 0)
    );
end entity;

architecture math of detectorNz is

signal teste : std_logic_vector(1 downto 0);
begin
    teste(1) <= '1' when e(7) = '1' else '0';
    teste(0) <= '1' when e  = "00000000" else '0';
end architecture;



