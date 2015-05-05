
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
	-- Hook up the clock divider and the display
	clockDiv : entity ClockDivider port map (Clock, slowClock);
	display: entity SevenSegmentDisplay port map (Clock, ones, tens, SegmentSelect, AnodeSelect);
	
	-- Much of the IO on the DSX kit uses active low logic, which we will need to invert
	count: entity Counter port map (SlowClock, 
		not Active, 
		not Testmode,
		not Reset, 
		hasOverflow, 
		ones, 
		tens
	);
	
	Overflow <= not hasOverflow;
end Behavioral;

