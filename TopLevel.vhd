
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TopLevel is
	Port (
			Clock, Active, Testmode, Reset : in std_logic;
			Overflow : out std_logic := '1';
			SegmentSelect : out std_logic_vector(6 downto 0);
			AnodeSelect : out std_logic_vector(1 downto 0)
		);
end TopLevel;

architecture Behavioral of TopLevel is
	signal ones, tens : std_logic_vector(3 downto 0);
	signal slowClock, doReset, enableClock, enableTestMode : std_logic;

begin
	clockDiv : ClockDivider port map (Clock, slowClock);
	display: SevenSegDisplay port map (Clock, ones, tens, SegmentSelect, AnodeSelect);
	
	count: Counter port map (SlowClock, 
		not Active, 
		not Testmode,
		not Reset, 
		hasOverflow, 
		ones, 
		tens
	);

	-- Much of the IO on the DSX kit uses active low logic, which we will need to invert
	Overflow <= not hasOverflow;
	isEnabled <= not Active;
	
end Behavioral;

