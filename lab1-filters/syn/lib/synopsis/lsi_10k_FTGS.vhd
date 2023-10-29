
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler v3.1-development
-- FILENAME     :    lsi_10k_FTGS.vhd
-- FILE CONTENTS:    Entity, Structural Architecture(FTGS),
--                   and Configuration
-- DATE CREATED :    Fri Jan 21 11:54:43 1994
-- 
-- LIBRARY      :    lsi_10k
-- DATE ENTERED :    July 18, 1991
-- REVISION     :    1.250000
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    FTGS, Timing_mesg(TRUE), Timing_xgen(FALSE), GLITCH_HANDLE
-- HISTORY      :
-- 
----------------------------------------------------------------

----- CELL AN2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.480 ns;
      tpdA_Z_F                       :	Time := 0.770 ns;
      tpdB_Z_R                       :	Time := 0.480 ns;
      tpdB_Z_F                       :	Time := 0.770 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0001",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_AN2_FTGS of AN2 is
   for FTGS
   end for;
end CFG_AN2_FTGS;


----- CELL AN2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.540 ns;
      tpdA_Z_F                       :	Time := 0.840 ns;
      tpdB_Z_R                       :	Time := 0.540 ns;
      tpdB_Z_F                       :	Time := 0.840 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0001",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_AN2P_FTGS of AN2P is
   for FTGS
   end for;
end CFG_AN2P_FTGS;


----- CELL AN3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.690 ns;
      tpdA_Z_F                       :	Time := 0.850 ns;
      tpdB_Z_R                       :	Time := 0.690 ns;
      tpdB_Z_F                       :	Time := 0.850 ns;
      tpdC_Z_R                       :	Time := 0.690 ns;
      tpdC_Z_F                       :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "00000001",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AN3_FTGS of AN3 is
   for FTGS
   end for;
end CFG_AN3_FTGS;


----- CELL AN3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.840 ns;
      tpdA_Z_F                       :	Time := 0.940 ns;
      tpdB_Z_R                       :	Time := 0.840 ns;
      tpdB_Z_F                       :	Time := 0.940 ns;
      tpdC_Z_R                       :	Time := 0.840 ns;
      tpdC_Z_F                       :	Time := 0.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "00000001",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AN3P_FTGS of AN3P is
   for FTGS
   end for;
end CFG_AN3P_FTGS;


----- CELL AN4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.970 ns;
      tpdA_Z_F                       :	Time := 0.950 ns;
      tpdB_Z_R                       :	Time := 0.970 ns;
      tpdB_Z_F                       :	Time := 0.950 ns;
      tpdC_Z_R                       :	Time := 0.970 ns;
      tpdC_Z_F                       :	Time := 0.950 ns;
      tpdD_Z_R                       :	Time := 0.970 ns;
      tpdD_Z_F                       :	Time := 0.950 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0000000000000001",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AN4_FTGS of AN4 is
   for FTGS
   end for;
end CFG_AN4_FTGS;


----- CELL AN4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AN4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.150 ns;
      tpdA_Z_F                       :	Time := 0.960 ns;
      tpdB_Z_R                       :	Time := 1.150 ns;
      tpdB_Z_F                       :	Time := 0.960 ns;
      tpdC_Z_R                       :	Time := 1.150 ns;
      tpdC_Z_F                       :	Time := 0.960 ns;
      tpdD_Z_R                       :	Time := 1.150 ns;
      tpdD_Z_F                       :	Time := 0.960 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AN4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AN4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0000000000000001",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AN4P_FTGS of AN4P is
   for FTGS
   end for;
end CFG_AN4P_FTGS;


----- CELL AO1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.110 ns;
      tpdA_Z_F                       :	Time := 0.270 ns;
      tpdB_Z_R                       :	Time := 1.110 ns;
      tpdB_Z_F                       :	Time := 0.270 ns;
      tpdC_Z_R                       :	Time := 1.110 ns;
      tpdC_Z_F                       :	Time := 0.270 ns;
      tpdD_Z_R                       :	Time := 1.110 ns;
      tpdD_Z_F                       :	Time := 0.270 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1000100010000000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO1_FTGS of AO1 is
   for FTGS
   end for;
end CFG_AO1_FTGS;


----- CELL AO1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.120 ns;
      tpdA_Z_F                       :	Time := 0.280 ns;
      tpdB_Z_R                       :	Time := 1.120 ns;
      tpdB_Z_F                       :	Time := 0.280 ns;
      tpdC_Z_R                       :	Time := 1.120 ns;
      tpdC_Z_F                       :	Time := 0.280 ns;
      tpdD_Z_R                       :	Time := 1.120 ns;
      tpdD_Z_F                       :	Time := 0.280 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1000100010000000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO1P_FTGS of AO1P is
   for FTGS
   end for;
end CFG_AO1P_FTGS;


----- CELL AO2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.820 ns;
      tpdA_Z_F                       :	Time := 0.470 ns;
      tpdB_Z_R                       :	Time := 0.820 ns;
      tpdB_Z_F                       :	Time := 0.470 ns;
      tpdC_Z_R                       :	Time := 0.820 ns;
      tpdC_Z_F                       :	Time := 0.470 ns;
      tpdD_Z_R                       :	Time := 0.820 ns;
      tpdD_Z_F                       :	Time := 0.470 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1110111011100000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO2_FTGS of AO2 is
   for FTGS
   end for;
end CFG_AO2_FTGS;


----- CELL AO2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.800 ns;
      tpdA_Z_F                       :	Time := 0.380 ns;
      tpdB_Z_R                       :	Time := 0.800 ns;
      tpdB_Z_F                       :	Time := 0.380 ns;
      tpdC_Z_R                       :	Time := 0.800 ns;
      tpdC_Z_F                       :	Time := 0.380 ns;
      tpdD_Z_R                       :	Time := 0.800 ns;
      tpdD_Z_F                       :	Time := 0.380 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1110111011100000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO2P_FTGS of AO2P is
   for FTGS
   end for;
end CFG_AO2P_FTGS;


----- CELL AO3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.520 ns;
      tpdA_Z_F                       :	Time := 0.390 ns;
      tpdB_Z_R                       :	Time := 0.520 ns;
      tpdB_Z_F                       :	Time := 0.390 ns;
      tpdC_Z_R                       :	Time := 0.520 ns;
      tpdC_Z_F                       :	Time := 0.390 ns;
      tpdD_Z_R                       :	Time := 0.520 ns;
      tpdD_Z_F                       :	Time := 0.390 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111111011101110",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO3_FTGS of AO3 is
   for FTGS
   end for;
end CFG_AO3_FTGS;


----- CELL AO3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.420 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.420 ns;
      tpdC_Z_R                       :	Time := 0.500 ns;
      tpdC_Z_F                       :	Time := 0.420 ns;
      tpdD_Z_R                       :	Time := 0.500 ns;
      tpdD_Z_F                       :	Time := 0.420 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111111011101110",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO3P_FTGS of AO3P is
   for FTGS
   end for;
end CFG_AO3P_FTGS;


----- CELL AO4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.920 ns;
      tpdA_Z_F                       :	Time := 0.370 ns;
      tpdB_Z_R                       :	Time := 0.920 ns;
      tpdB_Z_F                       :	Time := 0.370 ns;
      tpdC_Z_R                       :	Time := 0.920 ns;
      tpdC_Z_F                       :	Time := 0.370 ns;
      tpdD_Z_R                       :	Time := 0.920 ns;
      tpdD_Z_F                       :	Time := 0.370 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111100010001000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO4_FTGS of AO4 is
   for FTGS
   end for;
end CFG_AO4_FTGS;


----- CELL AO4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.900 ns;
      tpdA_Z_F                       :	Time := 0.380 ns;
      tpdB_Z_R                       :	Time := 0.900 ns;
      tpdB_Z_F                       :	Time := 0.380 ns;
      tpdC_Z_R                       :	Time := 0.900 ns;
      tpdC_Z_F                       :	Time := 0.380 ns;
      tpdD_Z_R                       :	Time := 0.900 ns;
      tpdD_Z_F                       :	Time := 0.380 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111100010001000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO4P_FTGS of AO4P is
   for FTGS
   end for;
end CFG_AO4P_FTGS;


----- CELL AO5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO5 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.120 ns;
      tpdA_Z_F                       :	Time := 0.450 ns;
      tpdB_Z_R                       :	Time := 1.120 ns;
      tpdB_Z_F                       :	Time := 0.450 ns;
      tpdC_Z_R                       :	Time := 1.120 ns;
      tpdC_Z_F                       :	Time := 0.450 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO5;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO5 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11101000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO5_FTGS of AO5 is
   for FTGS
   end for;
end CFG_AO5_FTGS;


----- CELL AO5P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO5P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.060 ns;
      tpdA_Z_F                       :	Time := 0.420 ns;
      tpdB_Z_R                       :	Time := 1.060 ns;
      tpdB_Z_F                       :	Time := 0.420 ns;
      tpdC_Z_R                       :	Time := 1.060 ns;
      tpdC_Z_F                       :	Time := 0.420 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO5P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO5P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11101000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO5P_FTGS of AO5P is
   for FTGS
   end for;
end CFG_AO5P_FTGS;


----- CELL AO6 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO6 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.820 ns;
      tpdA_Z_F                       :	Time := 0.270 ns;
      tpdB_Z_R                       :	Time := 0.820 ns;
      tpdB_Z_F                       :	Time := 0.270 ns;
      tpdC_Z_R                       :	Time := 0.820 ns;
      tpdC_Z_F                       :	Time := 0.270 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO6;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO6 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10101000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO6_FTGS of AO6 is
   for FTGS
   end for;
end CFG_AO6_FTGS;


----- CELL AO6P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO6P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.800 ns;
      tpdA_Z_F                       :	Time := 0.180 ns;
      tpdB_Z_R                       :	Time := 0.800 ns;
      tpdB_Z_F                       :	Time := 0.180 ns;
      tpdC_Z_R                       :	Time := 0.800 ns;
      tpdC_Z_F                       :	Time := 0.180 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO6P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO6P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10101000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO6P_FTGS of AO6P is
   for FTGS
   end for;
end CFG_AO6P_FTGS;


----- CELL AO7 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO7 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.520 ns;
      tpdA_Z_F                       :	Time := 0.370 ns;
      tpdB_Z_R                       :	Time := 0.520 ns;
      tpdB_Z_F                       :	Time := 0.370 ns;
      tpdC_Z_R                       :	Time := 0.520 ns;
      tpdC_Z_F                       :	Time := 0.370 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO7;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO7 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11101010",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO7_FTGS of AO7 is
   for FTGS
   end for;
end CFG_AO7_FTGS;


----- CELL AO7P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO7P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.280 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.280 ns;
      tpdC_Z_R                       :	Time := 0.500 ns;
      tpdC_Z_F                       :	Time := 0.280 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO7P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO7P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11101010",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_AO7P_FTGS of AO7P is
   for FTGS
   end for;
end CFG_AO7P_FTGS;


----- CELL AO11 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO11 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.170 ns;
      tpdA_Z_F                       :	Time := 0.950 ns;
      tpdB_Z_R                       :	Time := 1.170 ns;
      tpdB_Z_F                       :	Time := 0.950 ns;
      tpdC_Z_R                       :	Time := 1.170 ns;
      tpdC_Z_F                       :	Time := 0.950 ns;
      tpdD_Z_R                       :	Time := 1.170 ns;
      tpdD_Z_F                       :	Time := 0.950 ns;
      tpdE_Z_R                       :	Time := 1.170 ns;
      tpdE_Z_F                       :	Time := 0.950 ns;
      tpdF_Z_R                       :	Time := 1.170 ns;
      tpdF_Z_F                       :	Time := 0.950 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO11;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO11 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "0001000100011111" &
		              "10101000",
		TT_size => (4, 3),
		Node_Index => (0, 1, 2, 3, 
		               4, 5, -1),
		pin_names => "A B E F C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(4), 
		Input(3) => connect(5), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO11_FTGS of AO11 is
   for FTGS
   end for;
end CFG_AO11_FTGS;


----- CELL AO11P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO11P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.340 ns;
      tpdA_Z_F                       :	Time := 1.040 ns;
      tpdB_Z_R                       :	Time := 1.340 ns;
      tpdB_Z_F                       :	Time := 1.040 ns;
      tpdC_Z_R                       :	Time := 1.340 ns;
      tpdC_Z_F                       :	Time := 1.040 ns;
      tpdD_Z_R                       :	Time := 1.340 ns;
      tpdD_Z_F                       :	Time := 1.040 ns;
      tpdE_Z_R                       :	Time := 1.340 ns;
      tpdE_Z_F                       :	Time := 1.040 ns;
      tpdF_Z_R                       :	Time := 1.340 ns;
      tpdF_Z_F                       :	Time := 1.040 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO11P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO11P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "0001000100011111" &
		              "10101000",
		TT_size => (4, 3),
		Node_Index => (0, 1, 2, 3, 
		               4, 5, -1),
		pin_names => "A B E F C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(4), 
		Input(3) => connect(5), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO11P_FTGS of AO11P is
   for FTGS
   end for;
end CFG_AO11P_FTGS;


----- CELL AO12 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO12 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.380 ns;
      tpdA_Z_F                       :	Time := 1.150 ns;
      tpdB_Z_R                       :	Time := 1.380 ns;
      tpdB_Z_F                       :	Time := 1.150 ns;
      tpdC_Z_R                       :	Time := 1.380 ns;
      tpdC_Z_F                       :	Time := 1.150 ns;
      tpdD_Z_R                       :	Time := 1.380 ns;
      tpdD_Z_F                       :	Time := 1.150 ns;
      tpdE_Z_R                       :	Time := 1.380 ns;
      tpdE_Z_F                       :	Time := 1.150 ns;
      tpdF_Z_R                       :	Time := 1.380 ns;
      tpdF_Z_F                       :	Time := 1.150 ns;
      tpdG_Z_R                       :	Time := 1.380 ns;
      tpdG_Z_F                       :	Time := 1.150 ns;
      tpdH_Z_R                       :	Time := 1.380 ns;
      tpdH_Z_F                       :	Time := 1.150 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO12;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO12 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "1111100010001000" &
		              "11111111110101011101010111010101",
		TT_size => (4, 5),
		Node_Index => (0, 1, 2, 3, 
		               4, 5, 6, 7, -1),
		pin_names => "E F G H A B C D Z",
		delay_param =>
			((tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(4), 
		Input(1) => connect(5), 
		Input(2) => connect(6), 
		Input(3) => connect(7), 
		Input(4) => connect(0), 
		Input(5) => connect(1), 
		Input(6) => connect(2), 
		Input(7) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO12_FTGS of AO12 is
   for FTGS
   end for;
end CFG_AO12_FTGS;


----- CELL AO12P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity AO12P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.560 ns;
      tpdA_Z_F                       :	Time := 1.260 ns;
      tpdB_Z_R                       :	Time := 1.560 ns;
      tpdB_Z_F                       :	Time := 1.260 ns;
      tpdC_Z_R                       :	Time := 1.560 ns;
      tpdC_Z_F                       :	Time := 1.260 ns;
      tpdD_Z_R                       :	Time := 1.560 ns;
      tpdD_Z_F                       :	Time := 1.260 ns;
      tpdE_Z_R                       :	Time := 1.560 ns;
      tpdE_Z_F                       :	Time := 1.260 ns;
      tpdF_Z_R                       :	Time := 1.560 ns;
      tpdF_Z_F                       :	Time := 1.260 ns;
      tpdG_Z_R                       :	Time := 1.560 ns;
      tpdG_Z_F                       :	Time := 1.260 ns;
      tpdH_Z_R                       :	Time := 1.560 ns;
      tpdH_Z_F                       :	Time := 1.260 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end AO12P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of AO12P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "1111100010001000" &
		              "11111111110101011101010111010101",
		TT_size => (4, 5),
		Node_Index => (0, 1, 2, 3, 
		               4, 5, 6, 7, -1),
		pin_names => "E F G H A B C D Z",
		delay_param =>
			((tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(4), 
		Input(1) => connect(5), 
		Input(2) => connect(6), 
		Input(3) => connect(7), 
		Input(4) => connect(0), 
		Input(5) => connect(1), 
		Input(6) => connect(2), 
		Input(7) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_AO12P_FTGS of AO12P is
   for FTGS
   end for;
end CFG_AO12P_FTGS;


----- CELL B1I -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B1I is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.550 ns;
      tpdA_Z_F                       :	Time := 1.100 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end B1I;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B1I is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_B1I_FTGS of B1I is
   for FTGS
   end for;
end CFG_B1I_FTGS;


----- CELL B2I -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B2I is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z1_R                      :	Time := 0.720 ns;
      tpdA_Z1_F                      :	Time := 0.400 ns;
      tpdA_Z2_R                      :	Time := 0.560 ns;
      tpdA_Z2_F                      :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end B2I;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B2I is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z1",
		delay_param =>
			( 0 => (tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z1);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z2",
		delay_param =>
			( 0 => (tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z2);


end FTGS;

configuration CFG_B2I_FTGS of B2I is
   for FTGS
   end for;
end CFG_B2I_FTGS;


----- CELL B2IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B2IP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z1_R                      :	Time := 0.700 ns;
      tpdA_Z1_F                      :	Time := 0.380 ns;
      tpdA_Z2_R                      :	Time := 0.630 ns;
      tpdA_Z2_F                      :	Time := 0.820 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end B2IP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B2IP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z1",
		delay_param =>
			( 0 => (tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z1);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z2",
		delay_param =>
			( 0 => (tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z2);


end FTGS;

configuration CFG_B2IP_FTGS of B2IP is
   for FTGS
   end for;
end CFG_B2IP_FTGS;


----- CELL B3I -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B3I is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z1_R                      :	Time := 0.490 ns;
      tpdA_Z1_F                      :	Time := 0.170 ns;
      tpdA_Z2_R                      :	Time := 0.340 ns;
      tpdA_Z2_F                      :	Time := 0.600 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end B3I;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B3I is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z1",
		delay_param =>
			( 0 => (tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z1);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z2",
		delay_param =>
			( 0 => (tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z2);


end FTGS;

configuration CFG_B3I_FTGS of B3I is
   for FTGS
   end for;
end CFG_B3I_FTGS;


----- CELL B3IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B3IP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z1_R                      :	Time := 0.400 ns;
      tpdA_Z1_F                      :	Time := 0.180 ns;
      tpdA_Z2_R                      :	Time := 0.350 ns;
      tpdA_Z2_F                      :	Time := 0.540 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end B3IP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B3IP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z1",
		delay_param =>
			( 0 => (tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z1);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z2",
		delay_param =>
			( 0 => (tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z2);


end FTGS;

configuration CFG_B3IP_FTGS of B3IP is
   for FTGS
   end for;
end CFG_B3IP_FTGS;


----- CELL B4I -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B4I is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.350 ns;
      tpdA_Z_F                       :	Time := 0.110 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end B4I;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B4I is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_B4I_FTGS of B4I is
   for FTGS
   end for;
end CFG_B4I_FTGS;


----- CELL B4IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B4IP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.350 ns;
      tpdA_Z_F                       :	Time := 0.020 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end B4IP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B4IP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_B4IP_FTGS of B4IP is
   for FTGS
   end for;
end CFG_B4IP_FTGS;


----- CELL B5I -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B5I is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.120 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end B5I;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B5I is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_B5I_FTGS of B5I is
   for FTGS
   end for;
end CFG_B5I_FTGS;


----- CELL B5IP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity B5IP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.330 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end B5IP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of B5IP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_B5IP_FTGS of B5IP is
   for FTGS
   end for;
end CFG_B5IP_FTGS;


----- CELL BTS4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity BTS4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.390 ns;
      tpdA_Z_F                       :	Time := 0.750 ns;
      tpdE_Z_R                       :	Time := 0.390 ns;
      tpdE_Z_F                       :	Time := 0.750 ns;
      tpdE_Z_LZ                      :	Time := 0.390 ns;
      tpdE_Z_HZ                      :	Time := 0.750 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end BTS4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of BTS4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_HZ: constant is 
	"U3/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_LZ: constant is 
	"U3/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "Z0Z1",
		pin_names => "A E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, tpdE_Z_LZ, tpdE_Z_R, tpdE_Z_HZ, tpdE_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_BTS4_FTGS of BTS4 is
   for FTGS
   end for;
end CFG_BTS4_FTGS;


----- CELL BTS4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity BTS4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.340 ns;
      tpdA_Z_F                       :	Time := 0.740 ns;
      tpdE_Z_R                       :	Time := 0.340 ns;
      tpdE_Z_F                       :	Time := 0.740 ns;
      tpdE_Z_LZ                      :	Time := 0.340 ns;
      tpdE_Z_HZ                      :	Time := 0.740 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end BTS4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of BTS4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_HZ: constant is 
	"U3/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_LZ: constant is 
	"U3/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "Z0Z1",
		pin_names => "A E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, tpdE_Z_LZ, tpdE_Z_R, tpdE_Z_HZ, tpdE_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_BTS4P_FTGS of BTS4P is
   for FTGS
   end for;
end CFG_BTS4P_FTGS;


----- CELL BTS5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity BTS5 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.890 ns;
      tpdA_Z_F                       :	Time := 0.650 ns;
      tpdE_Z_R                       :	Time := 0.890 ns;
      tpdE_Z_F                       :	Time := 0.650 ns;
      tpdE_Z_LZ                      :	Time := 0.890 ns;
      tpdE_Z_HZ                      :	Time := 0.650 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end BTS5;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of BTS5 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_HZ: constant is 
	"U3/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_LZ: constant is 
	"U3/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "Z1Z0",
		pin_names => "A E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, tpdE_Z_LZ, tpdE_Z_R, tpdE_Z_HZ, tpdE_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_BTS5_FTGS of BTS5 is
   for FTGS
   end for;
end CFG_BTS5_FTGS;


----- CELL BTS5P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity BTS5P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.000 ns;
      tpdA_Z_F                       :	Time := 0.750 ns;
      tpdE_Z_R                       :	Time := 1.000 ns;
      tpdE_Z_F                       :	Time := 0.750 ns;
      tpdE_Z_LZ                      :	Time := 1.000 ns;
      tpdE_Z_HZ                      :	Time := 0.750 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end BTS5P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of BTS5P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_HZ: constant is 
	"U3/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_LZ: constant is 
	"U3/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "Z1Z0",
		pin_names => "A E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, tpdE_Z_LZ, tpdE_Z_R, tpdE_Z_HZ, tpdE_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_BTS5P_FTGS of BTS5P is
   for FTGS
   end for;
end CFG_BTS5P_FTGS;


----- CELL D24L -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity D24L is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z0_R                      :	Time := 0.480 ns;
      tpdA_Z0_F                      :	Time := 0.730 ns;
      tpdB_Z0_R                      :	Time := 0.480 ns;
      tpdB_Z0_F                      :	Time := 0.730 ns;
      tpdA_Z1_R                      :	Time := 0.480 ns;
      tpdA_Z1_F                      :	Time := 0.730 ns;
      tpdB_Z1_R                      :	Time := 0.480 ns;
      tpdB_Z1_F                      :	Time := 0.730 ns;
      tpdA_Z2_R                      :	Time := 0.480 ns;
      tpdA_Z2_F                      :	Time := 0.730 ns;
      tpdB_Z2_R                      :	Time := 0.480 ns;
      tpdB_Z2_F                      :	Time := 0.730 ns;
      tpdA_Z3_R                      :	Time := 0.500 ns;
      tpdA_Z3_F                      :	Time := 0.130 ns;
      tpdB_Z3_R                      :	Time := 0.500 ns;
      tpdB_Z3_F                      :	Time := 0.130 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z0                             :	out   STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC;
      Z3                             :	out   STD_LOGIC);
end D24L;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of D24L is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z3_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z3_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z3_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z3_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z2_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z2_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z1_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z1_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z0_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z0_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z0_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z0_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0111",
		pin_names => "A B Z0",
		delay_param =>
			((tpdA_Z0_R, tpdA_Z0_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z0_R, tpdB_Z0_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z0);

   U4 : TLU
	generic map(
		N => 2,
		TruthTable => "1101",
		pin_names => "A B Z1",
		delay_param =>
			((tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z1_R, tpdB_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z1);

   U5 : TLU
	generic map(
		N => 2,
		TruthTable => "1011",
		pin_names => "A B Z2",
		delay_param =>
			((tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z2_R, tpdB_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z2);

   U6 : TLU
	generic map(
		N => 2,
		TruthTable => "1110",
		pin_names => "A B Z3",
		delay_param =>
			((tpdA_Z3_R, tpdA_Z3_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z3_R, tpdB_Z3_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z3);


end FTGS;

configuration CFG_D24L_FTGS of D24L is
   for FTGS
   end for;
end CFG_D24L_FTGS;


----- CELL D24LP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity D24LP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z0_R                      :	Time := 0.600 ns;
      tpdA_Z0_F                      :	Time := 0.960 ns;
      tpdB_Z0_R                      :	Time := 0.600 ns;
      tpdB_Z0_F                      :	Time := 0.960 ns;
      tpdA_Z1_R                      :	Time := 0.600 ns;
      tpdA_Z1_F                      :	Time := 0.960 ns;
      tpdB_Z1_R                      :	Time := 0.600 ns;
      tpdB_Z1_F                      :	Time := 0.960 ns;
      tpdA_Z2_R                      :	Time := 0.600 ns;
      tpdA_Z2_F                      :	Time := 0.960 ns;
      tpdB_Z2_R                      :	Time := 0.600 ns;
      tpdB_Z2_F                      :	Time := 0.960 ns;
      tpdA_Z3_R                      :	Time := 0.500 ns;
      tpdA_Z3_F                      :	Time := 0.160 ns;
      tpdB_Z3_R                      :	Time := 0.500 ns;
      tpdB_Z3_F                      :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z0                             :	out   STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC;
      Z3                             :	out   STD_LOGIC);
end D24LP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of D24LP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z3_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z3_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z3_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z3_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z2_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z2_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z2_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z2_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z1_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z1_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z1_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z1_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z0_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z0_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z0_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z0_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0111",
		pin_names => "A B Z0",
		delay_param =>
			((tpdA_Z0_R, tpdA_Z0_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z0_R, tpdB_Z0_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z0);

   U4 : TLU
	generic map(
		N => 2,
		TruthTable => "1101",
		pin_names => "A B Z1",
		delay_param =>
			((tpdA_Z1_R, tpdA_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z1_R, tpdB_Z1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z1);

   U5 : TLU
	generic map(
		N => 2,
		TruthTable => "1011",
		pin_names => "A B Z2",
		delay_param =>
			((tpdA_Z2_R, tpdA_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z2_R, tpdB_Z2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z2);

   U6 : TLU
	generic map(
		N => 2,
		TruthTable => "1110",
		pin_names => "A B Z3",
		delay_param =>
			((tpdA_Z3_R, tpdA_Z3_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z3_R, tpdB_Z3_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z3);


end FTGS;

configuration CFG_D24LP_FTGS of D24LP is
   for FTGS
   end for;
end CFG_D24LP_FTGS;


----- CELL EN -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EN is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.790 ns;
      tpdA_Z_F                       :	Time := 1.060 ns;
      tpdB_Z_R                       :	Time := 0.790 ns;
      tpdB_Z_F                       :	Time := 1.060 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EN;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EN is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1001",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_EN_FTGS of EN is
   for FTGS
   end for;
end CFG_EN_FTGS;


----- CELL EN3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EN3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.680 ns;
      tpdA_Z_F                       :	Time := 1.850 ns;
      tpdB_Z_R                       :	Time := 1.680 ns;
      tpdB_Z_F                       :	Time := 1.850 ns;
      tpdC_Z_R                       :	Time := 1.680 ns;
      tpdC_Z_F                       :	Time := 1.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EN3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EN3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10010110",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_EN3_FTGS of EN3 is
   for FTGS
   end for;
end CFG_EN3_FTGS;


----- CELL EN3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EN3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.650 ns;
      tpdA_Z_F                       :	Time := 1.940 ns;
      tpdB_Z_R                       :	Time := 1.650 ns;
      tpdB_Z_F                       :	Time := 1.940 ns;
      tpdC_Z_R                       :	Time := 1.650 ns;
      tpdC_Z_F                       :	Time := 1.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EN3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EN3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10010110",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_EN3P_FTGS of EN3P is
   for FTGS
   end for;
end CFG_EN3P_FTGS;


----- CELL ENP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ENP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.840 ns;
      tpdA_Z_F                       :	Time := 1.050 ns;
      tpdB_Z_R                       :	Time := 0.840 ns;
      tpdB_Z_F                       :	Time := 1.050 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ENP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ENP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1001",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_ENP_FTGS of ENP is
   for FTGS
   end for;
end CFG_ENP_FTGS;


----- CELL EO -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EO is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.790 ns;
      tpdA_Z_F                       :	Time := 1.060 ns;
      tpdB_Z_R                       :	Time := 0.790 ns;
      tpdB_Z_F                       :	Time := 1.060 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EO;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EO is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0110",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_EO_FTGS of EO is
   for FTGS
   end for;
end CFG_EO_FTGS;


----- CELL EO1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EO1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.820 ns;
      tpdA_Z_F                       :	Time := 0.970 ns;
      tpdB_Z_R                       :	Time := 0.820 ns;
      tpdB_Z_F                       :	Time := 0.970 ns;
      tpdC_Z_R                       :	Time := 0.820 ns;
      tpdC_Z_F                       :	Time := 0.970 ns;
      tpdD_Z_R                       :	Time := 0.820 ns;
      tpdD_Z_F                       :	Time := 0.970 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EO1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EO1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0111011101110000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_EO1_FTGS of EO1 is
   for FTGS
   end for;
end CFG_EO1_FTGS;


----- CELL EO1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EO1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.000 ns;
      tpdA_Z_F                       :	Time := 0.880 ns;
      tpdB_Z_R                       :	Time := 1.000 ns;
      tpdB_Z_F                       :	Time := 0.880 ns;
      tpdC_Z_R                       :	Time := 1.000 ns;
      tpdC_Z_F                       :	Time := 0.880 ns;
      tpdD_Z_R                       :	Time := 1.000 ns;
      tpdD_Z_F                       :	Time := 0.880 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EO1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EO1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0111011101110000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_EO1P_FTGS of EO1P is
   for FTGS
   end for;
end CFG_EO1P_FTGS;


----- CELL EO3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EO3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.680 ns;
      tpdA_Z_F                       :	Time := 1.850 ns;
      tpdB_Z_R                       :	Time := 1.680 ns;
      tpdB_Z_F                       :	Time := 1.850 ns;
      tpdC_Z_R                       :	Time := 1.680 ns;
      tpdC_Z_F                       :	Time := 1.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EO3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EO3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_EO3_FTGS of EO3 is
   for FTGS
   end for;
end CFG_EO3_FTGS;


----- CELL EO3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EO3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.650 ns;
      tpdA_Z_F                       :	Time := 1.940 ns;
      tpdB_Z_R                       :	Time := 1.650 ns;
      tpdB_Z_F                       :	Time := 1.940 ns;
      tpdC_Z_R                       :	Time := 1.650 ns;
      tpdC_Z_F                       :	Time := 1.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EO3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EO3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_EO3P_FTGS of EO3P is
   for FTGS
   end for;
end CFG_EO3P_FTGS;


----- CELL EON1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EON1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.820 ns;
      tpdA_Z_F                       :	Time := 0.870 ns;
      tpdB_Z_R                       :	Time := 0.820 ns;
      tpdB_Z_F                       :	Time := 0.870 ns;
      tpdC_Z_R                       :	Time := 0.820 ns;
      tpdC_Z_F                       :	Time := 0.870 ns;
      tpdD_Z_R                       :	Time := 0.820 ns;
      tpdD_Z_F                       :	Time := 0.870 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EON1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EON1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111000100010001",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_EON1_FTGS of EON1 is
   for FTGS
   end for;
end CFG_EON1_FTGS;


----- CELL EON1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EON1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.000 ns;
      tpdA_Z_F                       :	Time := 0.880 ns;
      tpdB_Z_R                       :	Time := 1.000 ns;
      tpdB_Z_F                       :	Time := 0.880 ns;
      tpdC_Z_R                       :	Time := 1.000 ns;
      tpdC_Z_F                       :	Time := 0.880 ns;
      tpdD_Z_R                       :	Time := 1.000 ns;
      tpdD_Z_F                       :	Time := 0.880 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EON1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EON1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111000100010001",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_EON1P_FTGS of EON1P is
   for FTGS
   end for;
end CFG_EON1P_FTGS;


----- CELL EOP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity EOP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.840 ns;
      tpdA_Z_F                       :	Time := 1.050 ns;
      tpdB_Z_R                       :	Time := 0.840 ns;
      tpdB_Z_F                       :	Time := 1.050 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end EOP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of EOP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0110",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_EOP_FTGS of EOP is
   for FTGS
   end for;
end CFG_EOP_FTGS;


----- CELL FA1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FA1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCI_S_R                      :	Time := 0.780 ns;
      tpdCI_S_F                      :	Time := 0.640 ns;
      tpdA_S_R                       :	Time := 1.880 ns;
      tpdA_S_F                       :	Time := 1.940 ns;
      tpdB_S_R                       :	Time := 1.880 ns;
      tpdB_S_F                       :	Time := 1.940 ns;
      tpdCI_CO_R                     :	Time := 0.790 ns;
      tpdCI_CO_F                     :	Time := 1.340 ns;
      tpdA_CO_R                      :	Time := 0.790 ns;
      tpdA_CO_F                      :	Time := 1.340 ns;
      tpdB_CO_R                      :	Time := 0.790 ns;
      tpdB_CO_F                      :	Time := 1.340 ns;
      twdCI_R                        :	Time := 0.000 ns;
      twdCI_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end FA1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FA1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_CO_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_CO_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_S_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_S_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCI_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCI_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCI_R, twdCI_F, twdCI_R, twdCI_R, twdCI_F, twdCI_F))
	port map( Input => CI, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "CI A B S",
		delay_param =>
			((tpdCI_S_R, tpdCI_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => S);

   U5 : TLU
	generic map(
		N => 3,
		TruthTable => "00010111",
		pin_names => "CI A B CO",
		delay_param =>
			((tpdCI_CO_R, tpdCI_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => CO);


end FTGS;

configuration CFG_FA1_FTGS of FA1 is
   for FTGS
   end for;
end CFG_FA1_FTGS;


----- CELL FA1A -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FA1A is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCI_S_R                      :	Time := 0.890 ns;
      tpdCI_S_F                      :	Time := 0.760 ns;
      tpdA_S_R                       :	Time := 1.990 ns;
      tpdA_S_F                       :	Time := 1.860 ns;
      tpdB_S_R                       :	Time := 1.990 ns;
      tpdB_S_F                       :	Time := 1.860 ns;
      tpdCI_CO_R                     :	Time := 0.790 ns;
      tpdCI_CO_F                     :	Time := 1.040 ns;
      tpdA_CO_R                      :	Time := 1.890 ns;
      tpdA_CO_F                      :	Time := 2.140 ns;
      tpdB_CO_R                      :	Time := 1.890 ns;
      tpdB_CO_F                      :	Time := 2.140 ns;
      twdCI_R                        :	Time := 0.000 ns;
      twdCI_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end FA1A;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FA1A is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_CO_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_CO_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_S_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_S_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCI_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCI_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCI_R, twdCI_F, twdCI_R, twdCI_R, twdCI_F, twdCI_F))
	port map( Input => CI, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "CI A B S",
		delay_param =>
			((tpdCI_S_R, tpdCI_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => S);

   U5 : TLU
	generic map(
		N => 3,
		TruthTable => "00010111",
		pin_names => "CI A B CO",
		delay_param =>
			((tpdCI_CO_R, tpdCI_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => CO);


end FTGS;

configuration CFG_FA1A_FTGS of FA1A is
   for FTGS
   end for;
end CFG_FA1A_FTGS;


----- CELL FA1AP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FA1AP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCI_S_R                      :	Time := 0.940 ns;
      tpdCI_S_F                      :	Time := 0.850 ns;
      tpdA_S_R                       :	Time := 2.040 ns;
      tpdA_S_F                       :	Time := 1.950 ns;
      tpdB_S_R                       :	Time := 2.040 ns;
      tpdB_S_F                       :	Time := 1.950 ns;
      tpdCI_CO_R                     :	Time := 0.940 ns;
      tpdCI_CO_F                     :	Time := 1.150 ns;
      tpdA_CO_R                      :	Time := 2.040 ns;
      tpdA_CO_F                      :	Time := 2.250 ns;
      tpdB_CO_R                      :	Time := 2.040 ns;
      tpdB_CO_F                      :	Time := 2.250 ns;
      twdCI_R                        :	Time := 0.000 ns;
      twdCI_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end FA1AP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FA1AP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_CO_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_CO_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_S_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_S_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCI_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCI_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCI_R, twdCI_F, twdCI_R, twdCI_R, twdCI_F, twdCI_F))
	port map( Input => CI, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "CI A B S",
		delay_param =>
			((tpdCI_S_R, tpdCI_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => S);

   U5 : TLU
	generic map(
		N => 3,
		TruthTable => "00010111",
		pin_names => "CI A B CO",
		delay_param =>
			((tpdCI_CO_R, tpdCI_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => CO);


end FTGS;

configuration CFG_FA1AP_FTGS of FA1AP is
   for FTGS
   end for;
end CFG_FA1AP_FTGS;


----- CELL FA1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FA1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCI_S_R                      :	Time := 0.840 ns;
      tpdCI_S_F                      :	Time := 0.650 ns;
      tpdA_S_R                       :	Time := 2.040 ns;
      tpdA_S_F                       :	Time := 1.950 ns;
      tpdB_S_R                       :	Time := 2.040 ns;
      tpdB_S_F                       :	Time := 1.950 ns;
      tpdCI_CO_R                     :	Time := 0.840 ns;
      tpdCI_CO_F                     :	Time := 1.430 ns;
      tpdA_CO_R                      :	Time := 0.840 ns;
      tpdA_CO_F                      :	Time := 1.430 ns;
      tpdB_CO_R                      :	Time := 0.840 ns;
      tpdB_CO_F                      :	Time := 1.430 ns;
      twdCI_R                        :	Time := 0.000 ns;
      twdCI_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end FA1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FA1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_CO_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_CO_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCI_S_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCI_S_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCI_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCI_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCI_R, twdCI_F, twdCI_R, twdCI_R, twdCI_F, twdCI_F))
	port map( Input => CI, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01101001",
		pin_names => "CI A B S",
		delay_param =>
			((tpdCI_S_R, tpdCI_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => S);

   U5 : TLU
	generic map(
		N => 3,
		TruthTable => "00010111",
		pin_names => "CI A B CO",
		delay_param =>
			((tpdCI_CO_R, tpdCI_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => CO);


end FTGS;

configuration CFG_FA1P_FTGS of FA1P is
   for FTGS
   end for;
end CFG_FA1P_FTGS;


----- CELL FD1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.370 ns;
      tpdCP_QN_R                     :	Time := 1.590 ns;
      tpdCP_QN_F                     :	Time := 1.570 ns;
      tsuD_CP                        :	Time := 0.800 ns;
      thCP_D                         :	Time := 0.400 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "CP D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "CP D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FD1_FTGS of FD1 is
   for FTGS
   end for;
end CFG_FD1_FTGS;


----- CELL FD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.160 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdCP_QN_R                     :	Time := 1.840 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 0.800 ns;
      thCP_D                         :	Time := 0.400 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "CP D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "CP D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FD1P_FTGS of FD1P is
   for FTGS
   end for;
end CFG_FD1P_FTGS;


----- CELL FD1S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD1S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.370 ns;
      tpdCP_QN_R                     :	Time := 1.590 ns;
      tpdCP_QN_F                     :	Time := 1.570 ns;
      tsuD_CP                        :	Time := 1.300 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuTI_CP                       :	Time := 1.300 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.300 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD1S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD1S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(7).Check_time, " &
	"U6/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(3));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "00011011",
		lut_next => "NN01NN01",
		pin_names => "CP D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuTI_CP),
			 (0, 2, hold_rising_ff, thCP_TI),
			 (3, 0, setup_rising_ff, tsuTE_CP),
			 (0, 3, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "11100100",
		lut_next => "NN01NN01",
		pin_names => "CP D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuTI_CP),
			 (0, 2, hold_rising_ff, thCP_TI),
			 (3, 0, setup_rising_ff, tsuTE_CP),
			 (0, 3, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FD1S_FTGS of FD1S is
   for FTGS
   end for;
end CFG_FD1S_FTGS;


----- CELL FD1SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD1SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.160 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdCP_QN_R                     :	Time := 1.840 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 1.300 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuTI_CP                       :	Time := 1.300 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.300 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.600 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD1SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD1SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(7).Check_time, " &
	"U6/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(3));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "00011011",
		lut_next => "NN01NN01",
		pin_names => "CP D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuTI_CP),
			 (0, 2, hold_rising_ff, thCP_TI),
			 (3, 0, setup_rising_ff, tsuTE_CP),
			 (0, 3, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "11100100",
		lut_next => "NN01NN01",
		pin_names => "CP D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuTI_CP),
			 (0, 2, hold_rising_ff, thCP_TI),
			 (3, 0, setup_rising_ff, tsuTE_CP),
			 (0, 3, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FD1SP_FTGS of FD1SP is
   for FTGS
   end for;
end CFG_FD1SP_FTGS;


----- CELL FD2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.770 ns;
      tpdCP_Q_R                      :	Time := 1.190 ns;
      tpdCP_Q_F                      :	Time := 1.370 ns;
      tpdCD_QN_R                     :	Time := 0.870 ns;
      tpdCP_QN_R                     :	Time := 1.470 ns;
      tpdCP_QN_F                     :	Time := 1.670 ns;
      tsuD_CP                        :	Time := 0.850 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FD2_FTGS of FD2 is
   for FTGS
   end for;
end CFG_FD2_FTGS;


----- CELL FD2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.740 ns;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.340 ns;
      tpdCD_QN_R                     :	Time := 1.160 ns;
      tpdCP_QN_R                     :	Time := 1.760 ns;
      tpdCP_QN_F                     :	Time := 1.960 ns;
      tsuD_CP                        :	Time := 0.850 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FD2P_FTGS of FD2P is
   for FTGS
   end for;
end CFG_FD2P_FTGS;


----- CELL FD2S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.770 ns;
      tpdCP_Q_R                      :	Time := 1.190 ns;
      tpdCP_Q_F                      :	Time := 1.370 ns;
      tpdCD_QN_R                     :	Time := 0.870 ns;
      tpdCP_QN_R                     :	Time := 1.470 ns;
      tpdCP_QN_F                     :	Time := 1.670 ns;
      tsuD_CP                        :	Time := 1.250 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.550 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD2S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(1)(TRAN_10), U7/delay_param(2)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01), U7/delay_param(3)(TRAN_01), " &
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10), U6/delay_param(3)(TRAN_10), " &
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "00011011",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "11100100",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FD2S_FTGS of FD2S is
   for FTGS
   end for;
end CFG_FD2S_FTGS;


----- CELL FD2SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.740 ns;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.340 ns;
      tpdCD_QN_R                     :	Time := 1.160 ns;
      tpdCP_QN_R                     :	Time := 1.760 ns;
      tpdCP_QN_F                     :	Time := 1.960 ns;
      tsuD_CP                        :	Time := 1.250 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.250 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.250 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.550 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD2SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(1)(TRAN_10), U7/delay_param(2)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01), U7/delay_param(3)(TRAN_01), " &
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(8).Check_time, " &
	"U7/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10), U6/delay_param(3)(TRAN_10), " &
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "00011011",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "11100100",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FD2SP_FTGS of FD2SP is
   for FTGS
   end for;
end CFG_FD2SP_FTGS;


----- CELL FD2TS -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2TS is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Z_F                      :	Time := 0.000 ns;
      tpdRD_Z_R                      :	Time := 0.500 ns;
      tpdRD_Z_F                      :	Time := 0.250 ns;
      tpdRD_Z_LZ                     :	Time := 0.500 ns;
      tpdRD_Z_HZ                     :	Time := 0.250 ns;
      tpdCP_Z_R                      :	Time := 1.930 ns;
      tpdCP_Z_F                      :	Time := 1.670 ns;
      tpdCD_Q_F                      :	Time := 0.000 ns;
      tpdCP_Q_R                      :	Time := 1.430 ns;
      tpdCP_Q_F                      :	Time := 1.420 ns;
      tsuD_CP                        :	Time := 0.850 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdRD_R                        :	Time := 0.000 ns;
      twdRD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC;
      Q                              :	out   STD_LOGIC);
end FD2TS;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2TS is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdRD_Z_HZ: constant is 
	"U6/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdRD_Z_LZ: constant is 
	"U6/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdRD_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdRD_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdRD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdRD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 

   signal internal_net0 : STD_LOGIC;

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdRD_R, twdRD_F, twdRD_R, twdRD_R, twdRD_F, twdRD_F))
	port map( Input => RD, Output => connect(1));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D Z",
		delay_param =>
			((tpdCP_Z_R, tpdCP_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Z_R, tpdCD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Z_R, tpdCP_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => internal_net0);

   U6 : TLU
	generic map(
		N => 2,
		TruthTable => "Z0Z1",
		pin_names => "Z RD Z",
		delay_param =>
			((0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_Z_R, tpdRD_Z_F, tpdRD_Z_LZ, tpdRD_Z_R, tpdRD_Z_HZ, tpdRD_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => internal_net0, 
		Input(1) => connect(1), 
		Output => Z);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => Q);


end FTGS;

configuration CFG_FD2TS_FTGS of FD2TS is
   for FTGS
   end for;
end CFG_FD2TS_FTGS;


----- CELL FD2TSP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD2TSP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Z_F                      :	Time := 0.000 ns;
      tpdRD_Z_R                      :	Time := 0.410 ns;
      tpdRD_Z_F                      :	Time := 0.350 ns;
      tpdRD_Z_LZ                     :	Time := 0.410 ns;
      tpdRD_Z_HZ                     :	Time := 0.350 ns;
      tpdCP_Z_R                      :	Time := 1.850 ns;
      tpdCP_Z_F                      :	Time := 1.820 ns;
      tsuD_CP                        :	Time := 0.850 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdRD_R                        :	Time := 0.000 ns;
      twdRD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end FD2TSP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD2TSP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdRD_Z_HZ: constant is 
	"U6/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdRD_Z_LZ: constant is 
	"U6/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdRD_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdRD_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdRD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdRD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 

   signal internal_net0 : STD_LOGIC;

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdRD_R, twdRD_F, twdRD_R, twdRD_R, twdRD_F, twdRD_F))
	port map( Input => RD, Output => connect(1));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD D Z",
		delay_param =>
			((tpdCP_Z_R, tpdCP_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Z_R, tpdCD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Z_R, tpdCP_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => internal_net0);

   U6 : TLU
	generic map(
		N => 2,
		TruthTable => "Z0Z1",
		pin_names => "Z RD Z",
		delay_param =>
			((0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_Z_R, tpdRD_Z_F, tpdRD_Z_LZ, tpdRD_Z_R, tpdRD_Z_HZ, tpdRD_Z_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => internal_net0, 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_FD2TSP_FTGS of FD2TSP is
   for FTGS
   end for;
end CFG_FD2TSP_FTGS;


----- CELL FD3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.750 ns;
      tpdSD_Q_R                      :	Time := 0.970 ns;
      tpdCP_Q_R                      :	Time := 1.170 ns;
      tpdCP_Q_F                      :	Time := 1.350 ns;
      tpdCD_QN_R                     :	Time := 1.090 ns;
      tpdSD_QN_F                     :	Time := 0.770 ns;
      tpdCP_QN_R                     :	Time := 1.690 ns;
      tpdCP_QN_F                     :	Time := 1.670 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U5/delay_param(1)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U5/delay_param(1)(TRAN_01), " &
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(1));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "10",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FD3_FTGS of FD3 is
   for FTGS
   end for;
end CFG_FD3_FTGS;


----- CELL FD3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.940 ns;
      tpdSD_Q_R                      :	Time := 1.190 ns;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.540 ns;
      tpdCD_QN_R                     :	Time := 1.440 ns;
      tpdSD_QN_F                     :	Time := 0.890 ns;
      tpdCP_QN_R                     :	Time := 2.040 ns;
      tpdCP_QN_F                     :	Time := 1.940 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U5/delay_param(1)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U5/delay_param(1)(TRAN_01), " &
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(1));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "10",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FD3P_FTGS of FD3P is
   for FTGS
   end for;
end CFG_FD3P_FTGS;


----- CELL FD3S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD3S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.750 ns;
      tpdSD_Q_R                      :	Time := 0.970 ns;
      tpdCP_Q_R                      :	Time := 1.170 ns;
      tpdCP_Q_F                      :	Time := 1.350 ns;
      tpdCD_QN_R                     :	Time := 1.090 ns;
      tpdSD_QN_F                     :	Time := 0.770 ns;
      tpdCP_QN_R                     :	Time := 1.690 ns;
      tpdCP_QN_F                     :	Time := 1.670 ns;
      tsuD_CP                        :	Time := 1.400 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.400 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.400 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD3S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD3S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U8/delay_param(1)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(3)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U7/constraint_param(9).Check_time, " &
	"U8/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U7/constraint_param(8).Check_time, " &
	"U8/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U7/constraint_param(7).Check_time, " &
	"U8/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U7/constraint_param(6).Check_time, " &
	"U8/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U7/constraint_param(5).Check_time, " &
	"U8/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U7/constraint_param(4).Check_time, " &
	"U8/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U7/constraint_param(3).Check_time, " &
	"U8/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U7/constraint_param(2).Check_time, " &
	"U8/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U8/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U8/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U7/delay_param(1)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(5));

   -- Netlist
   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "00011011",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => Q);

   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "11100100",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => QN);


end FTGS;

configuration CFG_FD3S_FTGS of FD3S is
   for FTGS
   end for;
end CFG_FD3S_FTGS;


----- CELL FD3SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD3SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.940 ns;
      tpdSD_Q_R                      :	Time := 1.190 ns;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.540 ns;
      tpdCD_QN_R                     :	Time := 1.440 ns;
      tpdSD_QN_F                     :	Time := 0.890 ns;
      tpdCP_QN_R                     :	Time := 2.040 ns;
      tpdCP_QN_F                     :	Time := 1.940 ns;
      tsuD_CP                        :	Time := 1.400 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.400 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.400 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.700 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD3SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD3SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U8/delay_param(1)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(3)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U7/constraint_param(9).Check_time, " &
	"U8/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U7/constraint_param(8).Check_time, " &
	"U8/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U7/constraint_param(7).Check_time, " &
	"U8/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U7/constraint_param(6).Check_time, " &
	"U8/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U7/constraint_param(5).Check_time, " &
	"U8/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U7/constraint_param(4).Check_time, " &
	"U8/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U7/constraint_param(3).Check_time, " &
	"U8/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U7/constraint_param(2).Check_time, " &
	"U8/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U8/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U8/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U7/delay_param(1)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(5));

   -- Netlist
   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "00011011",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => Q);

   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "11100100",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuD_CP),
			 (0, 3, hold_rising_ff, thCP_D),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => QN);


end FTGS;

configuration CFG_FD3SP_FTGS of FD3SP is
   for FTGS
   end for;
end CFG_FD3SP_FTGS;


----- CELL FD4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 0.890 ns;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.450 ns;
      tpdSD_QN_F                     :	Time := 0.720 ns;
      tpdCP_QN_R                     :	Time := 1.790 ns;
      tpdCP_QN_F                     :	Time := 1.570 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "01",
		lut_next => "NN110111NN110111",
		pin_names => "CP SD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "10",
		lut_next => "NN000100NN000100",
		pin_names => "CP SD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FD4_FTGS of FD4 is
   for FTGS
   end for;
end CFG_FD4_FTGS;


----- CELL FD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.010 ns;
      tpdCP_Q_R                      :	Time := 1.160 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdSD_QN_F                     :	Time := 0.740 ns;
      tpdCP_QN_R                     :	Time := 2.040 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "01",
		lut_next => "NN110111NN110111",
		pin_names => "CP SD D Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 1,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "10",
		lut_next => "NN000100NN000100",
		pin_names => "CP SD D QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FD4P_FTGS of FD4P is
   for FTGS
   end for;
end CFG_FD4P_FTGS;


----- CELL FD4S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD4S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 0.890 ns;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.450 ns;
      tpdSD_QN_F                     :	Time := 0.720 ns;
      tpdCP_QN_R                     :	Time := 1.790 ns;
      tpdCP_QN_F                     :	Time := 1.570 ns;
      tsuD_CP                        :	Time := 1.400 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.400 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.400 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.700 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD4S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD4S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(3)(TRAN_10), " &
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(8).Check_time, " &
	"U7/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01), U6/delay_param(3)(TRAN_01), " &
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "00011011",
		lut_next => "NN110111NN110111",
		pin_names => "CP SD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "11100100",
		lut_next => "NN000100NN000100",
		pin_names => "CP SD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FD4S_FTGS of FD4S is
   for FTGS
   end for;
end CFG_FD4S_FTGS;


----- CELL FD4SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FD4SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.010 ns;
      tpdCP_Q_R                      :	Time := 1.160 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdSD_QN_F                     :	Time := 0.740 ns;
      tpdCP_QN_R                     :	Time := 2.040 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 1.400 ns;
      thCP_D                         :	Time := 0.300 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.400 ns;
      thCP_TI                        :	Time := 0.300 ns;
      tsuTE_CP                       :	Time := 1.400 ns;
      thCP_TE                        :	Time := 0.300 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.700 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FD4SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FD4SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(3)(TRAN_10), " &
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(8).Check_time, " &
	"U7/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01), U6/delay_param(3)(TRAN_01), " &
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "00011011",
		lut_next => "NN110111NN110111",
		pin_names => "CP SD D TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "11100100",
		lut_next => "NN000100NN000100",
		pin_names => "CP SD D TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuD_CP),
			 (0, 2, hold_rising_ff, thCP_D),
			 (1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FD4SP_FTGS of FD4SP is
   for FTGS
   end for;
end CFG_FD4SP_FTGS;


----- CELL FDS2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FDS2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.270 ns;
      tpdCP_QN_R                     :	Time := 1.490 ns;
      tpdCP_QN_F                     :	Time := 1.570 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCR_CP                       :	Time := 0.900 ns;
      thCP_CR                        :	Time := 0.400 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCR_R                        :	Time := 0.000 ns;
      twdCR_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FDS2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FDS2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(5).Check_time, " &
	"U5/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_CR: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCR_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCR_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCR_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCR_R, twdCR_F, twdCR_R, twdCR_R, twdCR_F, twdCR_F))
	port map( Input => CR, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "0001",
		lut_next => "NN01NN01",
		pin_names => "CP D CR Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "1110",
		lut_next => "NN01NN01",
		pin_names => "CP D CR QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FDS2_FTGS of FDS2 is
   for FTGS
   end for;
end CFG_FDS2_FTGS;


----- CELL FDS2L -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FDS2L is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 1.250 ns;
      tpdCP_QN_R                     :	Time := 1.470 ns;
      tpdCP_QN_F                     :	Time := 1.550 ns;
      tsuD_CP                        :	Time := 1.600 ns;
      thCP_D                         :	Time := 0.200 ns;
      tsuCR_CP                       :	Time := 1.600 ns;
      thCP_CR                        :	Time := 0.200 ns;
      tsuLD_CP                       :	Time := 1.600 ns;
      thCP_LD                        :	Time := 0.200 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.800 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCR_R                        :	Time := 0.000 ns;
      twdCR_F                        :	Time := 0.000 ns;
      twdLD_R                        :	Time := 0.000 ns;
      twdLD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      LD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FDS2L;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FDS2L is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(7).Check_time, " &
	"U6/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_LD: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuLD_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_CR: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCR_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdLD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdLD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCR_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCR_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCR_R, twdCR_F, twdCR_R, twdCR_R, twdCR_F, twdCR_F))
	port map( Input => CR, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdLD_R, twdLD_F, twdLD_R, twdLD_R, twdLD_F, twdLD_F))
	port map( Input => LD, Output => connect(3));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "0000010000000111",
		lut_next => "NN01NN01",
		pin_names => "CP D CR LD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (3, 0, setup_rising_ff, tsuLD_CP),
			 (0, 3, hold_rising_ff, thCP_LD),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "1111011111110100",
		lut_next => "NN01NN01",
		pin_names => "CP D CR LD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (3, 0, setup_rising_ff, tsuLD_CP),
			 (0, 3, hold_rising_ff, thCP_LD),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FDS2L_FTGS of FDS2L is
   for FTGS
   end for;
end CFG_FDS2L_FTGS;


----- CELL FDS2LP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FDS2LP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.260 ns;
      tpdCP_Q_F                      :	Time := 1.340 ns;
      tpdCP_QN_R                     :	Time := 1.740 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 1.600 ns;
      thCP_D                         :	Time := 0.200 ns;
      tsuCR_CP                       :	Time := 1.600 ns;
      thCP_CR                        :	Time := 0.200 ns;
      tsuLD_CP                       :	Time := 1.600 ns;
      thCP_LD                        :	Time := 0.200 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.800 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCR_R                        :	Time := 0.000 ns;
      twdCR_F                        :	Time := 0.000 ns;
      twdLD_R                        :	Time := 0.000 ns;
      twdLD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      LD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FDS2LP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FDS2LP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(7).Check_time, " &
	"U6/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_LD: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuLD_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_CR: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCR_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10), " &
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdLD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdLD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCR_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCR_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCR_R, twdCR_F, twdCR_R, twdCR_R, twdCR_F, twdCR_F))
	port map( Input => CR, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdLD_R, twdLD_F, twdLD_R, twdLD_R, twdLD_F, twdLD_F))
	port map( Input => LD, Output => connect(3));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "0000010000000111",
		lut_next => "NN01NN01",
		pin_names => "CP D CR LD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (3, 0, setup_rising_ff, tsuLD_CP),
			 (0, 3, hold_rising_ff, thCP_LD),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 3,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "1111011111110100",
		lut_next => "NN01NN01",
		pin_names => "CP D CR LD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (3, 0, setup_rising_ff, tsuLD_CP),
			 (0, 3, hold_rising_ff, thCP_LD),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Input(3) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FDS2LP_FTGS of FDS2LP is
   for FTGS
   end for;
end CFG_FDS2LP_FTGS;


----- CELL FDS2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FDS2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.160 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdCP_QN_R                     :	Time := 1.840 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuD_CP                        :	Time := 0.900 ns;
      thCP_D                         :	Time := 0.400 ns;
      tsuCR_CP                       :	Time := 0.900 ns;
      thCP_CR                        :	Time := 0.400 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCR_R                        :	Time := 0.000 ns;
      twdCR_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FDS2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FDS2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(5).Check_time, " &
	"U5/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_CR: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCR_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCR_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCR_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCR_R, twdCR_F, twdCR_R, twdCR_R, twdCR_F, twdCR_F))
	port map( Input => CR, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "0001",
		lut_next => "NN01NN01",
		pin_names => "CP D CR Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "1110",
		lut_next => "NN01NN01",
		pin_names => "CP D CR QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuD_CP),
			 (0, 1, hold_rising_ff, thCP_D),
			 (2, 0, setup_rising_ff, tsuCR_CP),
			 (0, 2, hold_rising_ff, thCP_CR),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Input(2) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FDS2P_FTGS of FDS2P is
   for FTGS
   end for;
end CFG_FDS2P_FTGS;


----- CELL FJK1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.090 ns;
      tpdCP_Q_F                      :	Time := 0.940 ns;
      tpdCP_QN_R                     :	Time := 1.380 ns;
      tpdCP_QN_F                     :	Time := 1.450 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(5).Check_time, " &
	"U5/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01001110",
		lut_next => "NN01NN01",
		pin_names => "CP J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01110010",
		lut_next => "NN01NN01",
		pin_names => "CP J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FJK1_FTGS of FJK1 is
   for FTGS
   end for;
end CFG_FJK1_FTGS;


----- CELL FJK1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.140 ns;
      tpdCP_Q_F                      :	Time := 1.030 ns;
      tpdCP_QN_R                     :	Time := 1.560 ns;
      tpdCP_QN_F                     :	Time := 1.540 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(1)(TRAN_10), U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U4/constraint_param(5).Check_time, " &
	"U5/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10), U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01), U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01001110",
		lut_next => "NN01NN01",
		pin_names => "CP J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01110010",
		lut_next => "NN01NN01",
		pin_names => "CP J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Output => QN);


end FTGS;

configuration CFG_FJK1P_FTGS of FJK1P is
   for FTGS
   end for;
end CFG_FJK1P_FTGS;


----- CELL FJK1S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK1S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.290 ns;
      tpdCP_Q_F                      :	Time := 1.550 ns;
      tpdCP_QN_R                     :	Time := 1.780 ns;
      tpdCP_QN_F                     :	Time := 1.770 ns;
      tsuJ_CP                        :	Time := 1.700 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.700 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuTI_CP                       :	Time := 1.700 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.700 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK1S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK1S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(1)(TRAN_10), U7/delay_param(2)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(9).Check_time, " &
	"U7/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(8).Check_time, " &
	"U7/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN01NN01",
		pin_names => "CP J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN01NN01",
		pin_names => "CP J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FJK1S_FTGS of FJK1S is
   for FTGS
   end for;
end CFG_FJK1S_FTGS;


----- CELL FJK1SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK1SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.560 ns;
      tpdCP_QN_R                     :	Time := 1.960 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuJ_CP                        :	Time := 1.700 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.700 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuTI_CP                       :	Time := 1.700 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.700 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK1SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK1SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(1)(TRAN_10), U7/delay_param(2)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(9).Check_time, " &
	"U7/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(8).Check_time, " &
	"U7/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_01), U6/delay_param(2)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN01NN01",
		pin_names => "CP J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN01NN01",
		pin_names => "CP J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_ff, tsuJ_CP),
			 (0, 1, hold_rising_ff, thCP_J),
			 (2, 0, setup_rising_ff, tsuK_CP),
			 (0, 2, hold_rising_ff, thCP_K),
			 (3, 0, setup_rising_ff, tsuTI_CP),
			 (0, 3, hold_rising_ff, thCP_TI),
			 (4, 0, setup_rising_ff, tsuTE_CP),
			 (0, 4, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(3),
			Input(4) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_FJK1SP_FTGS of FJK1SP is
   for FTGS
   end for;
end CFG_FJK1SP_FTGS;


----- CELL FJK2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.690 ns;
      tpdCP_Q_R                      :	Time := 1.170 ns;
      tpdCP_Q_F                      :	Time := 0.940 ns;
      tpdCD_QN_R                     :	Time := 1.070 ns;
      tpdCP_QN_R                     :	Time := 1.320 ns;
      tpdCP_QN_F                     :	Time := 1.550 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01), U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10), U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01001110",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01110010",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FJK2_FTGS of FJK2 is
   for FTGS
   end for;
end CFG_FJK2_FTGS;


----- CELL FJK2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.850 ns;
      tpdCP_Q_R                      :	Time := 1.250 ns;
      tpdCP_Q_F                      :	Time := 1.050 ns;
      tpdCD_QN_R                     :	Time := 1.360 ns;
      tpdCP_QN_R                     :	Time := 1.560 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_10), U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01), U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U6/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U6/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U6/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U6/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U6/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U6/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U6/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U5/delay_param(0)(TRAN_10), " &
	"U5/delay_param(2)(TRAN_10), U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U5/delay_param(0)(TRAN_01), " &
	"U5/delay_param(1)(TRAN_01), U5/delay_param(2)(TRAN_01), " &
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01001110",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => Q);

   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01110010",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Output => QN);


end FTGS;

configuration CFG_FJK2P_FTGS of FJK2P is
   for FTGS
   end for;
end CFG_FJK2P_FTGS;


----- CELL FJK2S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK2S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.750 ns;
      tpdCP_Q_R                      :	Time := 1.470 ns;
      tpdCP_Q_F                      :	Time := 1.450 ns;
      tpdCD_QN_R                     :	Time := 1.080 ns;
      tpdCP_QN_R                     :	Time := 1.780 ns;
      tpdCP_QN_F                     :	Time := 1.970 ns;
      tsuJ_CP                        :	Time := 1.800 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.800 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.800 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.800 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK2S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK2S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U8/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(1)(TRAN_10), U8/delay_param(2)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01), U8/delay_param(3)(TRAN_01), " &
	"U8/delay_param(4)(TRAN_01), U8/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U7/constraint_param(10).Check_time, " &
	"U8/constraint_param(10).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U7/constraint_param(9).Check_time, " &
	"U8/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U7/constraint_param(8).Check_time, " &
	"U8/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U7/constraint_param(7).Check_time, " &
	"U8/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U7/constraint_param(6).Check_time, " &
	"U8/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U7/constraint_param(5).Check_time, " &
	"U8/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U7/constraint_param(4).Check_time, " &
	"U8/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U7/constraint_param(3).Check_time, " &
	"U8/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U7/constraint_param(2).Check_time, " &
	"U8/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U8/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U8/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(3)(TRAN_10), " &
	"U7/delay_param(4)(TRAN_10), U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U5 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(5));

   -- Netlist
   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => Q);

   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => QN);


end FTGS;

configuration CFG_FJK2S_FTGS of FJK2S is
   for FTGS
   end for;
end CFG_FJK2S_FTGS;


----- CELL FJK2SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK2SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.840 ns;
      tpdCP_Q_R                      :	Time := 1.570 ns;
      tpdCP_Q_F                      :	Time := 1.540 ns;
      tpdCD_QN_R                     :	Time := 1.260 ns;
      tpdCP_QN_R                     :	Time := 1.960 ns;
      tpdCP_QN_F                     :	Time := 2.040 ns;
      tsuJ_CP                        :	Time := 1.800 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.800 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.800 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.800 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK2SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK2SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U8/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(1)(TRAN_10), U8/delay_param(2)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01), U8/delay_param(3)(TRAN_01), " &
	"U8/delay_param(4)(TRAN_01), U8/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U7/constraint_param(10).Check_time, " &
	"U8/constraint_param(10).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U7/constraint_param(9).Check_time, " &
	"U8/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U7/constraint_param(8).Check_time, " &
	"U8/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U7/constraint_param(7).Check_time, " &
	"U8/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U7/constraint_param(6).Check_time, " &
	"U8/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U7/constraint_param(5).Check_time, " &
	"U8/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U7/constraint_param(4).Check_time, " &
	"U8/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U7/constraint_param(3).Check_time, " &
	"U8/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U7/constraint_param(2).Check_time, " &
	"U8/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U8/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U8/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(3)(TRAN_10), " &
	"U7/delay_param(4)(TRAN_10), U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(2));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(3));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   U5 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(5));

   -- Netlist
   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN000100NN000100",
		pin_names => "CP CD J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => Q);

   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN110111NN110111",
		pin_names => "CP CD J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_ff, tsuJ_CP),
			 (0, 2, hold_rising_ff, thCP_J),
			 (3, 0, setup_rising_ff, tsuK_CP),
			 (0, 3, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (4, 0, setup_rising_ff, tsuTI_CP),
			 (0, 4, hold_rising_ff, thCP_TI),
			 (5, 0, setup_rising_ff, tsuTE_CP),
			 (0, 5, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(3),
			Input(1) => connect(0),
			Input(2) => connect(1),
			Input(3) => connect(2),
			Input(4) => connect(4),
			Input(5) => connect(5),
			Output => QN);


end FTGS;

configuration CFG_FJK2SP_FTGS of FJK2SP is
   for FTGS
   end for;
end CFG_FJK2SP_FTGS;


----- CELL FJK3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.140 ns;
      tpdCD_Q_F                      :	Time := 0.750 ns;
      tpdCP_Q_R                      :	Time := 1.290 ns;
      tpdCP_Q_F                      :	Time := 1.450 ns;
      tpdSD_QN_F                     :	Time := 1.800 ns;
      tpdCD_QN_R                     :	Time := 1.390 ns;
      tpdCP_QN_R                     :	Time := 2.090 ns;
      tpdCP_QN_F                     :	Time := 1.950 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(4));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01001110",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01110010",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FJK3_FTGS of FJK3 is
   for FTGS
   end for;
end CFG_FJK3_FTGS;


----- CELL FJK3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.240 ns;
      tpdCD_Q_F                      :	Time := 0.740 ns;
      tpdCP_Q_R                      :	Time := 1.340 ns;
      tpdCP_Q_F                      :	Time := 1.440 ns;
      tpdSD_QN_F                     :	Time := 0.860 ns;
      tpdCD_QN_R                     :	Time := 1.540 ns;
      tpdCP_QN_R                     :	Time := 2.240 ns;
      tpdCP_QN_F                     :	Time := 2.060 ns;
      tsuJ_CP                        :	Time := 1.400 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.400 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U6/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U6/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U6/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U6/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(4));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01001110",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD J K Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 2,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01110010",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD J K QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Output => QN);


end FTGS;

configuration CFG_FJK3P_FTGS of FJK3P is
   for FTGS
   end for;
end CFG_FJK3P_FTGS;


----- CELL FJK3S -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK3S is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.420 ns;
      tpdCD_Q_F                      :	Time := 0.940 ns;
      tpdCP_Q_R                      :	Time := 1.570 ns;
      tpdCP_Q_F                      :	Time := 1.640 ns;
      tpdSD_QN_F                     :	Time := 0.820 ns;
      tpdCD_QN_R                     :	Time := 1.490 ns;
      tpdCP_QN_R                     :	Time := 2.190 ns;
      tpdCP_QN_F                     :	Time := 1.970 ns;
      tsuJ_CP                        :	Time := 1.700 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.700 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.700 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.700 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK3S;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK3S is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U9/delay_param(1)(TRAN_10), " &
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U9/delay_param(1)(TRAN_01), " &
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U9/delay_param(0)(TRAN_10), " &
	"U9/delay_param(3)(TRAN_10), U9/delay_param(4)(TRAN_10), " &
	"U9/delay_param(5)(TRAN_10), U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U9/delay_param(0)(TRAN_01), " &
	"U9/delay_param(3)(TRAN_01), U9/delay_param(4)(TRAN_01), " &
	"U9/delay_param(5)(TRAN_01), U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U8/constraint_param(11).Check_time, " &
	"U9/constraint_param(11).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U8/constraint_param(10).Check_time, " &
	"U9/constraint_param(10).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U8/constraint_param(9).Check_time, " &
	"U9/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U8/constraint_param(8).Check_time, " &
	"U9/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U8/constraint_param(7).Check_time, " &
	"U9/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U8/constraint_param(6).Check_time, " &
	"U9/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U8/constraint_param(5).Check_time, " &
	"U9/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U8/constraint_param(4).Check_time, " &
	"U9/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U8/constraint_param(3).Check_time, " &
	"U9/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U8/constraint_param(2).Check_time, " &
	"U9/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U8/constraint_param(1).Check_time, " &
	"U9/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U8/constraint_param(0).Check_time, " &
	"U9/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U8/delay_param(1)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10), U8/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(3)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01), U8/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 6) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(4));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   U6 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(6));

   -- Netlist
   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (5, 0, setup_rising_ff, tsuTI_CP),
			 (0, 5, hold_rising_ff, thCP_TI),
			 (6, 0, setup_rising_ff, tsuTE_CP),
			 (0, 6, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Input(5) => connect(5),
			Input(6) => connect(6),
			Output => Q);

   U9 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (5, 0, setup_rising_ff, tsuTI_CP),
			 (0, 5, hold_rising_ff, thCP_TI),
			 (6, 0, setup_rising_ff, tsuTE_CP),
			 (0, 6, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Input(5) => connect(5),
			Input(6) => connect(6),
			Output => QN);


end FTGS;

configuration CFG_FJK3S_FTGS of FJK3S is
   for FTGS
   end for;
end CFG_FJK3S_FTGS;


----- CELL FJK3SP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FJK3SP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 1.620 ns;
      tpdCD_Q_F                      :	Time := 0.940 ns;
      tpdCP_Q_R                      :	Time := 1.670 ns;
      tpdCP_Q_F                      :	Time := 1.640 ns;
      tpdSD_QN_F                     :	Time := 0.890 ns;
      tpdCD_QN_R                     :	Time := 1.740 ns;
      tpdCP_QN_R                     :	Time := 2.440 ns;
      tpdCP_QN_F                     :	Time := 2.140 ns;
      tsuJ_CP                        :	Time := 1.700 ns;
      thCP_J                         :	Time := 0.000 ns;
      tsuK_CP                        :	Time := 1.700 ns;
      thCP_K                         :	Time := 0.000 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      tsuTI_CP                       :	Time := 1.700 ns;
      thCP_TI                        :	Time := 0.000 ns;
      tsuTE_CP                       :	Time := 1.700 ns;
      thCP_TE                        :	Time := 0.000 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdJ_R                         :	Time := 0.000 ns;
      twdJ_F                         :	Time := 0.000 ns;
      twdK_R                         :	Time := 0.000 ns;
      twdK_F                         :	Time := 0.000 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdTI_R                        :	Time := 0.000 ns;
      twdTI_F                        :	Time := 0.000 ns;
      twdTE_R                        :	Time := 0.000 ns;
      twdTE_F                        :	Time := 0.000 ns);

   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FJK3SP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FJK3SP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U9/delay_param(1)(TRAN_10), " &
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U9/delay_param(1)(TRAN_01), " &
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U9/delay_param(0)(TRAN_10), " &
	"U9/delay_param(3)(TRAN_10), U9/delay_param(4)(TRAN_10), " &
	"U9/delay_param(5)(TRAN_10), U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U9/delay_param(0)(TRAN_01), " &
	"U9/delay_param(3)(TRAN_01), U9/delay_param(4)(TRAN_01), " &
	"U9/delay_param(5)(TRAN_01), U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U8/constraint_param(11).Check_time, " &
	"U9/constraint_param(11).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U8/constraint_param(10).Check_time, " &
	"U9/constraint_param(10).Check_time";
   attribute PROPAGATE_VALUE of thCP_TE: constant is 
	"U8/constraint_param(9).Check_time, " &
	"U9/constraint_param(9).Check_time";
   attribute PROPAGATE_VALUE of tsuTE_CP: constant is 
	"U8/constraint_param(8).Check_time, " &
	"U9/constraint_param(8).Check_time";
   attribute PROPAGATE_VALUE of thCP_TI: constant is 
	"U8/constraint_param(7).Check_time, " &
	"U9/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of tsuTI_CP: constant is 
	"U8/constraint_param(6).Check_time, " &
	"U9/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U8/constraint_param(5).Check_time, " &
	"U9/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U8/constraint_param(4).Check_time, " &
	"U9/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thCP_K: constant is 
	"U8/constraint_param(3).Check_time, " &
	"U9/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuK_CP: constant is 
	"U8/constraint_param(2).Check_time, " &
	"U9/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thCP_J: constant is 
	"U8/constraint_param(1).Check_time, " &
	"U9/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuJ_CP: constant is 
	"U8/constraint_param(0).Check_time, " &
	"U9/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U8/delay_param(1)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(4)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10), U8/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(3)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01), U8/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdTE_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTE_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdTI_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdTI_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdK_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdK_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdJ_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdJ_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 6) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdJ_R, twdJ_F, twdJ_R, twdJ_R, twdJ_F, twdJ_F))
	port map( Input => J, Output => connect(2));

   U2 : WIREBUF
	generic map(delay => (twdK_R, twdK_F, twdK_R, twdK_R, twdK_F, twdK_F))
	port map( Input => K, Output => connect(3));

   U3 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(4));

   U4 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(1));

   U5 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   U6 : WIREBUF
	generic map(delay => (twdTI_R, twdTI_F, twdTI_R, twdTI_R, twdTI_F, twdTI_F))
	port map( Input => TI, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdTE_R, twdTE_F, twdTE_R, twdTE_R, twdTE_F, twdTE_F))
	port map( Input => TE, Output => connect(6));

   -- Netlist
   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01000111000000111100111110001011",
		lut_next => "NN11000001110000" &
		            "NN11000001110000",
		pin_names => "CP CD SD J K TI TE Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (5, 0, setup_rising_ff, tsuTI_CP),
			 (0, 5, hold_rising_ff, thCP_TI),
			 (6, 0, setup_rising_ff, tsuTE_CP),
			 (0, 6, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Input(5) => connect(5),
			Input(6) => connect(6),
			Output => Q);

   U9 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 1,
		N_data => 4,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "01110100111111000011000010111000",
		lut_next => "NN00110001001100" &
		            "NN00110001001100",
		pin_names => "CP CD SD J K TI TE QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((3, 0, setup_rising_ff, tsuJ_CP),
			 (0, 3, hold_rising_ff, thCP_J),
			 (4, 0, setup_rising_ff, tsuK_CP),
			 (0, 4, hold_rising_ff, thCP_K),
			 (1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (2, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (5, 0, setup_rising_ff, tsuTI_CP),
			 (0, 5, hold_rising_ff, thCP_TI),
			 (6, 0, setup_rising_ff, tsuTE_CP),
			 (0, 6, hold_rising_ff, thCP_TE),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XXXXXXX",
		Q_feedback => TRUE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Input(2) => connect(0),
			Input(3) => connect(2),
			Input(4) => connect(3),
			Input(5) => connect(5),
			Input(6) => connect(6),
			Output => QN);


end FTGS;

configuration CFG_FJK3SP_FTGS of FJK3SP is
   for FTGS
   end for;
end CFG_FJK3SP_FTGS;


----- CELL FT2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FT2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.000 ns;
      tpdCP_Q_R                      :	Time := 1.070 ns;
      tpdCP_Q_F                      :	Time := 1.040 ns;
      tpdCD_QN_F                     :	Time := 0.000 ns;
      tpdCP_QN_R                     :	Time := 1.290 ns;
      tpdCP_QN_F                     :	Time := 1.550 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FT2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FT2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "",
		lut_next => "N010N000",
		pin_names => "CP CD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "",
		lut_next => "N111N101",
		pin_names => "CP CD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_preset_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FT2_FTGS of FT2 is
   for FTGS
   end for;
end CFG_FT2_FTGS;


----- CELL FT2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FT2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdCD_Q_F                      :	Time := 0.000 ns;
      tpdCP_Q_R                      :	Time := 1.150 ns;
      tpdCP_Q_F                      :	Time := 1.030 ns;
      tpdCD_QN_F                     :	Time := 0.000 ns;
      tpdCP_QN_R                     :	Time := 1.460 ns;
      tpdCP_QN_F                     :	Time := 1.740 ns;
      tsuCD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FT2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FT2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdCD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(0));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "",
		lut_next => "N010N000",
		pin_names => "CP CD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_Q_R, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_clear_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 1,
		N_preset => 0,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "",
		lut_next => "N111N101",
		pin_names => "CP CD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCP_QN_R, tpdCD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_preset_rise_rising_ff, tsuCD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FT2P_FTGS of FT2P is
   for FTGS
   end for;
end CFG_FT2P_FTGS;


----- CELL FT4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FT4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 0.000 ns;
      tpdSD_Q_F                      :	Time := 0.000 ns;
      tpdCP_Q_R                      :	Time := 0.990 ns;
      tpdCP_Q_F                      :	Time := 1.040 ns;
      tpdSD_QN_R                     :	Time := 0.000 ns;
      tpdSD_QN_F                     :	Time := 0.000 ns;
      tpdCP_QN_R                     :	Time := 1.490 ns;
      tpdCP_QN_F                     :	Time := 1.550 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FT4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FT4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N111N101",
		pin_names => "CP SD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdSD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N010N000",
		pin_names => "CP SD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_clear_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FT4_FTGS of FT4 is
   for FTGS
   end for;
end CFG_FT4_FTGS;


----- CELL FT4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity FT4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdSD_Q_R                      :	Time := 0.000 ns;
      tpdSD_Q_F                      :	Time := 0.000 ns;
      tpdCP_Q_R                      :	Time := 1.040 ns;
      tpdCP_Q_F                      :	Time := 1.030 ns;
      tpdSD_QN_R                     :	Time := 0.000 ns;
      tpdSD_QN_F                     :	Time := 0.000 ns;
      tpdCP_QN_R                     :	Time := 1.640 ns;
      tpdCP_QN_F                     :	Time := 1.640 ns;
      tsuSD_CP                       :	Time := 0.500 ns;
      twCP_H                         :	Time := 1.500 ns;
      twCP_L                         :	Time := 1.500 ns;
      twdCP_R                        :	Time := 0.000 ns;
      twdCP_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns);

   port(
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end FT4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of FT4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twCP_L: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of twCP_H: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuSD_CP: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdSD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCP_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdCP_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdCP_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCP_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdCP_R, twdCP_F, twdCP_R, twdCP_R, twdCP_F, twdCP_F))
	port map( Input => CP, Output => connect(1));

   U2 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(0));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N111N101",
		pin_names => "CP SD Q",
		delay_param =>
			((tpdCP_Q_R, tpdCP_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdSD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_preset_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 1,
		N_clear => 0,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "01",
		lut_clear => "",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N010N000",
		pin_names => "CP SD QN",
		delay_param =>
			((tpdCP_QN_R, tpdCP_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, recovery_clear_rise_rising_ff, tsuSD_CP),
			 (0, 0, pwidth_pos_hi_ff, twCP_H),
			 (0, 0, pwidth_neg_hi_ff, twCP_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_FT4P_FTGS of FT4P is
   for FTGS
   end for;
end CFG_FT4P_FTGS;


----- CELL HA1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity HA1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_S_R                       :	Time := 1.080 ns;
      tpdA_S_F                       :	Time := 0.940 ns;
      tpdB_S_R                       :	Time := 1.080 ns;
      tpdB_S_F                       :	Time := 0.940 ns;
      tpdA_CO_R                      :	Time := 0.480 ns;
      tpdA_CO_F                      :	Time := 0.770 ns;
      tpdB_CO_R                      :	Time := 0.480 ns;
      tpdB_CO_F                      :	Time := 0.770 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end HA1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of HA1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0110",
		pin_names => "A B S",
		delay_param =>
			((tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => S);

   U4 : TLU
	generic map(
		N => 2,
		TruthTable => "0001",
		pin_names => "A B CO",
		delay_param =>
			((tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => CO);


end FTGS;

configuration CFG_HA1_FTGS of HA1 is
   for FTGS
   end for;
end CFG_HA1_FTGS;


----- CELL HA1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity HA1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_S_R                       :	Time := 1.140 ns;
      tpdA_S_F                       :	Time := 1.050 ns;
      tpdB_S_R                       :	Time := 1.140 ns;
      tpdB_S_F                       :	Time := 1.050 ns;
      tpdA_CO_R                      :	Time := 0.540 ns;
      tpdA_CO_F                      :	Time := 0.840 ns;
      tpdB_CO_R                      :	Time := 0.540 ns;
      tpdB_CO_F                      :	Time := 0.840 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end HA1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of HA1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_CO_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_CO_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_CO_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_CO_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_S_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_S_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_S_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_S_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0110",
		pin_names => "A B S",
		delay_param =>
			((tpdA_S_R, tpdA_S_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_S_R, tpdB_S_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => S);

   U4 : TLU
	generic map(
		N => 2,
		TruthTable => "0001",
		pin_names => "A B CO",
		delay_param =>
			((tpdA_CO_R, tpdA_CO_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_CO_R, tpdB_CO_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => CO);


end FTGS;

configuration CFG_HA1P_FTGS of HA1P is
   for FTGS
   end for;
end CFG_HA1P_FTGS;


----- CELL IV -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IV is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.380 ns;
      tpdA_Z_F                       :	Time := 0.150 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IV;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IV is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IV_FTGS of IV is
   for FTGS
   end for;
end CFG_IV_FTGS;


----- CELL IVA -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IVA is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.240 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IVA;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IVA is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IVA_FTGS of IVA is
   for FTGS
   end for;
end CFG_IVA_FTGS;


----- CELL IVAP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IVAP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.260 ns;
      tpdA_Z_F                       :	Time := 0.140 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IVAP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IVAP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IVAP_FTGS of IVAP is
   for FTGS
   end for;
end CFG_IVAP_FTGS;


----- CELL IVDA -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IVDA is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Y_R                       :	Time := 0.550 ns;
      tpdA_Y_F                       :	Time := 0.320 ns;
      tpdA_Z_R                       :	Time := 0.480 ns;
      tpdA_Z_F                       :	Time := 0.670 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Y                              :	out   STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IVDA;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IVDA is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Y_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Y_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Y",
		delay_param =>
			( 0 => (tpdA_Y_R, tpdA_Y_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Y);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IVDA_FTGS of IVDA is
   for FTGS
   end for;
end CFG_IVDA_FTGS;


----- CELL IVDAP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IVDAP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Y_R                       :	Time := 0.400 ns;
      tpdA_Y_F                       :	Time := 0.180 ns;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.530 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Y                              :	out   STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IVDAP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IVDAP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Y_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Y_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Y",
		delay_param =>
			( 0 => (tpdA_Y_R, tpdA_Y_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Y);

   U3 : TLU
	generic map(
		N => 1,
		TruthTable => "01",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IVDAP_FTGS of IVDAP is
   for FTGS
   end for;
end CFG_IVDAP_FTGS;


----- CELL IVP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity IVP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end IVP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of IVP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U2/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U2/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 0) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   -- Netlist
   U2 : TLU
	generic map(
		N => 1,
		TruthTable => "10",
		pin_names => "A Z",
		delay_param =>
			( 0 => (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "X",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_IVP_FTGS of IVP is
   for FTGS
   end for;
end CFG_IVP_FTGS;


----- CELL LD1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 0.890 ns;
      tpdD_Q_F                       :	Time := 0.860 ns;
      tpdG_Q_R                       :	Time := 0.890 ns;
      tpdG_Q_F                       :	Time := 0.860 ns;
      tpdD_QN_R                      :	Time := 1.180 ns;
      tpdD_QN_F                      :	Time := 1.370 ns;
      tpdG_QN_R                      :	Time := 1.180 ns;
      tpdG_QN_F                      :	Time := 1.370 ns;
      tsuD_G                         :	Time := 0.400 ns;
      thG_D                          :	Time := 0.400 ns;
      twG_H                          :	Time := 1.500 ns;
      twG_L                          :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_G: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D Q",
		delay_param =>
			((tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD_G),
			 (0, 1, hold_falling_latch, thG_D),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D QN",
		delay_param =>
			((tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD_G),
			 (0, 1, hold_falling_latch, thG_D),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD1_FTGS of LD1 is
   for FTGS
   end for;
end CFG_LD1_FTGS;


----- CELL LD1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 0.940 ns;
      tpdD_Q_F                       :	Time := 0.950 ns;
      tpdG_Q_R                       :	Time := 0.940 ns;
      tpdG_Q_F                       :	Time := 0.950 ns;
      tpdD_QN_R                      :	Time := 1.460 ns;
      tpdD_QN_F                      :	Time := 1.540 ns;
      tpdG_QN_R                      :	Time := 1.460 ns;
      tpdG_QN_F                      :	Time := 1.540 ns;
      tsuD_G                         :	Time := 0.600 ns;
      thG_D                          :	Time := 0.400 ns;
      twG_H                          :	Time := 1.500 ns;
      twG_L                          :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_G: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D Q",
		delay_param =>
			((tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD_G),
			 (0, 1, hold_falling_latch, thG_D),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D QN",
		delay_param =>
			((tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD_G),
			 (0, 1, hold_falling_latch, thG_D),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD1P_FTGS of LD1P is
   for FTGS
   end for;
end CFG_LD1P_FTGS;


----- CELL LD1X4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD1X4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Q0_R                     :	Time := 0.990 ns;
      tpdD0_Q0_F                     :	Time := 0.960 ns;
      tpdG_Q0_R                      :	Time := 0.990 ns;
      tpdG_Q0_F                      :	Time := 0.960 ns;
      tpdD1_Q1_R                     :	Time := 0.990 ns;
      tpdD1_Q1_F                     :	Time := 0.960 ns;
      tpdG_Q1_R                      :	Time := 0.990 ns;
      tpdG_Q1_F                      :	Time := 0.960 ns;
      tpdD2_Q2_R                     :	Time := 0.990 ns;
      tpdD2_Q2_F                     :	Time := 0.960 ns;
      tpdG_Q2_R                      :	Time := 0.990 ns;
      tpdG_Q2_F                      :	Time := 0.960 ns;
      tpdD3_Q3_R                     :	Time := 0.990 ns;
      tpdD3_Q3_F                     :	Time := 0.960 ns;
      tpdG_Q3_R                      :	Time := 0.990 ns;
      tpdG_Q3_F                      :	Time := 0.960 ns;
      tpdD0_Q0N_R                    :	Time := 1.280 ns;
      tpdD0_Q0N_F                    :	Time := 1.450 ns;
      tpdG_Q0N_R                     :	Time := 1.280 ns;
      tpdG_Q0N_F                     :	Time := 1.450 ns;
      tpdD1_Q1N_R                    :	Time := 1.280 ns;
      tpdD1_Q1N_F                    :	Time := 1.450 ns;
      tpdG_Q1N_R                     :	Time := 1.280 ns;
      tpdG_Q1N_F                     :	Time := 1.450 ns;
      tpdD2_Q2N_R                    :	Time := 1.280 ns;
      tpdD2_Q2N_F                    :	Time := 1.450 ns;
      tpdG_Q2N_R                     :	Time := 1.280 ns;
      tpdG_Q2N_F                     :	Time := 1.450 ns;
      tpdD3_Q3N_R                    :	Time := 1.280 ns;
      tpdD3_Q3N_F                    :	Time := 1.450 ns;
      tpdG_Q3N_R                     :	Time := 1.280 ns;
      tpdG_Q3N_F                     :	Time := 1.450 ns;
      tsuD0_G                        :	Time := 0.400 ns;
      thG_D0                         :	Time := 0.400 ns;
      tsuD1_G                        :	Time := 0.400 ns;
      thG_D1                         :	Time := 0.400 ns;
      tsuD2_G                        :	Time := 0.400 ns;
      thG_D2                         :	Time := 0.400 ns;
      tsuD3_G                        :	Time := 0.400 ns;
      thG_D3                         :	Time := 0.400 ns;
      twG_H                          :	Time := 0.800 ns;
      twG_L                          :	Time := 0.800 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q0                             :	out   STD_LOGIC;
      Q1                             :	out   STD_LOGIC;
      Q2                             :	out   STD_LOGIC;
      Q3                             :	out   STD_LOGIC;
      Q0N                            :	out   STD_LOGIC;
      Q1N                            :	out   STD_LOGIC;
      Q2N                            :	out   STD_LOGIC;
      Q3N                            :	out   STD_LOGIC);
end LD1X4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD1X4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD3_Q3N_F: constant is 
	"U13/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Q3N_R: constant is 
	"U13/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q3N_F: constant is 
	"U13/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q3N_R: constant is 
	"U13/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Q2N_F: constant is 
	"U12/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Q2N_R: constant is 
	"U12/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q2N_F: constant is 
	"U12/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q2N_R: constant is 
	"U12/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Q1N_F: constant is 
	"U11/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Q1N_R: constant is 
	"U11/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q1N_F: constant is 
	"U11/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q1N_R: constant is 
	"U11/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Q0N_F: constant is 
	"U10/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Q0N_R: constant is 
	"U10/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q0N_F: constant is 
	"U10/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q0N_R: constant is 
	"U10/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D3: constant is 
	"U9/constraint_param(1).Check_time, " &
	"U13/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD3_G: constant is 
	"U9/constraint_param(0).Check_time, " &
	"U13/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD3_Q3_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Q3_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q3_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q3_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D2: constant is 
	"U8/constraint_param(1).Check_time, " &
	"U12/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD2_G: constant is 
	"U8/constraint_param(0).Check_time, " &
	"U12/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD2_Q2_F: constant is 
	"U8/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Q2_R: constant is 
	"U8/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q2_F: constant is 
	"U8/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q2_R: constant is 
	"U8/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D1: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U11/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD1_G: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U11/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD1_Q1_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Q1_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q1_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q1_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time, U8/constraint_param(3).Check_time, " &
	"U9/constraint_param(3).Check_time, U10/constraint_param(3).Check_time, " &
	"U11/constraint_param(3).Check_time, U12/constraint_param(3).Check_time, " &
	"U13/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time, U8/constraint_param(2).Check_time, " &
	"U9/constraint_param(2).Check_time, U10/constraint_param(2).Check_time, " &
	"U11/constraint_param(2).Check_time, U12/constraint_param(2).Check_time, " &
	"U13/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D0: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U10/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD0_G: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U10/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD0_Q0_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Q0_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q0_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q0_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D0 Q0",
		delay_param =>
			((tpdG_Q0_R, tpdG_Q0_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Q0_R, tpdD0_Q0_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD0_G),
			 (0, 1, hold_falling_latch, thG_D0),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(0),
			Output => Q0);

   U7 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D1 Q1",
		delay_param =>
			((tpdG_Q1_R, tpdG_Q1_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Q1_R, tpdD1_Q1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD1_G),
			 (0, 1, hold_falling_latch, thG_D1),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Output => Q1);

   U8 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D2 Q2",
		delay_param =>
			((tpdG_Q2_R, tpdG_Q2_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Q2_R, tpdD2_Q2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD2_G),
			 (0, 1, hold_falling_latch, thG_D2),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(2),
			Output => Q2);

   U9 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D3 Q3",
		delay_param =>
			((tpdG_Q3_R, tpdG_Q3_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Q3_R, tpdD3_Q3_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD3_G),
			 (0, 1, hold_falling_latch, thG_D3),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(3),
			Output => Q3);

   U10 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D0 Q0N",
		delay_param =>
			((tpdG_Q0N_R, tpdG_Q0N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Q0N_R, tpdD0_Q0N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD0_G),
			 (0, 1, hold_falling_latch, thG_D0),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(0),
			Output => Q0N);

   U11 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D1 Q1N",
		delay_param =>
			((tpdG_Q1N_R, tpdG_Q1N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Q1N_R, tpdD1_Q1N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD1_G),
			 (0, 1, hold_falling_latch, thG_D1),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Output => Q1N);

   U12 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D2 Q2N",
		delay_param =>
			((tpdG_Q2N_R, tpdG_Q2N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Q2N_R, tpdD2_Q2N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD2_G),
			 (0, 1, hold_falling_latch, thG_D2),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(2),
			Output => Q2N);

   U13 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D3 Q3N",
		delay_param =>
			((tpdG_Q3N_R, tpdG_Q3N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Q3N_R, tpdD3_Q3N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD3_G),
			 (0, 1, hold_falling_latch, thG_D3),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(3),
			Output => Q3N);


end FTGS;

configuration CFG_LD1X4_FTGS of LD1X4 is
   for FTGS
   end for;
end CFG_LD1X4_FTGS;


----- CELL LD1X4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD1X4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Q0_R                     :	Time := 1.040 ns;
      tpdD0_Q0_F                     :	Time := 0.950 ns;
      tpdG_Q0_R                      :	Time := 1.040 ns;
      tpdG_Q0_F                      :	Time := 0.950 ns;
      tpdD1_Q1_R                     :	Time := 1.040 ns;
      tpdD1_Q1_F                     :	Time := 0.950 ns;
      tpdG_Q1_R                      :	Time := 1.040 ns;
      tpdG_Q1_F                      :	Time := 0.950 ns;
      tpdD2_Q2_R                     :	Time := 1.040 ns;
      tpdD2_Q2_F                     :	Time := 0.950 ns;
      tpdG_Q2_R                      :	Time := 1.040 ns;
      tpdG_Q2_F                      :	Time := 0.950 ns;
      tpdD3_Q3_R                     :	Time := 1.040 ns;
      tpdD3_Q3_F                     :	Time := 0.950 ns;
      tpdG_Q3_R                      :	Time := 1.040 ns;
      tpdG_Q3_F                      :	Time := 0.950 ns;
      tpdD0_Q0N_R                    :	Time := 1.460 ns;
      tpdD0_Q0N_F                    :	Time := 1.540 ns;
      tpdG_Q0N_R                     :	Time := 1.460 ns;
      tpdG_Q0N_F                     :	Time := 1.540 ns;
      tpdD1_Q1N_R                    :	Time := 1.460 ns;
      tpdD1_Q1N_F                    :	Time := 1.540 ns;
      tpdG_Q1N_R                     :	Time := 1.460 ns;
      tpdG_Q1N_F                     :	Time := 1.540 ns;
      tpdD2_Q2N_R                    :	Time := 1.460 ns;
      tpdD2_Q2N_F                    :	Time := 1.540 ns;
      tpdG_Q2N_R                     :	Time := 1.460 ns;
      tpdG_Q2N_F                     :	Time := 1.540 ns;
      tpdD3_Q3N_R                    :	Time := 1.460 ns;
      tpdD3_Q3N_F                    :	Time := 1.540 ns;
      tpdG_Q3N_R                     :	Time := 1.460 ns;
      tpdG_Q3N_F                     :	Time := 1.540 ns;
      tsuD0_G                        :	Time := 0.500 ns;
      thG_D0                         :	Time := 0.400 ns;
      tsuD1_G                        :	Time := 0.500 ns;
      thG_D1                         :	Time := 0.400 ns;
      tsuD2_G                        :	Time := 0.500 ns;
      thG_D2                         :	Time := 0.400 ns;
      tsuD3_G                        :	Time := 0.500 ns;
      thG_D3                         :	Time := 0.400 ns;
      twG_H                          :	Time := 0.900 ns;
      twG_L                          :	Time := 0.900 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q0                             :	out   STD_LOGIC;
      Q1                             :	out   STD_LOGIC;
      Q2                             :	out   STD_LOGIC;
      Q3                             :	out   STD_LOGIC;
      Q0N                            :	out   STD_LOGIC;
      Q1N                            :	out   STD_LOGIC;
      Q2N                            :	out   STD_LOGIC;
      Q3N                            :	out   STD_LOGIC);
end LD1X4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD1X4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD3_Q3N_F: constant is 
	"U13/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Q3N_R: constant is 
	"U13/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q3N_F: constant is 
	"U13/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q3N_R: constant is 
	"U13/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Q2N_F: constant is 
	"U12/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Q2N_R: constant is 
	"U12/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q2N_F: constant is 
	"U12/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q2N_R: constant is 
	"U12/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Q1N_F: constant is 
	"U11/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Q1N_R: constant is 
	"U11/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q1N_F: constant is 
	"U11/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q1N_R: constant is 
	"U11/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Q0N_F: constant is 
	"U10/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Q0N_R: constant is 
	"U10/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q0N_F: constant is 
	"U10/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q0N_R: constant is 
	"U10/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D3: constant is 
	"U9/constraint_param(1).Check_time, " &
	"U13/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD3_G: constant is 
	"U9/constraint_param(0).Check_time, " &
	"U13/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD3_Q3_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Q3_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q3_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q3_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D2: constant is 
	"U8/constraint_param(1).Check_time, " &
	"U12/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD2_G: constant is 
	"U8/constraint_param(0).Check_time, " &
	"U12/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD2_Q2_F: constant is 
	"U8/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Q2_R: constant is 
	"U8/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q2_F: constant is 
	"U8/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q2_R: constant is 
	"U8/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of thG_D1: constant is 
	"U7/constraint_param(1).Check_time, " &
	"U11/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD1_G: constant is 
	"U7/constraint_param(0).Check_time, " &
	"U11/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD1_Q1_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Q1_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q1_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q1_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U6/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time, U8/constraint_param(3).Check_time, " &
	"U9/constraint_param(3).Check_time, U10/constraint_param(3).Check_time, " &
	"U11/constraint_param(3).Check_time, U12/constraint_param(3).Check_time, " &
	"U13/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U6/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time, U8/constraint_param(2).Check_time, " &
	"U9/constraint_param(2).Check_time, U10/constraint_param(2).Check_time, " &
	"U11/constraint_param(2).Check_time, U12/constraint_param(2).Check_time, " &
	"U13/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D0: constant is 
	"U6/constraint_param(1).Check_time, " &
	"U10/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD0_G: constant is 
	"U6/constraint_param(0).Check_time, " &
	"U10/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD0_Q0_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Q0_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Q0_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q0_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D0 Q0",
		delay_param =>
			((tpdG_Q0_R, tpdG_Q0_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Q0_R, tpdD0_Q0_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD0_G),
			 (0, 1, hold_falling_latch, thG_D0),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(0),
			Output => Q0);

   U7 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D1 Q1",
		delay_param =>
			((tpdG_Q1_R, tpdG_Q1_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Q1_R, tpdD1_Q1_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD1_G),
			 (0, 1, hold_falling_latch, thG_D1),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Output => Q1);

   U8 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D2 Q2",
		delay_param =>
			((tpdG_Q2_R, tpdG_Q2_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Q2_R, tpdD2_Q2_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD2_G),
			 (0, 1, hold_falling_latch, thG_D2),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(2),
			Output => Q2);

   U9 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "G D3 Q3",
		delay_param =>
			((tpdG_Q3_R, tpdG_Q3_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Q3_R, tpdD3_Q3_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD3_G),
			 (0, 1, hold_falling_latch, thG_D3),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(3),
			Output => Q3);

   U10 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D0 Q0N",
		delay_param =>
			((tpdG_Q0N_R, tpdG_Q0N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Q0N_R, tpdD0_Q0N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD0_G),
			 (0, 1, hold_falling_latch, thG_D0),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(0),
			Output => Q0N);

   U11 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D1 Q1N",
		delay_param =>
			((tpdG_Q1N_R, tpdG_Q1N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Q1N_R, tpdD1_Q1N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD1_G),
			 (0, 1, hold_falling_latch, thG_D1),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(1),
			Output => Q1N);

   U12 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D2 Q2N",
		delay_param =>
			((tpdG_Q2N_R, tpdG_Q2N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Q2N_R, tpdD2_Q2N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD2_G),
			 (0, 1, hold_falling_latch, thG_D2),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(2),
			Output => Q2N);

   U13 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "G D3 Q3N",
		delay_param =>
			((tpdG_Q3N_R, tpdG_Q3N_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Q3N_R, tpdD3_Q3N_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_falling_latch, tsuD3_G),
			 (0, 1, hold_falling_latch, thG_D3),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(4),
			Input(1) => connect(3),
			Output => Q3N);


end FTGS;

configuration CFG_LD1X4P_FTGS of LD1X4P is
   for FTGS
   end for;
end CFG_LD1X4P_FTGS;


----- CELL LD2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.090 ns;
      tpdD_Q_F                       :	Time := 1.240 ns;
      tpdGN_Q_R                      :	Time := 1.090 ns;
      tpdGN_Q_F                      :	Time := 1.240 ns;
      tpdD_QN_R                      :	Time := 1.580 ns;
      tpdD_QN_F                      :	Time := 1.570 ns;
      tpdGN_QN_R                     :	Time := 1.580 ns;
      tpdGN_QN_F                     :	Time := 1.570 ns;
      tsuD_GN                        :	Time := 0.400 ns;
      thGN_D                         :	Time := 0.400 ns;
      twGN_H                         :	Time := 1.500 ns;
      twGN_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdGN_R                        :	Time := 0.000 ns;
      twdGN_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twGN_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twGN_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thGN_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_GN: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdGN_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdGN_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdGN_R, twdGN_F, twdGN_R, twdGN_R, twdGN_F, twdGN_F))
	port map( Input => GN, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "GN D Q",
		delay_param =>
			((tpdGN_Q_R, tpdGN_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_latch, tsuD_GN),
			 (0, 1, hold_rising_latch, thGN_D),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "GN D QN",
		delay_param =>
			((tpdGN_QN_R, tpdGN_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_latch, tsuD_GN),
			 (0, 1, hold_rising_latch, thGN_D),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD2_FTGS of LD2 is
   for FTGS
   end for;
end CFG_LD2_FTGS;


----- CELL LD2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.140 ns;
      tpdD_Q_F                       :	Time := 1.230 ns;
      tpdGN_Q_R                      :	Time := 1.140 ns;
      tpdGN_Q_F                      :	Time := 1.230 ns;
      tpdD_QN_R                      :	Time := 1.760 ns;
      tpdD_QN_F                      :	Time := 1.740 ns;
      tpdGN_QN_R                     :	Time := 1.760 ns;
      tpdGN_QN_F                     :	Time := 1.740 ns;
      tsuD_GN                        :	Time := 0.600 ns;
      thGN_D                         :	Time := 0.400 ns;
      twGN_H                         :	Time := 1.500 ns;
      twGN_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdGN_R                        :	Time := 0.000 ns;
      twdGN_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twGN_L: constant is 
	"U3/constraint_param(3).Check_time, " &
	"U4/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of twGN_H: constant is 
	"U3/constraint_param(2).Check_time, " &
	"U4/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thGN_D: constant is 
	"U3/constraint_param(1).Check_time, " &
	"U4/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_GN: constant is 
	"U3/constraint_param(0).Check_time, " &
	"U4/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdGN_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdGN_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdGN_R, twdGN_F, twdGN_R, twdGN_R, twdGN_F, twdGN_F))
	port map( Input => GN, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN01NN01",
		pin_names => "GN D Q",
		delay_param =>
			((tpdGN_Q_R, tpdGN_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_latch, tsuD_GN),
			 (0, 1, hold_rising_latch, thGN_D),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "GN D QN",
		delay_param =>
			((tpdGN_QN_R, tpdGN_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((1, 0, setup_rising_latch, tsuD_GN),
			 (0, 1, hold_rising_latch, thGN_D),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD2P_FTGS of LD2P is
   for FTGS
   end for;
end CFG_LD2P_FTGS;


----- CELL LD3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.070 ns;
      tpdD_Q_F                       :	Time := 0.940 ns;
      tpdG_Q_R                       :	Time := 1.070 ns;
      tpdG_Q_F                       :	Time := 0.940 ns;
      tpdCD_Q_F                      :	Time := 1.340 ns;
      tpdD_QN_R                      :	Time := 1.180 ns;
      tpdD_QN_F                      :	Time := 1.470 ns;
      tpdG_QN_R                      :	Time := 1.180 ns;
      tpdG_QN_F                      :	Time := 1.470 ns;
      tpdCD_QN_R                     :	Time := 1.580 ns;
      tsuD_G                         :	Time := 0.500 ns;
      thG_D                          :	Time := 0.400 ns;
      tsuCD_G                        :	Time := 0.500 ns;
      twG_H                          :	Time := 1.500 ns;
      twG_L                          :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_G: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_G: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "G CD D Q",
		delay_param =>
			((tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (0 ns, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_G),
			 (0, 2, hold_falling_latch, thG_D),
			 (1, 0, recovery_clear_rise_falling_latch, tsuCD_G),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "G CD D QN",
		delay_param =>
			((tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_G),
			 (0, 2, hold_falling_latch, thG_D),
			 (1, 0, recovery_clear_rise_falling_latch, tsuCD_G),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD3_FTGS of LD3 is
   for FTGS
   end for;
end CFG_LD3_FTGS;


----- CELL LD3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.150 ns;
      tpdD_Q_F                       :	Time := 1.930 ns;
      tpdG_Q_R                       :	Time := 1.150 ns;
      tpdG_Q_F                       :	Time := 1.930 ns;
      tpdCD_Q_F                      :	Time := 2.330 ns;
      tpdD_QN_R                      :	Time := 1.460 ns;
      tpdD_QN_F                      :	Time := 1.640 ns;
      tpdG_QN_R                      :	Time := 1.460 ns;
      tpdG_QN_F                      :	Time := 1.640 ns;
      tpdCD_QN_R                     :	Time := 1.860 ns;
      tsuD_G                         :	Time := 0.700 ns;
      thG_D                          :	Time := 0.400 ns;
      tsuCD_G                        :	Time := 0.500 ns;
      twG_H                          :	Time := 1.500 ns;
      twG_L                          :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twG_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twG_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_G: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thG_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_G: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "G CD D Q",
		delay_param =>
			((tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (0 ns, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_G),
			 (0, 2, hold_falling_latch, thG_D),
			 (1, 0, recovery_clear_rise_falling_latch, tsuCD_G),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "01",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "G CD D QN",
		delay_param =>
			((tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_G),
			 (0, 2, hold_falling_latch, thG_D),
			 (1, 0, recovery_clear_rise_falling_latch, tsuCD_G),
			 (0, 0, pwidth_pos_hi_latch, twG_H),
			 (0, 0, pwidth_neg_hi_latch, twG_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD3P_FTGS of LD3P is
   for FTGS
   end for;
end CFG_LD3P_FTGS;


----- CELL LD4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.270 ns;
      tpdD_Q_F                       :	Time := 1.240 ns;
      tpdGN_Q_R                      :	Time := 1.270 ns;
      tpdGN_Q_F                      :	Time := 1.240 ns;
      tpdCD_Q_F                      :	Time := 1.640 ns;
      tpdD_QN_R                      :	Time := 1.480 ns;
      tpdD_QN_F                      :	Time := 1.650 ns;
      tpdGN_QN_R                     :	Time := 1.480 ns;
      tpdGN_QN_F                     :	Time := 1.650 ns;
      tpdCD_QN_R                     :	Time := 1.880 ns;
      tsuD_GN                        :	Time := 0.500 ns;
      thGN_D                         :	Time := 0.400 ns;
      tsuCD_GN                       :	Time := 0.500 ns;
      twGN_H                         :	Time := 1.500 ns;
      twGN_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdGN_R                        :	Time := 0.000 ns;
      twdGN_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twGN_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twGN_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_GN: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thGN_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_GN: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdGN_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdGN_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdGN_R, twdGN_F, twdGN_R, twdGN_R, twdGN_F, twdGN_F))
	port map( Input => GN, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "GN CD D Q",
		delay_param =>
			((tpdGN_Q_R, tpdGN_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (0 ns, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_latch, tsuD_GN),
			 (0, 2, hold_rising_latch, thGN_D),
			 (1, 0, recovery_clear_rise_rising_latch, tsuCD_GN),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "GN CD D QN",
		delay_param =>
			((tpdGN_QN_R, tpdGN_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_latch, tsuD_GN),
			 (0, 2, hold_rising_latch, thGN_D),
			 (1, 0, recovery_clear_rise_rising_latch, tsuCD_GN),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD4_FTGS of LD4 is
   for FTGS
   end for;
end CFG_LD4_FTGS;


----- CELL LD4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LD4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_Q_R                       :	Time := 1.350 ns;
      tpdD_Q_F                       :	Time := 1.230 ns;
      tpdGN_Q_R                      :	Time := 1.350 ns;
      tpdGN_Q_F                      :	Time := 1.230 ns;
      tpdCD_Q_F                      :	Time := 1.630 ns;
      tpdD_QN_R                      :	Time := 1.760 ns;
      tpdD_QN_F                      :	Time := 1.940 ns;
      tpdGN_QN_R                     :	Time := 1.760 ns;
      tpdGN_QN_F                     :	Time := 1.940 ns;
      tpdCD_QN_R                     :	Time := 2.160 ns;
      tsuD_GN                        :	Time := 0.700 ns;
      thGN_D                         :	Time := 0.400 ns;
      tsuCD_GN                       :	Time := 0.500 ns;
      twGN_H                         :	Time := 1.500 ns;
      twGN_L                         :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdGN_R                        :	Time := 0.000 ns;
      twdGN_F                        :	Time := 0.000 ns;
      twdCD_R                        :	Time := 0.000 ns;
      twdCD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LD4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LD4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_QN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdGN_QN_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_QN_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twGN_L: constant is 
	"U4/constraint_param(4).Check_time, " &
	"U5/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of twGN_H: constant is 
	"U4/constraint_param(3).Check_time, " &
	"U5/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuCD_GN: constant is 
	"U4/constraint_param(2).Check_time, " &
	"U5/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thGN_D: constant is 
	"U4/constraint_param(1).Check_time, " &
	"U5/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_GN: constant is 
	"U4/constraint_param(0).Check_time, " &
	"U5/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_Q_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Q_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdCD_Q_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdGN_Q_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdCD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdCD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdGN_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdGN_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdGN_R, twdGN_F, twdGN_R, twdGN_R, twdGN_F, twdGN_F))
	port map( Input => GN, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdCD_R, twdCD_F, twdCD_R, twdCD_R, twdCD_F, twdCD_F))
	port map( Input => CD, Output => connect(2));

   -- Netlist
   U4 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "01",
		lut_next => "NN000100NN000100",
		pin_names => "GN CD D Q",
		delay_param =>
			((tpdGN_Q_R, tpdGN_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (0 ns, tpdCD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Q_R, tpdD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_latch, tsuD_GN),
			 (0, 2, hold_rising_latch, thGN_D),
			 (1, 0, recovery_clear_rise_rising_latch, tsuCD_GN),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => Q);

   U5 : SEQGEN
	generic map(
		N_enable => 1,
		N_clock => 0,
		N_clear => 1,
		N_preset => 0,
		N_data => 1,
		lut_enable => "10",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN110111NN110111",
		pin_names => "GN CD D QN",
		delay_param =>
			((tpdGN_QN_R, tpdGN_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdCD_QN_R, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_rising_latch, tsuD_GN),
			 (0, 2, hold_rising_latch, thGN_D),
			 (1, 0, recovery_clear_rise_rising_latch, tsuCD_GN),
			 (0, 0, pwidth_pos_lo_latch, twGN_H),
			 (0, 0, pwidth_neg_lo_latch, twGN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LD4P_FTGS of LD4P is
   for FTGS
   end for;
end CFG_LD4P_FTGS;


----- CELL LS1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LS1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdC1_Q_R                      :	Time := 1.300 ns;
      tpdC1_Q_F                      :	Time := 0.930 ns;
      tpdC2_Q_R                      :	Time := 1.300 ns;
      tpdC2_Q_F                      :	Time := 0.930 ns;
      tpdC1_QN_R                     :	Time := 1.380 ns;
      tpdC1_QN_F                     :	Time := 1.550 ns;
      tpdC2_QN_R                     :	Time := 1.380 ns;
      tpdC2_QN_F                     :	Time := 1.550 ns;
      tsuD1_C1                       :	Time := 1.100 ns;
      thC1_D1                        :	Time := 0.000 ns;
      tsuD2_C2                       :	Time := 1.100 ns;
      thC2_D2                        :	Time := 0.000 ns;
      twC1_H                         :	Time := 1.500 ns;
      twC2_H                         :	Time := 1.500 ns;
      twC1_L                         :	Time := 1.500 ns;
      twC2_L                         :	Time := 1.500 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdC1_R                        :	Time := 0.000 ns;
      twdC1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdC2_R                        :	Time := 0.000 ns;
      twdC2_F                        :	Time := 0.000 ns);

   port(
      D1                             :	in    STD_LOGIC;
      C1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      C2                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LS1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LS1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

begin

   assert (FALSE)
     report "Cell LS1 was not properly created." & LF &
         "Please refer to the library compiler error log file."
     severity ERROR;

end FTGS;

configuration CFG_LS1_FTGS of LS1 is
   for FTGS
   end for;
end CFG_LS1_FTGS;


----- CELL LS1P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LS1P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdC1_Q_R                      :	Time := 1.250 ns;
      tpdC1_Q_F                      :	Time := 0.970 ns;
      tpdC2_Q_R                      :	Time := 1.250 ns;
      tpdC2_Q_F                      :	Time := 0.970 ns;
      tpdC1_QN_R                     :	Time := 1.540 ns;
      tpdC1_QN_F                     :	Time := 1.940 ns;
      tpdC2_QN_R                     :	Time := 1.540 ns;
      tpdC2_QN_F                     :	Time := 1.940 ns;
      tsuD1_C1                       :	Time := 1.300 ns;
      thC1_D1                        :	Time := 0.000 ns;
      tsuD2_C2                       :	Time := 1.300 ns;
      thC2_D2                        :	Time := 0.000 ns;
      twC1_H                         :	Time := 1.500 ns;
      twC2_H                         :	Time := 1.500 ns;
      twC1_L                         :	Time := 1.500 ns;
      twC2_L                         :	Time := 1.500 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdC1_R                        :	Time := 0.000 ns;
      twdC1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdC2_R                        :	Time := 0.000 ns;
      twdC2_F                        :	Time := 0.000 ns);

   port(
      D1                             :	in    STD_LOGIC;
      C1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      C2                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LS1P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LS1P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

begin

   assert (FALSE)
     report "Cell LS1P was not properly created." & LF &
         "Please refer to the library compiler error log file."
     severity ERROR;

end FTGS;

configuration CFG_LS1P_FTGS of LS1P is
   for FTGS
   end for;
end CFG_LS1P_FTGS;


----- CELL LSR0 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LSR0 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdS_Q_R                       :	Time := 1.530 ns;
      tpdR_Q_F                       :	Time := 0.920 ns;
      tpdS_QN_F                      :	Time := 0.920 ns;
      tpdR_QN_R                      :	Time := 1.530 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdR_R                         :	Time := 0.000 ns;
      twdR_F                         :	Time := 0.000 ns);

   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LSR0;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LSR0 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdR_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdR_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdR_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdR_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdR_R, twdR_F, twdR_R, twdR_R, twdR_F, twdR_F))
	port map( Input => R, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 1,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N100N100",
		pin_names => "R S Q",
		delay_param =>
			((tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 1,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N010N010",
		pin_names => "R S QN",
		delay_param =>
			((tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LSR0_FTGS of LSR0 is
   for FTGS
   end for;
end CFG_LSR0_FTGS;


----- CELL LSR0P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LSR0P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdS_Q_R                       :	Time := 1.720 ns;
      tpdR_Q_F                       :	Time := 0.970 ns;
      tpdS_QN_F                      :	Time := 0.970 ns;
      tpdR_QN_R                      :	Time := 1.720 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdR_R                         :	Time := 0.000 ns;
      twdR_F                         :	Time := 0.000 ns);

   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LSR0P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LSR0P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_QN_F: constant is 
	"U4/delay_param(0)(TRAN_10), " &
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdR_QN_R: constant is 
	"U4/delay_param(0)(TRAN_01), " &
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdR_Q_F: constant is 
	"U3/delay_param(0)(TRAN_10), " &
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Q_R: constant is 
	"U3/delay_param(0)(TRAN_01), " &
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdR_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdR_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdR_R, twdR_F, twdR_R, twdR_R, twdR_F, twdR_F))
	port map( Input => R, Output => connect(1));

   -- Netlist
   U3 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 1,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N100N100",
		pin_names => "R S Q",
		delay_param =>
			((tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => Q);

   U4 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 1,
		N_preset => 1,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "10",
		lut_preset => "10",
		lut_data => "",
		lut_next => "N010N010",
		pin_names => "R S QN",
		delay_param =>
			((tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_LSR0P_FTGS of LSR0P is
   for FTGS
   end for;
end CFG_LSR0P_FTGS;


----- CELL LSR1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LSR1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdS1_Q_R                      :	Time := 0.760 ns;
      tpdS2_Q_R                      :	Time := 0.760 ns;
      tpdSD_Q_R                      :	Time := 0.760 ns;
      tpdR1_Q_F                      :	Time := 1.220 ns;
      tpdR2_Q_F                      :	Time := 1.220 ns;
      tpdRD_Q_F                      :	Time := 1.220 ns;
      tpdS1_QN_F                     :	Time := 1.220 ns;
      tpdS2_QN_F                     :	Time := 1.220 ns;
      tpdSD_QN_F                     :	Time := 1.220 ns;
      tpdR1_QN_R                     :	Time := 0.760 ns;
      tpdR2_QN_R                     :	Time := 0.760 ns;
      tpdRD_QN_R                     :	Time := 0.760 ns;
      twdS1_R                        :	Time := 0.000 ns;
      twdS1_F                        :	Time := 0.000 ns;
      twdS2_R                        :	Time := 0.000 ns;
      twdS2_F                        :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdR1_R                        :	Time := 0.000 ns;
      twdR1_F                        :	Time := 0.000 ns;
      twdR2_R                        :	Time := 0.000 ns;
      twdR2_F                        :	Time := 0.000 ns;
      twdRD_R                        :	Time := 0.000 ns;
      twdRD_F                        :	Time := 0.000 ns);

   port(
      S1                             :	in    STD_LOGIC;
      S2                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      R1                             :	in    STD_LOGIC;
      R2                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LSR1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LSR1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS1_QN_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10), U8/delay_param(3)(TRAN_10), " &
	"U8/delay_param(4)(TRAN_10), U8/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS2_QN_F: constant is 
	"U8/delay_param(1)(TRAN_10), " &
	"U8/delay_param(2)(TRAN_10), U8/delay_param(3)(TRAN_10), " &
	"U8/delay_param(5)(TRAN_10), U8/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U8/delay_param(0)(TRAN_10), " &
	"U8/delay_param(1)(TRAN_10), U8/delay_param(2)(TRAN_10), " &
	"U8/delay_param(3)(TRAN_10), U8/delay_param(6)(TRAN_10), " &
	"U8/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdR1_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(1)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01), U8/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdRD_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(3)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01), U8/delay_param(6)(TRAN_01), " &
	"U8/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdR2_QN_R: constant is 
	"U8/delay_param(0)(TRAN_01), " &
	"U8/delay_param(2)(TRAN_01), U8/delay_param(4)(TRAN_01), " &
	"U8/delay_param(5)(TRAN_01), U8/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdS1_Q_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01), U7/delay_param(3)(TRAN_01), " &
	"U7/delay_param(4)(TRAN_01), U7/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdS2_Q_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01), U7/delay_param(3)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01), U7/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdR1_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(1)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10), U7/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdRD_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10), U7/delay_param(6)(TRAN_10), " &
	"U7/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdR2_Q_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10), U7/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(1)(TRAN_01), U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(6)(TRAN_01), " &
	"U7/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdRD_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdRD_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdR2_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdR2_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdR1_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdR1_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS2_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS2_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS1_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS1_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdS1_R, twdS1_F, twdS1_R, twdS1_R, twdS1_F, twdS1_F))
	port map( Input => S1, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdS2_R, twdS2_F, twdS2_R, twdS2_R, twdS2_F, twdS2_F))
	port map( Input => S2, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdR1_R, twdR1_F, twdR1_R, twdR1_R, twdR1_F, twdR1_F))
	port map( Input => R1, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdR2_R, twdR2_F, twdR2_R, twdR2_R, twdR2_F, twdR2_F))
	port map( Input => R2, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdRD_R, twdRD_F, twdRD_R, twdRD_R, twdRD_F, twdRD_F))
	port map( Input => RD, Output => connect(5));

   -- Netlist
   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 4,
		N_preset => 4,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "1010101011101010",
		lut_preset => "1101110011001100",
		lut_data => "",
		lut_next => "N101N101",
		pin_names => "SD R1 R2 RD S1 S2 SD RD Q",
		delay_param =>
			((tpdSD_Q_R, tpdR1_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS1_Q_R, tpdR1_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS1_Q_R, tpdR2_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS1_Q_R, tpdRD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS1_Q_R, tpdR1_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS2_Q_R, tpdR1_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdR1_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS1_Q_R, tpdRD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XXXXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(3),
			Input(2) => connect(4),
			Input(3) => connect(5),
			Input(4) => connect(0),
			Input(5) => connect(1),
			Input(6) => connect(2),
			Input(7) => connect(5),
			Output => Q);

   U8 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 4,
		N_preset => 4,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "1010101011101010",
		lut_preset => "1101110011001100",
		lut_data => "",
		lut_next => "N011N011",
		pin_names => "SD R1 R2 RD S1 S2 SD RD QN",
		delay_param =>
			((tpdR1_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR1_QN_R, tpdS1_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR2_QN_R, tpdS1_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_QN_R, tpdS1_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR1_QN_R, tpdS1_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR1_QN_R, tpdS2_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR1_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_QN_R, tpdS1_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XXXXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(2),
			Input(1) => connect(3),
			Input(2) => connect(4),
			Input(3) => connect(5),
			Input(4) => connect(0),
			Input(5) => connect(1),
			Input(6) => connect(2),
			Input(7) => connect(5),
			Output => QN);


end FTGS;

configuration CFG_LSR1_FTGS of LSR1 is
   for FTGS
   end for;
end CFG_LSR1_FTGS;


----- CELL LSR2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity LSR2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdS_Q_R                       :	Time := 0.760 ns;
      tpdR_Q_F                       :	Time := 1.220 ns;
      tpdG_Q_R                       :	Time := 0.760 ns;
      tpdG_Q_F                       :	Time := 1.220 ns;
      tpdSD_Q_R                      :	Time := 0.760 ns;
      tpdRD_Q_F                      :	Time := 1.220 ns;
      tpdS_QN_F                      :	Time := 1.220 ns;
      tpdR_QN_R                      :	Time := 0.760 ns;
      tpdG_QN_R                      :	Time := 0.760 ns;
      tpdG_QN_F                      :	Time := 1.220 ns;
      tpdSD_QN_F                     :	Time := 1.220 ns;
      tpdRD_QN_R                     :	Time := 0.760 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdR_R                         :	Time := 0.000 ns;
      twdR_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdSD_R                        :	Time := 0.000 ns;
      twdSD_F                        :	Time := 0.000 ns;
      twdRD_R                        :	Time := 0.000 ns;
      twdRD_F                        :	Time := 0.000 ns);

   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end LSR2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of LSR2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdRD_QN_R: constant is 
	"U7/delay_param(2)(TRAN_01), " &
	"U7/delay_param(3)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(6)(TRAN_01), U7/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10), " &
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01), " &
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdS_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(3)(TRAN_10), U7/delay_param(4)(TRAN_10), " &
	"U7/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSD_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10), " &
	"U7/delay_param(2)(TRAN_10), U7/delay_param(3)(TRAN_10), " &
	"U7/delay_param(6)(TRAN_10), U7/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdR_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01), " &
	"U7/delay_param(2)(TRAN_01), U7/delay_param(4)(TRAN_01), " &
	"U7/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdRD_Q_F: constant is 
	"U6/delay_param(2)(TRAN_10), " &
	"U6/delay_param(3)(TRAN_10), U6/delay_param(4)(TRAN_10), " &
	"U6/delay_param(6)(TRAN_10), U6/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Q_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdR_Q_F: constant is 
	"U6/delay_param(0)(TRAN_10), " &
	"U6/delay_param(2)(TRAN_10), U6/delay_param(4)(TRAN_10), " &
	"U6/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(3)(TRAN_01), U6/delay_param(4)(TRAN_01), " &
	"U6/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdSD_Q_R: constant is 
	"U6/delay_param(0)(TRAN_01), " &
	"U6/delay_param(2)(TRAN_01), U6/delay_param(3)(TRAN_01), " &
	"U6/delay_param(6)(TRAN_01), U6/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdRD_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdRD_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdR_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdR_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdR_R, twdR_F, twdR_R, twdR_R, twdR_F, twdR_F))
	port map( Input => R, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdSD_R, twdSD_F, twdSD_R, twdSD_R, twdSD_F, twdSD_F))
	port map( Input => SD, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdRD_R, twdRD_F, twdRD_R, twdRD_R, twdRD_F, twdRD_F))
	port map( Input => RD, Output => connect(4));

   -- Netlist
   U6 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 4,
		N_preset => 4,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "1011101010101010",
		lut_preset => "1101110011001100",
		lut_data => "",
		lut_next => "N101N101",
		pin_names => "R G SD RD S G SD RD Q",
		delay_param =>
			((tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Q_R, tpdRD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Q_R, tpdG_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdSD_Q_R, tpdR_Q_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Q_R, tpdRD_Q_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XXXXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(3),
			Input(3) => connect(4),
			Input(4) => connect(0),
			Input(5) => connect(2),
			Input(6) => connect(3),
			Input(7) => connect(4),
			Output => Q);

   U7 : SEQGEN
	generic map(
		N_enable => 0,
		N_clock => 0,
		N_clear => 4,
		N_preset => 4,
		N_data => 0,
		lut_enable => "",
		lut_clock => "",
		lut_clear => "1011101010101010",
		lut_preset => "1101110011001100",
		lut_data => "",
		lut_next => "N011N011",
		pin_names => "R G SD RD S G SD RD QN",
		delay_param =>
			((tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_QN_R, tpdG_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdR_QN_R, tpdSD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_QN_R, tpdS_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => nil_constraint,
		InMapZ => "XXXXXXXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(3),
			Input(3) => connect(4),
			Input(4) => connect(0),
			Input(5) => connect(2),
			Input(6) => connect(3),
			Input(7) => connect(4),
			Output => QN);


end FTGS;

configuration CFG_LSR2_FTGS of LSR2 is
   for FTGS
   end for;
end CFG_LSR2_FTGS;


----- CELL MUX21H -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21H is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.640 ns;
      tpdA_Z_F                       :	Time := 1.150 ns;
      tpdB_Z_R                       :	Time := 0.640 ns;
      tpdB_Z_F                       :	Time := 1.150 ns;
      tpdS_Z_R                       :	Time := 0.840 ns;
      tpdS_Z_F                       :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21H;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21H is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "00011011",
		pin_names => "A B S Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_MUX21H_FTGS of MUX21H is
   for FTGS
   end for;
end CFG_MUX21H_FTGS;


----- CELL MUX21HP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21HP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.760 ns;
      tpdA_Z_F                       :	Time := 1.250 ns;
      tpdB_Z_R                       :	Time := 0.760 ns;
      tpdB_Z_F                       :	Time := 1.250 ns;
      tpdS_Z_R                       :	Time := 0.960 ns;
      tpdS_Z_F                       :	Time := 0.950 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21HP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21HP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "00011011",
		pin_names => "A B S Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_MUX21HP_FTGS of MUX21HP is
   for FTGS
   end for;
end CFG_MUX21HP_FTGS;


----- CELL MUX21L -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21L is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.370 ns;
      tpdB_Z_R                       :	Time := 0.360 ns;
      tpdB_Z_F                       :	Time := 0.370 ns;
      tpdS_Z_R                       :	Time := 0.760 ns;
      tpdS_Z_F                       :	Time := 0.570 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21L;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21L is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11100100",
		pin_names => "A B S Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_MUX21L_FTGS of MUX21L is
   for FTGS
   end for;
end CFG_MUX21L_FTGS;


----- CELL MUX21LA -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21LA is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.280 ns;
      tpdA_Z_F                       :	Time := 0.570 ns;
      tpdB_Z_R                       :	Time := 0.280 ns;
      tpdB_Z_F                       :	Time := 0.570 ns;
      tpdS_Z_R                       :	Time := 0.280 ns;
      tpdS_Z_F                       :	Time := 0.570 ns;
      tpdSN_Z_R                      :	Time := 0.280 ns;
      tpdSN_Z_F                      :	Time := 0.570 ns;
      twdSN_R                        :	Time := 0.000 ns;
      twdSN_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      SN                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21LA;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21LA is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdSN_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSN_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSN_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSN_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdSN_R, twdSN_F, twdSN_R, twdSN_R, twdSN_F, twdSN_F))
	port map( Input => SN, Output => connect(3));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1110111011110011",
		pin_names => "SN A S B Z",
		delay_param =>
			((tpdSN_Z_R, tpdSN_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(3), 
		Input(1) => connect(0), 
		Input(2) => connect(2), 
		Input(3) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_MUX21LA_FTGS of MUX21LA is
   for FTGS
   end for;
end CFG_MUX21LA_FTGS;


----- CELL MUX21LAP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21LAP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.460 ns;
      tpdA_Z_F                       :	Time := 0.540 ns;
      tpdB_Z_R                       :	Time := 0.460 ns;
      tpdB_Z_F                       :	Time := 0.540 ns;
      tpdS_Z_R                       :	Time := 0.460 ns;
      tpdS_Z_F                       :	Time := 0.540 ns;
      tpdSN_Z_R                      :	Time := 0.460 ns;
      tpdSN_Z_F                      :	Time := 0.540 ns;
      twdSN_R                        :	Time := 0.000 ns;
      twdSN_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      SN                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21LAP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21LAP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdSN_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdSN_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdSN_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdSN_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdSN_R, twdSN_F, twdSN_R, twdSN_R, twdSN_F, twdSN_F))
	port map( Input => SN, Output => connect(3));

   U2 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1110111011110011",
		pin_names => "SN A S B Z",
		delay_param =>
			((tpdSN_Z_R, tpdSN_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(3), 
		Input(1) => connect(0), 
		Input(2) => connect(2), 
		Input(3) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_MUX21LAP_FTGS of MUX21LAP is
   for FTGS
   end for;
end CFG_MUX21LAP_FTGS;


----- CELL MUX21LP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX21LP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.460 ns;
      tpdA_Z_F                       :	Time := 0.360 ns;
      tpdB_Z_R                       :	Time := 0.460 ns;
      tpdB_Z_F                       :	Time := 0.360 ns;
      tpdS_Z_R                       :	Time := 0.860 ns;
      tpdS_Z_F                       :	Time := 0.660 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX21LP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX21LP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdS_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdS_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdS_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdS_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdS_R, twdS_F, twdS_R, twdS_R, twdS_F, twdS_F))
	port map( Input => S, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11100100",
		pin_names => "A B S Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdS_Z_R, tpdS_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_MUX21LP_FTGS of MUX21LP is
   for FTGS
   end for;
end CFG_MUX21LP_FTGS;


----- CELL MUX31L -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX31L is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.220 ns;
      tpdD0_Z_F                      :	Time := 0.570 ns;
      tpdD1_Z_R                      :	Time := 1.220 ns;
      tpdD1_Z_F                      :	Time := 0.570 ns;
      tpdD2_Z_R                      :	Time := 0.720 ns;
      tpdD2_Z_F                      :	Time := 0.470 ns;
      tpdA_Z_R                       :	Time := 1.520 ns;
      tpdA_Z_F                       :	Time := 0.770 ns;
      tpdB_Z_R                       :	Time := 0.720 ns;
      tpdB_Z_F                       :	Time := 0.470 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX31L;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX31L is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "11111010110110000111001001010000",
		pin_names => "D0 D1 D2 A B Z",
		delay_param =>
			((tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_MUX31L_FTGS of MUX31L is
   for FTGS
   end for;
end CFG_MUX31L_FTGS;


----- CELL MUX31LP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX31LP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.060 ns;
      tpdD0_Z_F                      :	Time := 0.450 ns;
      tpdD1_Z_R                      :	Time := 1.060 ns;
      tpdD1_Z_F                      :	Time := 0.450 ns;
      tpdD2_Z_R                      :	Time := 0.560 ns;
      tpdD2_Z_F                      :	Time := 0.350 ns;
      tpdA_Z_R                       :	Time := 1.160 ns;
      tpdA_Z_F                       :	Time := 0.850 ns;
      tpdB_Z_R                       :	Time := 0.560 ns;
      tpdB_Z_F                       :	Time := 0.350 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX31LP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX31LP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "11111010110110000111001001010000",
		pin_names => "D0 D1 D2 A B Z",
		delay_param =>
			((tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_MUX31LP_FTGS of MUX31LP is
   for FTGS
   end for;
end CFG_MUX31LP_FTGS;


----- CELL MUX41 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX41 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 0.690 ns;
      tpdD0_Z_F                      :	Time := 0.970 ns;
      tpdD1_Z_R                      :	Time := 0.690 ns;
      tpdD1_Z_F                      :	Time := 0.970 ns;
      tpdD2_Z_R                      :	Time := 0.690 ns;
      tpdD2_Z_F                      :	Time := 0.970 ns;
      tpdD3_Z_R                      :	Time := 0.690 ns;
      tpdD3_Z_F                      :	Time := 0.970 ns;
      tpdA_Z_R                       :	Time := 0.790 ns;
      tpdA_Z_F                       :	Time := 1.370 ns;
      tpdB_Z_R                       :	Time := 0.790 ns;
      tpdB_Z_F                       :	Time := 0.670 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX41;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX41 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "0011010100000000" &
		              "01010101010101010101111101110111",
		TT_size => (4, 5),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, -1),
		pin_names => "B A D0 D1 D2 D3 Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(5), 
		Input(1) => connect(4), 
		Input(2) => connect(0), 
		Input(3) => connect(1), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_MUX41_FTGS of MUX41 is
   for FTGS
   end for;
end CFG_MUX41_FTGS;


----- CELL MUX41P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX41P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 0.730 ns;
      tpdD0_Z_F                      :	Time := 0.940 ns;
      tpdD1_Z_R                      :	Time := 0.730 ns;
      tpdD1_Z_F                      :	Time := 0.940 ns;
      tpdD2_Z_R                      :	Time := 0.730 ns;
      tpdD2_Z_F                      :	Time := 0.940 ns;
      tpdD3_Z_R                      :	Time := 0.730 ns;
      tpdD3_Z_F                      :	Time := 0.940 ns;
      tpdA_Z_R                       :	Time := 0.830 ns;
      tpdA_Z_F                       :	Time := 1.240 ns;
      tpdB_Z_R                       :	Time := 0.830 ns;
      tpdB_Z_F                       :	Time := 0.640 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX41P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX41P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "0011010100000000" &
		              "01010101010101010101111101110111",
		TT_size => (4, 5),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, -1),
		pin_names => "B A D0 D1 D2 D3 Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(5), 
		Input(1) => connect(4), 
		Input(2) => connect(0), 
		Input(3) => connect(1), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_MUX41P_FTGS of MUX41P is
   for FTGS
   end for;
end CFG_MUX41P_FTGS;


----- CELL MUX51H -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX51H is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.790 ns;
      tpdD0_Z_F                      :	Time := 1.940 ns;
      tpdD1_Z_R                      :	Time := 1.790 ns;
      tpdD1_Z_F                      :	Time := 1.940 ns;
      tpdD2_Z_R                      :	Time := 1.790 ns;
      tpdD2_Z_F                      :	Time := 1.940 ns;
      tpdD3_Z_R                      :	Time := 1.790 ns;
      tpdD3_Z_F                      :	Time := 1.940 ns;
      tpdD4_Z_R                      :	Time := 0.690 ns;
      tpdD4_Z_F                      :	Time := 0.940 ns;
      tpdA_Z_R                       :	Time := 2.190 ns;
      tpdA_Z_F                       :	Time := 1.840 ns;
      tpdB_Z_R                       :	Time := 1.290 ns;
      tpdB_Z_F                       :	Time := 0.940 ns;
      tpdC_Z_R                       :	Time := 0.890 ns;
      tpdC_Z_F                       :	Time := 0.640 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdD4_R                        :	Time := 0.000 ns;
      twdD4_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      D4                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX51H;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX51H is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD4_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD4_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdD4_R, twdD4_F, twdD4_R, twdD4_R, twdD4_F, twdD4_F))
	port map( Input => D4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "0011010100000000" &
		              "0000000000110101" &
		              "0111011100001111",
		TT_size => (4, 4, 4),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, 
		               6, 7, -1, -2),
		pin_names => "B A D0 D1 D2 D3 C D4 Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD4_Z_R, tpdD4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(6), 
		Input(1) => connect(5), 
		Input(2) => connect(0), 
		Input(3) => connect(1), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Input(6) => connect(7), 
		Input(7) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_MUX51H_FTGS of MUX51H is
   for FTGS
   end for;
end CFG_MUX51H_FTGS;


----- CELL MUX51HP -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX51HP is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.840 ns;
      tpdD0_Z_F                      :	Time := 2.050 ns;
      tpdD1_Z_R                      :	Time := 1.840 ns;
      tpdD1_Z_F                      :	Time := 2.050 ns;
      tpdD2_Z_R                      :	Time := 1.840 ns;
      tpdD2_Z_F                      :	Time := 2.050 ns;
      tpdD3_Z_R                      :	Time := 1.840 ns;
      tpdD3_Z_F                      :	Time := 2.050 ns;
      tpdD4_Z_R                      :	Time := 0.740 ns;
      tpdD4_Z_F                      :	Time := 1.050 ns;
      tpdA_Z_R                       :	Time := 2.240 ns;
      tpdA_Z_F                       :	Time := 1.950 ns;
      tpdB_Z_R                       :	Time := 1.340 ns;
      tpdB_Z_F                       :	Time := 1.050 ns;
      tpdC_Z_R                       :	Time := 0.940 ns;
      tpdC_Z_F                       :	Time := 0.750 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdD4_R                        :	Time := 0.000 ns;
      twdD4_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      D4                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX51HP;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX51HP is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD4_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD4_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdD4_R, twdD4_F, twdD4_R, twdD4_R, twdD4_F, twdD4_F))
	port map( Input => D4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "0011010100000000" &
		              "0000000000110101" &
		              "0111011100001111",
		TT_size => (4, 4, 4),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, 
		               6, 7, -1, -2),
		pin_names => "B A D0 D1 D2 D3 C D4 Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD4_Z_R, tpdD4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(6), 
		Input(1) => connect(5), 
		Input(2) => connect(0), 
		Input(3) => connect(1), 
		Input(4) => connect(2), 
		Input(5) => connect(3), 
		Input(6) => connect(7), 
		Input(7) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_MUX51HP_FTGS of MUX51HP is
   for FTGS
   end for;
end CFG_MUX51HP_FTGS;


----- CELL MUX81 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX81 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.090 ns;
      tpdD0_Z_F                      :	Time := 1.250 ns;
      tpdD1_Z_R                      :	Time := 1.090 ns;
      tpdD1_Z_F                      :	Time := 1.250 ns;
      tpdD2_Z_R                      :	Time := 1.090 ns;
      tpdD2_Z_F                      :	Time := 1.250 ns;
      tpdD3_Z_R                      :	Time := 1.090 ns;
      tpdD3_Z_F                      :	Time := 1.250 ns;
      tpdD4_Z_R                      :	Time := 1.090 ns;
      tpdD4_Z_F                      :	Time := 1.250 ns;
      tpdD5_Z_R                      :	Time := 1.090 ns;
      tpdD5_Z_F                      :	Time := 1.250 ns;
      tpdD6_Z_R                      :	Time := 1.090 ns;
      tpdD6_Z_F                      :	Time := 1.250 ns;
      tpdD7_Z_R                      :	Time := 1.090 ns;
      tpdD7_Z_F                      :	Time := 1.250 ns;
      tpdA_Z_R                       :	Time := 1.790 ns;
      tpdA_Z_F                       :	Time := 2.350 ns;
      tpdB_Z_R                       :	Time := 1.790 ns;
      tpdB_Z_F                       :	Time := 2.350 ns;
      tpdC_Z_R                       :	Time := 1.790 ns;
      tpdC_Z_F                       :	Time := 2.350 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdD4_R                        :	Time := 0.000 ns;
      twdD4_F                        :	Time := 0.000 ns;
      twdD5_R                        :	Time := 0.000 ns;
      twdD5_F                        :	Time := 0.000 ns;
      twdD6_R                        :	Time := 0.000 ns;
      twdD6_F                        :	Time := 0.000 ns;
      twdD7_R                        :	Time := 0.000 ns;
      twdD7_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      D4                             :	in    STD_LOGIC;
      D5                             :	in    STD_LOGIC;
      D6                             :	in    STD_LOGIC;
      D7                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX81;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX81 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U12/delay_param(10)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U12/delay_param(10)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U12/delay_param(9)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U12/delay_param(9)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U12/delay_param(8)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U12/delay_param(8)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U12/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U12/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U12/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U12/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD7_Z_F: constant is 
	"U12/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD7_Z_R: constant is 
	"U12/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD6_Z_F: constant is 
	"U12/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD6_Z_R: constant is 
	"U12/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD5_Z_F: constant is 
	"U12/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD5_Z_R: constant is 
	"U12/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD4_Z_F: constant is 
	"U12/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD4_Z_R: constant is 
	"U12/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U12/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U12/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U12/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U12/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U11/delay(TRAN_10), " &
	"U11/delay(TRAN_1Z), U11/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U11/delay(TRAN_01), " &
	"U11/delay(TRAN_0Z), U11/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U10/delay(TRAN_10), " &
	"U10/delay(TRAN_1Z), U10/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U10/delay(TRAN_01), " &
	"U10/delay(TRAN_0Z), U10/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U9/delay(TRAN_10), " &
	"U9/delay(TRAN_1Z), U9/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U9/delay(TRAN_01), " &
	"U9/delay(TRAN_0Z), U9/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD7_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD7_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD6_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD6_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD5_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD5_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 10) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdD4_R, twdD4_F, twdD4_R, twdD4_R, twdD4_F, twdD4_F))
	port map( Input => D4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdD5_R, twdD5_F, twdD5_R, twdD5_R, twdD5_F, twdD5_F))
	port map( Input => D5, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdD6_R, twdD6_F, twdD6_R, twdD6_R, twdD6_F, twdD6_F))
	port map( Input => D6, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdD7_R, twdD7_F, twdD7_R, twdD7_R, twdD7_F, twdD7_F))
	port map( Input => D7, Output => connect(7));

   U9 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(8));

   U10 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(9));

   U11 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(10));

   -- Netlist
   U12 : TLU
	generic map(
		N => 11,
		TruthTable => "0011010100000000" &
		              "0000000000110101" &
		              "0011010100000000" &
		              "0000000000110101" &
		              "01110111011101110000111111111111",
		TT_size => (4, 4, 4, 4, 5),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, 
		               0, 1, 6, 7, 
		               0, 1, 8, 9, 
		               10, -1, -2, -3, -4),
		pin_names => "B A D4 D5 D6 D7 D0 D1 D2 D3 C Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD4_Z_R, tpdD4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD5_Z_R, tpdD5_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD6_Z_R, tpdD6_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD7_Z_R, tpdD7_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(9), 
		Input(1) => connect(8), 
		Input(2) => connect(4), 
		Input(3) => connect(5), 
		Input(4) => connect(6), 
		Input(5) => connect(7), 
		Input(6) => connect(0), 
		Input(7) => connect(1), 
		Input(8) => connect(2), 
		Input(9) => connect(3), 
		Input(10) => connect(10), 
		Output => Z);


end FTGS;

configuration CFG_MUX81_FTGS of MUX81 is
   for FTGS
   end for;
end CFG_MUX81_FTGS;


----- CELL MUX81P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity MUX81P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD0_Z_R                      :	Time := 1.330 ns;
      tpdD0_Z_F                      :	Time := 1.120 ns;
      tpdD1_Z_R                      :	Time := 1.330 ns;
      tpdD1_Z_F                      :	Time := 1.120 ns;
      tpdD2_Z_R                      :	Time := 1.330 ns;
      tpdD2_Z_F                      :	Time := 1.120 ns;
      tpdD3_Z_R                      :	Time := 1.330 ns;
      tpdD3_Z_F                      :	Time := 1.120 ns;
      tpdD4_Z_R                      :	Time := 1.330 ns;
      tpdD4_Z_F                      :	Time := 1.120 ns;
      tpdD5_Z_R                      :	Time := 1.330 ns;
      tpdD5_Z_F                      :	Time := 1.120 ns;
      tpdD6_Z_R                      :	Time := 1.330 ns;
      tpdD6_Z_F                      :	Time := 1.120 ns;
      tpdD7_Z_R                      :	Time := 1.330 ns;
      tpdD7_Z_F                      :	Time := 1.120 ns;
      tpdA_Z_R                       :	Time := 2.130 ns;
      tpdA_Z_F                       :	Time := 2.020 ns;
      tpdB_Z_R                       :	Time := 1.130 ns;
      tpdB_Z_F                       :	Time := 0.920 ns;
      tpdC_Z_R                       :	Time := 0.830 ns;
      tpdC_Z_F                       :	Time := 0.620 ns;
      twdD0_R                        :	Time := 0.000 ns;
      twdD0_F                        :	Time := 0.000 ns;
      twdD1_R                        :	Time := 0.000 ns;
      twdD1_F                        :	Time := 0.000 ns;
      twdD2_R                        :	Time := 0.000 ns;
      twdD2_F                        :	Time := 0.000 ns;
      twdD3_R                        :	Time := 0.000 ns;
      twdD3_F                        :	Time := 0.000 ns;
      twdD4_R                        :	Time := 0.000 ns;
      twdD4_F                        :	Time := 0.000 ns;
      twdD5_R                        :	Time := 0.000 ns;
      twdD5_F                        :	Time := 0.000 ns;
      twdD6_R                        :	Time := 0.000 ns;
      twdD6_F                        :	Time := 0.000 ns;
      twdD7_R                        :	Time := 0.000 ns;
      twdD7_F                        :	Time := 0.000 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      D4                             :	in    STD_LOGIC;
      D5                             :	in    STD_LOGIC;
      D6                             :	in    STD_LOGIC;
      D7                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end MUX81P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of MUX81P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U12/delay_param(10)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U12/delay_param(10)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD3_Z_F: constant is 
	"U12/delay_param(9)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD3_Z_R: constant is 
	"U12/delay_param(9)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD2_Z_F: constant is 
	"U12/delay_param(8)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD2_Z_R: constant is 
	"U12/delay_param(8)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD1_Z_F: constant is 
	"U12/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD1_Z_R: constant is 
	"U12/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD0_Z_F: constant is 
	"U12/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD0_Z_R: constant is 
	"U12/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD7_Z_F: constant is 
	"U12/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD7_Z_R: constant is 
	"U12/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD6_Z_F: constant is 
	"U12/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD6_Z_R: constant is 
	"U12/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD5_Z_F: constant is 
	"U12/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD5_Z_R: constant is 
	"U12/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD4_Z_F: constant is 
	"U12/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD4_Z_R: constant is 
	"U12/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U12/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U12/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U12/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U12/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U11/delay(TRAN_10), " &
	"U11/delay(TRAN_1Z), U11/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U11/delay(TRAN_01), " &
	"U11/delay(TRAN_0Z), U11/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U10/delay(TRAN_10), " &
	"U10/delay(TRAN_1Z), U10/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U10/delay(TRAN_01), " &
	"U10/delay(TRAN_0Z), U10/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U9/delay(TRAN_10), " &
	"U9/delay(TRAN_1Z), U9/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U9/delay(TRAN_01), " &
	"U9/delay(TRAN_0Z), U9/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD7_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD7_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD6_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD6_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD5_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD5_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 10) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD0_R, twdD0_F, twdD0_R, twdD0_R, twdD0_F, twdD0_F))
	port map( Input => D0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdD1_R, twdD1_F, twdD1_R, twdD1_R, twdD1_F, twdD1_F))
	port map( Input => D1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdD2_R, twdD2_F, twdD2_R, twdD2_R, twdD2_F, twdD2_F))
	port map( Input => D2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD3_R, twdD3_F, twdD3_R, twdD3_R, twdD3_F, twdD3_F))
	port map( Input => D3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdD4_R, twdD4_F, twdD4_R, twdD4_R, twdD4_F, twdD4_F))
	port map( Input => D4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdD5_R, twdD5_F, twdD5_R, twdD5_R, twdD5_F, twdD5_F))
	port map( Input => D5, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdD6_R, twdD6_F, twdD6_R, twdD6_R, twdD6_F, twdD6_F))
	port map( Input => D6, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdD7_R, twdD7_F, twdD7_R, twdD7_R, twdD7_F, twdD7_F))
	port map( Input => D7, Output => connect(7));

   U9 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(8));

   U10 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(9));

   U11 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(10));

   -- Netlist
   U12 : TLU
	generic map(
		N => 11,
		TruthTable => "0011010100000000" &
		              "0000000000110101" &
		              "0011010100000000" &
		              "0000000000110101" &
		              "01110111011101110000111111111111",
		TT_size => (4, 4, 4, 4, 5),
		Node_Index => (0, 1, 2, 3, 
		               0, 1, 4, 5, 
		               0, 1, 6, 7, 
		               0, 1, 8, 9, 
		               10, -1, -2, -3, -4),
		pin_names => "B A D4 D5 D6 D7 D0 D1 D2 D3 C Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD4_Z_R, tpdD4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD5_Z_R, tpdD5_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD6_Z_R, tpdD6_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD7_Z_R, tpdD7_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD0_Z_R, tpdD0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD1_Z_R, tpdD1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD2_Z_R, tpdD2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD3_Z_R, tpdD3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(9), 
		Input(1) => connect(8), 
		Input(2) => connect(4), 
		Input(3) => connect(5), 
		Input(4) => connect(6), 
		Input(5) => connect(7), 
		Input(6) => connect(0), 
		Input(7) => connect(1), 
		Input(8) => connect(2), 
		Input(9) => connect(3), 
		Input(10) => connect(10), 
		Output => Z);


end FTGS;

configuration CFG_MUX81P_FTGS of MUX81P is
   for FTGS
   end for;
end CFG_MUX81P_FTGS;


----- CELL ND2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.130 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.130 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1110",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_ND2_FTGS of ND2 is
   for FTGS
   end for;
end CFG_ND2_FTGS;


----- CELL ND2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1110",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_ND2P_FTGS of ND2P is
   for FTGS
   end for;
end CFG_ND2P_FTGS;


----- CELL ND3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.650 ns;
      tpdA_Z_F                       :	Time := 0.370 ns;
      tpdB_Z_R                       :	Time := 0.650 ns;
      tpdB_Z_F                       :	Time := 0.370 ns;
      tpdC_Z_R                       :	Time := 0.650 ns;
      tpdC_Z_F                       :	Time := 0.370 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11111110",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_ND3_FTGS of ND3 is
   for FTGS
   end for;
end CFG_ND3_FTGS;


----- CELL ND3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.640 ns;
      tpdA_Z_F                       :	Time := 0.410 ns;
      tpdB_Z_R                       :	Time := 0.640 ns;
      tpdB_Z_F                       :	Time := 0.410 ns;
      tpdC_Z_R                       :	Time := 0.640 ns;
      tpdC_Z_F                       :	Time := 0.410 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "11111110",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_ND3P_FTGS of ND3P is
   for FTGS
   end for;
end CFG_ND3P_FTGS;


----- CELL ND4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.650 ns;
      tpdA_Z_F                       :	Time := 0.450 ns;
      tpdB_Z_R                       :	Time := 0.650 ns;
      tpdB_Z_F                       :	Time := 0.450 ns;
      tpdC_Z_R                       :	Time := 0.650 ns;
      tpdC_Z_F                       :	Time := 0.450 ns;
      tpdD_Z_R                       :	Time := 0.650 ns;
      tpdD_Z_F                       :	Time := 0.450 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111111111111110",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_ND4_FTGS of ND4 is
   for FTGS
   end for;
end CFG_ND4_FTGS;


----- CELL ND4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.620 ns;
      tpdA_Z_F                       :	Time := 0.420 ns;
      tpdB_Z_R                       :	Time := 0.620 ns;
      tpdB_Z_F                       :	Time := 0.420 ns;
      tpdC_Z_R                       :	Time := 0.620 ns;
      tpdC_Z_F                       :	Time := 0.420 ns;
      tpdD_Z_R                       :	Time := 0.620 ns;
      tpdD_Z_F                       :	Time := 0.420 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1111111111111110",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_ND4P_FTGS of ND4P is
   for FTGS
   end for;
end CFG_ND4P_FTGS;


----- CELL ND5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND5 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.080 ns;
      tpdA_Z_F                       :	Time := 1.150 ns;
      tpdB_Z_R                       :	Time := 1.080 ns;
      tpdB_Z_F                       :	Time := 1.150 ns;
      tpdC_Z_R                       :	Time := 1.080 ns;
      tpdC_Z_F                       :	Time := 1.150 ns;
      tpdD_Z_R                       :	Time := 1.080 ns;
      tpdD_Z_F                       :	Time := 1.150 ns;
      tpdE_Z_R                       :	Time := 1.080 ns;
      tpdE_Z_F                       :	Time := 1.150 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND5;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND5 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "11111111111111111111111111111110",
		pin_names => "A B C D E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_ND5_FTGS of ND5 is
   for FTGS
   end for;
end CFG_ND5_FTGS;


----- CELL ND5P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND5P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.160 ns;
      tpdA_Z_F                       :	Time := 1.260 ns;
      tpdB_Z_R                       :	Time := 1.160 ns;
      tpdB_Z_F                       :	Time := 1.260 ns;
      tpdC_Z_R                       :	Time := 1.160 ns;
      tpdC_Z_F                       :	Time := 1.260 ns;
      tpdD_Z_R                       :	Time := 1.160 ns;
      tpdD_Z_F                       :	Time := 1.260 ns;
      tpdE_Z_R                       :	Time := 1.160 ns;
      tpdE_Z_F                       :	Time := 1.260 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND5P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND5P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "11111111111111111111111111111110",
		pin_names => "A B C D E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_ND5P_FTGS of ND5P is
   for FTGS
   end for;
end CFG_ND5P_FTGS;


----- CELL ND6 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND6 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.980 ns;
      tpdA_Z_F                       :	Time := 1.150 ns;
      tpdB_Z_R                       :	Time := 0.980 ns;
      tpdB_Z_F                       :	Time := 1.150 ns;
      tpdC_Z_R                       :	Time := 0.980 ns;
      tpdC_Z_F                       :	Time := 1.150 ns;
      tpdD_Z_R                       :	Time := 0.980 ns;
      tpdD_Z_F                       :	Time := 1.150 ns;
      tpdE_Z_R                       :	Time := 0.980 ns;
      tpdE_Z_F                       :	Time := 1.150 ns;
      tpdF_Z_R                       :	Time := 0.980 ns;
      tpdF_Z_F                       :	Time := 1.150 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND6;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND6 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "11111111111111111111111111111110" &
		              "1101",
		TT_size => (5, 2),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, -1),
		pin_names => "B C D E F A Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(1), 
		Input(1) => connect(2), 
		Input(2) => connect(3), 
		Input(3) => connect(4), 
		Input(4) => connect(5), 
		Input(5) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_ND6_FTGS of ND6 is
   for FTGS
   end for;
end CFG_ND6_FTGS;


----- CELL ND6P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND6P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.060 ns;
      tpdA_Z_F                       :	Time := 1.260 ns;
      tpdB_Z_R                       :	Time := 1.060 ns;
      tpdB_Z_F                       :	Time := 1.260 ns;
      tpdC_Z_R                       :	Time := 1.060 ns;
      tpdC_Z_F                       :	Time := 1.260 ns;
      tpdD_Z_R                       :	Time := 1.060 ns;
      tpdD_Z_F                       :	Time := 1.260 ns;
      tpdE_Z_R                       :	Time := 1.060 ns;
      tpdE_Z_F                       :	Time := 1.260 ns;
      tpdF_Z_R                       :	Time := 1.060 ns;
      tpdF_Z_F                       :	Time := 1.260 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND6P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND6P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "11111111111111111111111111111110" &
		              "1101",
		TT_size => (5, 2),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, -1),
		pin_names => "B C D E F A Z",
		delay_param =>
			((tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(1), 
		Input(1) => connect(2), 
		Input(2) => connect(3), 
		Input(3) => connect(4), 
		Input(4) => connect(5), 
		Input(5) => connect(0), 
		Output => Z);


end FTGS;

configuration CFG_ND6P_FTGS of ND6P is
   for FTGS
   end for;
end CFG_ND6P_FTGS;


----- CELL ND8 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND8 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.080 ns;
      tpdA_Z_F                       :	Time := 1.450 ns;
      tpdB_Z_R                       :	Time := 1.080 ns;
      tpdB_Z_F                       :	Time := 1.450 ns;
      tpdC_Z_R                       :	Time := 1.080 ns;
      tpdC_Z_F                       :	Time := 1.450 ns;
      tpdD_Z_R                       :	Time := 1.080 ns;
      tpdD_Z_F                       :	Time := 1.450 ns;
      tpdE_Z_R                       :	Time := 1.080 ns;
      tpdE_Z_F                       :	Time := 1.450 ns;
      tpdF_Z_R                       :	Time := 1.080 ns;
      tpdF_Z_F                       :	Time := 1.450 ns;
      tpdG_Z_R                       :	Time := 1.080 ns;
      tpdG_Z_F                       :	Time := 1.450 ns;
      tpdH_Z_R                       :	Time := 1.080 ns;
      tpdH_Z_F                       :	Time := 1.450 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND8;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND8 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "11111111111111111111111111111110" &
		              "1111111111111101",
		TT_size => (5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, -1),
		pin_names => "D E F G H A B C Z",
		delay_param =>
			((tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(3), 
		Input(1) => connect(4), 
		Input(2) => connect(5), 
		Input(3) => connect(6), 
		Input(4) => connect(7), 
		Input(5) => connect(0), 
		Input(6) => connect(1), 
		Input(7) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_ND8_FTGS of ND8 is
   for FTGS
   end for;
end CFG_ND8_FTGS;


----- CELL ND8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity ND8P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.160 ns;
      tpdA_Z_F                       :	Time := 1.560 ns;
      tpdB_Z_R                       :	Time := 1.160 ns;
      tpdB_Z_F                       :	Time := 1.560 ns;
      tpdC_Z_R                       :	Time := 1.160 ns;
      tpdC_Z_F                       :	Time := 1.560 ns;
      tpdD_Z_R                       :	Time := 1.160 ns;
      tpdD_Z_F                       :	Time := 1.560 ns;
      tpdE_Z_R                       :	Time := 1.160 ns;
      tpdE_Z_F                       :	Time := 1.560 ns;
      tpdF_Z_R                       :	Time := 1.160 ns;
      tpdF_Z_F                       :	Time := 1.560 ns;
      tpdG_Z_R                       :	Time := 1.160 ns;
      tpdG_Z_F                       :	Time := 1.560 ns;
      tpdH_Z_R                       :	Time := 1.160 ns;
      tpdH_Z_F                       :	Time := 1.560 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end ND8P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of ND8P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "11111111111111111111111111111110" &
		              "1111111111111101",
		TT_size => (5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, -1),
		pin_names => "D E F G H A B C Z",
		delay_param =>
			((tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(3), 
		Input(1) => connect(4), 
		Input(2) => connect(5), 
		Input(3) => connect(6), 
		Input(4) => connect(7), 
		Input(5) => connect(0), 
		Input(6) => connect(1), 
		Input(7) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_ND8P_FTGS of ND8P is
   for FTGS
   end for;
end CFG_ND8P_FTGS;


----- CELL NR2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.550 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      tpdB_Z_R                       :	Time := 0.550 ns;
      tpdB_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1000",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_NR2_FTGS of NR2 is
   for FTGS
   end for;
end CFG_NR2_FTGS;


----- CELL NR2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.560 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      tpdB_Z_R                       :	Time := 0.560 ns;
      tpdB_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "1000",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_NR2P_FTGS of NR2P is
   for FTGS
   end for;
end CFG_NR2P_FTGS;


----- CELL NR3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.810 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      tpdB_Z_R                       :	Time := 0.810 ns;
      tpdB_Z_F                       :	Time := 0.250 ns;
      tpdC_Z_R                       :	Time := 0.810 ns;
      tpdC_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10000000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_NR3_FTGS of NR3 is
   for FTGS
   end for;
end CFG_NR3_FTGS;


----- CELL NR3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.820 ns;
      tpdA_Z_F                       :	Time := 0.270 ns;
      tpdB_Z_R                       :	Time := 0.820 ns;
      tpdB_Z_F                       :	Time := 0.270 ns;
      tpdC_Z_R                       :	Time := 0.820 ns;
      tpdC_Z_F                       :	Time := 0.270 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "10000000",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_NR3P_FTGS of NR3P is
   for FTGS
   end for;
end CFG_NR3P_FTGS;


----- CELL NR4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.070 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      tpdB_Z_R                       :	Time := 1.070 ns;
      tpdB_Z_F                       :	Time := 0.250 ns;
      tpdC_Z_R                       :	Time := 1.070 ns;
      tpdC_Z_F                       :	Time := 0.250 ns;
      tpdD_Z_R                       :	Time := 1.070 ns;
      tpdD_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1000000000000000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_NR4_FTGS of NR4 is
   for FTGS
   end for;
end CFG_NR4_FTGS;


----- CELL NR4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.120 ns;
      tpdA_Z_F                       :	Time := 0.270 ns;
      tpdB_Z_R                       :	Time := 1.120 ns;
      tpdB_Z_F                       :	Time := 0.270 ns;
      tpdC_Z_R                       :	Time := 1.120 ns;
      tpdC_Z_F                       :	Time := 0.270 ns;
      tpdD_Z_R                       :	Time := 1.120 ns;
      tpdD_Z_F                       :	Time := 0.270 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "1000000000000000",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_NR4P_FTGS of NR4P is
   for FTGS
   end for;
end CFG_NR4P_FTGS;


----- CELL NR5 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR5 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.490 ns;
      tpdA_Z_F                       :	Time := 0.870 ns;
      tpdB_Z_R                       :	Time := 1.490 ns;
      tpdB_Z_F                       :	Time := 0.870 ns;
      tpdC_Z_R                       :	Time := 1.490 ns;
      tpdC_Z_F                       :	Time := 0.870 ns;
      tpdD_Z_R                       :	Time := 1.490 ns;
      tpdD_Z_F                       :	Time := 0.870 ns;
      tpdE_Z_R                       :	Time := 1.490 ns;
      tpdE_Z_F                       :	Time := 0.870 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR5;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR5 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "10000000000000000000000000000000",
		pin_names => "A B C D E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_NR5_FTGS of NR5 is
   for FTGS
   end for;
end CFG_NR5_FTGS;


----- CELL NR5P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR5P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.640 ns;
      tpdA_Z_F                       :	Time := 0.860 ns;
      tpdB_Z_R                       :	Time := 1.640 ns;
      tpdB_Z_F                       :	Time := 0.860 ns;
      tpdC_Z_R                       :	Time := 1.640 ns;
      tpdC_Z_F                       :	Time := 0.860 ns;
      tpdD_Z_R                       :	Time := 1.640 ns;
      tpdD_Z_F                       :	Time := 0.860 ns;
      tpdE_Z_R                       :	Time := 1.640 ns;
      tpdE_Z_F                       :	Time := 0.860 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR5P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR5P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U6/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U6/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U6/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U6/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U6/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U6/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U6/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U6/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U6/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U6/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 4) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   -- Netlist
   U6 : TLU
	generic map(
		N => 5,
		TruthTable => "10000000000000000000000000000000",
		pin_names => "A B C D E Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Output => Z);


end FTGS;

configuration CFG_NR5P_FTGS of NR5P is
   for FTGS
   end for;
end CFG_NR5P_FTGS;


----- CELL NR6 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR6 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.590 ns;
      tpdA_Z_F                       :	Time := 0.870 ns;
      tpdB_Z_R                       :	Time := 1.590 ns;
      tpdB_Z_F                       :	Time := 0.870 ns;
      tpdC_Z_R                       :	Time := 1.590 ns;
      tpdC_Z_F                       :	Time := 0.870 ns;
      tpdD_Z_R                       :	Time := 1.590 ns;
      tpdD_Z_F                       :	Time := 0.870 ns;
      tpdE_Z_R                       :	Time := 1.590 ns;
      tpdE_Z_F                       :	Time := 0.870 ns;
      tpdF_Z_R                       :	Time := 1.590 ns;
      tpdF_Z_F                       :	Time := 0.870 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR6;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR6 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "01111111111111111111111111111111" &
		              "1000",
		TT_size => (5, 2),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, -1),
		pin_names => "A B C D E F Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Input(5) => connect(5), 
		Output => Z);


end FTGS;

configuration CFG_NR6_FTGS of NR6 is
   for FTGS
   end for;
end CFG_NR6_FTGS;


----- CELL NR6P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR6P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.740 ns;
      tpdA_Z_F                       :	Time := 0.940 ns;
      tpdB_Z_R                       :	Time := 1.740 ns;
      tpdB_Z_F                       :	Time := 0.940 ns;
      tpdC_Z_R                       :	Time := 1.740 ns;
      tpdC_Z_F                       :	Time := 0.940 ns;
      tpdD_Z_R                       :	Time := 1.740 ns;
      tpdD_Z_F                       :	Time := 0.940 ns;
      tpdE_Z_R                       :	Time := 1.740 ns;
      tpdE_Z_F                       :	Time := 0.940 ns;
      tpdF_Z_R                       :	Time := 1.740 ns;
      tpdF_Z_F                       :	Time := 0.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR6P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR6P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U7/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U7/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U7/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U7/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U7/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U7/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 5) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   -- Netlist
   U7 : TLU
	generic map(
		N => 6,
		TruthTable => "01111111111111111111111111111111" &
		              "1000",
		TT_size => (5, 2),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, -1),
		pin_names => "A B C D E F Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Input(5) => connect(5), 
		Output => Z);


end FTGS;

configuration CFG_NR6P_FTGS of NR6P is
   for FTGS
   end for;
end CFG_NR6P_FTGS;


----- CELL NR8 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR8 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 1.890 ns;
      tpdA_Z_F                       :	Time := 0.870 ns;
      tpdB_Z_R                       :	Time := 1.890 ns;
      tpdB_Z_F                       :	Time := 0.870 ns;
      tpdC_Z_R                       :	Time := 1.890 ns;
      tpdC_Z_F                       :	Time := 0.870 ns;
      tpdD_Z_R                       :	Time := 1.890 ns;
      tpdD_Z_F                       :	Time := 0.870 ns;
      tpdE_Z_R                       :	Time := 1.890 ns;
      tpdE_Z_F                       :	Time := 0.870 ns;
      tpdF_Z_R                       :	Time := 1.890 ns;
      tpdF_Z_F                       :	Time := 0.870 ns;
      tpdG_Z_R                       :	Time := 1.890 ns;
      tpdG_Z_F                       :	Time := 0.870 ns;
      tpdH_Z_R                       :	Time := 1.890 ns;
      tpdH_Z_F                       :	Time := 0.870 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR8;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR8 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "01111111111111111111111111111111" &
		              "1000000000000000",
		TT_size => (5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, -1),
		pin_names => "A B C D E F G H Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Input(5) => connect(5), 
		Input(6) => connect(6), 
		Input(7) => connect(7), 
		Output => Z);


end FTGS;

configuration CFG_NR8_FTGS of NR8 is
   for FTGS
   end for;
end CFG_NR8_FTGS;


----- CELL NR8P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR8P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 2.040 ns;
      tpdA_Z_F                       :	Time := 0.840 ns;
      tpdB_Z_R                       :	Time := 2.040 ns;
      tpdB_Z_F                       :	Time := 0.840 ns;
      tpdC_Z_R                       :	Time := 2.040 ns;
      tpdC_Z_F                       :	Time := 0.840 ns;
      tpdD_Z_R                       :	Time := 2.040 ns;
      tpdD_Z_F                       :	Time := 0.840 ns;
      tpdE_Z_R                       :	Time := 2.040 ns;
      tpdE_Z_F                       :	Time := 0.840 ns;
      tpdF_Z_R                       :	Time := 2.040 ns;
      tpdF_Z_F                       :	Time := 0.840 ns;
      tpdG_Z_R                       :	Time := 2.040 ns;
      tpdG_Z_F                       :	Time := 0.840 ns;
      tpdH_Z_R                       :	Time := 2.040 ns;
      tpdH_Z_F                       :	Time := 0.840 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdE_R                         :	Time := 0.000 ns;
      twdE_F                         :	Time := 0.000 ns;
      twdF_R                         :	Time := 0.000 ns;
      twdF_F                         :	Time := 0.000 ns;
      twdG_R                         :	Time := 0.000 ns;
      twdG_F                         :	Time := 0.000 ns;
      twdH_R                         :	Time := 0.000 ns;
      twdH_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      H                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR8P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR8P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdH_Z_F: constant is 
	"U9/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdH_Z_R: constant is 
	"U9/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdG_Z_F: constant is 
	"U9/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdG_Z_R: constant is 
	"U9/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdF_Z_F: constant is 
	"U9/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdF_Z_R: constant is 
	"U9/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdE_Z_F: constant is 
	"U9/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdE_Z_R: constant is 
	"U9/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U9/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U9/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U9/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U9/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U9/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U9/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U9/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U9/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdH_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdH_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdG_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdG_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdF_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdF_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdE_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdE_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 7) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdE_R, twdE_F, twdE_R, twdE_R, twdE_F, twdE_F))
	port map( Input => E, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdF_R, twdF_F, twdF_R, twdF_R, twdF_F, twdF_F))
	port map( Input => F, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdG_R, twdG_F, twdG_R, twdG_R, twdG_F, twdG_F))
	port map( Input => G, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdH_R, twdH_F, twdH_R, twdH_R, twdH_F, twdH_F))
	port map( Input => H, Output => connect(7));

   -- Netlist
   U9 : TLU
	generic map(
		N => 8,
		TruthTable => "01111111111111111111111111111111" &
		              "1000000000000000",
		TT_size => (5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, -1),
		pin_names => "A B C D E F G H Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdE_Z_R, tpdE_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdF_Z_R, tpdF_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdG_Z_R, tpdG_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdH_Z_R, tpdH_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Input(4) => connect(4), 
		Input(5) => connect(5), 
		Input(6) => connect(6), 
		Input(7) => connect(7), 
		Output => Z);


end FTGS;

configuration CFG_NR8P_FTGS of NR8P is
   for FTGS
   end for;
end CFG_NR8P_FTGS;


----- CELL NR16 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR16 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdI0_Z_R                      :	Time := 2.270 ns;
      tpdI0_Z_F                      :	Time := 0.950 ns;
      tpdI1_Z_R                      :	Time := 2.270 ns;
      tpdI1_Z_F                      :	Time := 0.950 ns;
      tpdI2_Z_R                      :	Time := 2.270 ns;
      tpdI2_Z_F                      :	Time := 0.950 ns;
      tpdI3_Z_R                      :	Time := 2.270 ns;
      tpdI3_Z_F                      :	Time := 0.950 ns;
      tpdI4_Z_R                      :	Time := 2.270 ns;
      tpdI4_Z_F                      :	Time := 0.950 ns;
      tpdI5_Z_R                      :	Time := 2.270 ns;
      tpdI5_Z_F                      :	Time := 0.950 ns;
      tpdI6_Z_R                      :	Time := 2.270 ns;
      tpdI6_Z_F                      :	Time := 0.950 ns;
      tpdI7_Z_R                      :	Time := 2.270 ns;
      tpdI7_Z_F                      :	Time := 0.950 ns;
      tpdI8_Z_R                      :	Time := 2.270 ns;
      tpdI8_Z_F                      :	Time := 0.950 ns;
      tpdI9_Z_R                      :	Time := 2.270 ns;
      tpdI9_Z_F                      :	Time := 0.950 ns;
      tpdI10_Z_R                     :	Time := 2.270 ns;
      tpdI10_Z_F                     :	Time := 0.950 ns;
      tpdI11_Z_R                     :	Time := 2.270 ns;
      tpdI11_Z_F                     :	Time := 0.950 ns;
      tpdI12_Z_R                     :	Time := 2.270 ns;
      tpdI12_Z_F                     :	Time := 0.950 ns;
      tpdI13_Z_R                     :	Time := 2.270 ns;
      tpdI13_Z_F                     :	Time := 0.950 ns;
      tpdI14_Z_R                     :	Time := 2.270 ns;
      tpdI14_Z_F                     :	Time := 0.950 ns;
      tpdI15_Z_R                     :	Time := 2.270 ns;
      tpdI15_Z_F                     :	Time := 0.950 ns;
      twdI0_R                        :	Time := 0.000 ns;
      twdI0_F                        :	Time := 0.000 ns;
      twdI1_R                        :	Time := 0.000 ns;
      twdI1_F                        :	Time := 0.000 ns;
      twdI2_R                        :	Time := 0.000 ns;
      twdI2_F                        :	Time := 0.000 ns;
      twdI3_R                        :	Time := 0.000 ns;
      twdI3_F                        :	Time := 0.000 ns;
      twdI4_R                        :	Time := 0.000 ns;
      twdI4_F                        :	Time := 0.000 ns;
      twdI5_R                        :	Time := 0.000 ns;
      twdI5_F                        :	Time := 0.000 ns;
      twdI6_R                        :	Time := 0.000 ns;
      twdI6_F                        :	Time := 0.000 ns;
      twdI7_R                        :	Time := 0.000 ns;
      twdI7_F                        :	Time := 0.000 ns;
      twdI8_R                        :	Time := 0.000 ns;
      twdI8_F                        :	Time := 0.000 ns;
      twdI9_R                        :	Time := 0.000 ns;
      twdI9_F                        :	Time := 0.000 ns;
      twdI10_R                       :	Time := 0.000 ns;
      twdI10_F                       :	Time := 0.000 ns;
      twdI11_R                       :	Time := 0.000 ns;
      twdI11_F                       :	Time := 0.000 ns;
      twdI12_R                       :	Time := 0.000 ns;
      twdI12_F                       :	Time := 0.000 ns;
      twdI13_R                       :	Time := 0.000 ns;
      twdI13_F                       :	Time := 0.000 ns;
      twdI14_R                       :	Time := 0.000 ns;
      twdI14_F                       :	Time := 0.000 ns;
      twdI15_R                       :	Time := 0.000 ns;
      twdI15_F                       :	Time := 0.000 ns);

   port(
      I0                             :	in    STD_LOGIC;
      I1                             :	in    STD_LOGIC;
      I2                             :	in    STD_LOGIC;
      I3                             :	in    STD_LOGIC;
      I4                             :	in    STD_LOGIC;
      I5                             :	in    STD_LOGIC;
      I6                             :	in    STD_LOGIC;
      I7                             :	in    STD_LOGIC;
      I8                             :	in    STD_LOGIC;
      I9                             :	in    STD_LOGIC;
      I10                            :	in    STD_LOGIC;
      I11                            :	in    STD_LOGIC;
      I12                            :	in    STD_LOGIC;
      I13                            :	in    STD_LOGIC;
      I14                            :	in    STD_LOGIC;
      I15                            :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR16;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR16 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdI9_Z_F: constant is 
	"U17/delay_param(15)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI9_Z_R: constant is 
	"U17/delay_param(15)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI8_Z_F: constant is 
	"U17/delay_param(14)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI8_Z_R: constant is 
	"U17/delay_param(14)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI7_Z_F: constant is 
	"U17/delay_param(13)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI7_Z_R: constant is 
	"U17/delay_param(13)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI6_Z_F: constant is 
	"U17/delay_param(12)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI6_Z_R: constant is 
	"U17/delay_param(12)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI5_Z_F: constant is 
	"U17/delay_param(11)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI5_Z_R: constant is 
	"U17/delay_param(11)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI4_Z_F: constant is 
	"U17/delay_param(10)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI4_Z_R: constant is 
	"U17/delay_param(10)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI3_Z_F: constant is 
	"U17/delay_param(9)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI3_Z_R: constant is 
	"U17/delay_param(9)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI2_Z_F: constant is 
	"U17/delay_param(8)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI2_Z_R: constant is 
	"U17/delay_param(8)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI15_Z_F: constant is 
	"U17/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI15_Z_R: constant is 
	"U17/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI14_Z_F: constant is 
	"U17/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI14_Z_R: constant is 
	"U17/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI13_Z_F: constant is 
	"U17/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI13_Z_R: constant is 
	"U17/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI12_Z_F: constant is 
	"U17/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI12_Z_R: constant is 
	"U17/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI11_Z_F: constant is 
	"U17/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI11_Z_R: constant is 
	"U17/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI10_Z_F: constant is 
	"U17/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI10_Z_R: constant is 
	"U17/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI1_Z_F: constant is 
	"U17/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI1_Z_R: constant is 
	"U17/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI0_Z_F: constant is 
	"U17/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI0_Z_R: constant is 
	"U17/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdI15_F: constant is 
	"U16/delay(TRAN_10), " &
	"U16/delay(TRAN_1Z), U16/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI15_R: constant is 
	"U16/delay(TRAN_01), " &
	"U16/delay(TRAN_0Z), U16/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI14_F: constant is 
	"U15/delay(TRAN_10), " &
	"U15/delay(TRAN_1Z), U15/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI14_R: constant is 
	"U15/delay(TRAN_01), " &
	"U15/delay(TRAN_0Z), U15/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI13_F: constant is 
	"U14/delay(TRAN_10), " &
	"U14/delay(TRAN_1Z), U14/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI13_R: constant is 
	"U14/delay(TRAN_01), " &
	"U14/delay(TRAN_0Z), U14/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI12_F: constant is 
	"U13/delay(TRAN_10), " &
	"U13/delay(TRAN_1Z), U13/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI12_R: constant is 
	"U13/delay(TRAN_01), " &
	"U13/delay(TRAN_0Z), U13/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI11_F: constant is 
	"U12/delay(TRAN_10), " &
	"U12/delay(TRAN_1Z), U12/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI11_R: constant is 
	"U12/delay(TRAN_01), " &
	"U12/delay(TRAN_0Z), U12/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI10_F: constant is 
	"U11/delay(TRAN_10), " &
	"U11/delay(TRAN_1Z), U11/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI10_R: constant is 
	"U11/delay(TRAN_01), " &
	"U11/delay(TRAN_0Z), U11/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI9_F: constant is 
	"U10/delay(TRAN_10), " &
	"U10/delay(TRAN_1Z), U10/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI9_R: constant is 
	"U10/delay(TRAN_01), " &
	"U10/delay(TRAN_0Z), U10/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI8_F: constant is 
	"U9/delay(TRAN_10), " &
	"U9/delay(TRAN_1Z), U9/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI8_R: constant is 
	"U9/delay(TRAN_01), " &
	"U9/delay(TRAN_0Z), U9/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI7_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI7_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI6_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI6_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI5_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI5_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 15) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdI0_R, twdI0_F, twdI0_R, twdI0_R, twdI0_F, twdI0_F))
	port map( Input => I0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdI1_R, twdI1_F, twdI1_R, twdI1_R, twdI1_F, twdI1_F))
	port map( Input => I1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdI2_R, twdI2_F, twdI2_R, twdI2_R, twdI2_F, twdI2_F))
	port map( Input => I2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdI3_R, twdI3_F, twdI3_R, twdI3_R, twdI3_F, twdI3_F))
	port map( Input => I3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdI4_R, twdI4_F, twdI4_R, twdI4_R, twdI4_F, twdI4_F))
	port map( Input => I4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdI5_R, twdI5_F, twdI5_R, twdI5_R, twdI5_F, twdI5_F))
	port map( Input => I5, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdI6_R, twdI6_F, twdI6_R, twdI6_R, twdI6_F, twdI6_F))
	port map( Input => I6, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdI7_R, twdI7_F, twdI7_R, twdI7_R, twdI7_F, twdI7_F))
	port map( Input => I7, Output => connect(7));

   U9 : WIREBUF
	generic map(delay => (twdI8_R, twdI8_F, twdI8_R, twdI8_R, twdI8_F, twdI8_F))
	port map( Input => I8, Output => connect(8));

   U10 : WIREBUF
	generic map(delay => (twdI9_R, twdI9_F, twdI9_R, twdI9_R, twdI9_F, twdI9_F))
	port map( Input => I9, Output => connect(9));

   U11 : WIREBUF
	generic map(delay => (twdI10_R, twdI10_F, twdI10_R, twdI10_R, twdI10_F, twdI10_F))
	port map( Input => I10, Output => connect(10));

   U12 : WIREBUF
	generic map(delay => (twdI11_R, twdI11_F, twdI11_R, twdI11_R, twdI11_F, twdI11_F))
	port map( Input => I11, Output => connect(11));

   U13 : WIREBUF
	generic map(delay => (twdI12_R, twdI12_F, twdI12_R, twdI12_R, twdI12_F, twdI12_F))
	port map( Input => I12, Output => connect(12));

   U14 : WIREBUF
	generic map(delay => (twdI13_R, twdI13_F, twdI13_R, twdI13_R, twdI13_F, twdI13_F))
	port map( Input => I13, Output => connect(13));

   U15 : WIREBUF
	generic map(delay => (twdI14_R, twdI14_F, twdI14_R, twdI14_R, twdI14_F, twdI14_F))
	port map( Input => I14, Output => connect(14));

   U16 : WIREBUF
	generic map(delay => (twdI15_R, twdI15_F, twdI15_R, twdI15_R, twdI15_F, twdI15_F))
	port map( Input => I15, Output => connect(15));

   -- Netlist
   U17 : TLU
	generic map(
		N => 16,
		TruthTable => "01111111111111111111111111111111" &
		              "01111111111111111111111111111111" &
		              "01111111111111111111111111111111" &
		              "1000000000000000",
		TT_size => (5, 5, 5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, 8, 9, 
		               10, 11, 12, 13, 14, 
		               15, -1, -2, -3),
		pin_names => "I0 I1 I10 I11 I12 I13 I14 I15 I2 I3 I4 I5 I6 " &
		             "I7 I8 I9 Z",
		delay_param =>
			((tpdI0_Z_R, tpdI0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI1_Z_R, tpdI1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI10_Z_R, tpdI10_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI11_Z_R, tpdI11_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI12_Z_R, tpdI12_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI13_Z_R, tpdI13_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI14_Z_R, tpdI14_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI15_Z_R, tpdI15_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI2_Z_R, tpdI2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI3_Z_R, tpdI3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI4_Z_R, tpdI4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI5_Z_R, tpdI5_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI6_Z_R, tpdI6_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI7_Z_R, tpdI7_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI8_Z_R, tpdI8_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI9_Z_R, tpdI9_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXXXXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(10), 
		Input(3) => connect(11), 
		Input(4) => connect(12), 
		Input(5) => connect(13), 
		Input(6) => connect(14), 
		Input(7) => connect(15), 
		Input(8) => connect(2), 
		Input(9) => connect(3), 
		Input(10) => connect(4), 
		Input(11) => connect(5), 
		Input(12) => connect(6), 
		Input(13) => connect(7), 
		Input(14) => connect(8), 
		Input(15) => connect(9), 
		Output => Z);


end FTGS;

configuration CFG_NR16_FTGS of NR16 is
   for FTGS
   end for;
end CFG_NR16_FTGS;


----- CELL NR16P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity NR16P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdI0_Z_R                      :	Time := 2.450 ns;
      tpdI0_Z_F                      :	Time := 1.040 ns;
      tpdI1_Z_R                      :	Time := 2.450 ns;
      tpdI1_Z_F                      :	Time := 1.040 ns;
      tpdI2_Z_R                      :	Time := 2.450 ns;
      tpdI2_Z_F                      :	Time := 1.040 ns;
      tpdI3_Z_R                      :	Time := 2.450 ns;
      tpdI3_Z_F                      :	Time := 1.040 ns;
      tpdI4_Z_R                      :	Time := 2.450 ns;
      tpdI4_Z_F                      :	Time := 1.040 ns;
      tpdI5_Z_R                      :	Time := 2.450 ns;
      tpdI5_Z_F                      :	Time := 1.040 ns;
      tpdI6_Z_R                      :	Time := 2.450 ns;
      tpdI6_Z_F                      :	Time := 1.040 ns;
      tpdI7_Z_R                      :	Time := 2.450 ns;
      tpdI7_Z_F                      :	Time := 1.040 ns;
      tpdI8_Z_R                      :	Time := 2.450 ns;
      tpdI8_Z_F                      :	Time := 1.040 ns;
      tpdI9_Z_R                      :	Time := 2.450 ns;
      tpdI9_Z_F                      :	Time := 1.040 ns;
      tpdI10_Z_R                     :	Time := 2.450 ns;
      tpdI10_Z_F                     :	Time := 1.040 ns;
      tpdI11_Z_R                     :	Time := 2.450 ns;
      tpdI11_Z_F                     :	Time := 1.040 ns;
      tpdI12_Z_R                     :	Time := 2.450 ns;
      tpdI12_Z_F                     :	Time := 1.040 ns;
      tpdI13_Z_R                     :	Time := 2.450 ns;
      tpdI13_Z_F                     :	Time := 1.040 ns;
      tpdI14_Z_R                     :	Time := 2.450 ns;
      tpdI14_Z_F                     :	Time := 1.040 ns;
      tpdI15_Z_R                     :	Time := 2.450 ns;
      tpdI15_Z_F                     :	Time := 1.040 ns;
      twdI0_R                        :	Time := 0.000 ns;
      twdI0_F                        :	Time := 0.000 ns;
      twdI1_R                        :	Time := 0.000 ns;
      twdI1_F                        :	Time := 0.000 ns;
      twdI2_R                        :	Time := 0.000 ns;
      twdI2_F                        :	Time := 0.000 ns;
      twdI3_R                        :	Time := 0.000 ns;
      twdI3_F                        :	Time := 0.000 ns;
      twdI4_R                        :	Time := 0.000 ns;
      twdI4_F                        :	Time := 0.000 ns;
      twdI5_R                        :	Time := 0.000 ns;
      twdI5_F                        :	Time := 0.000 ns;
      twdI6_R                        :	Time := 0.000 ns;
      twdI6_F                        :	Time := 0.000 ns;
      twdI7_R                        :	Time := 0.000 ns;
      twdI7_F                        :	Time := 0.000 ns;
      twdI8_R                        :	Time := 0.000 ns;
      twdI8_F                        :	Time := 0.000 ns;
      twdI9_R                        :	Time := 0.000 ns;
      twdI9_F                        :	Time := 0.000 ns;
      twdI10_R                       :	Time := 0.000 ns;
      twdI10_F                       :	Time := 0.000 ns;
      twdI11_R                       :	Time := 0.000 ns;
      twdI11_F                       :	Time := 0.000 ns;
      twdI12_R                       :	Time := 0.000 ns;
      twdI12_F                       :	Time := 0.000 ns;
      twdI13_R                       :	Time := 0.000 ns;
      twdI13_F                       :	Time := 0.000 ns;
      twdI14_R                       :	Time := 0.000 ns;
      twdI14_F                       :	Time := 0.000 ns;
      twdI15_R                       :	Time := 0.000 ns;
      twdI15_F                       :	Time := 0.000 ns);

   port(
      I0                             :	in    STD_LOGIC;
      I1                             :	in    STD_LOGIC;
      I2                             :	in    STD_LOGIC;
      I3                             :	in    STD_LOGIC;
      I4                             :	in    STD_LOGIC;
      I5                             :	in    STD_LOGIC;
      I6                             :	in    STD_LOGIC;
      I7                             :	in    STD_LOGIC;
      I8                             :	in    STD_LOGIC;
      I9                             :	in    STD_LOGIC;
      I10                            :	in    STD_LOGIC;
      I11                            :	in    STD_LOGIC;
      I12                            :	in    STD_LOGIC;
      I13                            :	in    STD_LOGIC;
      I14                            :	in    STD_LOGIC;
      I15                            :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end NR16P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of NR16P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdI9_Z_F: constant is 
	"U17/delay_param(15)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI9_Z_R: constant is 
	"U17/delay_param(15)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI8_Z_F: constant is 
	"U17/delay_param(14)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI8_Z_R: constant is 
	"U17/delay_param(14)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI7_Z_F: constant is 
	"U17/delay_param(13)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI7_Z_R: constant is 
	"U17/delay_param(13)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI6_Z_F: constant is 
	"U17/delay_param(12)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI6_Z_R: constant is 
	"U17/delay_param(12)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI5_Z_F: constant is 
	"U17/delay_param(11)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI5_Z_R: constant is 
	"U17/delay_param(11)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI4_Z_F: constant is 
	"U17/delay_param(10)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI4_Z_R: constant is 
	"U17/delay_param(10)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI3_Z_F: constant is 
	"U17/delay_param(9)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI3_Z_R: constant is 
	"U17/delay_param(9)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI2_Z_F: constant is 
	"U17/delay_param(8)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI2_Z_R: constant is 
	"U17/delay_param(8)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI15_Z_F: constant is 
	"U17/delay_param(7)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI15_Z_R: constant is 
	"U17/delay_param(7)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI14_Z_F: constant is 
	"U17/delay_param(6)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI14_Z_R: constant is 
	"U17/delay_param(6)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI13_Z_F: constant is 
	"U17/delay_param(5)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI13_Z_R: constant is 
	"U17/delay_param(5)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI12_Z_F: constant is 
	"U17/delay_param(4)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI12_Z_R: constant is 
	"U17/delay_param(4)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI11_Z_F: constant is 
	"U17/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI11_Z_R: constant is 
	"U17/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI10_Z_F: constant is 
	"U17/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI10_Z_R: constant is 
	"U17/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI1_Z_F: constant is 
	"U17/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI1_Z_R: constant is 
	"U17/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdI0_Z_F: constant is 
	"U17/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdI0_Z_R: constant is 
	"U17/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdI15_F: constant is 
	"U16/delay(TRAN_10), " &
	"U16/delay(TRAN_1Z), U16/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI15_R: constant is 
	"U16/delay(TRAN_01), " &
	"U16/delay(TRAN_0Z), U16/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI14_F: constant is 
	"U15/delay(TRAN_10), " &
	"U15/delay(TRAN_1Z), U15/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI14_R: constant is 
	"U15/delay(TRAN_01), " &
	"U15/delay(TRAN_0Z), U15/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI13_F: constant is 
	"U14/delay(TRAN_10), " &
	"U14/delay(TRAN_1Z), U14/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI13_R: constant is 
	"U14/delay(TRAN_01), " &
	"U14/delay(TRAN_0Z), U14/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI12_F: constant is 
	"U13/delay(TRAN_10), " &
	"U13/delay(TRAN_1Z), U13/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI12_R: constant is 
	"U13/delay(TRAN_01), " &
	"U13/delay(TRAN_0Z), U13/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI11_F: constant is 
	"U12/delay(TRAN_10), " &
	"U12/delay(TRAN_1Z), U12/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI11_R: constant is 
	"U12/delay(TRAN_01), " &
	"U12/delay(TRAN_0Z), U12/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI10_F: constant is 
	"U11/delay(TRAN_10), " &
	"U11/delay(TRAN_1Z), U11/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI10_R: constant is 
	"U11/delay(TRAN_01), " &
	"U11/delay(TRAN_0Z), U11/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI9_F: constant is 
	"U10/delay(TRAN_10), " &
	"U10/delay(TRAN_1Z), U10/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI9_R: constant is 
	"U10/delay(TRAN_01), " &
	"U10/delay(TRAN_0Z), U10/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI8_F: constant is 
	"U9/delay(TRAN_10), " &
	"U9/delay(TRAN_1Z), U9/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI8_R: constant is 
	"U9/delay(TRAN_01), " &
	"U9/delay(TRAN_0Z), U9/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI7_F: constant is 
	"U8/delay(TRAN_10), " &
	"U8/delay(TRAN_1Z), U8/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI7_R: constant is 
	"U8/delay(TRAN_01), " &
	"U8/delay(TRAN_0Z), U8/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI6_F: constant is 
	"U7/delay(TRAN_10), " &
	"U7/delay(TRAN_1Z), U7/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI6_R: constant is 
	"U7/delay(TRAN_01), " &
	"U7/delay(TRAN_0Z), U7/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI5_F: constant is 
	"U6/delay(TRAN_10), " &
	"U6/delay(TRAN_1Z), U6/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI5_R: constant is 
	"U6/delay(TRAN_01), " &
	"U6/delay(TRAN_0Z), U6/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI4_F: constant is 
	"U5/delay(TRAN_10), " &
	"U5/delay(TRAN_1Z), U5/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI4_R: constant is 
	"U5/delay(TRAN_01), " &
	"U5/delay(TRAN_0Z), U5/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI3_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI3_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI2_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI2_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI1_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI1_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdI0_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdI0_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 15) := (others => 'U'); 

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdI0_R, twdI0_F, twdI0_R, twdI0_R, twdI0_F, twdI0_F))
	port map( Input => I0, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdI1_R, twdI1_F, twdI1_R, twdI1_R, twdI1_F, twdI1_F))
	port map( Input => I1, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdI2_R, twdI2_F, twdI2_R, twdI2_R, twdI2_F, twdI2_F))
	port map( Input => I2, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdI3_R, twdI3_F, twdI3_R, twdI3_R, twdI3_F, twdI3_F))
	port map( Input => I3, Output => connect(3));

   U5 : WIREBUF
	generic map(delay => (twdI4_R, twdI4_F, twdI4_R, twdI4_R, twdI4_F, twdI4_F))
	port map( Input => I4, Output => connect(4));

   U6 : WIREBUF
	generic map(delay => (twdI5_R, twdI5_F, twdI5_R, twdI5_R, twdI5_F, twdI5_F))
	port map( Input => I5, Output => connect(5));

   U7 : WIREBUF
	generic map(delay => (twdI6_R, twdI6_F, twdI6_R, twdI6_R, twdI6_F, twdI6_F))
	port map( Input => I6, Output => connect(6));

   U8 : WIREBUF
	generic map(delay => (twdI7_R, twdI7_F, twdI7_R, twdI7_R, twdI7_F, twdI7_F))
	port map( Input => I7, Output => connect(7));

   U9 : WIREBUF
	generic map(delay => (twdI8_R, twdI8_F, twdI8_R, twdI8_R, twdI8_F, twdI8_F))
	port map( Input => I8, Output => connect(8));

   U10 : WIREBUF
	generic map(delay => (twdI9_R, twdI9_F, twdI9_R, twdI9_R, twdI9_F, twdI9_F))
	port map( Input => I9, Output => connect(9));

   U11 : WIREBUF
	generic map(delay => (twdI10_R, twdI10_F, twdI10_R, twdI10_R, twdI10_F, twdI10_F))
	port map( Input => I10, Output => connect(10));

   U12 : WIREBUF
	generic map(delay => (twdI11_R, twdI11_F, twdI11_R, twdI11_R, twdI11_F, twdI11_F))
	port map( Input => I11, Output => connect(11));

   U13 : WIREBUF
	generic map(delay => (twdI12_R, twdI12_F, twdI12_R, twdI12_R, twdI12_F, twdI12_F))
	port map( Input => I12, Output => connect(12));

   U14 : WIREBUF
	generic map(delay => (twdI13_R, twdI13_F, twdI13_R, twdI13_R, twdI13_F, twdI13_F))
	port map( Input => I13, Output => connect(13));

   U15 : WIREBUF
	generic map(delay => (twdI14_R, twdI14_F, twdI14_R, twdI14_R, twdI14_F, twdI14_F))
	port map( Input => I14, Output => connect(14));

   U16 : WIREBUF
	generic map(delay => (twdI15_R, twdI15_F, twdI15_R, twdI15_R, twdI15_F, twdI15_F))
	port map( Input => I15, Output => connect(15));

   -- Netlist
   U17 : TLU
	generic map(
		N => 16,
		TruthTable => "01111111111111111111111111111111" &
		              "01111111111111111111111111111111" &
		              "01111111111111111111111111111111" &
		              "1000000000000000",
		TT_size => (5, 5, 5, 4),
		Node_Index => (0, 1, 2, 3, 4, 
		               5, 6, 7, 8, 9, 
		               10, 11, 12, 13, 14, 
		               15, -1, -2, -3),
		pin_names => "I0 I1 I10 I11 I12 I13 I14 I15 I2 I3 I4 I5 I6 " &
		             "I7 I8 I9 Z",
		delay_param =>
			((tpdI0_Z_R, tpdI0_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI1_Z_R, tpdI1_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI10_Z_R, tpdI10_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI11_Z_R, tpdI11_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI12_Z_R, tpdI12_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI13_Z_R, tpdI13_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI14_Z_R, tpdI14_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI15_Z_R, tpdI15_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI2_Z_R, tpdI2_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI3_Z_R, tpdI3_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI4_Z_R, tpdI4_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI5_Z_R, tpdI5_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI6_Z_R, tpdI6_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI7_Z_R, tpdI7_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI8_Z_R, tpdI8_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdI9_Z_R, tpdI9_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXXXXXXXXXXXXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(10), 
		Input(3) => connect(11), 
		Input(4) => connect(12), 
		Input(5) => connect(13), 
		Input(6) => connect(14), 
		Input(7) => connect(15), 
		Input(8) => connect(2), 
		Input(9) => connect(3), 
		Input(10) => connect(4), 
		Input(11) => connect(5), 
		Input(12) => connect(6), 
		Input(13) => connect(7), 
		Input(14) => connect(8), 
		Input(15) => connect(9), 
		Output => Z);


end FTGS;

configuration CFG_NR16P_FTGS of NR16P is
   for FTGS
   end for;
end CFG_NR16P_FTGS;


----- CELL OR2 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR2 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.380 ns;
      tpdA_Z_F                       :	Time := 0.850 ns;
      tpdB_Z_R                       :	Time := 0.380 ns;
      tpdB_Z_F                       :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR2;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR2 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0111",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_OR2_FTGS of OR2 is
   for FTGS
   end for;
end CFG_OR2_FTGS;


----- CELL OR2P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR2P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.460 ns;
      tpdA_Z_F                       :	Time := 0.940 ns;
      tpdB_Z_R                       :	Time := 0.460 ns;
      tpdB_Z_F                       :	Time := 0.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR2P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR2P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U3/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U3/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U3/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U3/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 1) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   -- Netlist
   U3 : TLU
	generic map(
		N => 2,
		TruthTable => "0111",
		pin_names => "A B Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Output => Z);


end FTGS;

configuration CFG_OR2P_FTGS of OR2P is
   for FTGS
   end for;
end CFG_OR2P_FTGS;


----- CELL OR3 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR3 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.480 ns;
      tpdA_Z_F                       :	Time := 1.240 ns;
      tpdB_Z_R                       :	Time := 0.480 ns;
      tpdB_Z_F                       :	Time := 1.240 ns;
      tpdC_Z_R                       :	Time := 0.480 ns;
      tpdC_Z_F                       :	Time := 1.240 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR3;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR3 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01111111",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_OR3_FTGS of OR3 is
   for FTGS
   end for;
end CFG_OR3_FTGS;


----- CELL OR3P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR3P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.560 ns;
      tpdA_Z_F                       :	Time := 1.330 ns;
      tpdB_Z_R                       :	Time := 0.560 ns;
      tpdB_Z_F                       :	Time := 1.330 ns;
      tpdC_Z_R                       :	Time := 0.560 ns;
      tpdC_Z_F                       :	Time := 1.330 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR3P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR3P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U4/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U4/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U4/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U4/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U4/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U4/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 2) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   -- Netlist
   U4 : TLU
	generic map(
		N => 3,
		TruthTable => "01111111",
		pin_names => "A B C Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Output => Z);


end FTGS;

configuration CFG_OR3P_FTGS of OR3P is
   for FTGS
   end for;
end CFG_OR3P_FTGS;


----- CELL OR4 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR4 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.380 ns;
      tpdA_Z_F                       :	Time := 1.350 ns;
      tpdB_Z_R                       :	Time := 0.380 ns;
      tpdB_Z_F                       :	Time := 1.350 ns;
      tpdC_Z_R                       :	Time := 0.380 ns;
      tpdC_Z_F                       :	Time := 1.350 ns;
      tpdD_Z_R                       :	Time := 0.380 ns;
      tpdD_Z_F                       :	Time := 1.350 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR4;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR4 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0111111111111111",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_OR4_FTGS of OR4 is
   for FTGS
   end for;
end CFG_OR4_FTGS;


----- CELL OR4P -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity OR4P is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdA_Z_R                       :	Time := 0.560 ns;
      tpdA_Z_F                       :	Time := 1.870 ns;
      tpdB_Z_R                       :	Time := 0.560 ns;
      tpdB_Z_F                       :	Time := 1.870 ns;
      tpdC_Z_R                       :	Time := 0.560 ns;
      tpdC_Z_F                       :	Time := 1.870 ns;
      tpdD_Z_R                       :	Time := 0.560 ns;
      tpdD_Z_F                       :	Time := 1.870 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns;
      twdC_R                         :	Time := 0.000 ns;
      twdC_F                         :	Time := 0.000 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns);

   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end OR4P;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of OR4P is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_Z_F: constant is 
	"U5/delay_param(3)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_Z_R: constant is 
	"U5/delay_param(3)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdC_Z_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdC_Z_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdB_Z_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdB_Z_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdA_Z_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdA_Z_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdC_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdC_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdB_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdB_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdA_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdA_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 


begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdA_R, twdA_F, twdA_R, twdA_R, twdA_F, twdA_F))
	port map( Input => A, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdB_R, twdB_F, twdB_R, twdB_R, twdB_F, twdB_F))
	port map( Input => B, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdC_R, twdC_F, twdC_R, twdC_R, twdC_F, twdC_F))
	port map( Input => C, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(3));

   -- Netlist
   U5 : TLU
	generic map(
		N => 4,
		TruthTable => "0111111111111111",
		pin_names => "A B C D Z",
		delay_param =>
			((tpdA_Z_R, tpdA_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdB_Z_R, tpdB_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdC_Z_R, tpdC_Z_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_Z_R, tpdD_Z_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		InMapZ => "XXXX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => connect(0), 
		Input(1) => connect(1), 
		Input(2) => connect(2), 
		Input(3) => connect(3), 
		Output => Z);


end FTGS;

configuration CFG_OR4P_FTGS of OR4P is
   for FTGS
   end for;
end CFG_OR4P_FTGS;


----- CELL RAM1 -----
library IEEE;
use IEEE.STD_LOGIC_1164.all;
library SYNOPSYS;
use SYNOPSYS.attributes.REAL_NAME;

-- entity declaration --
entity RAM1 is
   generic(
      Timing_mesg: Boolean := True;
      Timing_xgen: Boolean := False;
      tpdD_ZN_R                      :	Time := 0.000 ns;
      tpdD_ZN_F                      :	Time := 0.000 ns;
      tpdWR_ZN_R                     :	Time := 0.000 ns;
      tpdWR_ZN_F                     :	Time := 0.000 ns;
      tpdWRN_ZN_R                    :	Time := 0.000 ns;
      tpdWRN_ZN_F                    :	Time := 0.000 ns;
      tpdRD_ZN_R                     :	Time := 0.390 ns;
      tpdRD_ZN_F                     :	Time := 0.230 ns;
      tpdRD_ZN_LZ                    :	Time := 0.390 ns;
      tpdRD_ZN_HZ                    :	Time := 0.230 ns;
      tpdD_QN_R                      :	Time := 0.000 ns;
      tpdD_QN_F                      :	Time := 0.000 ns;
      tpdWR_QN_R                     :	Time := 0.460 ns;
      tpdWR_QN_F                     :	Time := 0.610 ns;
      tpdWRN_QN_R                    :	Time := 0.460 ns;
      tpdWRN_QN_F                    :	Time := 0.610 ns;
      tsuD_WR                        :	Time := 1.000 ns;
      thWR_D                         :	Time := 0.000 ns;
      tsuD_WRN                       :	Time := 1.000 ns;
      thWRN_D                        :	Time := 0.000 ns;
      twWR_H                         :	Time := 1.500 ns;
      twWRN_H                        :	Time := 1.500 ns;
      twWR_L                         :	Time := 1.500 ns;
      twWRN_L                        :	Time := 1.500 ns;
      twdD_R                         :	Time := 0.000 ns;
      twdD_F                         :	Time := 0.000 ns;
      twdWR_R                        :	Time := 0.000 ns;
      twdWR_F                        :	Time := 0.000 ns;
      twdWRN_R                       :	Time := 0.000 ns;
      twdWRN_F                       :	Time := 0.000 ns;
      twdRD_R                        :	Time := 0.000 ns;
      twdRD_F                        :	Time := 0.000 ns);

   port(
      D                              :	in    STD_LOGIC;
      WR                             :	in    STD_LOGIC;
      WRN                            :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      ZN                             :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end RAM1;

-- architecture body --
library IEEE_ASIC;
use IEEE.STD_LOGIC_MISC.all;
use SYNOPSYS.attributes.PRIVATE;
use SYNOPSYS.attributes.ASIC_CELL;
use SYNOPSYS.attributes.PROPAGATE_VALUE;

library IEEE;
use IEEE.GS_TYPES.all;
library GSCOMP;
use GSCOMP.GS_COMPONENTS.all;

architecture FTGS of RAM1 is
   attribute PRIVATE of FTGS : architecture is TRUE;
   attribute ASIC_CELL of FTGS : architecture is TRUE;

   -- Backannotation attributes
   attribute PROPAGATE_VALUE of tpdD_QN_F: constant is 
	"U7/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_QN_R: constant is 
	"U7/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdWRN_QN_F: constant is 
	"U7/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdWRN_QN_R: constant is 
	"U7/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdWR_QN_F: constant is 
	"U7/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdWR_QN_R: constant is 
	"U7/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdRD_ZN_HZ: constant is 
	"U6/delay_param(1)(TRAN_1Z)";
   attribute PROPAGATE_VALUE of tpdRD_ZN_LZ: constant is 
	"U6/delay_param(1)(TRAN_0Z)";
   attribute PROPAGATE_VALUE of tpdRD_ZN_F: constant is 
	"U6/delay_param(1)(TRAN_10), " &
	"U6/delay_param(1)(TRAN_Z0)";
   attribute PROPAGATE_VALUE of tpdRD_ZN_R: constant is 
	"U6/delay_param(1)(TRAN_01), " &
	"U6/delay_param(1)(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twWRN_L: constant is 
	"U5/constraint_param(7).Check_time, " &
	"U7/constraint_param(7).Check_time";
   attribute PROPAGATE_VALUE of twWRN_H: constant is 
	"U5/constraint_param(6).Check_time, " &
	"U7/constraint_param(6).Check_time";
   attribute PROPAGATE_VALUE of twWR_L: constant is 
	"U5/constraint_param(5).Check_time, " &
	"U7/constraint_param(5).Check_time";
   attribute PROPAGATE_VALUE of twWR_H: constant is 
	"U5/constraint_param(4).Check_time, " &
	"U7/constraint_param(4).Check_time";
   attribute PROPAGATE_VALUE of thWRN_D: constant is 
	"U5/constraint_param(3).Check_time, " &
	"U7/constraint_param(3).Check_time";
   attribute PROPAGATE_VALUE of tsuD_WRN: constant is 
	"U5/constraint_param(2).Check_time, " &
	"U7/constraint_param(2).Check_time";
   attribute PROPAGATE_VALUE of thWR_D: constant is 
	"U5/constraint_param(1).Check_time, " &
	"U7/constraint_param(1).Check_time";
   attribute PROPAGATE_VALUE of tsuD_WR: constant is 
	"U5/constraint_param(0).Check_time, " &
	"U7/constraint_param(0).Check_time";
   attribute PROPAGATE_VALUE of tpdD_ZN_F: constant is 
	"U5/delay_param(2)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdD_ZN_R: constant is 
	"U5/delay_param(2)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdWRN_ZN_F: constant is 
	"U5/delay_param(1)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdWRN_ZN_R: constant is 
	"U5/delay_param(1)(TRAN_01)";
   attribute PROPAGATE_VALUE of tpdWR_ZN_F: constant is 
	"U5/delay_param(0)(TRAN_10)";
   attribute PROPAGATE_VALUE of tpdWR_ZN_R: constant is 
	"U5/delay_param(0)(TRAN_01)";
   attribute PROPAGATE_VALUE of twdRD_F: constant is 
	"U4/delay(TRAN_10), " &
	"U4/delay(TRAN_1Z), U4/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdRD_R: constant is 
	"U4/delay(TRAN_01), " &
	"U4/delay(TRAN_0Z), U4/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdWRN_F: constant is 
	"U3/delay(TRAN_10), " &
	"U3/delay(TRAN_1Z), U3/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdWRN_R: constant is 
	"U3/delay(TRAN_01), " &
	"U3/delay(TRAN_0Z), U3/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdWR_F: constant is 
	"U2/delay(TRAN_10), " &
	"U2/delay(TRAN_1Z), U2/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdWR_R: constant is 
	"U2/delay(TRAN_01), " &
	"U2/delay(TRAN_0Z), U2/delay(TRAN_Z1)";
   attribute PROPAGATE_VALUE of twdD_F: constant is 
	"U1/delay(TRAN_10), " &
	"U1/delay(TRAN_1Z), U1/delay(TRAN_Z0)";
   attribute PROPAGATE_VALUE of twdD_R: constant is 
	"U1/delay(TRAN_01), " &
	"U1/delay(TRAN_0Z), U1/delay(TRAN_Z1)";

   signal connect : STD_LOGIC_VECTOR (0 to 3) := (others => 'U'); 

   signal internal_net0 : STD_LOGIC;

begin

   -- Extrinsic delay buffers
   U1 : WIREBUF
	generic map(delay => (twdD_R, twdD_F, twdD_R, twdD_R, twdD_F, twdD_F))
	port map( Input => D, Output => connect(0));

   U2 : WIREBUF
	generic map(delay => (twdWR_R, twdWR_F, twdWR_R, twdWR_R, twdWR_F, twdWR_F))
	port map( Input => WR, Output => connect(1));

   U3 : WIREBUF
	generic map(delay => (twdWRN_R, twdWRN_F, twdWRN_R, twdWRN_R, twdWRN_F, twdWRN_F))
	port map( Input => WRN, Output => connect(2));

   U4 : WIREBUF
	generic map(delay => (twdRD_R, twdRD_F, twdRD_R, twdRD_R, twdRD_F, twdRD_F))
	port map( Input => RD, Output => connect(3));

   -- Netlist
   U5 : SEQGEN
	generic map(
		N_enable => 2,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "0010",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "WR WRN D ZN",
		delay_param =>
			((tpdWR_ZN_R, tpdWR_ZN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdWRN_ZN_R, tpdWRN_ZN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_ZN_R, tpdD_ZN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_WR),
			 (0, 2, hold_falling_latch, thWR_D),
			 (2, 1, setup_rising_latch, tsuD_WRN),
			 (1, 2, hold_rising_latch, thWRN_D),
			 (0, 0, pwidth_pos_hi_latch, twWR_H),
			 (0, 0, pwidth_neg_hi_latch, twWR_L),
			 (1, 1, pwidth_pos_lo_latch, twWRN_H),
			 (1, 1, pwidth_neg_lo_latch, twWRN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => Timing_mesg,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => internal_net0);

   U6 : TLU
	generic map(
		N => 2,
		TruthTable => "Z0Z1",
		pin_names => "ZN RD ZN",
		delay_param =>
			((0 ns, 0 ns, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdRD_ZN_R, tpdRD_ZN_F, tpdRD_ZN_LZ, tpdRD_ZN_R, tpdRD_ZN_HZ, tpdRD_ZN_F)),
		InMapZ => "XX",
		OutMapZ => 'Z',
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		strn => strn_X01)
	port map(
		Input(0) => internal_net0, 
		Input(1) => connect(3), 
		Output => ZN);

   U7 : SEQGEN
	generic map(
		N_enable => 2,
		N_clock => 0,
		N_clear => 0,
		N_preset => 0,
		N_data => 1,
		lut_enable => "0010",
		lut_clock => "",
		lut_clear => "",
		lut_preset => "",
		lut_data => "10",
		lut_next => "NN01NN01",
		pin_names => "WR WRN D QN",
		delay_param =>
			((tpdWR_QN_R, tpdWR_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdWRN_QN_R, tpdWRN_QN_F, 0 ns, 0 ns, 0 ns, 0 ns),
			 (tpdD_QN_R, tpdD_QN_F, 0 ns, 0 ns, 0 ns, 0 ns)),
		constraint_param => 
			((2, 0, setup_falling_latch, tsuD_WR),
			 (0, 2, hold_falling_latch, thWR_D),
			 (2, 1, setup_rising_latch, tsuD_WRN),
			 (1, 2, hold_rising_latch, thWRN_D),
			 (0, 0, pwidth_pos_hi_latch, twWR_H),
			 (0, 0, pwidth_neg_hi_latch, twWR_L),
			 (1, 1, pwidth_pos_lo_latch, twWRN_H),
			 (1, 1, pwidth_neg_lo_latch, twWRN_L)),
		InMapZ => "XXX",
		Q_feedback => FALSE,
		Enable_feedback => FALSE,
		PulseHandling => PH_GLITCH,
		Timing_mesg => Timing_mesg,
		Timing_xgen => Timing_xgen,
		Constraint_mesg => FALSE,
		Constraint_xgen => Timing_xgen,
		strn => strn_X01)
	port map(	Input(0) => connect(1),
			Input(1) => connect(2),
			Input(2) => connect(0),
			Output => QN);


end FTGS;

configuration CFG_RAM1_FTGS of RAM1 is
   for FTGS
   end for;
end CFG_RAM1_FTGS;


---- end of library ----
