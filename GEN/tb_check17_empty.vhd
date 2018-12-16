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

entity tb_check17 is
end tb_check17;

architecture stimulus of tb_check17 is

-- COMPONENTS --
	component check17
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			ENA		: in	std_logic;
			SIN		: in	std_logic;
			ERR		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK		: std_logic;
	signal nRST		: std_logic;
	signal ENA		: std_logic;
	signal SIN		: std_logic;
	signal ERR		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_check17_0 : check17
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			ENA		=> ENA,
			SIN		=> SIN,
			ERR		=> ERR
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
