-----------------------------------------------------------------------------------------------
-- Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
--			 Marco Crisolgo 	[s305673@studenti.polito.it],
--			 Matteo Lago 		[s319914@studenti.polito.it],
--			 Renato Belmonte 	[s316792@studenti.polito.it],
--
-- Module Name: REG
-- Project Name: iir filter advanced
-- Description: Standard N-bit register with asynchronous active low reset
--
-----------------------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity REG is
	generic (
		DATA_WIDTH : integer := 16
	);
	port (
		CLK:	in	std_logic;
		RST_N:	in	std_logic;
		EN:		in	std_logic;
		DIN:	in	signed(DATA_WIDTH - 1 downto 0);
		DOUT:	out	signed(DATA_WIDTH - 1 downto 0)
	);
end entity REG;

architecture BEHAV of REG is

	signal data_out : signed(DATA_WIDTH - 1 downto 0);

begin

	DOUT <= data_out;

	DELAY: process (CLK, RST_N) is
	begin

		if (RST_N = '0') then
			data_out <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			data_out <= data_out;
			if (EN = '1') then
				data_out <= DIN;
			end if;
		end if;

	end process DELAY;

end architecture BEHAV;


configuration CFG_REG_BEHAV of REG is
	for BEHAV
	end for;
end CFG_REG_BEHAV;