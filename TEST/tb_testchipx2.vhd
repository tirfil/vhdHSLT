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
			LED2		: out	std_logic;
			LED		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal MCLK0		: std_logic;
	signal MCLK1		: std_logic;
	signal nRST		: std_logic;
	signal TX		: std_logic;
	signal RX		: std_logic;
	signal LED10		: std_logic;
	signal LED20		: std_logic;
	signal LED11		: std_logic;
	signal LED21		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_testchip_0 : testchip
		port map (
			MCLK		=> MCLK0,
			nRST		=> nRST,
			TX		=> TX,
			RX		=> RX,
			LED2	=> LED20,
			LED		=> LED10
		);
		
	-- PORT MAP --
	I_testchip_1 : testchip
		port map (
			MCLK		=> MCLK1,
			nRST		=> nRST,
			TX		=> RX,
			RX		=> TX,
			LED2	=> LED21,
			LED		=> LED11
		);

--
	
	CLOCK0: process
	begin
		while (RUNNING = '1') loop
			MCLK0 <= '1';
			wait for 41 ns;
			MCLK0 <= '0';
			wait for 41 ns;
		end loop;
		wait;
	end process CLOCK0;
	
	CLOCK1: process
	begin
		while (RUNNING = '1') loop
			MCLK1 <= '1';
			wait for 39 ns;
			MCLK1 <= '0';
			wait for 39 ns;
		end loop;
		wait;
	end process CLOCK1;
	

	GO: process
	begin
		nRST <= '0';
		wait for 401 ns;
		nRST <= '1';
		wait for 300 ms;
		RUNNING <= '0';
		wait;
	end process GO;

end stimulus;
