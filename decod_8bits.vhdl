library ieee;
use ieee.std_logic_1164.all; 
entity decod_8bits is
    port(
        instr_in : in std_logic_vector (7 downto 0);
        instr_out : out std_logic_vector (10 downto 0)    
    );
end entity;
architecture decodificar of decod_8bits is
begin
    instr_out <= "10000000000" when instr_in = "00000000" else -- nop
    "01000000000" when instr_in = "00010000" else -- sta
    "00100000000" when instr_in = "00100000" else -- lda
    "00010000000" when instr_in = "00110000" else -- add
    "00001000000" when instr_in = "01000000" else -- or
    "00000100000" when instr_in = "01010000" else -- and
    "00000010000" when instr_in = "01100000" else -- not
    "00000001000" when instr_in = "10000000" else -- jmp
    "00000000100" when instr_in = "10010000" else -- jn
    "00000000010" when instr_in = "10100000" else -- jz
    "00000000001" when instr_in = "11110000"; -- hlt 
end architecture;
