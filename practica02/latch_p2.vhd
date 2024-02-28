library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity latch_p2 is
	port (
			clk	: in std_logic;
			rst 	: in std_logic;
			x		: in std_logic;
			y		: in std_logic;
			z		: in std_logic;
			w		: in std_logic;
			liga	: in std_logic_vector(2 downto 0);
			estado_presente_entradas	:	out std_logic_vector(6 downto 0)
			);
end latch_p2;

architecture arq of latch_p2 is
begin
	proceso : process (clk, rst) is
	begin
		if rst='1' then 
			estado_presente_entradas <=	(others => '0');
		elsif clk='1' and clk'event then
			estado_presente_entradas <=	liga & x & y & z & w;
		end if;
	end process;
end arq;