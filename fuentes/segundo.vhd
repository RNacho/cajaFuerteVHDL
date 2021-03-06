library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SEGUNDO is port(
	RELOJ_BASE: in std_logic;
	RELOJ_SALIDA : out std_logic
); end SEGUNDO;


architecture LOGICA_SEGUNDO of SEGUNDO is

	signal CONTADOR : std_logic_vector(26 downto 0);
	signal SIGNAL_RELOJ_SALIDA : std_logic;
	
begin

	process (RELOJ_BASE) begin
		if (RELOJ_BASE'event and RELOJ_BASE='1') then
			if (CONTADOR = 25000000) then
				SIGNAL_RELOJ_SALIDA <= not(SIGNAL_RELOJ_SALIDA);
				CONTADOR <= "000000000000000000000000000";
			else
				CONTADOR <= CONTADOR + 1;
			end if;
		end if;
	end process;
	
	RELOJ_SALIDA <= SIGNAL_RELOJ_SALIDA;

end LOGICA_SEGUNDO;
