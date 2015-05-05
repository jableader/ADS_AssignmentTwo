----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:50:56 05/05/2015 
-- Design Name: 
-- Module Name:    SevenSegmentDisplay - Behavioral 
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

entity SevenSegmentDisplay is
    Port ( Clock : in  STD_LOGIC;
           First : in  STD_LOGIC_VECTOR (3 downto 0);
           Second : in  STD_LOGIC_VECTOR (3 downto 0);
           SegmentSelect : in  STD_LOGIC_VECTOR (6 downto 0);
           LineSelect : in  STD_LOGIC_VECTOR (1 downto 0));
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is

signal lineToUse : std_logic := '0';
signal numToUse : std_logic_vector(3 downto 0) := First;

begin
	process(Clock)
	begin
		if rising_edge(Clock) then
			lineToUse <= inv(lineToUse);
		end if;
	end process;
	
	LineSelect <= "10" when lineToUse = '1' else "01";
	numToUse <= First when lineToUse = '1' else Second;
	
	c1: CathodeSelect port map (lineToUse, SegmentSelect);
end Behavioral;



entity CathodeSelect is
	port (
		value : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(6 downto 0)
	);
end;

architecture Behavoural of CathodeSelect is
begin
	with value select Output <=
		"1111110" when "0000",
		"0110000" when "0001",
		"1101101" when "0010",
		"1111001" when "0011",
		"0110011" when "0100",
		"1011011" when "0101",
		"1011111" when "0110",
		"1110000" when "0111",
		"1111111" when "1000",
		"1111011" when "1001",
		"1001111" when others;
end;