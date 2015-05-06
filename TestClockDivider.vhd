LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestClockDivider IS
END TestClockDivider;
 
ARCHITECTURE behavior OF TestClockDivider IS 
    --Inputs
   signal Clock : std_logic := '0';
	signal enable : std_logic := '1';
	signal reset : std_logic := '0';

 	--Outputs
   signal DivClock : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 2 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.ClockDivider PORT MAP (Clock, reset, enable, DivClock);

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
END;
