library ieee;
use ieee.std_logic_1164.all;

entity bloque_or_pedidos is
	port ( Pisos,teclado: in std_logic_vector(11 downto 0);
		 Pedidos: out std_logic_vector(11 downto 0));
end bloque_or_pedidos;

architecture behav of bloque_or_pedidos is
begin
	Pedidos(11) <= Pisos(11) or teclado(11);
	Pedidos(10) <= Pisos(10) or teclado(10);
	Pedidos(9) <= Pisos(9) or teclado(9);
	Pedidos(8) <= Pisos(8) or teclado(8);
	Pedidos(7) <= Pisos(7) or teclado(7);
	Pedidos(6) <= Pisos(6) or teclado(6);
	Pedidos(5) <= Pisos(5) or teclado(5);
	Pedidos(4) <= Pisos(4) or teclado(4);
	Pedidos(3) <= Pisos(3) or teclado(3);
	Pedidos(2) <= Pisos(2) or teclado(2);
	Pedidos(1) <= Pisos(1) or teclado(1);
	Pedidos(0) <= Pisos(0) or teclado(0);
end behav;