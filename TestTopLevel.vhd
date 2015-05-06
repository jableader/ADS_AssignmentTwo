--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:41:27 05/06/2015
-- Design Name:   
-- Module Name:   C:/Users/Jableader/Documents/Xilinx/AssignmentTwo/TestTopLevel.vhd
-- Project Name:  AssignmentTwo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopLevel
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestTopLevel IS
END TestTopLevel;
 
ARCHITECTURE behavior OF TestTopLevel IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopLevel
    PORT(
         Clock : IN  std_logic;
         Active : IN  std_logic;
         Testmode : IN  std_logic;
         Reset : IN  std_logic;
         Overflow : OUT  std_logic;
         SegmentSelect : OUT  std_logic_vector(0 to 6);
         AnodeSelect : OUT  std_logic_vector(0 to 1)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Active : std_logic := '1';
   signal Testmode : std_logic := '1';
   signal Reset : std_logic := '1';

 	--Outputs
   signal Overflow : std_logic;
   signal SegmentSelect : std_logic_vector(0 to 6);
   signal AnodeSelect : std_logic_vector(0 to 1);

   -- Clock period definitions
   constant Clock_period : time := 2 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevel PORT MAP (
          Clock => Clock,
          Active => Active,
          Testmode => Testmode,
          Reset => Reset,
          Overflow => Overflow,
          SegmentSelect => SegmentSelect,
          AnodeSelect => AnodeSelect
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 600 ms;
		Active <= '0';
		
		wait for 1200 ms;
		Reset <= '0';
		wait for 3 ms;
		Reset <= '1';
	
      wait for Clock_period*10;
		Active <= '1';
      wait;
   end process;

END;
