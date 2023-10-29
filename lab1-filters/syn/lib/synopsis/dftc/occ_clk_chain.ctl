STIL 1.0 {
    CTL P2001.10;
    Design DFT_clock_chain;
    TCL P2001.01;
}
Header {
    Title "CTL Template for DFT Clock Chain used in PLL CTRL";
Pragma TCL {*
 set logicbist 1
 if { $OCC_IMPL_TYPE == $logicbist } {
   set shift_clk "bist_clk"
 } else {
   set shift_clk "clk"
 }
 set SEQCOMP 3
*}
}
Signals {
   "clk" In;
   "se"  In ;
   Pragma TCL {* 
     if { $OCC_IMPL_TYPE == $logicbist } { 
       puts [format "  \"bist_clk\" In;"];
       puts [format "  \"bist_mode\" In;"];
       puts [format "  \"lfsr_se\" In;"];
     }
     if {$chain_count>1} {
       for {set i 0} {$i<$chain_count} {incr i} {
         puts [format "  \"si\[$i\]\" In;"];
       }
       for {set i 0} {$i<$chain_count} {incr i} {
         puts [format "  \"so\[$i\]\" Out;"];
       }
     } else {
       puts [format "  \"si\" In;"];
       puts [format "  \"so\" Out;"];
     }
     if {$clk_ctrl_width>1} {
       for {set i 0} {$i<$clk_ctrl_width} {incr i} { 
         puts [format "  \"clk_ctrl_data\[$i\]\" Out;"];
       }
     } else {
       puts [format "  \"clk_ctrl_data\" Out;"];
     }
     if { $OCC_IMPL_TYPE == $logicbist } {
       if {$pattern_ctr_width>1} {
	 for {set i 0} {$i<$pattern_ctr_width} {incr i} { 
	   puts [format "  \"pattern_ctr_data\[$i\]\" Out;"];
	 }
       } else {
	 puts [format "  \"pattern_ctr_data\" Out;"];
       }
       if {$cycle_ctr_width>1} {
	 for {set i 0} {$i<$cycle_ctr_width} {incr i} { 
	   puts [format "  \"cycle_ctr_data\[$i\]\" Out;"];
	 }
       } else {
	 puts [format "  \"cycle_ctr_data\" Out;"];
       }
     }
     if { $sccomp_type == $SEQCOMP } {
       puts [format "  \"test_mode\" In;"];
       puts [format "  \"cc_comp_clk\" In;"];
     }	
  *}
}

ScanStructures Internal_scan {
   Pragma TCL {*
   set len [expr $clk_ctrl_width];
      if {$pattern_ctr_width>1} {
        set len [expr $len+$pattern_ctr_width];
      }
      if {$cycle_ctr_width>1} {
        set len [expr $len+$cycle_ctr_width];
      }
      set len [expr ($len/$chain_count)];
      set last_len  [expr ($clk_ctrl_width - (($chain_count-1)*$len))];
      if {$chain_count>1} {
        for {set i 0} {$i<$chain_count} {incr i} {
          puts "     ScanChain \"clock_chain_$i\" {";
            if {$i == [expr ($chain_count-1)]} {
              puts "\tScanLength $last_len;
              \tScanCells ";
              for { set j [expr $last_len-1] } {$j>=0} {incr j -1} {
                puts "\t\t\"U_shftreg_$i/ff_$j/q_reg\"";
              }
           } else {
              puts "\tScanLength $len;
              \tScanCells ";
              for { set j [expr $len-1] } {$j>=0} {incr j -1} {
                puts "\t\t\"U_shftreg_$i/ff_$j/q_reg\"";
              }
           }
          puts "\t\t\t;
            \tScanIn \"si\[$i\]\";
            \tScanOut \"so\[$i\]\";
            \tScanEnable \"se\";";
	  puts "\tScanMasterClock \"${shift_clk}\";";
          puts "}";
        }
      } else {
        puts "     ScanChain \"clock_chain\" {
          \tScanLength $len;
          \tScanCells ";
          for { set j [expr $len-1] } {$j>=0} {incr j -1} {
            puts "\t\t\"U_shftreg_0/ff_$j/q_reg\"";
          }
          puts "\t\t\t;
          \tScanIn \"si\";
          \tScanOut \"so\";
          \tScanEnable \"se\";";
	  puts "\tScanMasterClock \"${shift_clk}\";";
	  puts "}";
      }
   *}
}
Environment DFT_clock_chain {
   CTL {
      Family SNPS_CLOCK_chain;
      Pragma TCL {*
	puts "
      Internal {
	\"clk\" {DataType MasterClock; }";
	if { $OCC_IMPL_TYPE == $logicbist } {
	  puts "\"bist_clk\" {DataType MasterClock; }";
	  puts "\"bist_mode\" {DataType Functional;} ";
	}
	if {$clk_ctrl_width>1} {
	  for {set i 0} {$i<$clk_ctrl_width} {incr i} {
	    puts "\t\"clk_ctrl_data\[$i\]\" \{ DataType User snps_pll_clkctrl_data\;\}";
	  }
	} else {
	  puts "\t\"clk_ctrl_data\" \{DataType User snps_pll_clkctrl_data\;\}";
        }
	if { $OCC_IMPL_TYPE == $logicbist } {
	  if {$pattern_ctr_width>1} {
	    for {set i 0} {$i<$pattern_ctr_width} {incr i} {
	      puts "\t\"pattern_ctr_data\[$i\]\" \{DataType User snps_bist_patctr_data\;\}";
	    }
	  } else {
	    puts "\t\"pattern_ctr_data\" \{DataType User snps_bist_patctr_data\;\}";
	  }
	  if {$cycle_ctr_width>1} {
	    for {set i 0} {$i<$cycle_ctr_width} {incr i} {
	      puts "\t\"cycle_ctr_data\[$i\]\" \{DataType User snps_bist_cyclctr_data\;\}";
	    }
	  } else {
	    puts "\t\"cycle_ctr_data\" \{DataType User snps_bist_cyclctr_data\;\}";
	  }
	}
        puts "       }";
      *}
   }
   CTL Internal_scan {
      TestMode InternalTest;
      Family SNPS_CLOCK_chain;
      DomainReferences {
        ScanStructures Internal_scan;
      }
      Pragma TCL {*
        puts "
      Internal {
        \"clk\" {DataType ScanMasterClock; }";
	if { $OCC_IMPL_TYPE == $logicbist } {
	  puts "\"bist_clk\" {DataType ScanMasterClock User snps_bist_clk; }";
	  puts "\"bist_mode\" {DataType Functional;}";
	}
        puts "\"se\" {DataType ScanEnable {ActiveState ForceUp;}}";
	if {$chain_count>1} {
	  for {set i 0} {$i<$chain_count} {incr i} {
	    puts "\t\"si\[$i\]\" {CaptureClock \"${shift_clk}\" {LeadingEdge\;} DataType ScanDataIn {ScanDataType Internal\;}}";
	    puts "\t\"so\[$i\]\" {LaunchClock \"${shift_clk}\" {LeadingEdge\;} DataType ScanDataOut {ScanDataType Internal\;}}";
	  }
	} else {
	  puts "\t\"si\" {CaptureClock \"${shift_clk}\" {LeadingEdge\;} DataType ScanDataIn {ScanDataType Internal\;}}";
	  puts "\t\"so\" {LaunchClock \"${shift_clk}\" {LeadingEdge\;} DataType ScanDataOut {ScanDataType Internal\;}}";
	}
	if {$clk_ctrl_width>1} {
	  for {set i 0} {$i<$clk_ctrl_width} {incr i} {
	    puts "\t\"clk_ctrl_data\[$i\]\" \{ DataType User snps_pll_clkctrl_data\;\}";
	  }
	} else {
	  puts "\t\"clk_ctrl_data\" \{DataType User snps_pll_clkctrl_data\;\}";
	}
	if { $OCC_IMPL_TYPE == $logicbist } {
	  if {$pattern_ctr_width>1} {
	    for {set i 0} {$i<$pattern_ctr_width} {incr i} {
	      puts "\t\"pattern_ctr_data\[$i\]\" \{DataType User snps_bist_patctr_data\;\}";
	    }
	  } else {
	    puts "\t\"pattern_ctr_data\" \{DataType User snps_bist_patctr_data\;\}";
	  }
	  if {$cycle_ctr_width>1} {
	    for {set i 0} {$i<$cycle_ctr_width} {incr i} {
	      puts "\t\"cycle_ctr_data\[$i\]\" \{DataType User snps_bist_cyclctr_data\;\}";
	    }
	  } else {
	    puts "\t\"cycle_ctr_data\" \{DataType User snps_bist_cyclctr_data\;\}";
	  }
	}
        if { $sccomp_type == $SEQCOMP } {
	  puts "\t\"test_mode\" \{DataType TestMode\;\}";
        }
        puts "      }";
      *}
   }
}

