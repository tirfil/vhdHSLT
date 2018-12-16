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
		E4		: out	std_logic;
		E8		: out	std_logic;
		S1		: out	std_logic;
		S2		: out	std_logic
	);
end timing;

architecture rtl of timing is

begin

	TODO: process(MCLK, nRST)
	begin
		if (nRST = '0') then

		elsif (MCLK'event and MCLK = '1') then

	end process TODO;

end rtl;

