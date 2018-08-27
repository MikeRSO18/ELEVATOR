LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
USE ieee.numeric_std.ALL;

ENTITY memoria_flecha IS
	PORT(clock: IN STD_LOGIC;
	     sub,baj,pis_a: IN STD_LOGIC;
		  bffsub,bffbaj,bffstay: buffer STD_LOGIC;
        code:out STD_LOGIC_VECTOR (1 downto 0));
		
END memoria_flecha;

ARCHITECTURE sol OF memoria_flecha IS
SIGNAL bs,bb,bst: STD_LOGIC;
   begin
	PROCESS(clock)
	BEGIN
		if (clock'event and clock='1') then
				
			if( (bffstay='1' or pis_a='1') and sub='0' and baj='0' ) then 
				bs<='0';
				bb<='0';
				bst<='1';
				code<="00"; 
				
				
			elsif((sub='1'  or bffsub='1') and pis_a='0' and baj='0') then 
				bs<='1';
				bb<='0';
				bst<='0';
				code<="10"; 
				
			
			elsif((baj='1'  or bffbaj='1')and pis_a='0' and sub='0' )then 
				bs<='0';
				bb<='1';
				bst<='0';
				code<="01"; 
				
			else
			   bs<='0';
				bb<='0';
				bst<='1';
				code<="00"; 
				
				end if;
		end if;
    end process;		
		bffsub<=bs;
		bffbaj<=bb;
		bffstay<=bst;
				
end sol;			
			