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

entity testchip is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		TX		: out	std_logic;
		RX		: in	std_logic;
		LED		: out	std_logic
	);
end testchip;

architecture struct of testchip is

begin

	TODO: process(MCLK, nRST)
	begin
		if (nRST = '0') then

		elsif (MCLK'event and MCLK = '1') then

	end process TODO;

end struct;

