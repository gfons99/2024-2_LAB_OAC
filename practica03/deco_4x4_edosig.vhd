-- ****************************************
-- tittle:	Decodificador 4x4
-- author:	F.R., G.M.
-- date:		2024-03-08
-- description: Permite seleccionar el estado siguiente. Se considerará 1 para la liga verdadera y 0 para la liga falsa.
-- ****************************************
library ieee;
use ieee.std_logic_1164.all;

entity deco_4x4_edosig is
	port(
	liga_v: in std_logic_vector(3 downto 0);
	liga_f: in std_logic_vector(3 downto 0);

	sel: in std_logic;
	
	sal: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arq_deco of deco_4x4_edosig is
begin
	with sel select
		sal <=
			liga_f when '0',
			liga_v when '1';
end architecture;