--###############################
--# Project Name : 
--# File         : 
--# Author       : 
--# Description  : 
--# Modification History
--#
--###############################

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity timing is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		E2		: out	std_logic;
		S1		: out	std_logic;
		S2		: out	std_logic
	);
end timing;

architecture rtl of timing is
signal counter : std_logic_vector(2 downto 0);
begin

	PCNT: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			counter <= (others=>'0');
		elsif (MCLK'event and MCLK = '1') then
			if (counter = "111") then
				counter <= (others=>'0');
			else
				counter <= std_logic_vector(unsigned(counter) + 1 );
			end if;
		end if;
	end process PCNT;
	
	E2 <= counter(0);
	S1 <= not counter(0);
	S2 <= counter(0);

end rtl;

