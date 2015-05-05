library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Convert binary digits 0-9 into a format to be displayed on the seven segment display
entity BinaryToSSD is
	port (
		value : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(6 downto 0)
	);
end;

architecture Behavoural of BinaryTOSSD is
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

