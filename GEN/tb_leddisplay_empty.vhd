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

entity tb_leddisplay is
end tb_leddisplay;

architecture stimulus of tb_leddisplay is

-- COMPONENTS --
	component leddisplay
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			SET		: in	std_logic;
			RESET		: in	std_logic;
			LED		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK		: std_logic;
	signal nRST		: std_logic;
	signal SET		: std_logic;
	signal RESET		: std_logic;
	signal LED		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_leddisplay_0 : leddisplay
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			SET		=> SET,
			RESET		=> RESET,
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
