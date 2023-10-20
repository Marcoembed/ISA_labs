--------------------------------------------------------------------------------
-- Engineer: Simone Ruffini  [simone.ruffini@studenti.polito.it]
--
-- Create Date:
-- Design Name:     IIR_PKG
-- Project Name:
-- Description:     IIR package
--
-- Revision:
-- Revision 00 - Simone Ruffini
--  first implementation
-- Additional Comments:
--
--------------------------------------------------------------------------------

------------------------------------------------------------- PACKAGES/LIBRARIES

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;

------------------------------------------------------------- PACKAGE
package IIR_PKG is

  constant C_IIR_DATA_W : integer := 10;
  constant C_IIR_ORDER  : integer := 1;

  type sig_arr_type is array (natural range <>) of signed; -- unconstrained array of unconstrained signed values

end package IIR_PKG;

package body IIR_PKG is

end package body IIR_PKG;
