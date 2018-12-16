--###############################
--# Project Name : 
--# File         : 
--# Author       : 
--# Description  : counter 250 ms with 50 MHz input clock
--# Modification History
--#
--###############################

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity timer250m is
	port(
		CK50M		: in	std_logic;
		nRST		: in	std_logic;
		TIC		: out	std_logic
	);
end timer250m;

architecture rtl of timer250m is
signal counter : unsigned(22 downto 0);
signal detect : std_logic;
begin
	
	detect <= counter(22) and counter(21); 
	--test
	--detect <= counter(15);

	PCNT: process(CK50M, nRST)
	begin
		if (nRST = '0') then
			counter <= (others=>'0');
		elsif (CK50M'event and CK50M = '1') then
			if (detect = '1') then
				counter <= (0=>'1',others=>'0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process PCNT;
	
	TIC <= detect;

end rtl;

