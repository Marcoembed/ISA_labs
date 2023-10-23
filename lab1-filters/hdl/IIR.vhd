--------------------------------------------------------------------------------
-- Engineer: Simone Ruffini [simone.ruffini@studenti.polito.it,
--                           simone.ruffini@tutanota.com]
--
-- Create Date:
-- Module Name:   IIR
-- Project Name:
-- Description:   Infinite Impulse Response Filter first order
--
-- Revision:
-- Revision 00 - Simone Ruffini
--  * Created
-- Additional Comments:
--------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.iir_pkg.all;
------------------------------------------------------------- ENTITY

entity IIR is
  generic (
    A         : sig_arr_type (C_IIR_ORDER + 1 - 1 downto 0)(C_IIR_DATA_W - 1 downto 0);
    B         : sig_arr_type (C_IIR_ORDER + 1 - 1 downto 0)(C_IIR_DATA_W - 1 downto 0);
    SHAMT     : integer
  );
  port (
    CLK       : in    std_logic;                                -- Clock Signal (rising-edge trigger)
    RST_AN    : in    std_logic;                                -- Reset Signal: Asyncronous Active Low (Negative)
  	VIN		  : in 	  std_logic; 
  	A1		  : in	  std_logic_vector(C_IIR_DATA_W downto 0);
  	B0		  : in	  std_logic_vector(C_IIR_DATA_W downto 0);
  	B1		  : in	  std_logic_vector(C_IIR_DATA_W downto 0);
    X         : in    signed(C_IIR_DATA_W - 1 downto 0);          -- Input sample (data_maker DOUT)
    Y         : out   signed(C_IIR_DATA_W - 1 downto 0)           -- Output sample
  );
end entity IIR;

architecture BEHAVIOURAL of IIR is

  signal sn             : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal A1_in      	: signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal B0_in          : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal B1_in          : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal sn_min_1       : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal sn_min_1_tmp   : std_logic_vector(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal x_d1_tmp		: std_logic_vector(C_IIR_DATA_W - 1 downto 0); ---------------------- 10 bits
  signal x_d1           : signed(C_IIR_DATA_W - 1 downto 0); ---------------------- 10 bits
  signal x_ext          : signed(C_IIR_DATA_W downto 0);
  signal y_drop         : signed(C_IIR_DATA_W - 1 downto 0); ---------------------- 10 bits
  signal y_drop_tmp     : std_logic_vector(C_IIR_DATA_W - 1 downto 0); ---------------------- 10 bits
  signal y_ext          : signed(C_IIR_DATA_W downto 0); 	---------------------- 11 bits
  signal fb             : signed(2*(C_IIR_DATA_W + 1) - 1 downto 0); ---------------------- 21 bits
  signal ff             : signed(2*(C_IIR_DATA_W + 1) - 1 downto 0); ---------------------- 21 bits
  signal wb             : signed(2*(C_IIR_DATA_W + 1) - 1 downto 0); ---------------------- 21 bits
  signal fb_drop        : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal ff_drop        : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits
  signal wb_drop        : signed(C_IIR_DATA_W downto 0);	---------------------- 11 bits

--
-- +---+    +---+   fb    +---+   +----+
-- | X +--->| + |<--------+ * |<--+ A1 |
-- +---+    +-+-+         +---+   +----+
--            |     +----+  ^
--            |     | Sx |  |
--            |     | R  |  |
--         sn +-11->| E  +--+ sn_min_1
--            |     | G  |  |
--            |     +----+  |
--            v             v
-- +----+   +---+         +---+   +----+
-- | B0 +-->| * |         | * |<--+ B1 |
-- +----+   +-+-+         +---+   +----+
--            | s_wb        v ff
--            |           +---+    +---+
--            +---------->| + +--->| Y |
--                        +---+    +---+

begin

  --------------------------------------------------
  -- REGISTERS
  --------------------------------------------------

  IN_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => C_IIR_DATA_W,
      INIT_VAL     => (0 to C_IIR_DATA_W - 1 => '0'),
      RST_INIT_VAL => (0 to C_IIR_DATA_W - 1 => '0')
    )
    port map (
      CLK   => CLK,
      RST_AN => RST_AN,

      EN   => VIN,
      INIT => '0',
      DIN  => std_logic_vector(X),
      DOUT => x_d1_tmp
    );

  sn_min_1 <= signed(sn_min_1_tmp);
  x_d1 <= signed(x_d1_tmp);

  OUT_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => C_IIR_DATA_W,
      INIT_VAL     => (0 to C_IIR_DATA_W - 1 => '0'),
      RST_INIT_VAL => (0 to C_IIR_DATA_W - 1 => '0')
    )
    port map (
      CLK   => CLK,
      RST_AN => RST_AN,

      EN   => VIN,
      INIT => '0',
      DIN  => std_logic_vector(y_drop),
      DOUT => y_drop_tmp
    );

  sn_min_1 <= signed(sn_min_1_tmp);
  Y <= signed(y_drop_tmp);

  U_SX_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => C_IIR_DATA_W,
      INIT_VAL     => (0 to C_IIR_DATA_W - 1 => '0'),
      RST_INIT_VAL => (0 to C_IIR_DATA_W - 1 => '0')
    )
    port map (
      CLK   => CLK,
      RST_AN => RST_AN,

      EN   => VIN,
      INIT => '0',
      DIN  => std_logic_vector(sn),
      DOUT => sn_min_1_tmp
    );

  sn_min_1 <= signed(sn_min_1_tmp);

  --------------------------------------------------
  -- FEEDBACK
  --------------------------------------------------

  A1_in <= signed(A1);
  B0_in <= signed(B0);
  B1_in <= signed(B1);

  fb <= resize(A1_in, C_IIR_DATA_W + 1) * sn_min_1;
  fb_drop <= fb(2*(C_IIR_DATA_W+1) - 1 downto C_IIR_DATA_W+1);

  x_ext <= resize(x_d1, C_IIR_DATA_W + 1);
  sn <= fb_drop + resize(x_ext, C_IIR_DATA_W + 1);

  --------------------------------------------------
  -- FEEDFORWARD
  --------------------------------------------------

  ff <= resize(B1_in, C_IIR_DATA_W + 1) * sn_min_1;
  ff_drop <= ff(2*(C_IIR_DATA_W+1) - 1 downto C_IIR_DATA_W+1);

  wb <= resize(B0_in, C_IIR_DATA_W + 1) * sn;
  wb_drop <= wb(2*(C_IIR_DATA_W+1) - 1 downto C_IIR_DATA_W+1);

  y_ext  <= wb_drop + ff_drop;
  y_drop <= y_ext(C_IIR_DATA_W - 1 downto 0);


end architecture BEHAVIOURAL;

------------------------------------------------------------- ARCHITECTURE: BEHAV_WITH_EN
