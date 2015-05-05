library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Clock divider to turn a 20ms clock to 1s

entity ClockDivider is
    Port ( Clock : in STD_LOGIC;
           DivClock : buffer STD_LOGIC := '0');
end ClockDivider;

architecture Behavioral of ClockDivider is
	signal count : natural range 1 to 250 := 1;
begin
	process (Clock)
	begin
		if rising_edge(Clock) then
			count <= count + 1;
			
			--When the value is back to 1 we have recieved 250 pulses at 20ms apart
			--meaning 0.5 seconds have past and we need to invert our clock
			if count = 1 then 
				DivClock <= not DivClock;
			end if;
		end if;
	end process;

end Behavioral;