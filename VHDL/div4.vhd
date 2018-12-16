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

entity div4 is
	port(
		CK50M		: in	std_logic;
		nRST		: in	std_logic;
		CKOUT		: out	std_logic
	);
end div4;

architecture rtl of div4 is
signal counter : unsigned(1 downto 0);
begin
	

	PCNT: process(CK50M, nRST)
	begin
		if (nRST = '0') then
			counter <= (others=>'0');
		elsif (CK50M'event and CK50M = '1') then
		if (counter = 3) then
				counter <= (others=>'0');
			else
				counter <= counter + 1;
			end if;
		end if;
	end process PCNT;
	
	CKOUT <= counter(1);

end rtl;

