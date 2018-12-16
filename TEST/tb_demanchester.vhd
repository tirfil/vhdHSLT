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

entity tb_demanchester is
end tb_demanchester;

architecture stimulus of tb_demanchester is

-- COMPONENTS --
	component demanchester
		port(
			CK4X		: in	std_logic;
			nRST		: in	std_logic;
			ENENCOD		: in	std_logic;
			ENCOD		: in	std_logic;
			DECOD		: out	std_logic;
			ENDECOD		: out	std_logic
		);
	end component;

--
-- SIGNALS --
	signal CK4X		: std_logic;
	signal nRST		: std_logic;
	signal ENENCOD		: std_logic;
	signal ENCOD		: std_logic;
	signal DECOD		: std_logic;
	signal ENDECOD		: std_logic;

--
	signal RUNNING	: std_logic := '1';

begin

-- PORT MAP --
	I_demanchester_0 : demanchester
		port map (
			CK4X		=> CK4X,
			nRST		=> nRST,
			ENENCOD		=> ENENCOD,
			ENCOD		=> ENCOD,
			DECOD		=> DECOD,
			ENDECOD		=> ENDECOD
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
	procedure ONE is
	begin
		ENENCOD <= '1';
		ENCOD <= '1';
		wait for 20 ns;
		ENENCOD <= '0';
		wait for 60 ns;
		ENENCOD <= '1';
		ENCOD <= '0';
		wait for 20 ns;
		ENENCOD <= '0';
		wait for 60 ns;
	end ONE;
	procedure ZERO is
	begin
		ENENCOD <= '1';		
		ENCOD <= '0';
		wait for 20 ns;
		ENENCOD <= '0';
		wait for 60 ns;
		ENENCOD <= '1';	
		ENCOD <= '1';
		wait for 20 ns;
		ENENCOD <= '0';
		wait for 60 ns;
	end ZERO; 		
	begin
		nRST <= '0';
		ENENCOD <= '0';
		ENCOD <= '0';		
		wait for 1000 ns;
		nRST <= '1';
		wait for 41 ns;
		--ENENCOD <= '1';
		ONE;
		ZERO;
		ONE;
		ZERO;
		ONE;
		ONE;
		ZERO;
		ZERO;
		ONE;
		ONE;
		ONE;
		ZERO;
		ZERO;	
		ZERO;	
		RUNNING <= '0';
		wait;
	end process GO;

end stimulus;
