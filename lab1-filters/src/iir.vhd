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
  port (
    CLK   : in    std_logic;                              -- Clock Signal (rising-edge trigger)
    RST_N : in    std_logic;                              -- Reset Signal: Asyncronous Active Low (Negative)
    VIN   : in    std_logic;                              -- Input valid signal
    A1    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
    B0    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
    B1    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
    X     : in    signed(NBIT - 1 downto 0);              -- Input sample (data_maker DOUT)
    Y     : out   signed(NBIT - 1 downto 0);              -- Output sample
    VOUT  : out   std_logic                               -- Output valid signal
  );
end entity IIR;

------------------------------------------------------------- ARCHITECTURE

architecture BEHAV of IIR is

  signal sn         : signed(NBIT downto 0);               --11 bits
  signal a1_in      : signed(NBIT - 1 downto 0);
  signal b0_in      : signed(NBIT - 1 downto 0);
  signal b1_in      : signed(NBIT - 1 downto 0);           --10 bits
  signal a1_out     : signed(NBIT - 1 downto 0);
  signal b0_out     : signed(NBIT - 1 downto 0);
  signal b1_out     : signed(NBIT - 1 downto 0);           --10 bits
  signal sn_d1      : signed(NBIT downto 0);               --11 bits
  signal sn_d1_tmp  : std_logic_vector(NBIT downto 0);     --11 bits
  signal x_d1       : signed(NBIT - 1 downto 0);           --10 bits
  signal x_d1_tmp   : std_logic_vector(NBIT - 1 downto 0); --10 bits
  signal x_ext      : signed(NBIT downto 0);               --11 bits
  signal y_drop     : signed(NBIT - 1 downto 0);           --10 bits
  signal y_drop_tmp : std_logic_vector(NBIT - 1 downto 0); --10 bits
  signal y_ext      : signed(NBIT downto 0);               --11 bits
  signal fb         : signed(2 * (NBIT + 1) - 1 downto 0);
  signal ff         : signed(2 * (NBIT + 1) - 1 downto 0);
  signal wb         : signed(2 * (NBIT + 1) - 1 downto 0); --21 bits
  signal fb_crop    : signed(NBIT downto 0);
  signal ff_crop    : signed(NBIT downto 0);
  signal wb_crop    : signed(NBIT downto 0);               --11 bits
  signal fb_shift   : signed(NBIT downto 0);
  signal ff_shift   : signed(NBIT downto 0);
  signal wb_shift   : signed(NBIT downto 0);               --11 bits
  signal vin_d1     : std_logic;
  signal vin_d2     : std_logic;

--
-- +---+    +---+   fb    +---+   +----+
-- | X +--->| + |<--------+ * |<--+ A1 |
-- +---+    +-+-+         +---+   +----+
--            |     +----+  ^
--            |     | Sx |  |
--            |     | R  |  |
--         sn +-11->| E  +--+ sn_d1
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

  -------------------------------------------------- valid INPUT REG
  VALID_IN : process (CLK, RST_N) is
  begin

    if (RST_N = '0') then
      vin_d1 <= '0';
    elsif (CLK'event and CLK = '1') then
      vin_d1 <= VIN;
    end if;

  end process VALID_IN;

  -------------------------------------------------- A1 INPUT REG
  A1_IN_REG : reg
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => '1',
      DIN  => a1_in,
      DOUT => a1_out
    );

  -------------------------------------------------- B0 INPUT REG
  B0_IN_REG : reg
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => '1',
      DIN  => b0_in,
      DOUT => b0_out
    );

  -------------------------------------------------- B1 INPUT REG
  B1_IN_REG : reg
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => '1',
      DIN  => b1_in,
      DOUT => b1_out
    );

  -------------------------------------------------- SAMPLE INPUT REG
  IN_REG : reg
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => '1',
      DIN  => X,
      DOUT => x_d1
    );

  -------------------------------------------------- valid OUTPUT REG
  VALID_OUT : process (CLK, RST_N) is
  begin

    if (RST_N = '0') then
      VOUT   <= '0';
      vin_d2 <= '0';
    elsif (CLK'event and CLK = '1') then
      VOUT <= vin_d1;
    end if;

  end process VALID_OUT;

  -------------------------------------------------- DATA OUTPUT REG
  OUT_REG : reg
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => '1',
      DIN  => y_drop,
      DOUT => Y
    );

  -------------------------------------------------- SN REG
  U_SN_REG : reg
    generic map (
      DATA_WIDTH => NBIT + 1
    )
    port map (
      CLK   => CLK,
      RST_N => RST_N,

      EN   => vin_d1, -- start register when we have X_d1 ready
      DIN  => sn,
      DOUT => sn_d1
    );

  --------------------------------------------------
  -- FEEDBACK
  --------------------------------------------------

  a1_in <= signed(A1);
  b0_in <= signed(B0);
  b1_in <= signed(B1);

  fb       <= resize(a1_out, NBIT + 1) * sn_d1;
  fb_crop  <= resize(fb(2 * NBIT - 1 downto SHAMT), NBIT + 1);
  fb_shift <= shift_left(fb_crop, SHAMT - NBIT + 1);

  x_ext <= resize(x_d1, NBIT + 1);
  sn    <= resize(x_ext, NBIT + 1) + fb_shift;

  --------------------------------------------------
  -- FEEDFORWARD
  --------------------------------------------------

  ff       <= resize(b1_out, NBIT + 1) * sn_d1;
  ff_crop  <= resize(ff(2 * NBIT - 1 downto SHAMT), NBIT + 1);
  ff_shift <= shift_left(ff_crop, SHAMT - NBIT + 1);

  wb       <= resize(b0_out, NBIT + 1) * sn;
  wb_crop  <= resize(wb(2 * NBIT - 1 downto SHAMT), NBIT + 1);
  wb_shift <= shift_left(wb_crop, SHAMT - NBIT + 1);

  y_ext  <= wb_shift + ff_shift;
  y_drop <= y_ext(NBIT - 1 downto 0);

end architecture BEHAV;

configuration CFG_IIR_BEHAV of IIR is
  for BEHAV
    for all: REG
      use configuration work.CFG_REG_BEHAV;
    end for;
  end for;
end CFG_IIR_BEHAV;
