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
signal detect : std_logic;
begin

	P0: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			LED <= '0';
			detect <= '0';
		elsif (MCLK'event and MCLK = '1') then
			if RESET = '1' then
				LED <= detect;
				detect <= '0';
			end if;
			if SET = '1' then
				detect <= '1';
			end if;
		end if;
	end process P0;

end rtl;

