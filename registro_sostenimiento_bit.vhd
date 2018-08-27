LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;


ENTITY registro_sostenimiento_bit IS
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC;
		 Q : OUT STD_LOGIC );
END registro_sostenimiento_bit;

ARCHITECTURE sol OF registro_sostenimiento_bit IS
SIGNAL temp: STD_LOGIC;
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<='0';
		elsif (clock'event and clock='1') then
			if(enable='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	Q<=temp;
END sol;
