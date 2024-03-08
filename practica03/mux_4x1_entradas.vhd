-- ****************************************
-- tittle:	Multiplexor 4x1
-- author:	F.R., G.M.
-- date:		2024-03-08
-- description: Permite seleccionar las entradas Q0...QN
-- ****************************************
library ieee;
use ieee.std_logic_1164.all;

entity mux_4x1_entradas is
	port(
	entradas: in std_logic_vector(3 downto 0);
	
	sel: in std_logic_vector(1 downto 0);
	
	sal: out std_logic
	);
end entity;

architecture arq_mux of mux_4x1_entradas is
begin
	with sel select
		sal <=
			entradas(0) when "00",
			entradas(1) when "01",
			entradas(2) when "10",
			entradas(3) when "11";
end architecture;