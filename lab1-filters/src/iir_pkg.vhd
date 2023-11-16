--------------------------------------------------------------------------------
-- Engineer: Simone Ruffini  [simone.ruffini@studenti.polito.it]
--
-- Create Date:
-- Design Name:     iir_pkg
-- Project Name:
-- Description:     IIR package
--
-- Revision:
-- Revision 00 - Simone Ruffini
--  first implementation
-- Additional Comments:
--
--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.math_real.all;

package iir_pkg is

	constant NBIT:		integer := 10;
	constant IIR_ORDER:	integer :=  1;

	-- "Lossless" multiplications
	--constant SHAMT:		integer :=  9;

	-- Basic IIR SHAMT that guarantees THD < -30 dB
	--constant SHAMT:		integer := 13;

	-- Advanced IIR SHAMT that guarantees THD < -30 dB
	constant SHAMT:		integer := 12;

end package iir_pkg;


package body iir_pkg is
end package body iir_pkg;
