----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:12 05/05/2015 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
	Port (
		Clock, Active, Testmode, Reset : in std_logic;
		Overflow : out std_logic := '0';
		Ones, Tens : out std_logic_vector(3 downto 0)
	);
end Counter;

architecture Behavioral of Counter is
	signal lowerDigit, upperDigit : unsigned(3 downto 0) := (others => '0');
	
begin
	
	process (SlowClock, Reset)
	begin
		if Reset = '1' then
			lowerDigit <= "0000";
			upperDigit <= "0000";
			Overflow <= "0";
		
		elsif rising_edge(SlowClock) then
			if Active = '1' then
				if lowerDigit = "1001" then
					lowerDigit <= "0000";
					
					if upperDigit = "1001" or (Test = '1' and upperDigit = "0010") then
						Overflow <= '1';
						upperDigit <= "0000";
					else
						upperDigit <= upperDigit + 1;
					end if;
				else
					lowerDigit <= lowerDigit + 1;
					if lowerDigit = "0100" then
						Overflow <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	Ones <= std_logic_vector(lowerDigit);
	Tens <= std_logic_vector(upperDigit);
end Behavioral;

