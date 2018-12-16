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

entity manchester is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		S1			: in	std_logic;
		S2			: in	std_logic;
		SIN			: in	std_logic;
		SOUT		: out	std_logic
	);
end manchester;

architecture rtl of manchester is

begin

	P0: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			SOUT <= '1';
		elsif (MCLK'event and MCLK = '1') then
			if (S1 = '1') then
				SOUT <= SIN;
			elsif (S2 = '1') then
				SOUT <= not(SIN);
			end if;
		end if;
	end process P0;

end rtl;

