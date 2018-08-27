 library ieee;
use ieee.std_logic_1164.all;

Entity repetidor is

PORT(	A: IN std_logic;
		Q: OUT std_logic_vector(3 downto 0));
end repetidor;

Architecture sol of repetidor is
Begin
	
Q<= A&A&A&A;
end sol;