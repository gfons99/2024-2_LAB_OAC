-- ****************************************
-- tittle:	ROM de la carta ASM
-- author:	F.R., G.M.
-- date:		2024-02-28
-- description: La ROM describe una carta ASM, empleando el método de "direccionamiento por trayectoria
-- ****************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_asm is
	port(
		edopresente: in std_logic_vector(2 downto 0);
		entradas: in std_logic_vector(3 downto 0);
		
		edosiguiente: out std_logic_vector(2 downto 0);
		salidas: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arq_rom_async of rom_asm is
	type rom_type is array (0 to 127) of std_logic_vector(6 downto 0);
	constant rom: rom_type := (
		0 => "0010001",
		1 => "0010001",
		2 => "0010001",
		3 => "0010001",
		4 => "0010001",
		5 => "0010001",
		6 => "0010001",
		7 => "0010001",
		8 => "0100011",
		9 => "0100011",
		10 => "0100011",
		11 => "0100011",
		12 => "0100011",
		13 => "0100011",
		14 => "0100011",
		15 => "0100011",
		16 => "1101011",
		17 => "1101011",
		18 => "1101011",
		19 => "1101011",
		24 => "1101011",
		25 => "1101011",
		26 => "1101011",
		27 => "1101011",
		20 => "0111010",
		21 => "0111010",
		22 => "0111010",
		23 => "0111010",
		28 => "0111010",
		29 => "0111010",
		30 => "0111010",
		31 => "0111010",
		32 => "0110100",
		34 => "0110100",
		36 => "1011101",
		38 => "1011101",
		40 => "0110100",
		42 => "0110100",
		44 => "1011101",
		46 => "1011101",
		33 => "1000111",
		35 => "1000111",
		41 => "1000111",
		43 => "1000111",
		37 => "1011101",
		39 => "1011101",
		45 => "1011101",
		47 => "1011101",
		48 => "1101011",
		49 => "1101011",
		52 => "1101011",
		53 => "1101011",
		56 => "1101011",
		57 => "1101011",
		60 => "1101011",
		61 => "1101011",
		50 => "1110001",
		51 => "1110001",
		54 => "1110001",
		55 => "1110001",
		58 => "1110001",
		59 => "1110001",
		62 => "1110001",
		63 => "1110001",
		64 => "1101010",
		65 => "1101010",
		68 => "1101010",
		69 => "1101010",
		72 => "1101010",
		73 => "1101010",
		76 => "1101010",
		77 => "1101010",
		66 => "1110010",
		67 => "1110010",
		70 => "1110010",
		71 => "1110010",
		74 => "1110010",
		75 => "1110010",
		78 => "1110010",
		79 => "1110010",
		80 => "1011000",
		81 => "1011000",
		84 => "1011000",
		85 => "1011000",
		88 => "1011000",
		89 => "1011000",
		92 => "1011000",
		93 => "1011000",
		82 => "0001000",
		83 => "0001000",
		86 => "0001000",
		87 => "0001000",
		90 => "0001000",
		91 => "0001000",
		94 => "0001000",
		95 => "0001000",
		96 => "0000100",
		97 => "0000100",
		98 => "0000100",
		99 => "0000100",
		100 => "0000100",
		101 => "0000100",
		102 => "0000100",
		103 => "0000100",
		104 => "0000100",
		105 => "0000100",
		106 => "0000100",
		107 => "0000100",
		108 => "0000100",
		109 => "0000100",
		110 => "0000100",
		111 => "0000100",
		112 => "0001000",
		113 => "0001000",
		114 => "0001000",
		115 => "0001000",
		116 => "0001000",
		117 => "0001000",
		118 => "0001000",
		119 => "0001000",
		120 => "0001000",
		121 => "0001000",
		122 => "0001000",
		123 => "0001000",
		124 => "0001000",
		125 => "0001000",
		126 => "0001000",
		127 => "0001000"
		);
	signal rom_in: std_logic_vector (6 downto 0);
	signal rom_out: std_logic_vector (6 downto 0);
	begin
		rom_in(6 downto 4) <= edopresente;
		rom_in(3 downto 0) <= entradas;
		rom_out <= rom(to_integer(unsigned(rom_in)));
		
		edosiguiente <= rom_out(6 downto 4);
		salidas <= rom_out(3 downto 0);
	
end architecture;