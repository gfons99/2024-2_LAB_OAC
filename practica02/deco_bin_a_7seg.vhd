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
	edo: in std_logic_vector(2 downto 0);
	seg: out std_logic_vector(7 downto 0)
	);
end entity;

architecture frgm of deco_bin_a_7seg is
begin
	with edo select
				  --abcdefg,dp
		seg <= 	
			"00000011" when "000", -- 0
			"10011111" when "001",
			"00100101" when "010",
			"00001101" when "011",
			"10011001" when "100",
			"01001001" when "101",
			"01000001" when "110",
			"00011111" when "111", -- 7
			"11111111" when others;
		
end architecture;