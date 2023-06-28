library ieee;
use ieee.std_logic_1164.all;

entity mux_5x8 is
    port(
        notOp : in std_logic_vector(7 downto 0);
        andOp : in std_logic_vector(7 downto 0);
        orOp : in std_logic_vector(7 downto 0);
        addOp : in std_logic_vector(7 downto 0);
        ldaOp : in std_logic_vector(7 downto 0);
        op : in std_logic_vector(2 downto 0);
        z : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behaviour of mux_5x8 is
begin
    z <= ldaOp when op = "000" else addOp when op = "001"
    else orOp when op = "010" else andOp when op = "011"
    else notOp when op = "100";
end architecture;
