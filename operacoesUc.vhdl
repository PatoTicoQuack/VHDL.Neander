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
    s(10) <= '1'; -- not barInc
    s(9) <= not(counter(2)) or not(counter(0)) or counter(1); -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '1'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(4) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(1) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '1'; -- ula(1)
    s(6) <= '1'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(4) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(1) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(0) <= (not(counter(2)) and counter(1) and not(counter(0))); -- riNRW
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
    s(10) <= '0'; -- not barInc
    s(9) <= '0'; -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= '0'; -- pcNRW
    s(4) <= '0'; -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= '0'; -- remNRW
    s(1) <= '0'; -- rdmNRW
    s(0) <= '0'; -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(4) <= counter(0) and counter(1) and counter(2); -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= (not(counter(1)) and (counter(2) xnor counter(0))) or (not(counter(2)) and counter(1) and counter(0)); -- remNRW
    s(1) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= '1'; -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= not(counter(1)) and not(counter(2)) and counter(0); -- pcNRW
    s(4) <= '0'; -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= not(counter(2)) and not(counter(1)) and not(counter(0)); -- remNRW
    s(1) <= not(counter(1)) and not(counter(2)) and counter(0); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= '1'; -- not barPC
    s(8) <= '1'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= not(counter(2)) and not(counter(1)) and counter(0); -- pcNRW
    s(4) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= not(counter(2)) and not(counter(1)) and not(counter(0)); -- remNRW
    s(1) <= not(counter(2)) and not(counter(1)) and counter(0); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= not(counter(2)) or counter(1) or not(counter(0)); -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '1'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(4) <= counter(2) and counter(1) and counter(0); -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(1) <= (counter(2) and not(counter(0))) or (not(counter(2)) and not(counter(1)) and counter(0)); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
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
    s(10) <= '1'; -- not barInc
    s(9) <= not(counter(2)) or not(counter(0)) or counter(1); -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- pcNRW
    s(4) <= '0'; -- acNRW
    s(3) <= counter(2) and counter(1) and not(counter(0)); -- memNRW
    s(2) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)) or (counter(2) and not(counter(1)) and counter(0)); -- remNRW
    s(1) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;


-- JMP

library ieee;
use ieee.std_logic_1164.all;

entity JMP is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of JMP is
begin
    s(10) <= not(counter(2)) or not(counter(0)) or counter(1); -- not barInc
    s(9) <= '1'; -- not barPC
    s(8) <= '0'; -- ula(2)
    s(7) <= '0'; -- ula(1)
    s(6) <= '0'; -- ula(0)
    s(5) <= (not(counter(1)) and counter(0)); -- pcNRW
    s(4) <= '0'; -- acNRW
    s(3) <= '0'; -- memNRW
    s(2) <= (not(counter(2)) and not(counter(1)) and not(counter(0))) or (not(counter(2)) and counter(1) and counter(0)); -- remNRW
    s(1) <= (not(counter(2)) and not(counter(1)) and counter(0)) or (counter(2) and not(counter(1)) and not(counter(0))); -- rdmNRW
    s(0) <= not(counter(2)) and counter(1) and not(counter(0)); -- riNRW
end architecture;

-- JN
library ieee;
use ieee.std_logic_1164.all;

entity JN is
    port(
        counterbit : in std_logic_vector (2 downto 0);
        flagnz : in std_logic_vector (1 downto 0);
        saida : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of JN is
    component JMP is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
    end component;

    signal saidaJMP : std_logic_vector (10 downto 0);
    signal saidaJN : std_logic_vector (10 downto 0);
begin
    u_JMP : JMP port map (counterbit, saidaJMP);

    saidaJN(10) <= '1'; -- not barInc
    saidaJN(9) <= '1'; -- not barPC
    saidaJN(8) <= '0'; -- ula(2)
    saidaJN(7) <= '0'; -- ula(1)
    saidaJN(6) <= '0'; -- ula(0)
    saidaJN(5) <= (not(counterbit(2)) and counterbit(0)); -- pcNRW
    saidaJN(4) <= '0'; -- acNRW
    saidaJN(3) <= '0'; -- memNRW
    saidaJN(2) <= (not(counterbit(2)) and not(counterbit(1)) and not(counterbit(0))); -- remNRW
    saidaJN(1) <= (not(counterbit(2)) and not(counterbit(1)) and counterbit(0)); -- rdmNRW
    saidaJN(0) <= not(counterbit(2)) and counterbit(1) and not(counterbit(0)); -- riNRW
    saida <= saidaJMP when flagnz(1) = '1' else saidaJN;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity JZ is
    port(
        counterbit : in std_logic_vector (2 downto 0);
        flagnz : in std_logic_vector (1 downto 0);
        saida : out std_logic_vector (10 downto 0)
    );
end entity;

architecture fazer of JZ is
    component JMP is
    port(
        counter : in std_logic_vector (2 downto 0);
        s : out std_logic_vector (10 downto 0)
    );
    end component;

    signal saidaJMP : std_logic_vector (10 downto 0);
    signal saidaJZ : std_logic_vector (10 downto 0);
begin
    u_JMP : JMP port map (counterbit, saidaJMP);

    saidaJZ(10) <= '1'; -- not barInc
    saidaJZ(9) <= '1'; -- not barPC
    saidaJZ(8) <= '0'; -- ula(2)
    saidaJZ(7) <= '0'; -- ula(1)
    saidaJZ(6) <= '0'; -- ula(0)
    saidaJZ(5) <= (not(counterbit(2)) and counterbit(0)); -- pcNRW
    saidaJZ(4) <= '0'; -- acNRW
    saidaJZ(3) <= '0'; -- memNRW
    saidaJZ(2) <= (not(counterbit(2)) and not(counterbit(1)) and not(counterbit(0))); -- remNRW
    saidaJZ(1) <= (not(counterbit(2)) and not(counterbit(1)) and counterbit(0)); -- rdmNRW
    saidaJZ(0) <= not(counterbit(2)) and counterbit(1) and not(counterbit(0)); -- riNRW
    saida <= saidaJMP when flagnz(0) = '1' else saidaJZ;
end architecture;
