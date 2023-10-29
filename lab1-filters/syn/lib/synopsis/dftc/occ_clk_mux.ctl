STIL 1.0 {
    CTL P2001.10;
    Design P2001.01;
    TCL P2001.01;
}
Header {
    Title "CTL template for PLL Controller";
}
Signals {
  "reset" In;
  "test_mode" In;
  "pll_bypass" In;
  "scan_en" In;
  "slow_clk" In;
  Pragma TCL {*
    set all_cycle_bits [expr $clk_cycle_bits * $clk_count];
    if {$all_cycle_bits>1} {
      for {set i 0 } {$i<$all_cycle_bits} {incr i 1} {
        puts [format "   \"clk_enable\[$i\]\" In;"];
      }
    } else {
      puts [format "   \"clk_enable\" In;"];
    }
    if {$clk_count>1} {
      set init [expr $clk_count-1];
      for {set i $init} {$i>=0} {incr i -1} {
        puts [format "   \"fast_clk\[$i\]\" In;"];
      }
      for {set i $init} {$i>=0} {incr i -1} {
        puts [format "   \"clk\[$i\]\" Out;"];
      }
    } else {
      puts [format "   \"fast_clk\" In;"];
      puts [format "   \"clk\" Out;"];
    }
  *}
}

MacroDefs capture_mode {
   Pragma TCL {*
      if {$clk_count>1} {
        for {set i 0} {$i<$clk_count} {incr i 1} {
          puts [format "\t\"fast_clk\[$i\]\" {"];
	  puts [format "\t\tC{\"test_mode\"=0;\"pll_bypass\"=0;\"scan_enable\"=0;}"];
	  puts [format "\t\tV{\"fast_clk\[$i\]\"=P;}" ]; 
	  puts [format "\t}"];
        }
      } else {
          puts [format "\t\"fast_clk\" {"];
	  puts [format "\t\tC{\"test_mode\"=0;\"pll_bypass\"=0;\"scan_enable\"=0;}"];
	  puts [format "\t\tV{\"fast_clk\"=P;}" ]; 
	  puts [format "\t}"];
      }
   *}	
}

Environment DFT_clk_mux {
   CTL {
      Family SNPS_CLOCK_controller;
      Pragma TCL {*
        puts [format "\tInternal { "];
        puts [format "\t   \"reset\" { DataType User snps_pll_reset; }"];
        puts [format "\t   \"test_mode\" { DataType User snps_pll_test_mode; }"];
        puts [format "\t   \"pll_bypass\" { DataType User snps_pll_bypass; }"];
        puts [format "\t   \"scan_en\" { DataType ScanEnable; }"];
        puts [format "\t   \"slow_clk\" { DataType MasterClock; }"];
        set all_cycle_bits [expr $clk_cycle_bits * $clk_count];
           if {$all_cycle_bits>1} {
             for {set i [expr $all_cycle_bits-1]} {$i>=0} {incr i -1} {
               puts [format "\t   \"clk_enable\[$i\]\" {DataType User snps_pll_clk_enable;}"];
             }
           } else { 
             puts [format "\t   \"clk_enable\" {DataType User snps_pll_clk_enable;}"];
           }
           if {$clk_count>1} {
             set init [expr $clk_count-1];
             for {set i $init} {$i>=0} {incr i -1} {
               puts [format "\t   \"fast_clk\[$i\]\" {DataType User snps_pll_oscillator;}"];
             }
             for {set i $init} {$i>=0} {incr i -1} {
               puts [format "\t   \"clk\[$i\]\" {DataType ScanMasterClock;}"];
             }
           } else { 
             puts [format "\t   \"fast_clk\" {DataType User snps_pll_oscillator;}"];
             puts [format "\t   \"clk\" {DataType ScanMasterClock;}"];
           } 
         puts [format "\t}"];

         puts [format "\tRelation { "];	
           if {$clk_count>1} {
             for {set i 0} {$i<$clk_count} {incr i 1} {
               puts [format "\t\tPort \'\"fast_clk\[$i\]\"+\"clk\[$i\]\"\' $i;"];
             }
           } else { 
               puts [format "\t\tPort \'fast_clk + clk\' 1;"];
           } 
         puts [format "\t}"];

      *}
   }

   CTL Mission_mode{
      Pragma TCL {*
         puts [format "\tTestMode Normal;"];
	 puts [format "\tInternal { " ];
	 puts [format "\t\t\"test_mode\" {DataType TestMode {ActiveState ForceUp;}} "];
         if {$clk_count>1} {	
            for {set i 0} {$i<$clk_count} {incr i 1} {
	       puts [format "\t\t\"clk\[$i\]\" { DataType Oscillator; }"];
            }
         } else {
           puts [format "\t\t\"clk\" {DataType Oscillator; } "];
         }
	 puts [format "\t}"];
      *}
   }

   CTL Shift_mode{
      Pragma TCL {*
         puts [format "\tTestMode ExternalTest;"];
	 puts [format "\tInternal { " ];
	 puts [format "\t\t\"test_mode\" {DataType TestMode {ActiveState ForceDown;}} "];
	 puts [format "\t\t\"scan_en\" {DataType TestControl {ActiveState ForceUp;}} "];
	 puts [format "\t\t\"pll_bypass\" {DataType TestControl {ActiveState ForceUp;}} "];
	 puts [format "\t\t\"slow_clk\" {DataType ScanMasterClock;} "];
         if {$clk_count>1} {	
           for {set i 0} {$i<$clk_count} {incr i 1} {
             puts [format "\t\t\"clk\[$i\]\" {"];	
 	     puts [format "\t\t\tDataType MasterClock;"];
	     puts [format "\t\t\tIsConnected Out { Signal \"slow_clk\"; }" ];
	     puts [format "\t\t}"];	
           }
         } else {
           puts [format "\t\t\"clk\" { "];
 	   puts [format "\t\t\tDataType MasterClock;"];
	   puts [format "\t\t\tIsConnected Out { Signal \"slow_clk\"; }" ];
	   puts [format "\t\t}"];
         }	
	  puts [format "\t}"];
      *}
   }

CTL Capture_mode {
      Pragma TCL {*
         puts [format "\tTestMode ExternalTest;"];
	 puts [format "\tDomainReferences {MacroDefs capture_mode;}"];
	 puts [format "\tInternal { " ];
	 puts [format "\t\t\"test_mode\" {DataType TestMode {ActiveState ForceDown;}} "];
	 puts [format "\t\t\"scan_en\" {DataType TestControl {ActiveState ForceDown;}} "];
	 puts [format "\t\t\"pll_bypass\" {DataType TestControl {ActiveState ForceDown;}} "];
	 puts [format "\t\t\"slow_clk\" {DataType ScanMasterClock;} "];
         if {$clk_count>1} {
            for {set i 0} {$i<$clk_count} {incr i 1} {	
	       puts [format "\t\t\"clk\[$i\]\" { "];
 	       puts [format "\t\t\tDataType MasterClock;"];
	       puts [format "\t\t\tIsConnected Out { Signal \"fast_clk\[$i\]\";"];
	       for {set j 0} {$j<$clk_cycle_bits} {incr j 1} {
                 puts [format "IsGatedBy LogicAnd a {"];
                 puts [format "a {Type Signal; Name \"clk_enable\[[expr $i*$clk_cycle_bits + $j]\]\";}"];
                 puts [format " DelayCycles $j;"];
                 puts [format " }"];

               }


	       puts [format " }"];
	       puts [format "\t\t}"];
            }	
         } else {
           puts [format "\t\t\"clk\" { "];
 	   puts [format "\t\t\tDataType MasterClock;"];
           puts [format "\t\t\tIsConnected Out { Signal \"fast_clk\";"];
	   if {$clk_cycle_bits>1} {
	     for {set j 0} {$j<$clk_cycle_bits} {incr j 1} {
                 puts [format "IsGatedBy LogicAnd a {"];
                 puts [format "a {Type Signal; Name \"clk_enable\[[expr $j]\]\";}"];
                 puts [format " DelayCycles $j;"];
                 puts [format " }"];

             }
           } else {
  		 puts [format "IsGatedBy LogicAnd a {"];
                 puts [format "a {Type Signal; Name \"clk_enable\";}"];
                 puts [format " DelayCycles 0;"];
                 puts [format " }"];
           }

	   puts [format " }"];
	   puts [format "\t\t}"];
         }	
	  puts [format "\t}"];
      *}
   }
 
   CTL Internal_scan {
      Pragma TCL {*
         puts [format "\tTestMode InternalTest;"];
 	 puts [format "\tInternal { " ];
	 puts [format "\t\t\"scan_en\" { DataType ScanEnable {ActiveState ForceUp;} }"];
	 puts [format "\t\t\"slow_clk\" {DataType ScanMasterClock;} "];
	 puts [format "\t}"];
      *}
   }
 
}
