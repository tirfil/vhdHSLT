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

entity tb_testchip is
end tb_testchip;

architecture stimulus of tb_testchip is

-- COMPONENTS --
	component testchip
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			TX		: out	std_logic;
			RX		: in	std_logic;
			LED		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK		: std_logic;
	signal nRST		: std_logic;
	signal TX		: std_logic;
	signal RX		: std_logic;
	signal LED		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_testchip_0 : testchip
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			TX		=> TX,
			RX		=> RX,
			LED		=> LED
		);

--
	CLOCK: process
	begin
		while (RUNNING = '1') loop
			MCLK <= '1';
			wait for 10 ns;
			MCLK <= '0';
			wait for 10 ns;
		end loop;
		wait;
	end process CLOCK;

	GO: process
	begin
		nRST <= '0';
		wait for 1000 ns;
		nRST <= '1';

		RUNNING <= '0';
		wait;
	end process GO;

end stimulus;
