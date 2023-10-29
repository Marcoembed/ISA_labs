////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2004 - 2021 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Martin B.,  May 1, 2004
//
// VERSION:   CTL file for mbist_t2_root
//
// DFT IP ID: a492bc1b
// DFT_release: S-2021.06-DWBB_202106.4
//
////////////////////////////////////////////////////////////////////////////////

STIL 1.0 {
  CTL P2001.10;
  Design P2001.1;
  TCL P2001.1;

}

Header {
Pragma TCL {*
  set ipmbSPRAM 0
  set ipmbDPRAM 1
  set ipmbROM 2
  set SCAN_SUPPORT $SNPS_IP_SCAN
  set RETENTION_SUPPORT 0
  set ROM_PROTOCOL_SUPPORT 0
  set DIAG_DELAY_ENABLE 1
  set JTAG_SUPPORT 1

  for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
    # Set up bus width
   if {$CONTROLLER_TYPE_LIST($i) == $ipmbDPRAM || $CONTROLLER_TYPE_LIST($i) == $ipmbSPRAM } {
      if {$PROGRAMMABLE_SUPPORT_LIST($i)} {
        
          set UP_BUS_MSB($i) 7
        
      } else {
        
          set UP_BUS_MSB($i) 4
        
      }

    # Set down bus width
    if { $PROGRAMMABLE_SUPPORT_LIST($i) } {
      set DOWN_BUS_MSB($i) 8
    } else {
      set DOWN_BUS_MSB($i) 5
    }

    if { $RETENTION_ENABLE_LIST($i) } {
      incr UP_BUS_MSB($i)
      incr DOWN_BUS_MSB($i)
      set RETENTION_SUPPORT 1
    }    
 
    if { $DIAG_DELAY_ENABLE } {
      incr DOWN_BUS_MSB($i)
    } 
    if { $REPAIR_SUPPORT_LIST($i) } {
      incr UP_BUS_MSB($i)
      incr DOWN_BUS_MSB($i)
      incr DOWN_BUS_MSB($i)
    }    
    if { $BURN_IN } {
      incr DOWN_BUS_MSB($i)
    }

  } elseif {$CONTROLLER_TYPE_LIST($i) == $ipmbROM} {
      set UP_BUS_MSB($i) 4
      set DOWN_BUS_MSB($i) 5
      if {[string compare $SIGNATURE_COMPARISON_LIST($i) "EXTERNAL"] == 0} {
        set ROM_PROTOCOL_SUPPORT 1
      }
      if { $DIAG_DELAY_ENABLE } {
	incr DOWN_BUS_MSB($i)
      } 
      if { $BURN_IN } {
	incr DOWN_BUS_MSB($i)
      }

    }
  } ;# for NUMBER_OF_GROUPS
# The list of busses
set BUSSES {}
*}

Pragma TCL {*
  puts " Title \"config_${MODULE_SUFFIX}\";"
*}

Pragma TCL {*
  if {$NUMBER_OF_GROUPS == 1} {
    set CONTROL_DATA_WIDTH 4
  } else {
    set CONTROL_DATA_WIDTH [expr {3 + int(ceil(log(abs(double($NUMBER_OF_GROUPS)))/log(2)))}]
  }

  set CONTROL_COUNTER_WIDTH [expr {int(ceil(log(abs(double([expr ($CONTROL_DATA_WIDTH + 4 +1)])))/log(2)))}]
  set CONTROL_COUNTER_MSB [expr ($CONTROL_COUNTER_WIDTH - 1)]
  set DIAG_SEL_MSB [expr ($NUMBER_OF_GROUPS - 1)]
  set DIAG_DATA_MSB [expr ($NUMBER_OF_GROUPS * 2 - 1)]
*}

}


Pragma TCL {*
puts "Variables {"

set cum_prog 0
for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
    if {$PROGRAMMABLE_SUPPORT_LIST($i)} {
	set cum_prog [expr ($cum_prog + 1)]
    }
}

if {$cum_prog > 0} {
  puts "SignalVariable use_prog;
        SignalVariable prog_stream;"
}

puts "
  IntegerConstant num_rel_ports_up=0;
  Integer num_clock_cycles;
  Integer seq_enable;
  Integer number_of_faults;
  IntegerConstant fail_limit = 1;
"

if { $RETENTION_SUPPORT } {
puts "
    IntegerConstant retention_pause_num_clock_cycles = 10;
"
}

set serial_reg_length 0

############# register 1
if {$REPAIR_SUPPORT} {
  ### output: pause field
  incr serial_reg_length
} 

############# register 2 to n+1
for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
    ### output: cntrl status i field
    incr serial_reg_length
}


############# register n+2
### output: end field
incr serial_reg_length

############# register n+3
### output: error field
incr serial_reg_length

############# register n+4
if {$RETENTION_SUPPORT} {
  ### output: pause field
  incr serial_reg_length
} 

############# register n+5
if {$BURN_IN} {
 ### output: burn in field
incr serial_reg_length
} 

puts "}"
     
*}




Signals {
clk                  In;
rst                  In;
mbist_connect        In;
mbist_on             In;
mbist_diagnosis      In;
mbist_end           Out;
mbist_error         Out;
mbist_diag_o        Out;
Pragma TCL {*

for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
  puts "
    mbist${i}_down\[$DOWN_BUS_MSB($i)..0\] Out;
    mbist${i}_up\[$UP_BUS_MSB($i)..0\] In;
  "
  lappend BUSSES  mbist${i}_down
  lappend BUSSES  mbist${i}_up
} ;# for NUMBER_OF_GROUPS


if {$cum_prog > 0} {
  puts " mbist_programmable  In;"
  puts " mbist_prog_e  In;"
  puts " mbist_prog_i  In;"
  puts " mbist_prog_l  Out;"
}

if {$JTAG_SUPPORT} {
  if { $NUMBER_OF_GROUPS == 1 } {
    puts " mbist_select   In;"
  } else {
    puts [format " mbist_select\[%d..0\]   In;" [expr ($NUMBER_OF_GROUPS - 1)]]
    lappend BUSSES  mbist_select
  }
}

if {$SCAN_SUPPORT} {
 puts " scan_en  In;"
}

if { $RETENTION_SUPPORT } {
 puts " mbist_resume  In;"
 puts " mbist_pause  Out;"
}

if { $DIAG_DELAY_ENABLE } {
 puts " mbist_diag_shift  In;"
} 

if { $JTAG_SUPPORT } {
 puts " mbist_serial_en  In;"
 puts " mbist_serial_in  In;"
 puts " mbist_serial_out  Out;"
 puts " mbist_load_en  In;"
 puts " mbist_capture_en  In;"
 puts " mbist_update_en  In;"
   if { $NUMBER_OF_GROUPS == 1 } {
 puts " mbist_status   Out;"
   } else {
 puts [format " mbist_status\[%d..0\]   Out;" [expr ($NUMBER_OF_GROUPS - 1)]]
 lappend BUSSES  mbist_status
   }
}

if {$REPAIR_SUPPORT} {
    puts " mbist_repair_enable  In;"
    puts " mbist_repair_used  Out;"
}

if {$BURN_IN } {
    puts " mbist_bi  In;"
} 

*}
}

Pragma TCL {*
  puts "
    ScanStructures go_nogo {
"
if { $JTAG_SUPPORT } {
  puts "
      ScanChain serial_reg {
        ScanIn mbist_serial_in;
        ScanOut mbist_serial_out;
        ScanEnable mbist_load_en;
        ScanLength ${serial_reg_length};
        ScanCells "  
        if {$RETENTION_SUPPORT == 1} {
         puts " \"i_mode_reg_0/resume_pause_q_reg\" "
        }
        puts " 
             \"i_mode_reg_0/diag_error_q_reg\"
             \"i_mode_reg_0/prog_end_q_reg\" "
        for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
         puts " \"i_mode_reg_0/select${i}_status${i}_q_reg\" "
        }
        if {$REPAIR_SUPPORT} {
         puts " \"i_mode_reg_0/re_ru_q_reg\" "
        }
        if {$BURN_IN} {
         puts " \"i_mode_reg_0/bi_q_reg\" "
        }
        puts ";"
        puts "
        ScanMasterClock clk;
       } "
       
  puts "
      ScanChain diag_reg {
        ScanOut mbist_diag_o;
        ScanEnable mbist_diag_shift;
        ScanLength 1; // Empty scan chains cause fatal.
        ScanMasterClock clk;
      }
"
  if {$cum_prog > 0} {
    puts "
      ScanChain prog_reg {
        ScanIn mbist_prog_i;
        ScanEnable mbist_prog_e;
        ScanLength 1; // Empty scan chains cause fatal.
        ScanMasterClock clk;
      }
    "
  }
}
  puts "
    }

    ScanStructures diagnose {
"
if { $JTAG_SUPPORT } {
  puts "
      ScanChain serial_reg {
        ScanIn mbist_serial_in;
        ScanOut mbist_serial_out;
        ScanEnable mbist_load_en;
        ScanLength ${serial_reg_length};
        ScanCells " 
        if {$RETENTION_SUPPORT == 1} {
         puts " \"i_mode_reg_0/resume_pause_q_reg\" "
        }
        puts "
               \"i_mode_reg_0/diag_error_q_reg\"
               \"i_mode_reg_0/prog_end_q_reg\" "
       
       for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
         puts " \"i_mode_reg_0/select${i}_status${i}_q_reg\" "
       }
       if {$REPAIR_SUPPORT} {
         puts " \"i_mode_reg_0/re_ru_q_reg\" "
       }
       if {$BURN_IN} {
         puts " \"i_mode_reg_0/bi_q_reg\" "
       }

        puts ";"
        puts "
        ScanMasterClock clk;
        } "
   puts "
      ScanChain diag_reg {
        ScanOut mbist_diag_o;
        ScanEnable mbist_diag_shift;
        ScanLength 1; // Empty scan chains cause fatal.
        ScanMasterClock clk;
      }
"
  if {$cum_prog > 0} {
    puts "
      ScanChain prog_reg {
        ScanIn mbist_prog_i;
        ScanEnable mbist_prog_e;
        ScanLength 1; // Empty scan chains cause fatal.
        ScanMasterClock clk;
      }
    "
  }
}
  puts "
    }
  "

*}

Pragma TCL {*
  puts "
ScanStructures Internal_scan {
"
if { $SCAN_SUPPORT && $JTAG_SUPPORT } {
puts "
   ScanChain mode_reg {
      ScanIn mbist_serial_in;
      ScanOut mbist_serial_out;
      ScanEnable mbist_load_en;
      ScanCells  \"i_mode_reg_0/prog_end_q_reg\" "
  if {$RETENTION_SUPPORT == 1} {
puts "           \"i_mode_reg_0/resume_pause_q_reg\" "
  }
  for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
puts "           \"i_mode_reg_0/select${i}_status${i}_q_reg\" "
  }
 if {$REPAIR_SUPPORT} {
puts "           \"i_mode_reg_0/re_ru_q_reg\" "
 }
 
puts "           \"i_mode_reg_0/diag_error_q_reg\";
      ScanMasterClock clk;
   } "
  if {$cum_prog > 0} {
    puts "
      ScanChain prog_reg {
        ScanIn mbist_prog_i;
        ScanEnable mbist_prog_e;
        ScanLength 1; // Empty scan chains cause fatal.
        ScanMasterClock clk;
      }
    "
  }
}

if {$SNPS_IP_SCAN==1} { puts "
   ScanChain unstitched {
    ScanCells s_control_counter_q_reg\[$CONTROL_COUNTER_MSB..0\] 
              s_diag_sel_q_reg\[$DIAG_SEL_MSB..0\]
              s_diag_sel_ack_q_reg\[$DIAG_SEL_MSB..0\]
              s_diag_data_q_reg\[$DIAG_DATA_MSB..0\]"
              for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
                if {$PROGRAMMABLE_SUPPORT_LIST($i)} {
                  puts " \"i_program_transmitter_${i}/s_trans_data_reg\"\[1..0\] "
                  puts " \"i_program_transmitter_${i}/s_trans_pending_q_reg\" "
                  puts " \"i_program_transmitter_${i}/s_trans_ack_prev_reg\"\[1..0\] "
                  puts " \"i_program_transmitter_${i}/s_trans_ack_q_reg\"\[1..0\] "
                }
              }
              if {$RETENTION_SUPPORT == 1} {
                  puts " mbist_resume_q_reg"
                  puts " \"i_mode_reg_0/test_pause_reg\" "
                  puts " \"i_mode_reg_0/u_resume_q_reg\" "
              } 
	      if { $DIAG_DELAY_ENABLE } {
                  puts " mbist_diag_shift_q_reg"
	      }
	      if { $JTAG_SUPPORT } {
                  puts " \"i_mode_reg_0/bist_en_q_reg\" "
                  puts " \"i_mode_reg_0/u_diag_q_reg\" "
		  if {$cum_prog > 0} {
		    puts " \"i_mode_reg_0/u_prog_q_reg\" "
		    puts " \"i_prog_en_0/prog_e_q_reg\"\[0\] "
		  }
		  for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
		      puts " \"i_mode_reg_0/u_select${i}_q_reg\" "
		  }
		 
                  if {$REPAIR_SUPPORT} {
                    puts " \"i_mode_reg_0/u_re_ru_q_reg\" "
                  }

                  if {$BURN_IN} {
                    puts " \"i_mode_reg_0/bi_q_reg\" "
                    puts " \"i_mode_reg_0/u_bi_q_reg\" "
                  }

	      }
              if {$cum_prog > 0} {
                  puts " s_prog_load_q1_reg"
                  puts " s_prog_load_q2_reg"
              }
 puts "
              s_diag_data_prev_q_reg\[$DIAG_DATA_MSB..0\];

    ScanMasterClock clk;
  } // unstitched
" }
puts " } // ScanStructures Internal_scan " 
*}
MacroDefs mbist_common { 

    "clock_mbist" {
      C { 
	    num_clock_cycles=#; 
      }
      Loop 'num_clock_cycles' { 
  	 V{ 
	    clk = P;
	 } 
      }
    }

Pragma TCL {*
      puts "
 \"test_setup\" {
    C { 
    }
    V { 
        clk = P; 
	rst=0;
	mbist_on=0;
	mbist_load_en=0;
	mbist_serial_in=0;
	mbist_update_en=0;
	mbist_capture_en=0;
	mbist_diag_shift=0;
    	mbist_connect=1;
"

    if {$cum_prog > 0} {
      puts "
	mbist_prog_i=0;
	mbist_prog_e=0;
	"
    }

puts "
   }
   V { 
	rst = 1;
   }
 }
"

if {$cum_prog > 0} {
puts "
  \"load_sequence\" { 
    Loop Data { 
      V {  
	  mbist_prog_i = #;
          mbist_prog_e = 1; 
	}  
      V {  
          mbist_prog_e = 1; 
	}  
      C {  
          mbist_prog_e = 0; 
	}  
    } 
  } 
  \"run_mbist_seq\" { 
    C { 
        seq_enable = #;
      } 
    Loop 'seq_enable' { 
      	load_sequence: Macro \"load_sequence\" {  
	   mbist_prog_i = #;	 
    	   } 
    	clock_mbist: Macro \"clock_mbist\" {  
	   num_clock_cycles= #;
    	   } 
    	} 
  } 
"
puts "
  \"perform_programmable_test\" { 
"
for {set i 1} {$i <= 8} {incr i} {
puts "
      run_mbist_seq${i}: Macro \"run_mbist_seq\" {  
        seq_enable = 'seq${i}_enable';
	mbist_prog_i='seq${i}_stream';	 
	num_clock_cycles='seq${i}_num_clock_cycle';
      }
"
}
puts "  } "
}
*}

}
MacroDefs go_nogo { 


Pragma TCL {*
if { $ROM_PROTOCOL_SUPPORT } {

puts "
   \"strobe_synchronization\" {
       Loop strobe_before_clk_edge {
          V {
	    mbist_diag_shift = 1;
          }
        }
   }
  \"unload_signature\" {
      V {
          mbist_diag_shift = 1;
      }
    Loop Data {
      V {
          mbist_diag_o = #;
          mbist_diag_shift = 1;
      }
    }
    C {
        mbist_diag_shift = 0;
        mbist_diag_o = X;
    }
  } // end unload_signature macro
"

puts "
    \"diag_shift_enable\" {
      V {
	mbist_diag_shift = 1;
      }
    } // end diag_shift_enable macro
"
} 
*}

Pragma TCL {*
    if { $RETENTION_SUPPORT } {
      puts "
    \"retention_pause\" {
        V {
        }
        capture_mbist_results : Macro \"capture_mbist_results\";
        unload_mode_reg: Macro \"unload_mode_reg\" {
  	    mbist_serial_out = #;
        }
        Loop retention_pause_num_clock_cycles {
            V {
                clk = 0;
            }
        }
        load_mode_reg: Macro \"load_mode_reg\" {
	   mbist_serial_in = #;
        }
        update_mode_reg : Macro \"update_mode_reg\";
        V {
        }
    }
"
    }

*}


}

MacroDefs diagnose {

  "unload_diag" { 
      C { 
          num_clock_cycles = #;
      } 
      Loop strobe_before_clk_edge {
        V {
	  clk = P;
        }
      }
      Loop 'num_clock_cycles' { 
	strobe_diag_pins: Macro "strobe_diag_pins";
      } 
  } 

}

Environment {
  CTL {
    Family SNPS_MBIST_root;
   Relation {
Pragma TCL {*
foreach bus $BUSSES {puts " Bus $bus;"}
for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
  puts " Port 'mbist${i}_down\[$DOWN_BUS_MSB($i)..0\]
               + mbist${i}_up\[$UP_BUS_MSB($i)..0\]' ${i}; "
} ;# for NUMBER_OF_GROUPS


puts " Corresponding '"
for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
  if {$i > 0} {
    puts "+"
  }
  puts  "mbist${i}_down\[$DOWN_BUS_MSB($i)..0\]
       + mbist${i}_up\[$UP_BUS_MSB($i)..0\] "
} ;# for NUMBER_OF_GROUPS
puts "';"

*}
   }//Relation

External {
Pragma TCL {*
for {set i 0} {$i < $NUMBER_OF_GROUPS} {incr i} {
  for {set j 0} {$j <= $DOWN_BUS_MSB($i)} {incr j} {
    puts " mbist${i}_down\[${j}\]
           {ConnectTo{ Symbolic \"stitch_mbist_down${j}\";}} "
  } ;# down bus width
  for {set j 0} {$j <= $UP_BUS_MSB($i)} {incr j} {
    puts " mbist${i}_up\[${j}\]
           {ConnectTo{ Symbolic \"stitch_mbist_up${j}\";}} "
  } ;# up bus width
} ;# for NUMBER_OF_GROUPS
*}
   }//External
  }//anonymous CTL

Pragma TCL {*
  puts "
  CTL Internal_scan {
    // Martin Bell 2004/09/15 - If we identify Internal_scan mode as
    // MBIST_root, all of the internal scan segments will get unique domain
    // keys, which puts them all in separate scan chains.  See
    // tsd_set_segment_domain_key_w_flag call to tsd_is_open_segment_ok.
    // Family SNPS_MBIST_root;
    TestMode InternalTest;
  "
  if {$SNPS_IP_SCAN==1} {
  puts "
    DomainReferences { ScanStructures Internal_scan; }
    Internal {
  "
if {$JTAG_SUPPORT} { puts "
      clk { DataType ScanMasterClock User snps_bist_clk
                 { ActiveState ForceUp;}}
      mbist_serial_in {
         CaptureClock clk { LeadingEdge; }
         DataType ScanDataIn { ScanDataType Internal; }
         ScanStyle MultiplexedData;}
      mbist_serial_out {
         LaunchClock clk { LeadingEdge; }
         DataType ScanDataOut { ScanDataType Internal; }
         ScanStyle MultiplexedData;}
" }
  puts "
      scan_en { DataType ScanEnable {ActiveState ForceUp;} }
      mbist_connect { DataType TestMode { ActiveState ForceUp; } }
    } // Internal
  "
}
puts "
  } // CTL Internal_scan
" *}
  
CTL passive { // Shut off unused controller
    Family SNPS_MBIST_root;
    TestMode Bypass;
    Internal {
      mbist_connect { DataType TestMode { ActiveState ForceDown; } }
    }
  } // CTL passive

CTL go_nogo {// Test to identify failing memories
    Family SNPS_MBIST_root;
    TestMode ExternalTest;
    DomainReferences {
      ScanStructures go_nogo;
      MacroDefs mbist_common;
      MacroDefs go_nogo;
    }

Pragma TCL {*
puts "Internal { 
      clk { DataType ScanMasterClock User snps_bist_clk_lu
                   { ActiveState ForceUp; } }
      rst { DataType Asynchronous Reset User snps_bist_reset
                { ActiveState ForceDown;} }
      mbist_connect { DataType TestMode { ActiveState ForceUp; } }
      mbist_on { DataType TestRun User snps_bist_run { ActiveState ForceUp; } }
      mbist_diag_o { LaunchClock clk { LeadingEdge; } 
                     DataType ScanDataOut { ScanDataType Internal; } 
                     ScanStyle MultiplexedData;}
"
if { $DIAG_DELAY_ENABLE } {
   puts "mbist_diag_shift { DataType ScanEnable { ActiveState ForceUp; } }"
} 


if { $JTAG_SUPPORT } {
   puts "mbist_serial_in {
         CaptureClock clk { LeadingEdge; }
         DataType ScanDataIn { ScanDataType Internal; }
         ScanStyle MultiplexedData;}"

   puts "mbist_serial_out {
         LaunchClock clk { LeadingEdge; }
         DataType ScanDataOut { ScanDataType Internal; }
         ScanStyle MultiplexedData;}"
 
   puts "
     mbist_load_en { DataType ScanEnable { ActiveState ForceUp; } }
     mbist_update_en { DataType OutEnable User \"IEEE1149.1\" { ActiveState ForceUp; } }
     mbist_capture_en { DataType ClockEnable User \"IEEE1149.1\" { ActiveState ForceUp; } }
   "

if {$cum_prog > 0} {
   puts "
     mbist_prog_e { DataType ScanEnable { ActiveState ForceUp; } }
   "
   puts "mbist_prog_i {
         CaptureClock clk { LeadingEdge; }
         DataType ScanDataIn { ScanDataType Internal; }
         ScanStyle MultiplexedData;}"
}

} 

puts "}"

*}
}//CTL go_nogo

CTL diagnose { // Test to diagnose failing memories
    Family SNPS_MBIST_root;
    TestMode Debug;
    DomainReferences {
      ScanStructures diagnose;
      MacroDefs mbist_common;
      MacroDefs diagnose;
    }

Pragma TCL {*
puts "Internal { 
        clk { DataType ScanMasterClock User snps_bist_clk_lu
                     { ActiveState ForceUp; } }
        rst { DataType Asynchronous Reset User snps_bist_reset
                { ActiveState ForceDown;} }
        mbist_connect { DataType TestMode { ActiveState ForceUp; } }
        mbist_on { DataType TestRun User snps_bist_run { ActiveState ForceUp; } }
        mbist_diag_o { LaunchClock clk { LeadingEdge; } DataType ScanDataOut { ScanDataType Internal; } ScanStyle MultiplexedData;}

"

if { $DIAG_DELAY_ENABLE } {
   puts "mbist_diag_shift { DataType ScanEnable { ActiveState ForceUp; } }"
} 

if { $JTAG_SUPPORT } {
   puts "mbist_serial_in {
        CaptureClock clk { LeadingEdge; }
        DataType ScanDataIn { ScanDataType Internal; }
        ScanStyle MultiplexedData; }"

   puts "mbist_serial_out {
         LaunchClock clk { LeadingEdge; }
         DataType ScanDataOut { ScanDataType Internal; }
         ScanStyle MultiplexedData;}"
   puts "
     mbist_load_en { DataType ScanEnable { ActiveState ForceUp; } }
     mbist_update_en { DataType OutEnable User \"IEEE1149.1\" { ActiveState ForceUp; } }
     mbist_capture_en { DataType ClockEnable User \"IEEE1149.1\" { ActiveState ForceUp; } }
   "

if {$cum_prog > 0} {
   puts "
     mbist_prog_e { DataType ScanEnable { ActiveState ForceUp; } }
   "
   puts "mbist_prog_i {
        CaptureClock clk { LeadingEdge; }
        DataType ScanDataIn { ScanDataType Internal; }
        ScanStyle MultiplexedData;}"
}

} 

puts "}"      
*}

}//CTL diagnose
}




