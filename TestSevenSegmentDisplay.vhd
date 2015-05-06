--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:30:46 05/06/2015
-- Design Name:   
-- Module Name:   C:/Users/Jableader/Documents/Xilinx/AssignmentTwo/TestSevenSegmentDisplay.vhd
-- Project Name:  AssignmentTwo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SevenSegmentDisplay
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
 
ENTITY TestSevenSegmentDisplay IS
END TestSevenSegmentDisplay;
 
ARCHITECTURE behavior OF TestSevenSegmentDisplay IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenSegmentDisplay
    PORT(
         Clock : IN  std_logic;
         First : IN  std_logic_vector(3 downto 0);
         Second : IN  std_logic_vector(3 downto 0);
         SegmentSelect : OUT  std_logic_vector(0 to 6);
         LineSelect : OUT  std_logic_vector(0 to 1)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal First : std_logic_vector(3 downto 0) := "0001";
   signal Second : std_logic_vector(3 downto 0) := "0010";

 	--Outputs
   signal SegmentSelect : std_logic_vector(0 to 6);
   signal LineSelect : std_logic_vector(0 to 1);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
   uut: SevenSegmentDisplay PORT MAP (Clock, First, Second, SegmentSelect, LineSelect);
	
   -- Clock process definitions
   process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 
END;
