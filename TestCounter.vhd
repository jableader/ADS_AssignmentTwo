LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestCounter IS
END TestCounter;

ARCHITECTURE behavior OF TestCounter IS 
   --Inputs
   signal Clock : std_logic := '0';
   signal Enable : std_logic := '1';
   signal Testmode : std_logic := '1';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Overflow : std_logic;
   signal Ones : std_logic_vector(3 downto 0);
   signal Tens : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 1 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.Counter PORT MAP (
          Clock => Clock,
          Enable => Enable,
          Testmode => Testmode,
          Reset => Reset,
          Overflow => Overflow,
          Ones => Ones,
          Tens => Tens
        );
		  
   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
END;
