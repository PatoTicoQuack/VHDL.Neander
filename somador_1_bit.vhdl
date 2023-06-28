library ieee;
use ieee.std_logic_1164.all;

entity somador_1_bit is
    port(
        x : in std_logic;
        y : in std_logic;
        cin : in std_logic;
    
        s : out std_logic;
        cout : out std_logic
    );
end entity;

architecture somador of somador_1_bit is
begin
    s <= x xor (y xor cin) after 4 ns;
    cout <= (x and cin) or (y and cin) or (x and y) after 3*4 ns;
end architecture;
