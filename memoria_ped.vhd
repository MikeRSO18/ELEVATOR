LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
USE ieee.numeric_std.ALL;

ENTITY memoria_ped IS
	PORT(clock,reset: IN STD_LOGIC;
	     QR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	    pis_a : out STD_LOGIC;
		 inp         : IN STD_LOGIC_VECTOR(11 downto 0);
		 peds        : buffer STD_LOGIC_VECTOR (11 downto 0));
END memoria_ped;

ARCHITECTURE sol OF memoria_ped IS
SIGNAL temp: STD_LOGIC_VECTOR(11 downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<="000000000000";
				elsif (clock'event and clock='1') then
				
			if(inp="000000000000"and temp="000000000000") then 
				pis_a<='0';
				end if;
			if(inp(11)='1' and peds(11)='0') then 
				temp(11)<='1';
				pis_a<='0';
				end if;
		   if(inp(10)='1' and peds(10)='0') then 
				temp(10)<='1';
				pis_a<='0';
				end if;
			if(inp(9)='1' and peds(9)='0') then 
				temp(9)<='1';
				pis_a<='0';
				end if;
			if(inp(8)='1' and peds(8)='0') then 
				temp(8)<='1';
				pis_a<='0';
				end if;
			if(inp(7)='1' and peds(7)='0') then 
				temp(7)<='1';
				pis_a<='0';
				end if;
			if(inp(6)='1' and peds(6)='0') then 
				temp(6)<='1';
				pis_a<='0';
				end if;
			if(inp(5)='1' and peds(5)='0') then 
				temp(5)<='1';
				pis_a<='0';
				end if;
			if(inp(4)='1' and peds(4)='0') then 
				temp(4)<='1';
				pis_a<='0';
				end if;
			if(inp(3)='1' and peds(3)='0') then 
				temp(3)<='1';
				pis_a<='0';
				end if;
			if(inp(2)='1' and peds(2)='0') then 
				temp(2)<='1';
				end if;
			if(inp(1)='1' and peds(1)='0') then 
				temp(1)<='1';
				pis_a<='0';
				end if;
				
			if(inp(0)='1' and peds(0)='0') then 
				temp(0)<='1';
				pis_a<='0';
				end if;
		
		   if (QR="0000" AND temp(0)='1') then
			   temp(0)<='0';
				pis_a<='1';
				 
		   elsif (QR="0001" AND temp(1)='1') then
			   temp(1)<='0';
				pis_a<='1';
		 
			elsif (QR="0010" AND temp(2)='1') then
			   temp(2)<='0';
				pis_a<='1';
				 
			elsif (QR="0011" AND temp(3)='1') then
			   temp(3)<='0';
				pis_a<='1';
				 
				
			elsif (QR="0100" AND temp(4)='1') then
			   temp(4)<='0';
				pis_a<='1';
			 
				
				
			elsif(QR="0101" AND temp(5)='1') then
			   temp(5)<='0';
				pis_a<='1';
		 
				
				
			elsif (QR="0110" AND temp(6)='1') then
			   temp(6)<='0';
				pis_a<='1';
			 
				
				
			elsif (QR="0111" AND temp(7)='1') then
			   temp(7)<='0';
				pis_a<='1';
				 
				
			elsif (QR="1000" AND temp(8)='1') then
			   temp(8)<='0';
				pis_a<='1';
				 
				
			elsif (QR="1001" AND temp(9)='1') then
			   temp(9)<='0';
				pis_a<='1';
			 
				
			elsif (QR="1010" AND temp(10)='1') then
			   temp(10)<='0';
				pis_a<='1';
				 
				
			elsif (QR="1011" AND temp(11)='1') then
			   temp(11)<='0';
				pis_a<='1';
			else
			pis_a<='0';
			end if;
			
	end if;
	end process;
	
	peds<=temp;
END sol;