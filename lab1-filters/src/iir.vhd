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
entity iir is
	port (
		CLK:	in	std_logic;		-- Clock Signal (rising-edge trigger)
		RST_n:	in	std_logic;		-- Reset Signal: Asyncronous Active Low (Negative)
		VIN:	in	std_logic;		-- Input valid signal
		A1:		in	std_logic_vector(NBIT-1 downto 0);		-- Taps
		B0:		in	std_logic_vector(NBIT-1 downto 0);		-- Taps
		B1:		in	std_logic_vector(NBIT-1 downto 0);		-- Taps
		X:		in	signed(NBIT-1 downto 0);		-- Input sample (data_maker DOUT)
		Y:		out	signed(NBIT-1 downto 0);		-- Output sample
		VOUT:	out	std_logic		-- Output valid signal
	);
end entity iir;



------------------------------------------------------------- ARCHITECTURE
architecture BEHAVIOURAL of iir is

	signal sn:								signed(NBIT downto 0);	---------------- 11 bits
	signal A1_in, B0_in, B1_in:				signed(NBIT-1 downto 0);	------------ 10 bits
	signal A1_out, B0_out, B1_out:			signed(NBIT-1 downto 0); ----- 10 bits
	signal sn_min_1:						signed(NBIT downto 0);	---------------- 11 bits
	signal sn_min_1_tmp:					std_logic_vector(NBIT downto 0);	---- 11 bits
	signal x_d1:							signed(NBIT-1 downto 0); --------------- 10 bits
	signal x_d1_tmp:						std_logic_vector(NBIT-1 downto 0); ----- 10 bits
	signal x_ext:							signed(NBIT downto 0);	---------------- 11 bits
	signal y_drop:							signed(NBIT-1 downto 0); --------------- 10 bits
	signal y_drop_tmp:						std_logic_vector(NBIT-1 downto 0); ----- 10 bits
	signal y_ext:							signed(NBIT downto 0); 	---------------- 11 bits
	signal fb, ff, wb:						signed(2*(NBIT+1)-1 downto 0); --------- 21 bits
	signal fb_crop, ff_crop, wb_crop:		signed(NBIT downto 0);	---------------- 11 bits
	signal fb_shift, ff_shift, wb_shift:	signed(NBIT downto 0);	---------------- 11 bits
	signal VIN_d1:							std_logic;
	signal VIN_d2:							std_logic;

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

	-------------------------------------------------- valid INPUT REG
	valid_IN: process(CLK, RST_n)
	begin
		if RST_n = '0' then
			VOUT	<= '0';
			VIN_d1	<= '0';
		elsif CLK'event and CLK = '1' then
			VIN_d1	<= VIN;
		end if;
	end process;
	
	-------------------------------------------------- A1 INPUT REG
	A1_IN_REG : entity work.reg(behav)
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,
	
			EN		=> '1',
			DIN		=> A1_in,
			DOUT	=> A1_out
		);

	-------------------------------------------------- B0 INPUT REG
	B0_IN_REG : entity work.reg
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,
	
			EN		=> '1',
			DIN		=> B0_in,
			DOUT	=> B0_out
		);

	-------------------------------------------------- B1 INPUT REG
	B1_IN_REG : entity work.reg
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,
	
			EN		=> '1',
			DIN		=> B1_in,
			DOUT	=> B1_out
		);
	-------------------------------------------------- SAMPLE INPUT REG
	IN_REG : entity work.reg
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,
	
			EN		=> '1',
			DIN		=> X,
			DOUT	=> X_d1
		);

	-------------------------------------------------- valid OUTPUT REG
	valid_OUT: process(CLK, RST_n)
	begin
		if RST_n = '0' then
			VOUT	<= '0';
			VIN_d2	<= '0';
		elsif CLK'event and CLK = '1' then
			VOUT	<= VIN_d2;
		end if;
	end process;
	
	-------------------------------------------------- DATA OUTPUT REG
	OUT_REG : entity work.reg
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,
	
			EN		=> '1',
			DIN		=> y_drop,
			DOUT	=> Y
		);

	-------------------------------------------------- DELAY REG
	U_SX_REG : entity work.reg
		generic map (data_width => NBIT+1)
		port map (
			CLK		=> CLK,
			RST_n	=> RST_n,

			EN		=> VIN_d1,
			DIN		=> sn,
			DOUT	=> sn_min_1
		);

	--------------------------------------------------
	-- FEEDBACK
	--------------------------------------------------

	A1_in <= signed(A1);
	B0_in <= signed(B0);
	B1_in <= signed(B1);

	fb <= resize(A1_out, NBIT+1) * sn_min_1;
	fb_crop <= resize(fb(2*NBIT-1 downto SHAMT), NBIT+1);
	fb_shift <= shift_left(fb_crop, SHAMT-NBIT+1);

	x_ext <= resize(x_d1, NBIT+1);
	sn <= resize(x_ext, NBIT+1) + fb_shift;

	--------------------------------------------------
	-- FEEDFORWARD
	--------------------------------------------------

	ff <= resize(B1_out, NBIT+1) * sn_min_1;
	ff_crop <= resize(ff(2*NBIT-1 downto SHAMT), NBIT+1);
	ff_shift <= shift_left(ff_crop, SHAMT-NBIT+1);

	wb <= resize(B0_out, NBIT+1) * sn;
	wb_crop <= resize(wb(2*NBIT-1 downto SHAMT), NBIT+1);
	wb_shift <= shift_left(wb_crop, SHAMT-NBIT+1);

	y_ext  <= wb_shift + ff_shift;
	y_drop <= y_ext(NBIT-1 downto 0);


end architecture BEHAVIOURAL;
