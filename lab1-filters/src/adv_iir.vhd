--------------------------------------------------------------------------------
-- Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
--			 Marco Crisolgo 	[s305673@studenti.polito.it],
--			 Matteo Lago 		[s305673@studenti.polito.it],
--			 Renato Belmonte 	[s305673@studenti.polito.it],
--
-- Module Name: adv_iir
-- Project Name: advanced iir filter
-- Description: Advanced Infinite Impulse Response Filter first order
--
-- Additional Comments: Optimize version of iir filter exploiting J-lookahed
--						technique.
--						Pipeline and retiming technique are employed to enhance
--						performance.
--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
  	use ieee.numeric_std.all;

library work;
	use work.iir_pkg.all;

------------------------------------------------------------- ENTITY

entity adv_iir is
	port (
  	  CLK   : in    std_logic;                              -- Clock Signal (rising-edge trigger)
  	  RST_N : in    std_logic;                              -- Reset Signal: Asyncronous Active Low (Negative)
  	  VIN   : in    std_logic;                              -- Input valid signal
  	  A1    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
  	  A1_2  : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
  	  B0    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
  	  B1    : in    std_logic_vector(NBIT - 1 downto 0);    -- Taps
  	  X     : in    signed(NBIT - 1 downto 0);              -- Input sample (data_maker DOUT)
  	  Y     : out   signed(NBIT - 1 downto 0);              -- Output sample
  	  VOUT  : out   std_logic                               -- Output valid signal
  	);
end entity adv_iir;

architecture behav of adv_iir is


	signal x_o			: signed(NBIT downto 0);
	signal f1_i			: signed(2 * (NBIT + 1) - 1 downto 0);
	signal f1_o			: signed(NBIT downto 0);
	signal w_i			: signed(NBIT downto 0);
	signal w_o			: signed(NBIT downto 0);
	signal s_i			: signed(NBIT downto 0);
	signal s_o			: signed(NBIT downto 0);
	signal s2_o			: signed(NBIT downto 0);
	signal fb_i			: signed(2 * (NBIT + 1) - 1 downto 0);
	signal fb_o			: signed(NBIT downto 0);
	signal f2_i			: signed(2 * (NBIT + 1) - 1 downto 0);
	signal f2_o			: signed(NBIT downto 0);
	signal f3_i			: signed(2 * (NBIT + 1) - 1 downto 0);
	signal f3_o			: signed(NBIT downto 0);
	signal y_i			: signed(NBIT downto 0);

	signal a1_in		: signed(NBIT-1 downto 0);
	signal a1_2_in		: signed(NBIT-1 downto 0);
	signal b0_in		: signed(NBIT-1 downto 0);
	signal b1_in		: signed(NBIT-1 downto 0);

	signal vin_d1		: std_logic;
	signal vin_d2		: std_logic;
	

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

	IN_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => X,
  	    	DOUT => x_o
		);

	SW0_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => f1_i(2 * NBIT - 1 downto SHAMT),
  	    	DOUT => f1_o
		);

	SW1_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => w_i,
  	    	DOUT => w_o
		);

	SW2_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => s_i,
  	    	DOUT => s_o
		);

	SW3_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => fb_i(2 * NBIT - 1 downto SHAMT),
  	    	DOUT => fb_o
		);

	SW4_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => s_o, 
  	    	DOUT => s2_o 
		);

	SW5_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => f3_i(2 * NBIT - 1 downto SHAMT),
  	    	DOUT => f3_o
		);

	SW6_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => f2_i(2 * NBIT - 1 downto SHAMT),
  	    	DOUT => f2_o
		);

	OUT_REG: reg
		port map(
  	    	CLK   => CLK,
  	    	RST_N => RST_N,

  	    	EN   => '1',
  	    	DIN  => y_i,
  	    	DOUT => Y
		);
		
  	a1_in <= signed(A1);
  	a1_2_in <= signed(A1_2);
  	b0_in <= signed(B0);
  	b1_in <= signed(B1);

	f1_i <= resize(a1_in, NBIT + 1) * x_o;
	w_i <= f1_o + x_o;
	s_i <= w_o + fb_o;
	fb_i <= resize(a1_2_in, NBIT + 1) * s_o;
	f3_i <= resize(b0_in, NBIT + 1) * s_o;
	f2_i <= resize(b1_in, NBIT + 1) * s2_o;
	y_i <= f3_o + f2_o;


end architecture behav;

