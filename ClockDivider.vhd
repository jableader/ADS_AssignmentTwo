library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Clock divider to turn a 2ms clock to 1s

entity ClockDivider is
    Port ( Clock, Reset : in STD_LOGIC;
           DivClock : BUFFER STD_LOGIC := '0');
end ClockDivider;

architecture Behavioral of ClockDivider is
	signal count : natural range 1 to 250 := 1;
begin
	process (Clock, Reset)
	begin
		if Reset = '1' then
			count <= 1;
		elsif rising_edge(Clock) then
			count <= count + 1;
			
			--When the value is back to 1 we have recieved 250 pulses at 20ms apart
			--meaning 0.5 seconds have past and we need to invert our clock
			if count = 250 then 
				DivClock <= not DivClock;
				count <= 1;
			end if;
		end if;
	end process;
end Behavioral;