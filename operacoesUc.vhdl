-- ADD

library ieee;
use ieee.std_logic_1164.all;

entity ADD is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of ADD is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= not(counter(2)) or not(counter(0)) or counter(1); -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '1'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(6) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(9) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- AND

library ieee;
use ieee.std_logic_1164.all;

entity AND_UC is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of AND_UC is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '1'; -- ula(1)
    s(4) <= '1'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- pcNRW
    s(6) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(9) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(10) <= (not(counter(2)) and counter(1) and not(counter(0))); -- riNRW
end architecture;

-- HLT
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

-- LDA

library ieee;
use ieee.std_logic_1164.all;

entity lda is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of lda is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= not(counter(1)) and (counter(2) xor counter(0)); -- pcNRW
    s(6) <= counter(0) and counter(1) and counter(2); -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= (not(counter(1)) and (counter(2) xnor counter(0))) or (not(counter(2)) and counter(1) and counter(0)); -- remNRW
    s(9) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- NOP

library ieee;
use ieee.std_logic_1164.all;

entity NOP is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of NOP is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= '1'; -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= not(counter(1)) and not(counter(2)) and counter(0); -- pcNRW
    s(6) <= '0'; -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= not(counter(2)) and not(counter(1)) and not(counter(0)); -- remNRW
    s(9) <= not(counter(1)) and not(counter(2)) and counter(0); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- NOT

library ieee;
use ieee.std_logic_1164.all;

entity NOT_UC is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of NOT_UC is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= '1'; -- not barPC
    s(2) <= '1'; -- ula(2)
    s(3) <= '0'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= not(counter(2)) and not(counter(1)) and counter(0); -- pcNRW
    s(6) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= not(counter(2)) and not(counter(1)) and not(counter(0)); -- remNRW
    s(9) <= not(counter(2)) and not(counter(1)) and counter(0); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- OR

library ieee;
use ieee.std_logic_1164.all;

entity OR_UC is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of OR_UC is
begin
    s(0) <= '1'; -- not barInc
    s(1) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(2) <= '0'; -- ula(2)
    s(3) <= '1'; -- ula(1)
    s(4) <= '0'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(6) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(7) <= '0'; -- memNRW
    s(8) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(9) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(10) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- STA

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
