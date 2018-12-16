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

entity tb_timing is
end tb_timing;

architecture stimulus of tb_timing is

-- COMPONENTS --
	component timing
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			E2		: out	std_logic;
			E4		: out	std_logic;
			E8		: out	std_logic;
			S1		: out	std_logic;
			S2		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK		: std_logic;
	signal nRST		: std_logic;
	signal E2		: std_logic;
	signal E4		: std_logic;
	signal E8		: std_logic;
	signal S1		: std_logic;
	signal S2		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_timing_0 : timing
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			E2		=> E2,
			E4		=> E4,
			E8		=> E8,
			S1		=> S1,
			S2		=> S2
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
