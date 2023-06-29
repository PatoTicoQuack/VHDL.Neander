library ieee;
use ieee.std_logic_1164.all;

-- Mux 2x1
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


-- Mux 5x8
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


-- Mux Registrador
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
