library IEEE;
use IEEE.STD_LOGIC_1164.all;
Use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

 

entity dot_matrix_sim is

  port (slow_clock, en : in std_logic;

 
        rows     : inout std_logic_vector (7 downto 0);
        col      : inout std_logic_vector (7 downto 0));

end dot_matrix_sim;

architecture Behavioral of dot_matrix_sim is

  signal row_count  : std_logic_vector(2 downto 0);
  signal counter    : integer range 0 to 25000000 := 0;  -- to divide the clock down
  

begin

  process(slow_clock)
  begin
  
    if (slow_clock'event and slow_clock = '1') then
      if (en = '1') then
        if (row_count = "111") then
          row_count <= "000";
        else
          row_count <= row_count + 1;
        end if;
      else
        row_count <= "000";
      end if;
    end if;
  end process ;



  DIS : process (row_count)
  begin

	   if row_count = "000" then           --1st clock count
			col  <= "00011100";                  --selecting 1st column
			rows <= "11101011";                -- putting the data on the 1st column

	   elsif row_count = "001" then        -- 2nd clock count
		  col  <= "00001110";                -- selecting 3rd column 
        rows <= "01001111";

      elsif row_count = "010" then            -- 3rd clock count
        col  <= "11001100";                -- selecting 3rd column 
        rows <= "01001001";

      elsif row_count = "011" then      -- 4th clock count
        col  <= "00000001";                -- selecting 4th column 
        rows <= "00010000";

      elsif row_count = "100" then      -- 5th clock count
         	col  <= "00011100";                  --selecting 1st column
			rows <= "11101011";  
		
		elsif row_count = "101" then      -- 4th clock count
      col  <= "00001110";                -- selecting 3rd column 
        rows <= "01001111";

      elsif row_count = "110" then      -- 5th clock count
          col  <= "11001100";                -- selecting 3rd column 
          rows <= "01001001";

		  
		elsif row_count = "111" then      -- 4th clock count
        col  <= "00000001";                -- selecting 4th column 
        rows <= "00010000";



      end if;
  end process DIS;

end Behavioral;