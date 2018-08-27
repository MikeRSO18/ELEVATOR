LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY clock_1 IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 clock_01 : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (1 downto 0));
END clock_1;

ARCHITECTURE sol OF clock_1 IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="00";clock_01<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="01") then Q<="00";clock_01<='1';
				else Q<=Q+1;clock_01<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;