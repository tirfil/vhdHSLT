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

entity leddisplay is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SET		: in	std_logic;
		RESET		: in	std_logic;
		LED		: out	std_logic
	);
end leddisplay;

architecture rtl of leddisplay is

begin

	TODO: process(MCLK, nRST)
	begin
		if (nRST = '0') then

		elsif (MCLK'event and MCLK = '1') then

	end process TODO;

end rtl;

