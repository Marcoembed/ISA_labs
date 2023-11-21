-----------------------------------------------------------------------------------------------
-- Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
--			 Marco Crisolgo 	[s305673@studenti.polito.it],
--			 Matteo Lago 		[s319914@studenti.polito.it],
--			 Renato Belmonte 	[s316792@studenti.polito.it],
--
-- Module Name: IIR_PKG
-- Project Name: iir filter
-- Description: Main constants used in the basic IIR implementation
--
-----------------------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.math_real.all;

package iir_pkg is

	constant NBIT:		integer := 10;
	constant IIR_ORDER:	integer :=  1;

	-- "Lossless" multiplications
	-- constant SHAMT:		integer :=  9;

	-- Basic IIR SHAMT that guarantees THD < -30 dB
	constant SHAMT:		integer := 13;

end package iir_pkg;


package body iir_pkg is
end package body iir_pkg;
