//-----------------------------------------------------------------------------
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2004 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Sanjay P.,  July 1, 2004
//
// VERSION:   CTL file for Scan DeCompressor
//
// DesignWare_version: 1a8e0e72
// DesignWare_release: V-2004.06-DWF_0406
//
//-----------------------------------------------------------------------------
STIL 1.0 {
  CTL P2001.1;
  Design P2001.1;
  TCL 2008;
}

Header {
    Title "Minimal STIL for design `DFT_ScanDecompressor'";
    Date "Tue Feb 25 10:24:19 2003";
    Source "DFT Compiler B-2008.09";
}


Signals {
  Pragma TCL {*
     ########### Calculate log2 of number of modes#################
     if {$number_of_modes == 1} {
        set number_of_sel_ports  0
     } else {
        set number_of_sel_ports [expr $number_of_modes-1] ;
        for {set n  0} { $number_of_sel_ports > 0} { incr n } {
           set number_of_sel_ports [expr $number_of_sel_ports >> 1]
        }
      set number_of_sel_ports $n ;
     }

     ###############################################################

     puts [format "din\[%d..0\] In;" [expr ($number_of_inputs - $number_of_sel_ports -1)] ];
     if {$number_of_sel_ports != 0} {puts [format "sel\[%d..0\] In;" [expr ($number_of_sel_ports - 1)]];}
     puts [format "dout\[%d..0\] Out;" [expr ($number_of_outputs + $number_of_mask_selectors - 1)]];
  *} 
}
Environment {
  CTL {
    Relation {
       Bus din;
       Bus sel;
       Bus dout;
    }
  }
  CTL decompress {
    Family SNPS_SCAN_DECOMPRESSOR;
    TestMode Control;
    DomainReferences {
       ScanStructures decompress;
    }
    Pragma TCL {*	
        ## returns decimal2binary
        proc dec2bin {dec m} {
            binary scan [binary format c $dec] B* bin
            set n [expr $m-1];
            string range $bin end-$n end
        }

        proc int_to_char {dec} {
          return [string map {0 a 1 b 2 c 3 d 4 e 5 f 6 g} $dec];
        }

     ########### Calculate log2 of number of modes#################
     if {$number_of_modes == 1} {
        set number_of_sel_ports  0
     } else {
        set number_of_sel_ports [expr $number_of_modes-1] ;
        for {set n  0} { $number_of_sel_ports > 0} { incr n } {
           set number_of_sel_ports [expr $number_of_sel_ports >> 1]
        }
      set number_of_sel_ports $n ;
     }

     ###############################################################

        set connection_idx 0;
        puts [format " Internal { "];
        for {set i 0} {$i< [expr $number_of_inputs - $number_of_sel_ports]} {incr i} {
          puts [format "  din\[%d\] \{" $i];
          puts [format "    DataType ScanDataIn \{ScanDataType Internal;\}"];
          for {set j 0} {$j<$number_of_modes} {incr j} {
            set first 1;
            puts -nonewline [format "    IsConnected In \{\n\tSignal \' "];
            for {set k 0} {$k<$number_of_outputs} {incr k} {
              set mode_idx [expr $k*$number_of_modes+$j];
              set inv_mode_idx [expr (-1)*($load_connections($mode_idx) + 1)];

              if {$load_connections($mode_idx) == $i} {
                if {$first == 1} {
                  puts -nonewline [format "dout\[$k\]"];
                  set first 0;
                } else {
                  puts -nonewline [format "+dout\[$k\]"];
                }
              } elseif {$inv_mode_idx == $i } {
                if {$first == 1} {
                  puts -nonewline [format "dout\[$k\]"];
                  set first 0;
                } else {
                  puts -nonewline [format "+dout\[$k\]"];
                }
	      }
            }
            for {set k 0} {$k<$number_of_mask_selectors} {incr k} {
              set mode_idx [expr $k*$number_of_modes+$j];
              if {$load_mask_connections($mode_idx) == $i} {
                  puts -nonewline [format "+dout\[[expr $k + $number_of_outputs]\]"];
              } 
            }
            puts [format "\' ;"];
	
            if {$number_of_sel_ports != 0} {
            set bin_val_for_mode [dec2bin $j $number_of_sel_ports];
	    puts -nonewline [format "\tIsGatedBy LogicAnd "];
	    for {set k 0} {$k<$number_of_sel_ports} {incr k} {
		if {$k != 0 } {
	          puts -nonewline [format " & "];
	        }
	        set char_val [int_to_char $k];
	        if {[string index $bin_val_for_mode $k] == "0"} {
	           puts -nonewline [format "~$char_val"];
	        } else {
	          puts -nonewline [format "$char_val"];
	        }
	     }
	     puts -nonewline [format " \{\n\t"];
	     for {set k 0} {$k<$number_of_sel_ports} {incr k} {
	       set char_val [int_to_char $k];
	       puts [format "\t   $char_val \{Type Signal; Name sel\[$k\];\}"];
	     }
	     puts [format "\t\}"];
	    }
            
            puts [format "     \}"];
          }
          puts [format "  \}"];
        }
	for {set k 0} {$k < $number_of_sel_ports}  {incr k} {  
          puts [format "sel\[%d\] {" $k ];
          puts [format "    DataType ScanDataIn \{ScanDataType Internal;\}"];  
          puts [format "  }"];
        }	
        for {set k 0} {$k< $number_of_outputs} {incr k} {
	  if { $k >= $sccomp_begin_count && $k <= $sccomp_end_count  } {
          puts [format "  dout\[%d\] {" $k];

	  if { $k < $number_of_clkchain_outputs } {
	    puts [format "    DataType Oscillator {}"];
	    puts [format "    DataType ScanDataOut {ScanDataType DataGenerator;}"];
	  } else {
            puts [format "    DataType ScanDataOut {ScanDataType DataGenerator;}"];
	  }
          puts [format "  }"];
	  }
        }
	if {$number_of_mask_selectors != 0} {
    	  set index 0
	  for {set k $number_of_outputs} {$k < [expr $number_of_outputs + $number_of_mask_selectors]} {incr k} {
            puts [format "  dout\[%d\] {" $k];
            puts [format "    DataType TestControl;"]
	    
	    if {$put_xtol_modes != 0} {    		   
  	      set  index_offset [expr $k - $number_of_outputs];
 	      if {$index_offset > 0} {
	        set  index [expr $index +  $number_of_modes];
              }	
	      for {set j 0} {$j<$number_of_modes} {incr j} {
	        set mask_index [expr $index +  $j];
	        if {$load_mask_connections($mask_index) < 0} {

		  puts [format "    IsConnected In \{\n\tSignal sel\[0\];  "];
	          if {$load_mask_connections($mask_index) == -1} {
		    puts [format "    Transform \{\n\tInvert;\}  "];
		  }	
		  set bin_val_for_mode [dec2bin $j $number_of_sel_ports];	
		  puts [format "    IsGatedBy LogicAnd  "];
		  for {set m 0} {$m<$number_of_sel_ports} {incr m} {
		    if {$m != 0 } {
		      puts -nonewline [format " & "];
		    }	
		    set char_val [int_to_char $m];
	            if {[string index $bin_val_for_mode $m] == "0"} {
		      puts -nonewline [format "~$char_val"];
		    } else {	
	              puts -nonewline [format "$char_val"];
	            }

		  }
    	          puts -nonewline [format " \{\n\t"];			
		  for {set b 0} {$b < $number_of_sel_ports}  {incr b} {                     
		    set char_val [int_to_char $b];
		    puts [format "\t   $char_val \{Type Signal; Name sel\[$b\];\}"];
		  }	
		  puts [format "\t\} "];
		  puts [format "     \} "];

	        }
	     }	    
	   }

           puts [format "  }"];
         }
       }

       puts [format "}"];
    *} 	
  }
}

Environment dftSpec {
    CTL decompress {
	DFTSpecification {
	   ScanCompressionIPParameters {
	   Pragma TCL {*
		puts [format "IPScanIns %d;" $number_of_inputs];
		puts [format "IPInternalChainCount %d;" $number_of_outputs];
	        puts [format "IPNumModes %d;" $number_of_modes];
		puts [format "IPRepeatPeriod %d;" $period];
          *}
  	   }
       }
    }
}
