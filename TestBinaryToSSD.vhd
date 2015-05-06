LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TestBinaryToSSD IS
END TestBinaryToSSD;
 
ARCHITECTURE behavior OF TestBinaryToSSD IS 
   signal binaryDigit : unsigned(3 downto 0) := (others => '0');
   signal output : std_logic_vector(0 to 6);
BEGIN
	
	c1: work.BinaryToSSD port map (std_logic_vector(binaryDigit), output);
	
   -- Stimulus process
   process
   begin
      wait for 100 ns;	
		binaryDigit <= binaryDigit + 1;
   end process;

END;
