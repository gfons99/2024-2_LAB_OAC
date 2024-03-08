-- ****************************************
-- tittle:	Decodificador de binario a 7 segmentos
-- author:	F.R., G.M.
-- date:		2024-02-28
-- description: Muestra el estado actual de la carta ASM en un DP7S
-- ****************************************

library ieee;
use ieee.std_logic_1164.all;

entity deco_bin_a_7seg is
port(
	edo: in std_logic_vector(3 downto 0);
	seg: out std_logic_vector(7 downto 0)
	);
end entity;

architecture frgm of deco_bin_a_7seg is
begin
	with edo select
				  --abcdefg,dp
		seg <= 	
			"00000011" when "0000", -- 0
			"10011111" when "0001",
			"00100101" when "0010",
			"00001101" when "0011",
			"10011001" when "0100",
			"01001001" when "0101",
			"01000001" when "0110",
			"00011111" when "0111",
			"00000001" when "1000",
			"00001001" when "1001", -- 9
			"00010001" when "1010", -- A
			"11000001" when "1011", -- B
			"01100011" when "1100", -- C
			"10000101" when "1101", -- D
			"01100001" when "1110", -- E
			"01110001" when "1111"; -- F
		
end architecture;