library ieee;
use ieee.std_logic_1164.all;

Entity decoder_de_bin_a_14segmentos is
	Port(	w: in std_logic_vector(3 downto 0);
			en: in std_logic;
			Q: out std_logic_vector(13 downto 0));
end decoder_de_bin_a_14segmentos;

Architecture sol of decoder_de_bin_a_14segmentos is
Signal F: std_logic_vector(13 downto 0);
SIGNAL ZRS,ONE: std_logic_vector(6 downto 0);

Begin
ZRS<="0000000";
ONE<="0000110";

	With w select
		F<=	   
		   ZRS &"0000110" when "0000",
			      
			ZRS &"1011011" when "0001",
			     
			ZRS &"1001111" when "0010",
			      
			ZRS &"1100110" when "0011",
			      
			ZRS &"1101101" when "0100",
			      
			ZRS &"1111101" when "0101",
			      
			ZRS &"0000111" when "0110",
			ZRS &"1111111" when "0111",
			ZRS &"1101111" when "1000",
			
			ONE &"0111111" when "1001",
			
			ONE & ONE when "1010",
			ONE &"1011011" when "1011",
			"11111111111111" when "1111",
			
			ZRS &"1000000" when others;
			
	Q<=F when en='1' else "00000000000000";
end sol;