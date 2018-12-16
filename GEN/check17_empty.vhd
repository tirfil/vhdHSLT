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

entity check17 is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		ENA		: in	std_logic;
		SIN		: in	std_logic;
		ERR		: out	std_logic
	);
end check17;

architecture rtl of check17 is

begin

	TODO: process(MCLK, nRST)
	begin
		if (nRST = '0') then

		elsif (MCLK'event and MCLK = '1') then

	end process TODO;

end rtl;

