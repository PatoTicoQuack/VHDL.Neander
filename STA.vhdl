library ieee;
use ieee.std_logic_1164.all;

entity STA is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of STA is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= not(counter(2)) or not(counter(0)) or counter(1); -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(6) <= '0'; -- acNRW
    s(7) <= counter(2) and counter(1) and not(counter(0)); -- memNRW
    s(8) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(9) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;
