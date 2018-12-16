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

entity demanchester is
	port(
		CK1X		: in	std_logic;
		nRST		: in	std_logic;
		ENCOD		: in	std_logic;
		DECOD		: out	std_logic;
		ENDECOD		: out	std_logic
	);
end demanchester;

architecture rtl of demanchester is
type state_t is (S_SYMBOL,S_INTER);
signal state : state_t;
signal store : std_logic;
signal value_change : std_logic;
begin

	PSTOR: process(CK1X, nRST)
	begin
		if (nRST = '0') then
			store <= '0';
		elsif (CK1X'event and CK1X = '1') then
				store <= ENCOD;
		end if;
	end process PSTOR;
	
	value_change <= store xor ENCOD;
	
	POTO: process(CK1X, nRST)
	begin
		if (nRST = '0') then
			state <= S_SYMBOL;
			ENDECOD <= '0';
			DECOD <= '0';
		elsif (CK1X'event and CK1X = '1') then
			if (state = S_SYMBOL) then
				state <= S_INTER;
				ENDECOD <= '0';
			elsif (state = S_INTER) then
				if (value_change = '1') then
					state <= S_SYMBOL;
					DECOD <= not ENCOD;
					ENDECOD <= '1';
				else
					ENDECOD <= '0';
				end if;
			end if;
		end if;
	end process POTO;
end rtl;

