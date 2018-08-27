library ieee;
use ieee.std_logic_1164.all;

entity bloque_or_up_dwn is
	port ( ped: in std_logic_vector(11 downto 0);
		 sub,baj: out std_logic_vector(11 downto 0));
end bloque_or_up_dwn;

architecture behav of bloque_or_up_dwn is
begin
	
	sub(11)<= '0';
	sub(10)<= ped(11);
	sub(9) <= ped(11) or ped(10);
	sub(8) <= ped(11) or ped(10) or ped(9);
	sub(7) <= ped(8) or ped(11) or ped(10) or ped(9);
	sub(6) <= ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(5) <= ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(4) <= ped(5) or ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(3) <= ped(4) or ped(5) or ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(2) <= ped(3) or ped(4) or ped(5) or ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(1) <= ped(2) or ped(3) or ped(4) or ped(5) or ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	sub(0) <= ped(1) or ped(2) or ped(3) or ped(4) or ped(5) or ped(6) or ped(7) or ped(8) or ped(11) or ped(10) or ped(9);
	
	baj(0)<= '0';
	baj(1)<= ped(0);
	baj(2) <= ped(1) or ped(0);
	baj(3) <= ped(2) or ped(1) or ped(0);
	baj(4) <= ped(3) or ped(2) or ped(1) or ped(0);
	baj(5) <= ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(6) <= ped(5) or ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(7) <= ped(6) or ped(5) or ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(8) <= ped(7) or ped(6) or ped(5) or ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(9) <= ped(8) or ped(7) or ped(6) or ped(5) or ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(10) <= ped(9) or ped(8) or ped(7) or ped(6) or ped(5) or ped(4) or ped(3) or ped(2) or ped(1) or ped(0);
	baj(11) <= ped(1) or ped(2) or ped(3) or ped(4) or ped(5) or ped(6) or ped(7) or ped(8) or ped(0) or ped(10) or ped(9);
end behav;