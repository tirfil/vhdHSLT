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

entity tb_bitclock is
end tb_bitclock;

architecture stimulus of tb_bitclock is

-- COMPONENTS --
	component bitclock
		port(
			CK4X		: in	std_logic;
			nRST		: in	std_logic;
			RX		: in	std_logic;
			RXOUT		: out	std_logic;
			RXENA		: out	std_logic;
			CKOUT		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal CK4X		: std_logic;
	signal nRST		: std_logic;
	signal RX		: std_logic;
	signal RXOUT		: std_logic;
	signal RXENA		: std_logic;

--
	signal RUNNING	: std_logic := '1';
	
	--constant DELAY : TIME := 75 ns;
	constant DELAY : TIME := 80 ns;
	--constant DELAY : TIME := 85 ns;

begin

-- PORT MAP --
	I_bitclock_0 : bitclock
		port map (
			CK4X		=> CK4X,
			nRST		=> nRST,
			RX		=> RX,
			RXOUT		=> RXOUT,
			RXENA		=> RXENA,
			CKOUT 		=> open
		);

--
	CLOCK: process
	begin
		while (RUNNING = '1') loop
			CK4X <= '1';
			wait for 10 ns;
			CK4X <= '0';
			wait for 10 ns;
		end loop;
		wait;
	end process CLOCK;

	GO: process
	begin
		nRST <= '0';
		RX <= '0';
		wait for 1000 ns;
		nRST <= '1';
		wait for 70 ns;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;
		RX <= '1';
		wait for DELAY;
		RX <= '0';
		wait for DELAY;		
		RUNNING <= '0';
		wait;
	end process GO;

end stimulus;
