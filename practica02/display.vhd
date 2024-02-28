library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity display is
	port(estado_presente_entradas	:	in std_logic_vector(6 downto 0);
	d0	:	out	std_logic;
	d1	:	out	std_logic;
	d2	:	out	std_logic;
	d3	:	out	std_logic;
	d4	:	out	std_logic;
	d5	:	out	std_logic;
	d6	:	out	std_logic);
end display;

architecture arq of display is
	signal estado	: std_logic_vector(2 downto 0);
	signal display : std_logic_vector(6 downto 0);
	
	begin
		estado	<=	estado_presente_entradas(6 downto 4);
		
		with estado	select

			display <= "1000000" when "000",
						  "1111001" when "001",
						  "0100100" when "010",
						  "0110000" when "011",
						  "0011001" when "100",
						  "0010010" when "101",
						  "0000010" when "110",
						  "1111000" when "111";
						  
		
		d0 <= display(0);
		d1 <= display(1);
		d2 <= display(2);
		d3 <= display(3);
		d4 <= display(4);
		d5 <= display(5);
		d6 <= display(6);
end arq;