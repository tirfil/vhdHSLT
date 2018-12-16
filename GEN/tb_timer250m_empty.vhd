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

entity tb_timer250m is
end tb_timer250m;

architecture stimulus of tb_timer250m is

-- COMPONENTS --
	component timer250m
		port(
			CK50M		: in	std_logic;
			nRST		: in	std_logic;
			TIC		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal CK50M		: std_logic;
	signal nRST		: std_logic;
	signal TIC		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_timer250m_0 : timer250m
		port map (
			CK50M		=> CK50M,
			nRST		=> nRST,
			TIC		=> TIC
		);

--
	CLOCK: process
	begin
		while (RUNNING = '1') loop
			CK50M <= '1';
			wait for 10 ns;
			CK50M <= '0';
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
