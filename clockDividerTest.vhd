LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Simple test for the clock divider
 
ENTITY clockDividerTest IS
END clockDividerTest;
 
ARCHITECTURE behavior OF clockDividerTest IS 
   signal Clock, Reset : std_logic := '0';
   signal DivClock : std_logic;
 
   -- Clock period definitions
   constant Clock_period : time := 2 ms; 
BEGIN
 
	-- Port map the component
   c1: entity work.ClockDivider PORT MAP (Clock, Reset, DivClock);

   -- Main Clock Process
   process
   begin
		Clock <= not Clock;
		wait for Clock_period/2;
   end process; 
	
	process
	begin
	
		reset <= '0';
		wait for 2200 ms;
		reset <= '1';
		wait;
	
	end process;
	
END;
