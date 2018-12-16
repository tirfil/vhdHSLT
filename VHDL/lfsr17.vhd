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

entity lfsr17 is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		EN			: in	std_logic;
		SOUT		: out	std_logic
	);
end lfsr17;

architecture rtl of lfsr17 is
signal lfsr		: std_logic_vector(16 downto 0);

begin

	PLFSR: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			lfsr <= "11100011100011100";
		elsif (MCLK'event and MCLK = '1') then
			if (EN = '1') then
				lfsr(0) <= lfsr(16) xor lfsr(13);
				lfsr(16 downto 1) <= lfsr(15 downto 0);
			end if;
		end if;
	end process PLFSR;
	
	SOUT <= lfsr(16);
	
end rtl;

