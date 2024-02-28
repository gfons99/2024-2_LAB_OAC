library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rom is
	port (estado_presente_entradas: in std_logic_vector (6 downto 0);
			s0: out std_logic;
			s1: out std_logic; 
			s2: out std_logic;
			s3: out std_logic;
			liga: buffer std_logic_vector (2 downto 0));
end rom;

architecture arq of rom is 
--Declaración de las constantes asociadas a los valores de ESTADOS
constant e0: std_logic_vector (2 downto 0):="000";
constant e1: std_logic_vector (2 downto 0):="001";
constant e2: std_logic_vector (2 downto 0):="010";
constant e3: std_logic_vector (2 downto 0):="011";
constant e4: std_logic_vector (2 downto 0):="100";
constant e5: std_logic_vector (2 downto 0):="101";
constant e6: std_logic_vector (2 downto 0):="110"; 
constant e7: std_logic_vector (2 downto 0):="111";

--Declaración de señales a utilziar
signal estado : std_logic_vector (2 downto 0); 
signal entradas: std_logic_vector (3 downto 0);

begin
--Obtención de datos de estado
	estado <= estado_presente_entradas (6 downto 4); 
	entradas <= estado_presente_entradas (3 downto 0);

	--Tabla de verdad
	process (estado, entradas) 
	begin
	
	case estado is
		when e0 =>
			case entradas is
				when "0000" => liga <= e0;
				when "0001" => liga <= e0;
				when "0100" => liga <= e0;
				when "0101" => liga <= e0;
				when "0010" => liga <= e2;
				when "0011" => liga <= e2;
				when "0110" => liga <= e2;
				when "0111" => liga <= e2; 
				when "1000" => liga <= e1;
				when "1001" => liga <= e1; 
				when "1010" => liga <= e1;
				when "1011" => liga <= e1;
				when "1100" => liga <= e1; 
				when "1101" => liga <= e1;
				when "1110" => liga <= e1;
				when others => liga <= e1; 
			end case;
		
			case liga is
				when e0 =>
					s0	<= '1';
					s1	<= '1';
					s2	<= '0';
					s3	<= '0';
				when e1 =>
					s0	<= '1';
					s1	<= '0';
					s2	<= '0';
					s3	<= '0';
				when others =>
					s0	<= '1';
					s1	<= '0';
					s2	<= '1';
					s3	<= '0';
			end case;
		when e1 =>
			case entradas is
				when "0000" => liga <= e3;
				when "0010" => liga <= e3;
				when "0100" => liga <= e3;
				when "0110" => liga <= e3;
				when "1000" => liga <= e3;
				when "1010" => liga <= e3;
				when "1100" => liga <= e3;
				when "1110" => liga <= e3; 
				when "0001" => liga <= e4;
				when "0011" => liga <= e4; 
				when "0101" => liga <= e4;
				when "0111" => liga <= e4;
				when "1001" => liga <= e4; 
				when "1011" => liga <= e4;
				when "1101" => liga <= e4;
				when others => liga <= e4; 
		end case;

			case liga is
				when e3 =>
					s0	<= '0';
					s1	<= '0';
					s2	<= '0';
					s3	<= '1';
				when others =>
					s0	<= '0';
					s1	<= '0';
					s2	<= '0';
					s3	<= '1';
			end case;
		
		when e2 =>
			case entradas is
				when "0000" => liga <= e4;
				when "0001" => liga <= e4;
				when "0010" => liga <= e4;
				when "0011" => liga <= e4;
				when "0100" => liga <= e4;
				when "0101" => liga <= e4;
				when "0110" => liga <= e4;
				when "0111" => liga <= e4; 
				when "1000" => liga <= e4;
				when "1001" => liga <= e4; 
				when "1010" => liga <= e4;
				when "1011" => liga <= e4;
				when "1100" => liga <= e4; 
				when "1101" => liga <= e4;
				when "1110" => liga <= e4;
				when others => liga <= e4; 
		end case;
		
				s0	<= '0';
				s1	<= '0';
				s2	<= '0';
				s3	<= '1';
		
		when e3 =>
			case entradas is
				when "0000" => liga <= e3;
				when "0001" => liga <= e3;
				when "0010" => liga <= e3;
				when "0011" => liga <= e3;
				when "0100" => liga <= e3;
				when "0101" => liga <= e3;
				when "0110" => liga <= e3;
				when "0111" => liga <= e3;
				when "1000" => liga <= e6;
				when "1001" => liga <= e6;
				when "1010" => liga <= e6;
				when "1011" => liga <= e6;
				when "1100" => liga <= e6;
				when "1101" => liga <= e6;
				when "1110" => liga <= e6;
				when others => liga <= e6; 
		end case;
		
			case liga is
				when e3 =>
					s0	<= '0';
					s1	<= '1';
					s2	<= '0';
					s3	<= '0';
				when others =>
					s0	<= '0';
					s1	<= '1';
					s2	<= '1';
					s3	<= '0';
			end case;
		
		when e4 =>
			case entradas is
				when "0000" => liga <= e5;
				when "0001" => liga <= e5;
				when "0010" => liga <= e5;
				when "0011" => liga <= e5;
				when "1000" => liga <= e5;
				when "1001" => liga <= e5;
				when "1010" => liga <= e5;
				when "1011" => liga <= e5;
				when "0100" => liga <= e4;
				when "0101" => liga <= e4;
				when "0110" => liga <= e4;
				when "0111" => liga <= e4;
				when "1100" => liga <= e4;
				when "1101" => liga <= e4;
				when "1110" => liga <= e4;
				when others => liga <= e4; 
		end case;

			case liga is
				when e4 =>
					s0	<= '0';
					s1	<= '1';
					s2	<= '0';
					s3	<= '0';
				when others =>
					s0	<= '0';
					s1	<= '1';
					s2	<= '0';
					s3	<= '1';
			end case;	
	
		when e5 =>
			case entradas is
				when "0000" => liga <= e2;
				when "0010" => liga <= e2;
				when "0100" => liga <= e2;
				when "0110" => liga <= e2;
				when "1000" => liga <= e2;
				when "1010" => liga <= e2;
				when "1100" => liga <= e2;
				when "1110" => liga <= e2;
				when "0001" => liga <= e7;
				when "0011" => liga <= e7;
				when "0101" => liga <= e7;
				when "0111" => liga <= e7;
				when "1001" => liga <= e7;
				when "1011" => liga <= e7;
				when "1101" => liga <= e7;
				when others => liga <= e7; 
		end case;
		
			case liga is
				when e2 =>
					s0	<= '1';
					s1	<= '0';
					s2	<= '0';
					s3	<= '0';
				when others =>
					s0	<= '0';
					s1	<= '0';
					s2	<= '0';
					s3	<= '0';
			end case;
		
		when e6 =>
			case entradas is
				when "0000" => liga <= e6;
				when "0100" => liga <= e6;
				when "1000" => liga <= e6;
				when "1100" => liga <= e6;
				when "0001" => liga <= e6;
				when "0101" => liga <= e6;
				when "1001" => liga <= e6;
				when "1101" => liga <= e6;
				when "0010" => liga <= e7;
				when "0110" => liga <= e7;
				when "1010" => liga <= e7;
				when "1110" => liga <= e7;
				when "0011" => liga <= e7;
				when "0111" => liga <= e7;
				when "1011" => liga <= e7;
				when others => liga <= e7; 
		end case;
		
			case liga is
				when e6 =>
					s0	<= '0';
					s1	<= '0';
					s2	<= '0';
					s3	<= '0';
				when others =>
					s0	<= '0';
					s1	<= '0';
					s2	<= '0';
					s3	<= '0';
			end case;
			
		when e7 =>
			liga <= e0;
			s0	<= '0';
			s1	<= '1';
			s2	<= '1';
			s3	<= '0';
			end case;
		end process;
	end arq;