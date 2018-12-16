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

entity timer250m is
	port(
		CK50M		: in	std_logic;
		nRST		: in	std_logic;
		TIC		: out	std_logic
	);
end timer250m;

architecture rtl of timer250m is

begin

	TODO: process(CK50M, nRST)
	begin
		if (nRST = '0') then

		elsif (CK50M'event and CK50M = '1') then

	end process TODO;

end rtl;

