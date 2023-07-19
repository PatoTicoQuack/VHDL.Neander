library ieee;
use ieee.std_logic_1164.all;

entity HLT is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of HLT is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= '1'; -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= '0'; -- pcNRW
    s(6) <= '0'; -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= '0'; -- remNRW
    s(9) <= '0'; -- rdmNRW
    s(10) <= '0'; -- riNRW
end architecture;
