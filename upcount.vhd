LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY upcount IS
PORT ( Clock, Resetn, E_up,E_dn: IN STD_LOGIC;
inp:IN std_logic_vector(3 downto 0);
Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) ;
END upcount ;

ARCHITECTURE Behavior OF upcount IS
	SIGNAL Count : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
	
	IF Resetn = '0' THEN
	Count <= "0000" ;
	ELSIF (Clock'EVENT AND Clock = '1') THEN
	IF E_up = '1'then
	Count<=inp+1;
	elsif E_dn='1' then
	Count <= inp-1 ;
	else count<=inp;
	END IF ;
	end if;
	END PROCESS;
	Q <= Count;
END Behavior;