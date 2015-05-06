
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TopLevel is
	Port (
			Clock, Active, Testmode, Reset : in std_logic;
			Overflow : out std_logic := '1';
			SegmentSelect : out std_logic_vector(0 to 6);
			AnodeSelect : out std_logic_vector(0 to 1)
		);
end TopLevel;

architecture Behavioral of TopLevel is
	signal ones, tens : std_logic_vector(3 downto 0);
	signal slowClock, hasOverflow : std_logic;
	
begin
	-- Much of the IO on the DSX kit uses active low logic, which we will need to invert

	-- Hook up the clock divider and the display
	clockDiv : entity work.ClockDivider port map (Clock, not Reset, not Active, slowClock);
	display: entity work.SevenSegmentDisplay port map (Clock, ones, tens, SegmentSelect, AnodeSelect);
	
	count: entity work.Counter port map (SlowClock, 
		not Testmode,
		not Reset, 
		hasOverflow, 
		ones, 
		tens
	);
	
	Overflow <= not hasOverflow;
end Behavioral;

