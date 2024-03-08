-- ****************************************
-- tittle:	ROM de la carta ASM
-- author:	F.R., G.M.
-- date:		2024-03-08
-- description: La ROM describe una carta ASM, empleando el método de "direccionamiento entrada-estado"
-- ****************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_asm is
	port(
		edopresente: in std_logic_vector(3 downto 0);
		
		prueba: out std_logic_vector(1 downto 0);
		lv_edosig: out std_logic_vector(3 downto 0);
		lf_edosig: out std_logic_vector(3 downto 0);
		salidas: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arq_rom_async of rom_asm is
	type rom_type is array (0 to 15) of std_logic_vector(13 downto 0);
	constant rom: rom_type := (
	-- edo pres => prueba, liga v. (edo sig.), liga f. (edo sig.), salidas
	-- Cuando prueba sea don't care (*) lo tomaremos como 0. Aunque da lo mismo si lo tomamos como 0 o 1 por el diseño del circuito.
		0 => "00001000010001",
		1 => "01010100110010",
		2 => "00010001000000",
		3 => "11100001110101",
		4 => "10011001011000",
		5 => "10100110000001",
		6 => "01101011010010",
		7 => "00101110110010",
		8 => "00101110110000",
		9 => "11110111000110",
		10 => "00000000000100",
		11 => "00000000000100",
		12 => "00000000000000",
		13 => "00000000001000",
		14 => "00000000000000",
		15 => "00000000000000"
		);
	signal rom_in: std_logic_vector (3 downto 0);
	signal rom_out: std_logic_vector (13 downto 0);
	begin
		rom_in <= edopresente;
		rom_out <= rom(to_integer(unsigned(rom_in)));
		
		
		prueba <= rom_out(13 downto 12);
		lv_edosig <= rom_out(11 downto 8);
		lf_edosig <= rom_out(7 downto 4);
		salidas <= rom_out(3 downto 0);
	
end architecture;