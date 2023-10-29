
----------------------------------------------------------------
-- 
-- Created by the Synopsys Library Compiler v3.1-development
-- FILENAME     :    lsi_10k_components.vhd
-- FILE CONTENTS:    Component Package
-- DATE CREATED :    Fri Jan 21 11:54:43 1994
-- 
-- LIBRARY      :    lsi_10k
-- DATE ENTERED :    July 18, 1991
-- REVISION     :    1.250000
-- TECHNOLOGY   :    cmos
-- TIME SCALE   :    1 ns
-- LOGIC SYSTEM :    IEEE-1164
-- NOTES        :    
-- HISTORY      :
-- 
----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
-- synopsys translate_off
use IEEE.GS_TYPES.sdt_values_t;
-- synopsys translate_on

package COMPONENTS is

constant Default_Timing_mesg : Boolean := True;
constant Default_Timing_xgen : Boolean := False;

----- Component AN2 -----
component AN2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.480 ns;
      tpdA_Z_F                       :	Time := 0.770 ns;
      tpdB_Z_R                       :	Time := 0.480 ns;
      tpdB_Z_F                       :	Time := 0.770 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AN2P -----
component AN2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.540 ns;
      tpdA_Z_F                       :	Time := 0.840 ns;
      tpdB_Z_R                       :	Time := 0.540 ns;
      tpdB_Z_F                       :	Time := 0.840 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AN3 -----
component AN3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AN3P -----
component AN3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AN4 -----
component AN4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AN4P -----
component AN4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO1 -----
component AO1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO1P -----
component AO1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO2 -----
component AO2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO2P -----
component AO2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO3 -----
component AO3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO3P -----
component AO3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO4 -----
component AO4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO4P -----
component AO4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO5 -----
component AO5
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO5P -----
component AO5P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO6 -----
component AO6
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO6P -----
component AO6P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO7 -----
component AO7
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO7P -----
component AO7P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO11 -----
component AO11
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO11P -----
component AO11P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component AO12 -----
component AO12
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component AO12P -----
component AO12P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component B1I -----
component B1I
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.550 ns;
      tpdA_Z_F                       :	Time := 1.100 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component B2I -----
component B2I
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z1_R                      :	Time := 0.720 ns;
      tpdA_Z1_F                      :	Time := 0.400 ns;
      tpdA_Z2_R                      :	Time := 0.560 ns;
      tpdA_Z2_F                      :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end component;


----- Component B2IP -----
component B2IP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z1_R                      :	Time := 0.700 ns;
      tpdA_Z1_F                      :	Time := 0.380 ns;
      tpdA_Z2_R                      :	Time := 0.630 ns;
      tpdA_Z2_F                      :	Time := 0.820 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end component;


----- Component B3I -----
component B3I
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z1_R                      :	Time := 0.490 ns;
      tpdA_Z1_F                      :	Time := 0.170 ns;
      tpdA_Z2_R                      :	Time := 0.340 ns;
      tpdA_Z2_F                      :	Time := 0.600 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end component;


----- Component B3IP -----
component B3IP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z1_R                      :	Time := 0.400 ns;
      tpdA_Z1_F                      :	Time := 0.180 ns;
      tpdA_Z2_R                      :	Time := 0.350 ns;
      tpdA_Z2_F                      :	Time := 0.540 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC);
end component;


----- Component B4I -----
component B4I
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.350 ns;
      tpdA_Z_F                       :	Time := 0.110 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component B4IP -----
component B4IP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.350 ns;
      tpdA_Z_F                       :	Time := 0.020 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component B5I -----
component B5I
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.120 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component B5IP -----
component B5IP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.330 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component BTS4 -----
component BTS4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component BTS4P -----
component BTS4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component BTS5 -----
component BTS5
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component BTS5P -----
component BTS5P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component D24L -----
component D24L
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z0                             :	out   STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC;
      Z3                             :	out   STD_LOGIC);
end component;


----- Component D24LP -----
component D24LP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z0                             :	out   STD_LOGIC;
      Z1                             :	out   STD_LOGIC;
      Z2                             :	out   STD_LOGIC;
      Z3                             :	out   STD_LOGIC);
end component;


----- Component EN -----
component EN
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.790 ns;
      tpdA_Z_F                       :	Time := 1.060 ns;
      tpdB_Z_R                       :	Time := 0.790 ns;
      tpdB_Z_F                       :	Time := 1.060 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EN3 -----
component EN3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EN3P -----
component EN3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ENP -----
component ENP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.840 ns;
      tpdA_Z_F                       :	Time := 1.050 ns;
      tpdB_Z_R                       :	Time := 0.840 ns;
      tpdB_Z_F                       :	Time := 1.050 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EO -----
component EO
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.790 ns;
      tpdA_Z_F                       :	Time := 1.060 ns;
      tpdB_Z_R                       :	Time := 0.790 ns;
      tpdB_Z_F                       :	Time := 1.060 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EO1 -----
component EO1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EO1P -----
component EO1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EO3 -----
component EO3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EO3P -----
component EO3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EON1 -----
component EON1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EON1P -----
component EON1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component EOP -----
component EOP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.840 ns;
      tpdA_Z_F                       :	Time := 1.050 ns;
      tpdB_Z_R                       :	Time := 0.840 ns;
      tpdB_Z_F                       :	Time := 1.050 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component FA1 -----
component FA1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component FA1A -----
component FA1A
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component FA1AP -----
component FA1AP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component FA1P -----
component FA1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CI                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component FD1 -----
component FD1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD1P -----
component FD1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD1S -----
component FD1S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD1SP -----
component FD1SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD2 -----
component FD2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD2P -----
component FD2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD2S -----
component FD2S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD2SP -----
component FD2SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD2TS -----
component FD2TS
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC;
      Q                              :	out   STD_LOGIC);
end component;


----- Component FD2TSP -----
component FD2TSP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component FD3 -----
component FD3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD3P -----
component FD3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD3S -----
component FD3S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD3SP -----
component FD3SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD4 -----
component FD4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD4P -----
component FD4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD4S -----
component FD4S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FD4SP -----
component FD4SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FDS2 -----
component FDS2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FDS2L -----
component FDS2L
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      LD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FDS2LP -----
component FDS2LP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      LD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FDS2P -----
component FDS2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CR                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK1 -----
component FJK1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK1P -----
component FJK1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK1S -----
component FJK1S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK1SP -----
component FJK1SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK2 -----
component FJK2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK2P -----
component FJK2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK2S -----
component FJK2S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK2SP -----
component FJK2SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      TI                             :	in    STD_LOGIC;
      TE                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK3 -----
component FJK3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK3P -----
component FJK3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      J                              :	in    STD_LOGIC;
      K                              :	in    STD_LOGIC;
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FJK3S -----
component FJK3S
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component FJK3SP -----
component FJK3SP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component FT2 -----
component FT2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FT2P -----
component FT2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CP                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FT4 -----
component FT4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component FT4P -----
component FT4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      CP                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component HA1 -----
component HA1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component HA1P -----
component HA1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	out   STD_LOGIC;
      CO                             :	out   STD_LOGIC);
end component;


----- Component IV -----
component IV
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.380 ns;
      tpdA_Z_F                       :	Time := 0.150 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component IVA -----
component IVA
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.240 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component IVAP -----
component IVAP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.260 ns;
      tpdA_Z_F                       :	Time := 0.140 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component IVDA -----
component IVDA
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Y_R                       :	Time := 0.550 ns;
      tpdA_Y_F                       :	Time := 0.320 ns;
      tpdA_Z_R                       :	Time := 0.480 ns;
      tpdA_Z_F                       :	Time := 0.670 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Y                              :	out   STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component IVDAP -----
component IVDAP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Y_R                       :	Time := 0.400 ns;
      tpdA_Y_F                       :	Time := 0.180 ns;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.530 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Y                              :	out   STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component IVP -----
component IVP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.360 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component LD1 -----
component LD1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD1P -----
component LD1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD1X4 -----
component LD1X4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component LD1X4P -----
component LD1X4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component LD2 -----
component LD2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD2P -----
component LD2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD3 -----
component LD3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD3P -----
component LD3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD4 -----
component LD4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LD4P -----
component LD4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      GN                             :	in    STD_LOGIC;
      CD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LS1 -----
component LS1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D1                             :	in    STD_LOGIC;
      C1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      C2                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LS1P -----
component LS1P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D1                             :	in    STD_LOGIC;
      C1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      C2                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LSR0 -----
component LSR0
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdS_Q_R                       :	Time := 1.530 ns;
      tpdR_Q_F                       :	Time := 0.920 ns;
      tpdS_QN_F                      :	Time := 0.920 ns;
      tpdR_QN_R                      :	Time := 1.530 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdR_R                         :	Time := 0.000 ns;
      twdR_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LSR0P -----
component LSR0P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdS_Q_R                       :	Time := 1.720 ns;
      tpdR_Q_F                       :	Time := 0.970 ns;
      tpdS_QN_F                      :	Time := 0.970 ns;
      tpdR_QN_R                      :	Time := 1.720 ns;
      twdS_R                         :	Time := 0.000 ns;
      twdS_F                         :	Time := 0.000 ns;
      twdR_R                         :	Time := 0.000 ns;
      twdR_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LSR1 -----
component LSR1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      S1                             :	in    STD_LOGIC;
      S2                             :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      R1                             :	in    STD_LOGIC;
      R2                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component LSR2 -----
component LSR2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      S                              :	in    STD_LOGIC;
      R                              :	in    STD_LOGIC;
      G                              :	in    STD_LOGIC;
      SD                             :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      Q                              :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


----- Component MUX21H -----
component MUX21H
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX21HP -----
component MUX21HP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX21L -----
component MUX21L
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX21LA -----
component MUX21LA
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      SN                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX21LAP -----
component MUX21LAP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      SN                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX21LP -----
component MUX21LP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      S                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX31L -----
component MUX31L
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX31LP -----
component MUX31LP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX41 -----
component MUX41
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX41P -----
component MUX41P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D0                             :	in    STD_LOGIC;
      D1                             :	in    STD_LOGIC;
      D2                             :	in    STD_LOGIC;
      D3                             :	in    STD_LOGIC;
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component MUX51H -----
component MUX51H
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component MUX51HP -----
component MUX51HP
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component MUX81 -----
component MUX81
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component MUX81P -----
component MUX81P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component ND2 -----
component ND2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.130 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.130 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND2P -----
component ND2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.500 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      tpdB_Z_R                       :	Time := 0.500 ns;
      tpdB_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND3 -----
component ND3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND3P -----
component ND3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND4 -----
component ND4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND4P -----
component ND4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND5 -----
component ND5
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND5P -----
component ND5P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND6 -----
component ND6
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND6P -----
component ND6P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component ND8 -----
component ND8
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component ND8P -----
component ND8P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component NR2 -----
component NR2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.550 ns;
      tpdA_Z_F                       :	Time := 0.250 ns;
      tpdB_Z_R                       :	Time := 0.550 ns;
      tpdB_Z_F                       :	Time := 0.250 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR2P -----
component NR2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.560 ns;
      tpdA_Z_F                       :	Time := 0.160 ns;
      tpdB_Z_R                       :	Time := 0.560 ns;
      tpdB_Z_F                       :	Time := 0.160 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR3 -----
component NR3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR3P -----
component NR3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR4 -----
component NR4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR4P -----
component NR4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR5 -----
component NR5
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR5P -----
component NR5P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR6 -----
component NR6
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR6P -----
component NR6P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      E                              :	in    STD_LOGIC;
      F                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component NR8 -----
component NR8
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component NR8P -----
component NR8P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component NR16 -----
component NR16
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component NR16P -----
component NR16P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
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
end component;


----- Component OR2 -----
component OR2
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.380 ns;
      tpdA_Z_F                       :	Time := 0.850 ns;
      tpdB_Z_R                       :	Time := 0.380 ns;
      tpdB_Z_F                       :	Time := 0.850 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component OR2P -----
component OR2P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
      tpdA_Z_R                       :	Time := 0.460 ns;
      tpdA_Z_F                       :	Time := 0.940 ns;
      tpdB_Z_R                       :	Time := 0.460 ns;
      tpdB_Z_F                       :	Time := 0.940 ns;
      twdA_R                         :	Time := 0.000 ns;
      twdA_F                         :	Time := 0.000 ns;
      twdB_R                         :	Time := 0.000 ns;
      twdB_F                         :	Time := 0.000 ns);

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component OR3 -----
component OR3
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component OR3P -----
component OR3P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component OR4 -----
component OR4
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component OR4P -----
component OR4P
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      A                              :	in    STD_LOGIC;
      B                              :	in    STD_LOGIC;
      C                              :	in    STD_LOGIC;
      D                              :	in    STD_LOGIC;
      Z                              :	out   STD_LOGIC);
end component;


----- Component RAM1 -----
component RAM1
-- synopsys translate_off
   generic(
      Timing_mesg: Boolean := Default_Timing_mesg;
      Timing_xgen: Boolean := Default_Timing_xgen;
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

-- synopsys translate_on
   port(
      D                              :	in    STD_LOGIC;
      WR                             :	in    STD_LOGIC;
      WRN                            :	in    STD_LOGIC;
      RD                             :	in    STD_LOGIC;
      ZN                             :	out   STD_LOGIC;
      QN                             :	out   STD_LOGIC);
end component;


end COMPONENTS;

---- end of components library ----
