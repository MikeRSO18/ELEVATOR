 library ieee;
use ieee.std_logic_1164.all;

Entity mux2a1n4 is

PORT(	A: IN std_logic_vector(3 downto 0);
		B: IN std_logic_vector(3 downto 0);
		SLECT: IN std_logic;
		Q: OUT std_logic_vector(3 downto 0));
end mux2a1n4;

Architecture sol of mux2a1n4 is
Begin
	with SLECT select
		Q<= A when '0',
		    B when '1';
	end sol;