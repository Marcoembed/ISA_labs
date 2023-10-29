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
// MODIFIED:  Sanjay R.,  August 26 2005. Added X tolerance features
//
// VERSION:   CTL file for Scan Compressor
//
// DesignWare_version: 1a8e0e72
// DesignWare_release: V-2004.06-DWF_0406
//
// Parameters:
// ------------
// number_of_inputs
// number_of_outputs
// number_of_selectors
// number_of_disables
// number_of_compr_modes
// default_unload_connections (array)
// mask_unload_connections (array)
// fanout
// diagnosis
// put_xtol_modes
//-----------------------------------------------------------------------------

STIL 1.0 {
  CTL P2001.1;
  Design P2001.1;
  TCL 2008;
}

Header {
    Title "Minimal STIL for design `DFT_ScanCompressor'";
    Date "Tue Feb 25 10:24:19 2003";
    Source "DFT Compiler B-2008.09";
}

Signals {
 Pragma TCL {*
    puts [format "din\[%d..0\] In;" [expr ($number_of_inputs - 1)]];
    puts [format "dout\[%d..0\] Out;" [expr ($number_of_outputs - 1)]];
    if {$number_of_selectors != 0} {
	puts [format "sel\[%d..0\] In;" [expr ($number_of_selectors - 1)]];
	puts [format "enable In;"];
     }
    if {$number_of_disables != 0} {puts [format "pwr_save_n In;"]}
 *}
}

Environment {
  CTL {
    Relation {
     Bus din;
     Bus dout;
     Pragma TCL {*
      if {$number_of_selectors != 0} {puts [format "Bus sel;"]}
    *}
    }
  }
  CTL compress {
    Family SNPS_SCAN_COMPRESSOR;
    TestMode Control;
     Pragma TCL {*	
	
 	## returns decimal2binary
        proc dec2bin {dec m} {
            binary scan [binary format c $dec] B* bin
            set n [expr $m-1];
            string range $bin end-$n end
        }

	## return character to string map
        proc int_to_char {dec} {
          return [string map {0 a0 1 a1 2 a2 3 a3 4 a4 5 a5 6 a6 7 a7 8 a8 9 a9 10 a10 11 a11 12 a12 13 a13 14 a14 15 a15 16 a16 17 a17 18 a18 19 a19 20 a20} $dec];
        }

       #Start printing the CTL	 	
       set connection_idx 0;
       set mask_idx 0;
       
       puts [format " Internal { "]; 
       
	for {set i 0} {$i<$number_of_outputs} {incr i} {

          puts [format "dout\[%d\] {" $i]; 
	
          puts [format "    DataType ScanDataOut {ScanDataType Internal;}"];
	
          ## The one-hot connections
      	  if {$put_xtol_modes != 0} {    	
       	   if {$number_of_selectors != 0} {    

	    for {set mode_idx 0} {$mode_idx < $number_of_compr_modes} {incr mode_idx} {
                    
  	           # Signal	
	      if {$mask_unload_connections($mask_idx) > 0} {
		     puts -nonewline [format "    IsConnected Out "];
                     if {$mask_unload_connections($mask_idx) == 1} {
                        puts -nonewline [format "Indirect "];
                     } else {
                        puts -nonewline [format "Transitive "];
	             }
		     puts -nonewline [format "{ \n\t Signal \'"]; 
		     
                     ## Connection
		     for {set j 1} {$j <= $mask_unload_connections($mask_idx)} {incr j} {
		       set tmp_idx [expr $mask_idx + $j];
		       puts -nonewline [format "din\[$mask_unload_connections($tmp_idx)\]"];
		       if {$j != $mask_unload_connections($mask_idx)} {
			 puts -nonewline [format "+"];
		       }
		     }
		     set mask_idx [expr $mask_idx + $mask_unload_connections($mask_idx) + 1];
		     puts [format "\'\;\n"]; 
		     
		     set bin_val_for_mode [dec2bin $mode_idx $number_of_selectors];
			     
		     puts -nonewline [format "\tIsGatedBy LogicAnd "];
		     for {set k 0} {$k<$number_of_selectors} {incr k} {
		       if {$k != 0} {
			 puts -nonewline [format " & "];
		       }
		       set char_val [int_to_char $k];
		       if {[string index $bin_val_for_mode $k] == "0"} {
			 puts -nonewline [format "~$char_val"];
		       } else {
			 puts -nonewline [format "$char_val"];
		       }
		     }
		     
                     # Print Enable signal
		     set char_val [int_to_char $number_of_selectors];
		     puts -nonewline [format " & $char_val"];
		     puts -nonewline [format " \{\n\t"];
		     
		     for {set k 0} {$k<$number_of_selectors} {incr k} {
		       set char_val [int_to_char $k];
		       puts [format "\t   $char_val \{Type Signal; Name sel\[$k\];\}"];
		     }
		     
                     #Print Enable signal
		     set char_val [int_to_char $number_of_selectors];
		     puts [format "\t  $char_val \{Type Signal; Name enable;\}"];
		     
		     puts [format "\t\}"];  
		     puts [format " }"]; 
		   } else {
		     set mask_idx [expr $mask_idx + $mask_unload_connections($mask_idx) + 1];
		   }
	    }
              
	   }
	  }
          #End one hot connections 
          ## The All-0 connections to observe all chains
           puts -nonewline [format "    IsConnected Out Transitive { \n\t Signal \'"]; 
	   ### XOR connections
	   for {set j 1} {$j <= $default_unload_connections($connection_idx)} {incr j} {
	     set tmp_idx [expr $connection_idx+$j];
	     puts -nonewline [format "din\[$default_unload_connections($tmp_idx)\]"];
	     if {$j != $default_unload_connections($connection_idx)} {
		puts -nonewline [format "+"];
	     }
  	   }
	   set connection_idx [expr $connection_idx+$default_unload_connections($connection_idx)+1];
	   puts [format "\'\;\n"]; 

           if {$number_of_selectors != 0} {

	     # Print mask selectors
	     puts -nonewline [format "\tIsGatedBy LogicAnd "];
	               
             # Print Enable signal
             set char_val [int_to_char $number_of_selectors];
	     puts -nonewline [format " ~$char_val"];
	     puts -nonewline [format " \{\n\t"];

	     #Print Enable signal
             set char_val [int_to_char $number_of_selectors];
	     puts [format "\t  $char_val \{Type Signal; Name enable;\}"];
	     puts [format "\t\}"]; 
           }

           puts [format " }"]; 
           puts [format "}"]; 
        }
        
        ## The input data types
	for {set i 0} {$i<$number_of_inputs} {incr i} {
	  if { $i >= $sccomp_begin_count && $i <= $sccomp_end_count  } {
          puts [format "din\[%d\] {" $i];
          puts [format "    DataType ScanDataIn {ScanDataType ResponseCompactor;}"];
          puts [format "}"];
	  }
	}
       
        ## The selector data types
	for {set i 0} {$i<$number_of_selectors} {incr i} {
          puts [format "sel\[%d\] {" $i];
          puts [format "    DataType TestControl;"];
          puts [format "}"];
	}
        
        ## The enable signal
          puts [format "enable {"];
          puts [format "    DataType TestData;"];
          puts [format "}"];

        ## The disable line data type
        if {$number_of_disables != 0} {
	  puts [format "pwr_save_n {"];
	  puts [format "     DataType TestMode { ActiveState ForceUp;}"];
	  puts [format "}"];
        }

 	puts [format "}"]; 
    *}       
  }
}


Environment dftSpec {
    CTL  {
    }
    CTL compress {
	DFTSpecification {
	    ScanCompressionIPParameters {
	      Pragma TCL {*
		puts [format "IPScanOuts %d;" $number_of_outputs]; 
		puts [format "IPInternalChainCount %d;" $number_of_inputs];
                puts [format "IPSelectors %d;" $number_of_selectors];
                puts [format "IPDisable %d;" $number_of_disables];
                puts [format "IPNumModes %d;" $number_of_compr_modes];
		puts [format "IPChainFanout %d;" $fanout];
		puts [format "IPDiagnosis %d;" $diagnosis];
	    *}
  	   }
    	}	
    }
}
