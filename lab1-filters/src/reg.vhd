library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.iir_pkg.all;

entity reg is
	generic(
		data_width : integer := NBIT	   
	);
	port (
		CLK:		in std_logic;		 
		RST_n:		in std_logic;		 

		EN:			in std_logic;

		DIN: 		in signed(data_width-1 downto 0);
		DOUT: 		out signed(data_width-1 downto 0)
	);
end entity reg;

architecture behav of reg is

	signal data_out : signed(data_width-1 downto 0);

begin

	DOUT <= data_out;

	delay: process(CLK, RST_n) is
	begin
		if (RST_n = '0') then
			data_out <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			data_out <= data_out;
			if (EN = '1') then
				data_out <= DIN;
			end if;
		end if;
	end process;

end architecture behav;

