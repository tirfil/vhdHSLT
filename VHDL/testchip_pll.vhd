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

LIBRARY altera_mf;
USE altera_mf.all;

entity testchip is
	port(
		MCLK		: in	std_logic;
		--CK4X		: in	std_logic;
		nRST		: in	std_logic;
		TX			: out	std_logic;
		RX			: in	std_logic;
		LED2			: out	std_logic;
		LED			: out	std_logic
	);
end testchip;

architecture struct of testchip is
-- COMPONENTS --


	component pllx4 IS
		port
		(
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC 
		);
	end component;
	component timing
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			E2			: out	std_logic;
			S1			: out	std_logic;
			S2			: out	std_logic
		);
	end component;
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
	component lfsr17
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			EN			: in	std_logic;
			SOUT		: out	std_logic
		);
	end component;
	component bitclock
		port(
			CK4X		: in	std_logic;
			nRST		: in	std_logic;
			RX			: in	std_logic;
			RXOUT		: out	std_logic;
			RXENA		: out	std_logic;
			CKOUT		: out	std_logic
		);
	end component;
	component demanchester
		port(
			CK1X		: in	std_logic;
			nRST		: in	std_logic;
			ENCOD		: in	std_logic;
			DECOD		: out	std_logic;
			ENDECOD		: out	std_logic
		);
	end component;
	component check17
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			ENA			: in	std_logic;
			SIN			: in	std_logic;
			ERR			: out	std_logic
		);
	end component;
	component leddisplay
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			SET			: in	std_logic;
			RESET		: in	std_logic;
			LED			: out	std_logic
		);
	end component;
	component timer250m
		port(
			CK50M		: in	std_logic;
			nRST		: in	std_logic;
			TIC			: out	std_logic
		);
	end component;
	
	signal E2		: std_logic;
	signal E4		: std_logic;
	signal E8		: std_logic;
	signal S1		: std_logic;
	signal S2		: std_logic;
	signal sin		: std_logic;
	signal rxena	: std_logic;
	signal rxout	: std_logic;
	signal sout		: std_logic;
	signal enout	: std_logic;
	signal err		: std_logic;
	signal tic		: std_logic;
	signal rcrclk	: std_logic;
	signal CK4X		: std_logic;
	signal LED2I		: std_logic;
begin
-- PORT MAP --
	I_PLL : pllx4
		port map (
			inclk0 => MCLK,
			c0 => CK4X
		);
	I_timing_0 : timing
		port map (
			MCLK	=> MCLK,
			nRST	=> nRST,
			E2		=> E2,
			S1		=> S1,
			S2		=> S2
		);
	I_manchester_0 : manchester
		port map (
			MCLK	=> MCLK,
			nRST	=> nRST,
			S1		=> S1,
			S2		=> S2,
			SIN		=> SIN,
			SOUT	=> TX
		);
	I_lfsr17_0 : lfsr17
		port map (
			MCLK	=> MCLK,
			nRST	=> nRST,
			EN		=> E2,
			SOUT    => SIN
		);	
	I_bitclock_0 : bitclock
		port map (
			CK4X		=> CK4X,
			nRST		=> nRST,
			RX			=> RX,
			RXOUT		=> RXOUT,
			RXENA		=> RXENA,
			CKOUT 		=> RCRCLK
		);
	I_demanchester_0 : demanchester
		port map (
			CK1X		=> RCRCLK,
			nRST		=> nRST,
			ENCOD		=> RXOUT,
			DECOD		=> SOUT,
			ENDECOD		=> ENOUT
		);
	I_check17_0 : check17
		port map (
			MCLK		=> RCRCLK,
			nRST		=> nRST,
			ENA			=> ENOUT,
			SIN			=> SOUT,
			ERR			=> ERR
		);
	I_leddisplay_0 : leddisplay
		port map (
			MCLK		=> RCRCLK,
			nRST		=> nRST,
			SET			=> ERR,
			RESET		=> TIC,
			LED			=> LED
		);	
	I_timer250m_0 : timer250m
		port map (
			CK50M		=> RCRCLK,
			nRST		=> nRST,
			TIC			=> TIC
		);
	PLED2: process(RCRCLK, nRST)
	begin
		if (nRST = '0') then
			LED2I <= '0';
		elsif (RCRCLK'event and RCRCLK = '1') then
			if (TIC = '1') then
				LED2I <= not(LED2I);
			end if;
		end if;
	end process PLED2;
	LED2 <= LED2I;
end struct;

