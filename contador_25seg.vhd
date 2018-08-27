LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador_25seg IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 t_seg : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (4 downto 0));
END contador_25seg;

ARCHITECTURE sol OF contador_25seg IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="00000";t_seg<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="11001") then Q<="00000";t_seg<='1';
				else Q<=Q+1;t_seg<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;