library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Counter implementation, with Enable & Async Reset
-- When Testmode = '1', counter will overflow at 19 rather than 99
-- When overflow has happened, the overflow line will be high for 5 seconds
entity Counter is
	Port (
		Clock, Enable, Testmode, Reset : in std_logic;
		Overflow : out std_logic := '0';
		Ones, Tens : out std_logic_vector(3 downto 0)
	);
end Counter;

architecture Behavioral of Counter is
	signal lowerDigit, upperDigit : unsigned(3 downto 0) := (others => '0');
	
begin
	
	process (Clock, Reset)
	begin
		--Overriding Reset
		if Reset = '1' then
			lowerDigit <= "0000";
			upperDigit <= "0000";
			Overflow <= '0';
		
		elsif rising_edge(Clock) then
			if Enable = '1' then
				--If the lower digit is up to 9, we reset it to 0 and increment the upper digit
				if lowerDigit = "1001" then
					lowerDigit <= "0000";
					
					--If the upper digit is ready for overflow
					if upperDigit = "1001" or (Test = '1' and upperDigit = "0010") then
					
						--Mark the overflow flag and reset it to 0
						Overflow <= '1';
						upperDigit <= "0000";
					else
						
						--Otherwise we are good to increment it
						upperDigit <= upperDigit + 1;
					end if;
				else
					lowerDigit <= lowerDigit + 1;
					
					--If lowerDigit is up to 5 then we can set the overflow bit to 0
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

