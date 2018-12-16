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

entity tb_manchester is
end tb_manchester;

architecture stimulus of tb_manchester is

-- COMPONENTS --
	component manchester
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			S1		: in	std_logic;
			S2		: in	std_logic;
			SIN		: in	std_logic;
			SOUT		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK		: std_logic;
	signal nRST		: std_logic;
	signal S1		: std_logic;
	signal S2		: std_logic;
	signal SIN		: std_logic;
	signal SOUT		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_manchester_0 : manchester
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			S1		=> S1,
			S2		=> S2,
			SIN		=> SIN,
			SOUT		=> SOUT
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
