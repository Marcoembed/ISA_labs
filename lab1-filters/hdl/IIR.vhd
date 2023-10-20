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
    A         : sig_arr_type (IIR_ORDER + 1 - 1 downto 0)(IIR_DATA_W - 1 downto 0);
    B         : sig_arr_type (IIR_ORDER + 1 - 1 downto 0)(IIR_DATA_W - 1 downto 0);
    SHAMT     : integer
  );
  port (
    CLK       : in    std_logic;                                -- Clock Signal (rising-edge trigger)
    RST_AN    : in    std_logic;                                -- Reset Signal: Asyncronous Active Low (Negative)
    X         : in    signed(IIR_DATA_W - 1 downto 0);          -- Input sample
    Y         : out   signed(IIR_DATA_W - 1 downto 0)           -- Output sample
  );
end entity IIR;

architecture BEHAVIOURAL of IIR is

  signal sn             : signed(IIR_DATA_W downto 0);
  signal sn_min_1       : signed(IIR_DATA_W downto 0);
  signal sn_min_1_tmp   : std_logic_vector(IIR_DATA_W downto 0);
  signal s_x            : signed(IIR_DATA_W - 1 downto 0);
  signal s_y            : signed(IIR_DATA_W - 1 downto 0);
  signal s_fb           : signed(IIR_DATA_W downto 0);
  signal s_ff           : signed(IIR_DATA_W downto 0);
  signal s_wb           : signed(IIR_DATA_W downto 0);
--
-- +---+    +---+   fb  +---+   +----+
-- | X +--->| + |<------+ * |<--+ A1 |
-- +---+    +-+-+       +---+   +----+
--            |   +----+  ^
--            |   | Sx |  |
--            |   | R  |  |
--         sn +-->| E  +--+ sn_min_1
--            |   | G  |  |
--            |   +----+  |
--            v           v
-- +----+   +---+       +---+   +----+
-- | B0 +-->| * |       | * |<--+ B1 |
-- +----+   +-+-+       +---+   +----+
--            | s_wb      v ff
--            |         +---+    +---+
--            +-------->| + +--->| Y |
--                      +---+    +---+

begin

  IN_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => ((2 * (IIR_DATA_W - SHAMT)) - 1 downto 0),
      INIT_VAL     => (others => '0'),
      RST_INIT_VAL => (others => '0')
    )
    port map (
      CLK   => CLK,
      RST_A => RST_AN,

      EN   => '1',
      INIT => '0',
      DIN  => X,
      DOUT => s_x
    );

  sn_min_1 <= signed(sn_min_1_tmp);

  OUT_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => ((2 * (IIR_DATA_W - SHAMT)) - 1 downto 0),
      INIT_VAL     => (others => '0'),
      RST_INIT_VAL => (others => '0')
    )
    port map (
      CLK   => CLK,
      RST_A => RST_AN,

      EN   => '1',
      INIT => '0',
      DIN  => std_logic_vector(sn),
      DOUT => sn_min_1_tmp
    );

  sn_min_1 <= signed(sn_min_1_tmp);

  U_SX_REG : entity work.reg_pipo(BEHAV_WITH_EN)
    generic map (
      DATA_W       => ((2 * (IIR_DATA_W - SHAMT)) - 1 downto 0),
      INIT_VAL     => (others => '0'),
      RST_INIT_VAL => (others => '0')
    )
    port map (
      CLK   => CLK,
      RST_A => RST_AN,

      EN   => '1',
      INIT => '0',
      DIN  => std_logic_vector(sn),
      DOUT => sn_min_1_tmp
    );

  sn_min_1 <= signed(sn_min_1_tmp);

  fb <= resize(A(1), IIR_DATA_W + 1) * sn_min_1;
  sn <= fb + resize(s_x, IIR_DATA_W + 1);

  ff   <= resize(B(1), IIR_DATA_W + 1) * sn_min_1;
  s_wb <= resize(B(0), IIR_DATA_W + 1) * sn;
  s_y  <= s_wb + ff;

  Y <= s_y;

end architecture BEHAVIOURAL;

------------------------------------------------------------- ARCHITECTURE: BEHAV_WITH_EN
