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
	--constant SHAMT:		integer :=  9;
	constant SHAMT:		integer := 13;

end package iir_pkg;


package body iir_pkg is
end package body iir_pkg;
