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
signal check : std_logic_vector(17 downto 0);
begin

	PCHECK: process(MCLK, nRST)
	begin
		if (nRST = '0') then
			check <= (others=>'0');
		elsif (MCLK'event and MCLK = '1') then
			if (ENA='1') then
				check(0) <= SIN;
				check(17 downto 1) <= check(16 downto 0);
			end if;
		end if;
	end process PCHECK;		
	
	ERR <= check(0) xor check(17) xor check(14);

end rtl;

