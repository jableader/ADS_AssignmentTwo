library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Allows us to display the given binary digits on the seven segment display

entity SevenSegmentDisplay is
    Port ( Clock : in  STD_LOGIC;
           First, Second : in  STD_LOGIC_VECTOR (3 downto 0);
           SegmentSelect : in  STD_LOGIC_VECTOR (6 downto 0);
           LineSelect : in  STD_LOGIC_VECTOR (1 downto 0));
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is

signal lineToUse : std_logic := '0';
signal numToUse : std_logic_vector(3 downto 0) := First;

begin
	--On each clock tick we alternate which number to display
	process(Clock)
	begin
		if rising_edge(Clock) then
			lineToUse <= inv(lineToUse);
		end if;
	end process;
	
	LineSelect <= "10" when lineToUse = '1' else "01";
	numToUse <= First when lineToUse = '1' else Second;
	
	c1: BinaryToSSD port map (numToUse, SegmentSelect);
end Behavioral;