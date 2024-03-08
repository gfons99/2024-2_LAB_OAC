-- ****************************************
-- tittle:	Registro (latch)
-- author:	F.R., G.M.
-- date:		2024-03-08
-- description: Almaneca de forma temporal el estado actual de la carta ASM
-- ****************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registro is
	port(
		clk: in std_logic;
		
		edosiguiente: in std_logic_vector(3 downto 0);
		reset: in std_logic;

		edopresente: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arq_rom_async of registro is
	begin
		process(clk)
		begin
		if rising_edge(clk) then
			if reset = '1' then
				edopresente <= "0000";
			else
				edopresente <= edosiguiente;
			end if;
		end if;
		end process;
end architecture;