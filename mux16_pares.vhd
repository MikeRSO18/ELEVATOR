 LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mux16_pares IS

PORT(vecs,vecb:IN STD_LOGIC_VECTOR(11 DOWNTO 0);
SEL:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DOUT:OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END mux16_pares ;
ARCHITECTURE BEH123 OF mux16_pares IS

BEGIN
with SEL select
DOUT<=
vecs(0)&vecb(0) WHEN "0000",
vecs(1)&vecb(1) WHEN "0001",
vecs(2)&vecb(2) WHEN "0010",
vecs(3)&vecb(3) WHEN "0011",
vecs(4)&vecb(4) WHEN "0100",
vecs(5)&vecb(5) WHEN "0101",
vecs(6)&vecb(6) WHEN "0110",
vecs(7)&vecb(7) WHEN "0111",
vecs(8)&vecb(8) WHEN "1000",
vecs(9)&vecb(9) WHEN "1001",
vecs(10)&vecb(10) WHEN "1010",
vecs(11)&vecb(11) WHEN "1011",
"ZZ" WHEN OTHERS;

END BEH123;