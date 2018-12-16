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

entity bitclock is
	port(
		CK4X		: in	std_logic;
		nRST		: in	std_logic;
		RX		: in	std_logic;
		RXOUT		: out	std_logic;
		RXENA		: out	std_logic;
		CKOUT		: out	std_logic
	);
end bitclock;

architecture rtl of bitclock is
signal rx1,rx2,rx3,rx4: std_logic;
signal transition : std_logic;
signal count : integer range 0 to 3;
begin

	PSYNC: process(CK4X, nRST)
	begin
		if (nRST = '0') then
			rx1 <= '0';
			rx2 <= '0';
			rx3 <= '0';
			rx4 <= '0';
		elsif (CK4X'event and CK4X = '1') then
			rx1 <= RX;
			rx2 <= rx1;
			rx3 <= rx2;
			rx4 <= rx3;
		end if;
	end process PSYNC;
	
	transition <= rx3 xor rx4;
	
	PCNT : process(CK4X, nRST)
	begin
		if (nRST = '0') then
			count <= 0;
			RXENA <= '0';
		elsif (CK4X'event and CK4X = '1') then
			if (transition = '1') then
				count <= 3;
				RXENA <= '0';
			elsif (count = 3) then
				count <= 0;
				RXENA <= '1';
			elsif (count = 1) then
				count <= 2;
				RXENA <= '0';
			else
				count <= count + 1;
				RXENA <= '0';
			end if;
		end if;
	end process PCNT;
	
	PCK: process(CK4X, nRST)
	begin
		if (nRST = '0') then
			CKOUT <= '0';
		elsif (CK4X'event and CK4X = '1') then
			if (transition = '1' or count = 2) then
				CKOUT <= '0';
			elsif (count = 0) then
				CKOUT <= '1';
			end if;
		end if;
	end process;

	RXOUT <= rx4;
	
end rtl;

