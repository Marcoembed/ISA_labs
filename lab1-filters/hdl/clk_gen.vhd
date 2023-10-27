library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity clk_gen is
	port (
		END_SIM:	in  std_logic;
		CLK:		out std_logic;
		RST_n:		out std_logic
	);
end clk_gen;



architecture beh of clk_gen is

	constant Ts : time := 100 ns;
	signal CLK_i : std_logic := '1';

begin  -- beh

	RST_n <= '0', '1' after 5*Ts/2;

	process
	begin  -- process
		CLK_i <= not(CLK_i);
		wait for Ts/2;
	end process;

	CLK <= CLK_i and not(END_SIM);

end beh;