library ieee;
use ieee.std_logic_1164.all;

entity overflow is
    port(
        x : in std_logic;
        y : in std_logic;
        z : in std_logic;

        oflow : out std_logic
    );
end entity;

architecture behavior of overflow is
begin
    oflow <= '1' when (x = y) and y /= z else '0';
end architecture;
