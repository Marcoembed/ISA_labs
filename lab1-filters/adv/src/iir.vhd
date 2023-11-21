-----------------------------------------------------------------------------------------------
-- Engineer: Simone Ruffini 	[simone.ruffini@studenti.polito.it],
--			 Marco Crisolgo 	[s305673@studenti.polito.it],
--			 Matteo Lago 		[s319914@studenti.polito.it],
--			 Renato Belmonte 	[s316792@studenti.polito.it],
--
-- Module Name: adiv_iir
-- Project Name: iir filter advanced
-- Description: Advanced Infinite Impulse Response Filter first order
--
-- Additional Comments: Optimized version of iir filter exploiting J-lookahed
--						technique.
--						Pipeline and retiming techniques are employed to enhance
--						performance: no more than 1 computing element (ADD/MPY)
--						is allocated in between registers.
--------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

library work;
	use work.iir_pkg.all;

------------------------------------------------------------- ENTITY

entity iir is
	port (
		CLK:	in	std_logic;								-- Clock Signal (rising-edge trigger)
		RST_N:	in	std_logic;								-- Reset Signal: Asyncronous Active Low (Negative)
		VIN:	in	std_logic;								-- Input valid signal
		A1:		in	std_logic_vector(NBIT - 1 downto 0);	-- Taps
		A1_2:	in	std_logic_vector(NBIT - 1 downto 0);	-- Taps
		B0:		in	std_logic_vector(NBIT - 1 downto 0);	-- Taps
		B1:		in	std_logic_vector(NBIT - 1 downto 0);	-- Taps
		X:		in	signed(NBIT - 1 downto 0);				-- Input sample (data_maker DOUT)
		Y:		out	signed(NBIT - 1 downto 0);				-- Output sample
		VOUT:	out	std_logic								-- Output valid signal
	);
end entity iir;

architecture behav of iir is


	signal x_o_tmp:		signed(NBIT-1 downto 0);
	signal x_o:			signed(NBIT downto 0);
	signal f1_i:		signed(2 * (NBIT + 1) - 1 downto 0);
	signal f1_o:		signed(NBIT downto 0);
	signal w_i:			signed(NBIT downto 0);
	signal w_o:			signed(NBIT downto 0);
	signal s_i:			signed(NBIT downto 0);
	signal s_o:			signed(NBIT downto 0);
	signal s2_o:		signed(NBIT downto 0);
	signal fb_i:		signed(2 * (NBIT + 1) - 1 downto 0);
	signal fb_o:		signed(NBIT downto 0);
	signal f2_i:		signed(2 * (NBIT + 1) - 1 downto 0);
	signal f2_o:		signed(NBIT downto 0);
	signal f3_i:		signed(2 * (NBIT + 1) - 1 downto 0);
	signal f3_o:		signed(NBIT downto 0);
	signal y_i:			signed(NBIT downto 0);

	signal a1_tmp:		signed(NBIT-1 downto 0);
	signal a1_2_tmp:	signed(NBIT-1 downto 0);
	signal b0_tmp:		signed(NBIT-1 downto 0);
	signal b1_tmp:		signed(NBIT-1 downto 0);

	signal a1_in:		signed(NBIT downto 0);
	signal a1_2_in:		signed(NBIT downto 0);
	signal b0_in:		signed(NBIT downto 0);
	signal b1_in:		signed(NBIT downto 0);

	signal vin_d1:		std_logic;
	signal count_vin:	std_logic_vector(2 downto 0);  -- used to keep track of the first 3 valid samples

	component REG is
		generic ( DATA_WIDTH : integer := 16);
		port (
			CLK:	in	std_logic;
			RST_N:	in	std_logic;
			EN:		in	std_logic;
			DIN:	in	signed(DATA_WIDTH - 1 downto 0);
			DOUT:	out	signed(DATA_WIDTH -1  downto 0)
		);
	end component;
	

begin

	--------------------------------------------------
	-- REGISTERS
	--------------------------------------------------

	-------------------------------------------------- valid bit managing
	VALID: process (CLK, RST_N) is
	begin

		if (RST_N = '0') then
			vin_d1 <= '0';
			count_vin <= "000";					-- after reset, no valid samples are processed
		elsif (CLK'event and CLK = '1') then
			vin_d1 <= VIN;
			VOUT   <= vin_d1 and count_vin(0);		-- vout is conditioned by the presence of 3 previously valid samples

			if (vin_d1 = '1') then
				count_vin <= '1' & count_vin(2 downto 1);  -- whenever an valid imput is provided, the 'token' advances
			end if;
		end if;

	end process VALID;


  	-------------------------------------------------- A1 INPUT REG
	A1_IN_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map (
			CLK   => CLK,
			RST_N => RST_N,
	
			EN   => '1',
			DIN  => signed(A1),
			DOUT => a1_tmp
		);

  	-------------------------------------------------- B0 INPUT REG
	B0_IN_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map (
			CLK   => CLK,
			RST_N => RST_N,
	
			EN   => '1',
			DIN  => signed(B0),
			DOUT => b0_tmp
		);

  	-------------------------------------------------- B1 INPUT REG
	B1_IN_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map (
			CLK   => CLK,
			RST_N => RST_N,
	
			EN   => '1',
			DIN  => signed(B1),
			DOUT => b1_tmp
		);

  	-------------------------------------------------- A1^2 INPUT REG
	A1_2_IN_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map (
			CLK   => CLK,
			RST_N => RST_N,
	
			EN   => '1',
			DIN  => signed(A1_2),
			DOUT => a1_2_tmp
		);


	-------------------------------------------------- INPUT REG
	IN_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => '1',
			DIN  => X,
			DOUT => x_o_tmp   
		
		);

	-------------------------------------------------- SW0 REG
	SW0_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => f1_i(NBIT downto 0),
			DOUT => f1_o
		);

	-------------------------------------------------- SW1 REG
	SW1_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => w_i,
			DOUT => w_o
		);

	-------------------------------------------------- SW2 REG
	SW2_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => s_i,
			DOUT => s_o
		);

	-------------------------------------------------- SW3 REG
	SW3_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => fb_i(NBIT downto 0),
			DOUT => fb_o
		);

	-------------------------------------------------- SW4 REG
	SW4_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => s_o, 
			DOUT => s2_o 
		);

	-------------------------------------------------- SW5 REG
	SW5_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => f3_i(NBIT downto 0),
			DOUT => f3_o
		);

	-------------------------------------------------- SW6 REG
	SW6_REG: reg
		generic map (DATA_WIDTH => NBIT	+ 1)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => vin_d1,
			DIN  => f2_i(NBIT downto 0),
			DOUT => f2_o
		);

	-------------------------------------------------- OUT REG
	OUT_REG: reg
		generic map (DATA_WIDTH => NBIT)
		port map(
			CLK   => CLK,
			RST_N => RST_N,

			EN   => '1',
			DIN  => y_i(NBIT-1 downto 0),
			DOUT => Y
		);
	
	--------------------------------------------------
	-- COMPUTATION
	--------------------------------------------------
		
	a1_in	<= resize(a1_tmp,	NBIT+1);
	a1_2_in	<= resize(a1_2_tmp,	NBIT+1);
	b0_in	<= resize(b0_tmp,	NBIT+1);
	b1_in	<= resize(b1_tmp,	NBIT+1);

	x_o		<= resize(x_o_tmp, NBIT+1);

	f1_i	<= shift_left((shift_right(a1_in * x_o,	SHAMT)), SHAMT-NBIT+1);
	w_i		<= f1_o + x_o;
	s_i		<= w_o + fb_o;
	fb_i	<= shift_left((shift_right(a1_2_in * s_o,  SHAMT)), SHAMT-NBIT+1);
	f3_i	<= shift_left((shift_right(b0_in   * s_o,  SHAMT)), SHAMT-NBIT+1);
	f2_i	<= shift_left((shift_right(b1_in   * s2_o, SHAMT)), SHAMT-NBIT+1);
	y_i		<= f3_o + f2_o;


end architecture behav;