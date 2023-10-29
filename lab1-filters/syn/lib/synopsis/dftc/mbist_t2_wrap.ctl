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
// VERSION:   CTL file for mbist_t2_wrap
//
// DFT IP ID: 47432a93
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
set ipmbNONE_REPAIR 0
set ipmbCOLUMN_REPAIR 1
set ipmbROW_REPAIR 2
set ipmbCOLUMN_ROW_REPAIR 3
set ipmbDATABIT_REPAIR 4
set ipmbROW_BEFORE_COLUMN 0
set ipmbCOLUMN_BEFORE_ROW 1
set ipmbMEM_SIG_IN 0
set ipmbMEM_SIG_OUT 1
set ipmbMEM_SIG_TEST 1
set ipmbMEM_LOG_PORT_R 0
set ipmbMEM_LOG_PORT_W 1
set ipmbMEM_LOG_PORT_RW 2
set isWO1 0
set isWO2 0
set isRO1 0
set isRO2 0
set SCAN_SUPPORT $SNPS_IP_SCAN
set ipmb_SIG_REPAIR 2
set ipmbMEM_NO_TOUCH 10
set ipmbGLOBAL_ROW 0
set ipmbPERBANK_ROW 1
set all_topological 1
set ipmbGLOBAL_COLUMN 0
set ipmbPERBANK_COLUMN 1

#set DP logical port modes
if {$MEMORY_TYPE == $ipmbDPRAM} {
 if {$MEMORY_LOGICAL_PORT_MODE(0) == $ipmbMEM_LOG_PORT_W} {
   set isWO1 1
 }	
 if {$MEMORY_LOGICAL_PORT_MODE(1) == $ipmbMEM_LOG_PORT_W} {
   set isWO2 1
 }	
 if {$MEMORY_LOGICAL_PORT_MODE(0) == $ipmbMEM_LOG_PORT_R} {
   set isRO1 1
 }	
 if {$MEMORY_LOGICAL_PORT_MODE(1) == $ipmbMEM_LOG_PORT_R} {
   set isRO2 1
 }
set ONE_RW_PORT [expr (!($isWO1 || $isRO1)) || (!($isWO2 || $isRO2)) ]

}	

  # Set sbl_control bus width
  if {$MEMORY_TYPE == $ipmbSPRAM} {
    set SBL_CNTRL_BUS_MSB 10
    set OPCODE_MSB 7    
      if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR || $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR } {
        set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3]
      }
  } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
    set SBL_CNTRL_BUS_MSB 15
    set OPCODE_MSB 12
      
      if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR || $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
        set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3 ]
      }
  } elseif {$MEMORY_TYPE == $ipmbROM} {
    set SBL_CNTRL_BUS_MSB 9
  }

   if { $MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
     if { $NON_MARCH_TEST_SUPPORT && $CNTRL_MASK_SUPPORT && $ALGO_FA_SUPPORT } {
       set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3 ]
       set OPCODE_MSB [expr $OPCODE_MSB + 3 ]
     }
   }

  # Set sbl_error bus width
  if {$MEMORY_TYPE == $ipmbDPRAM} {
    set SBL_ERR_BUS_MSB 1
  } else {
    set SBL_ERR_BUS_MSB 0
  }

 set ADDRESS_MSB [expr ([expr {int(ceil(log(abs(double($ADDRESS_WORDS)))/log(2)))}]) - 1]
if {$DIAG_FAULTY_DATA_BITS} {
  set ERROR_DETECTION_MODE 2
} else {
  if {$READ_DATA_DELAYED} {
    set ERROR_DETECTION_MODE 1
  } else {
    set ERROR_DETECTION_MODE 0
  }
}
 # sequential bypass flip-flops
  set REDUCED_ADDRESS_WIDTH [expr $ADDRESS_MSB + 1]
  set max_byp_reg 32
  set seq_bypass_type 0
  if { $MEMORY_TYPE != $ipmbROM } {
  if { $SEQUENTIAL_BYPASS && $ERROR_DETECTION_MODE == 0 } { 
   if { $DATA_WIDTH <= $REDUCED_ADDRESS_WIDTH } { 
     set seq_bypass_type 1 
   } else {
      if { $REDUCED_ADDRESS_WIDTH < $max_byp_reg } {
	if { $DATA_WIDTH < $max_byp_reg } {
          set seq_bypass_type 3
	} else {
          set seq_bypass_type 2
	}
      } else {
        set seq_bypass_type 4
      }
    }
  } else {
    set seq_bypass_type 0
  }
 }

# all topological
set test_index 0
if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM} {
  for {set test_index 0} { $test_index < $TEST_NUMBER } {incr test_index} {
    if { $DATA_BACKGROUND_TYPE($test_index) != 0 } {
      set all_topological 0
    }
  }
}


#mask_algo_0
set mask_algo_0 0
for {set algo_index 0} { $algo_index < [array size ALGO_READ_DATA_0] } {incr algo_index} {
  if { [string compare $ALGO_READ_DATA_0($algo_index) ""] != 0 } {
    set mask_algo_0 1
     }
}


# mask_algo_1
if {$MEMORY_TYPE == $ipmbDPRAM} {
  set mask_algo_1 0
  for {set algo_index 0} { $algo_index < [array size ALGO_READ_DATA_1] } {incr algo_index} {
    if { [string compare $ALGO_READ_DATA_1($algo_index) ""] != 0 } {
      set mask_algo_1 1
    }
  }
}

# RAU MSB, ROW MSB, BANK MSB

 if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
   set DATA_CODED [expr ([expr {int(ceil(log(abs(double($DATA_WIDTH)))/log(2)))}])]
   set SAR_MSB [expr [expr 1 + $DATA_CODED] * $EXTRA_COLUMN - 1]
   set COLUMN_RAU_MSB $DATA_WIDTH 
  } 

  if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
set ROW_ADDRESS_SIZE [expr $ROW_ADDRESS_HIGH_BIT - $ROW_ADDRESS_LOW_BIT + 1 - $ROW_REDUNDANCY_FREE_LSB_NUM]
set ROW_RAU_MSB [expr [expr $ROW_ADDRESS_SIZE + 1] * $EXTRA_ROW - 1]
set ROW_ADDRESS_MSB [expr $ROW_ADDRESS_SIZE - 1]
set BANK_ADDRESS_MSB [expr $BANK_ADDRESS_HIGH_BIT - $BANK_ADDRESS_LOW_BIT]
  }
# SAR MSB
if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
  set COLUMN_ADDRESS_SIZE [expr $COLUMN_REPAIR_ADDRESS_HIGH_BIT - $COLUMN_REPAIR_ADDRESS_LOW_BIT + 1]
  set COLUMN_ADDRESS_MSB [expr $COLUMN_ADDRESS_SIZE - 1]
  if {$COLUMN_REDUNDANCY_TYPE == $ipmbGLOBAL_COLUMN} {
   set DATA_CODED [expr ([expr {int(ceil(log(abs(double($DATA_WIDTH)))/log(2)))}])]
   set SAR_MSB [expr [expr $COLUMN_ADDRESS_SIZE + 1 + $DATA_CODED] * $EXTRA_COLUMN - 1]
   set COLUMN_RAU_MSB [expr [expr $COLUMN_ADDRESS_SIZE + $DATA_WIDTH +1] * $EXTRA_COLUMN - 1]
  } elseif {$COLUMN_REDUNDANCY_TYPE == $ipmbPERBANK_COLUMN} {
   set DATA_WIDTH_0 [expr $DATA_HIGH_VALUE_FOR_REDUNDANT_COLUMN(0) - $DATA_LOW_VALUE_FOR_REDUNDANT_COLUMN(0) + 1]
   set DATA_WIDTH_1 [expr $DATA_HIGH_VALUE_FOR_REDUNDANT_COLUMN(1) - $DATA_LOW_VALUE_FOR_REDUNDANT_COLUMN(1) + 1]  
   set DATA_CODED_0 [expr ([expr {int(ceil(log(abs(double($DATA_WIDTH_0)))/log(2)))}])]
   set DATA_CODED_1 [expr ([expr {int(ceil(log(abs(double($DATA_WIDTH_1)))/log(2)))}])]
   set SAR_MSB [expr 2 * $COLUMN_ADDRESS_SIZE + $DATA_CODED_0 + $DATA_CODED_1 + 2 - 1]
   set COLUMN_RAU_MSB [expr 2 * $COLUMN_ADDRESS_SIZE + $DATA_WIDTH + 2 - 1]
  }
}



# The list of busses
set BUSSES {}

*}

Pragma TCL {*
  puts " Title \"config_${MEMORY_MODULE}\";"
*}

}

Variables {
  IntegerConstant num_rel_ports_up=1;
  IntegerConstant depth=16;
}

Signals {
  
Pragma TCL {*

puts " sbl_control\[${SBL_CNTRL_BUS_MSB}..0\] In; "
lappend BUSSES sbl_control
if { $MEMORY_TYPE == $ipmbDPRAM } {
  puts " sbl_error\[${SBL_ERR_BUS_MSB}..0\] Out; "
  lappend BUSSES sbl_error
} else {
  puts " sbl_error Out; "
}

if { $MEMORY_HOLD } {
  puts "mem_hold  In;"
}

set i 0
set j 0
while { $i < $MEMORY_SIG_NUMBER } { 
   # Quote all memory signal names to avoid conflict with STIL
   # reserved names like A and D.
   if { $MEMORY_SIG_SPLIT($j) == 0 } {
     puts " \"$MEMORY_SIG_NAME($i)\""
     if {$MEMORY_SIG_BUS_TYPE($i) != 0} {
       puts "\[$MEMORY_SIG_LEFT_INDEX($i)..$MEMORY_SIG_RIGHT_INDEX($i)\]"
       lappend BUSSES \"$MEMORY_SIG_NAME($i)\"
     }
     if {$MEMORY_SIG_DIR($i) == $ipmbMEM_SIG_IN} {
       puts " In;"
     } elseif {$MEMORY_SIG_DIR($i) == $ipmbMEM_SIG_OUT} {
       puts " Out;"
     }
   } else {
    # compute msb and lsb
      set split_sg_nb $MEMORY_SIG_SPLIT($j)
      set s $i
      set min_left $MEMORY_SIG_LEFT_INDEX($s)
      set max_left $MEMORY_SIG_LEFT_INDEX($s)
      set min_right $MEMORY_SIG_RIGHT_INDEX($s)
      set max_right $MEMORY_SIG_RIGHT_INDEX($s)
      for {set s $i} { $s < ( $i + $split_sg_nb ) } {incr s} {
	if {$MEMORY_SIG_LEFT_INDEX($s) > $max_left} {
          set max_left $MEMORY_SIG_LEFT_INDEX($s)
        } 
	if {$MEMORY_SIG_LEFT_INDEX($s) < $min_left} {
          set min_left $MEMORY_SIG_LEFT_INDEX($s) 
        }
 	if {$MEMORY_SIG_RIGHT_INDEX($s) > $max_right} {
          set max_right $MEMORY_SIG_RIGHT_INDEX($s)
        } 
	if {$MEMORY_SIG_RIGHT_INDEX($s) < $min_right} {
          set min_right $MEMORY_SIG_RIGHT_INDEX($s) 
        }
     }
     if { $max_left > $max_right } {
       set msb $max_left
     } else {
       set msb $max_right
     }
     if { $min_left < $min_right } {
       set lsb $min_left
     } else {
       set lsb $min_right
     }
      puts " \"$MEMORY_SIG_NAME($i)\""
      puts "\[$msb..$lsb\]"
      lappend BUSSES \"$MEMORY_SIG_NAME($i)\"
      if {$MEMORY_SIG_DIR($i) == $ipmbMEM_SIG_IN} {
        puts " In;"
      } elseif {$MEMORY_SIG_DIR($i) == $ipmbMEM_SIG_OUT} {
        puts " Out;"
      }
   }
   if {$MEMORY_SIG_SPLIT($j) != 0} {
     set i [ expr $i + $MEMORY_SIG_SPLIT($j) ]
   } else {
     set i [ expr $i + 1 ]
   }
   set j [ expr $j + 1 ]
}
if {$SCAN_SUPPORT == 1} {
  if { $ERROR_DETECTION_MODE == 2} {
    if {$MEMORY_TYPE == $ipmbSPRAM} {
      puts " scan_r2_error_vector_in   In; "
      puts " scan_r2_error_vector_out  Out; "
    } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
      if {!$isWO1} {
        puts " scan_r2_error_vector_in_0   In; "
        puts " scan_r2_error_vector_out_0  Out; "
      }
      if {!$isWO2} {
        puts " scan_r2_error_vector_in_1   In; "
        puts " scan_r2_error_vector_out_1  Out; "
      }
    }
  }
   if { $NON_MARCH_TEST_SUPPORT } {
     if { $MEMORY_TYPE == $ipmbSPRAM || ($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT) } {
         puts " scan_oadf_shift_reg_in   In; "
         puts " scan_oadf_shift_reg_out  Out; "
     }
   } 
  
   if { ($NON_MARCH_TEST_SUPPORT && ($MEMORY_TYPE == $ipmbSPRAM || (($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT)))) || $ERROR_DETECTION_MODE == 2 || $REPAIR_TYPE_ENUM != $ipmbNONE_REPAIR} {
          puts " scan_en  In; "
   }
 
}

if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM} {
 if {$X_FIXING && !$SHADOW_DISABLE} {
    puts " mbist_bypass In;"
  }
}
 if {$MEMORY_TYPE == $ipmbROM} {
   puts " sbl_shift In;"
 }

if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR || $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
 puts " sar_clk In;"
 puts " repair_si In;"
 puts " repair_so Out;"
 puts " repair_se In;"
 puts " repair_used Out;"
}

*}


sbl_clk           In;
sbl_rst           In;


                             
}
Pragma TCL {*
if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR } {
puts "
ScanStructures repair {
  ScanChain mbist_repair_chain {
      ScanCells \"row_repair_0/sar_q_reg\"\[$ROW_RAU_MSB..0\];
      ScanIn repair_si;
      ScanOut repair_so;
      ScanEnable repair_se;
      ScanMasterClock sar_clk;
   }
}
  "
  } elseif {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
puts "
ScanStructures repair {
  ScanChain mbist_repair_chain {
      ScanCells \"column_repair_0/sar_q_reg\"\[$SAR_MSB..0\];
      ScanIn repair_si;
      ScanOut repair_so;
      ScanEnable repair_se;
      ScanMasterClock sar_clk;
   }
} "
  } elseif {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
puts "
ScanStructures repair {
  ScanChain mbist_repair_chain {
      ScanCells \"column_repair_0/sar_q_reg\"\[$SAR_MSB..0\] \"row_repair_0/sar_q_reg\"\[$ROW_RAU_MSB..0\];
      ScanIn repair_si;
      ScanOut repair_so;
      ScanEnable repair_se;
      ScanMasterClock sar_clk;
   }
} "
  }


 
  if {$SCAN_SUPPORT==1} {
    puts "
ScanStructures Internal_scan {
	"	
  if {$ERROR_DETECTION_MODE == 2} {
    if {$MEMORY_TYPE == $ipmbSPRAM} {
  puts "
  ScanChain r2_error_vector_reg {
      ScanCells \"error_detection_0/read_data_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\]; 
      ScanIn scan_r2_error_vector_in;
      ScanOut scan_r2_error_vector_out;
      ScanEnable scan_en;
      ScanMasterClock sbl_clk;
   }
  "
    } elseif {$MEMORY_TYPE == $ipmbDPRAM} {

  if {!$isWO1} {
   puts "
   ScanChain r2_error_vector_reg_0 {
      ScanCells \"error_detection_0/read_data_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\];
      ScanIn scan_r2_error_vector_in_0;
      ScanOut scan_r2_error_vector_out_0;
      ScanEnable scan_en;
      ScanMasterClock sbl_clk;
   }  
   	"
  }
  if {!$isWO2} {  
   puts "
     ScanChain r2_error_vector_reg_1 {
      ScanCells \"error_detection_1/read_data_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\];
      ScanIn scan_r2_error_vector_in_1;
      ScanOut scan_r2_error_vector_out_1;
      ScanEnable scan_en;
      ScanMasterClock sbl_clk;
   }  
  	"
  }  
   } 
  }

   if { $NON_MARCH_TEST_SUPPORT } {
     if { $MEMORY_TYPE == $ipmbSPRAM || ($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT) } {
    puts "
      ScanChain scan_oadf_shift_reg {
       ScanCells \"oadf_addrgen_0/shift_reg_q_reg\"\[$ADDRESS_MSB..0\];
       ScanIn scan_oadf_shift_reg_in;
       ScanOut scan_oadf_shift_reg_out;
       ScanEnable scan_en;
       ScanMasterClock sbl_clk;
    }  
   	"
     }
   }


if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR || $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
 puts "
   ScanChain unstitched_3 {
     ScanCells sar_load_q1_reg sar_load_q2_reg;
     ScanEnable scan_en;
     ScanMasterClock sar_clk;
   } "
   }

if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
 puts "
   ScanChain unstitched_2 {
    ScanCells"
     if {$MEMORY_TYPE == $ipmbSPRAM} {
     puts " row_address_q_reg\[$ROW_ADDRESS_MSB..0\] "
     puts " row_address_q2_reg\[$ROW_ADDRESS_MSB..0\] "
     if {$ROW_REDUNDANCY_TYPE == $ipmbPERBANK_ROW && $EXTRA_ROW > 1} {
     puts " bank_address_q_reg\[$BANK_ADDRESS_MSB..0\] "
     puts " bank_address_q2_reg\[$BANK_ADDRESS_MSB..0\] "
     }
       } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
     if {!$isWO1} {
     puts " row_address_p0_q_reg\[$ROW_ADDRESS_MSB..0\] "
     puts " row_address_p0_q2_reg\[$ROW_ADDRESS_MSB..0\] "
       if {$ROW_REDUNDANCY_TYPE == $ipmbPERBANK_ROW && $EXTRA_ROW > 1} {
     puts " bank_address_p0_q_reg\[$BANK_ADDRESS_MSB..0\] "
     puts " bank_address_p0_q2_reg\[$BANK_ADDRESS_MSB..0\] "
       }
     }
     if {!$isWO2} { 
     puts " row_address_p1_q_reg\[$ROW_ADDRESS_MSB..0\] "
     puts " row_address_p1_q2_reg\[$ROW_ADDRESS_MSB..0\] "
       if {$ROW_REDUNDANCY_TYPE == $ipmbPERBANK_ROW && $EXTRA_ROW > 1} {
     puts " bank_address_p1_q_reg\[$BANK_ADDRESS_MSB..0\] "
     puts " bank_address_p1_q2_reg\[$BANK_ADDRESS_MSB..0\] "
       }
     }
       }
     puts " \"row_repair_0/rau_q_reg\"\[$ROW_RAU_MSB..0\] "
     if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || ($REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR && $REPAIR_ALGORITHM_ENUM == $ipmbCOLUMN_BEFORE_ROW) } {
     puts " \"row_repair_0/repair_fail_q_reg\" "
     }
     if {$ROW_REDUNDANCY_TYPE == $ipmbGLOBAL_ROW && $ROW_REDUNDANCY_FREE_LSB_NUM == 0 && $ROW_REDUNDANCY_WIDTH == 2} {
     puts " \"row_repair_0/add_inf_q_reg\" "
     puts " \"row_repair_0/add_sup_q_reg\" "
     }
               
 puts " ;
     ScanMasterClock sbl_clk;
   } "
   }

if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
 puts "
   ScanChain unstitched_5 {
    ScanCells"
     if {$MEMORY_TYPE == $ipmbSPRAM} {
     puts " column_address_q_reg\[$COLUMN_ADDRESS_MSB..0\] "
     puts " column_address_q2_reg\[$COLUMN_ADDRESS_MSB..0\] "
     } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
     if {!$isWO1} {
     puts " column_address_p0_q_reg\[$COLUMN_ADDRESS_MSB..0\] "
     puts " column_address_p0_q2_reg\[$COLUMN_ADDRESS_MSB..0\] "
     }
     if {!$isWO2} { 
     puts " column_address_p1_q_reg\[$COLUMN_ADDRESS_MSB..0\] "
     puts " column_address_p1_q2_reg\[$COLUMN_ADDRESS_MSB..0\] "
     }
     }
     puts " \"column_repair_0/rau_q_reg\"\[$COLUMN_RAU_MSB..0\] "
     if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || ($REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR && $REPAIR_ALGORITHM_ENUM == $ipmbROW_BEFORE_COLUMN) } {
     puts " \"column_repair_0/repair_fail_q_reg\" "
       }
                    
 puts " ;
     ScanMasterClock sbl_clk;
   } "
   }

 if {$REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
 puts "
   ScanChain unstitched_5 {
    ScanCells"
   puts " \"column_repair_0/rau_q_reg\"\[$COLUMN_RAU_MSB..0\] "
   puts " \"column_repair_0/repair_fail_q_reg\" ;"
   puts " ScanMasterClock sbl_clk;
   } "
 }
 

 puts "
   ScanChain unstitched_1 {
    ScanCells"
      if {$ERROR_DETECTION_MODE == 1} {
        if {$MEMORY_TYPE == $ipmbSPRAM} {
          puts " \"error_detection_0/s_rvo_reg\" "
          puts " s_r1_read_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	  if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0} {
          puts " s_r1_expected_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	    } else {
          puts " s_r1_compact_data_q_reg\[1..0\]"
	    } 
        } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
          if {!$isWO1} {
          puts " \"error_detection_0/s_rvo_reg\" "
          puts " s_r1_read_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
            if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0} {
          puts " s_r1_expected_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	    } else {
          puts " s_r1_compact_data_q_reg\[1..0\]"
	    }  
          }
          if {!$isWO2} { 
          puts " \"error_detection_1/s_rvo_reg\" "
          puts " s_r1_read_data_b_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
            if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_1} {
          puts " s_r1_expected_data_b_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	    } else {
          puts " s_r1_compact_data_b_q_reg\[1..0\]"
	    }  
          }
        }
      }

     if {$ERROR_DETECTION_MODE == 2} {
      if {$MEMORY_TYPE == $ipmbSPRAM} {
        puts " \"error_detection_0/s_rvo_reg\" "
        puts " \"error_detection_0/lock_q_reg\" "
        if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0} {
        puts " s_r1_expected_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	} else {
        puts " s_r1_compact_data_q_reg\[1..0\]"
	}  
      } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
        if {!$isWO1} {
        puts " \"error_detection_0/s_rvo_reg\" "
        puts " \"error_detection_0/lock_q_reg\" "
          if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0} {
        puts " s_r1_expected_data_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	  } else {
        puts " s_r1_compact_data_q_reg\[1..0\]"
	  } 
        }
        if {!$isWO2} {
        puts " \"error_detection_1/s_rvo_reg\" "
        puts " \"error_detection_1/lock_q_reg\" "
       	  if {$ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_1} {
        puts " s_r1_expected_data_b_q_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
	  } else {
        puts " s_r1_compact_data_b_q_reg\[1..0\]"
	  }
        }
      }   
     }		

     if {($ERROR_DETECTION_MODE == 1 || $ERROR_DETECTION_MODE == 2) && !$all_topological } {
       if { $MEMORY_TYPE == $ipmbSPRAM } {
         if {!($ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0)} {
     puts " s_topo_bgnd_q_reg "
     puts " s_data_bgnd_q_reg\[[expr ($DATA_BACKGROUND_SIZE_0 - 1)]..0\] "
         }
       } elseif {$MEMORY_TYPE == $ipmbDPRAM && (!$isWO1 || !$isWO2) } {
         if {!($ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_0) || !($ALGO_FA_SUPPORT && $MEM_MASK_SUPPORT && $mask_algo_1)} {
     puts " s_topo_bgnd_q_reg "
     puts " s_data_bgnd_q_reg\[[expr ($DATA_BACKGROUND_SIZE_0 - 1)]..0\] "
         }
       }
     } 
       

     if {$ERROR_DETECTION_MODE == 0} {
      if {$MEMORY_TYPE == $ipmbSPRAM} {
        if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbNONE_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR} {
          puts " \"error_detection_0/error_bit_q_reg\" "
	}
        if {(($REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR) && $COLUMN_REDUNDANCY_TYPE == $ipmbGLOBAL_COLUMN) || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
          puts " \"error_detection_0/error_bit_q_reg\" "
          puts " \"error_detection_0/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	} 
        if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR && $COLUMN_REDUNDANCY_TYPE == $ipmbPERBANK_COLUMN} {
          puts " \"error_detection_0/error_bit_right_q_reg\" "
          puts " \"error_detection_0/error_bit_left_q_reg\" "
          puts " \"error_detection_0/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	} 
      } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
        if {!$isWO1} {
          if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbNONE_REPAIR} {
          puts " \"error_detection_0/error_bit_q_reg\" "
	  }
          if {(($REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR) && $COLUMN_REDUNDANCY_TYPE == $ipmbGLOBAL_COLUMN) || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
          puts " \"error_detection_0/error_bit_q_reg\" "
          puts " \"error_detection_0/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	  } 
          if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR && $COLUMN_REDUNDANCY_TYPE == $ipmbPERBANK_COLUMN} {
          puts " \"error_detection_0/error_bit_right_q_reg\" "
          puts " \"error_detection_0/error_bit_left_q_reg\" "
          puts " \"error_detection_0/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	  } 
        }
        if {!$isWO2} {
          if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbNONE_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR } {
          puts " \"error_detection_1/error_bit_q_reg\" "
	  }
          if {(($REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR) && $COLUMN_REDUNDANCY_TYPE == $ipmbGLOBAL_COLUMN) || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
          puts " \"error_detection_1/error_bit_q_reg\" "
          puts " \"error_detection_1/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	  } 
          if {$REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR && $COLUMN_REDUNDANCY_TYPE == $ipmbPERBANK_COLUMN} {
          puts " \"error_detection_1/error_bit_right_q_reg\" "
          puts " \"error_detection_1/error_bit_left_q_reg\" "
          puts " \"error_detection_1/r1_error_vector_q_reg\"\[[expr ($DATA_WIDTH - 1)]..0\] "
	  }
        }
      }  
     }		

       if {$MEMORY_TYPE == $ipmbDPRAM} {
        puts " s_idata_q_reg\[1..0\]"
        puts " s_offsets_q_reg\[1..0\]"
        if {$MEMORY_LATENCY != 0} {
          if {!$isWO1} {
            puts " s_r1_compact_data_reg\[1..0\] "
            puts " s_r1_read_valid_reg "
          }
          if {!$isWO2} {
            puts " s_r1_compact_data_b_reg\[1..0\] "
            puts " s_r1_read_valid_b_reg "
          }
        }
      }
 
      if {$PIPELINE} {
        if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
	  puts " s_c1_opcode_reg\[$OPCODE_MSB..0\] "
	} else {
     	  puts " s_c1_opcode_reg\[6..0\] "
        }
      }
      
      if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM} {
        puts " s_background_q_reg\[1..0\] "
          # nathalie (21 June 2005), fix star 9000070642
          # s_test_prog_enable_q_reg is not used and is optimized by the synthesis tool 
          # in case of !all_topo. To not complicate the c functions (sp/dp verilog/vhdl), 
          # this condition has been added only in the ctlpp file.
          # the same case for s_test_number_q_reg
	  if { ($DATA_WIDTH > 32 && $seq_bypass_type > 1 ) || !$all_topological || $ALGO_FA_SUPPORT } {
            puts " s_test_number_q_reg\[4..0\] "
	  }
          if {$PROGRAMMABILITY && !$all_topological} {
            puts " s_test_prog_enable_q_reg "
          } 
      }
      if {$ERROR_DETECTION_MODE > 0} {
        if {$MEMORY_TYPE == $ipmbSPRAM} {
          puts " \"error_detection_0/r2_read_valid_q_reg\" "
        } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
          if {!$isWO1} {
            puts " \"error_detection_0/r2_read_valid_q_reg\" "
          }
          if {!$isWO2} {
            puts " \"error_detection_1/r2_read_valid_q_reg\" "
          }
        }
      }
      if {$MEMORY_LATENCY == 2} {
        if {$MEMORY_TYPE == $ipmbSPRAM} {
          puts " s_c2_read_valid_q_reg "
          puts " s_c2_compact_data_q_reg\[1..0\] "
        } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
          if {!$isWO1} {
            puts " s_c2_read_valid_q_reg "
            puts " s_c2_compact_data_q_reg\[1..0\] "
          }
          if {!$isWO2} {
            puts " s_c2_read_valid_b_q_reg "
            puts " s_c2_compact_data_b_q_reg\[1..0\] "
          }
        }
      }
      if {!$SHADOW_DISABLE} {
      puts " test_q_reg "
        if {!$X_FIXING} {
          puts " test_q2_reg "
        }
      }
      
      if {$MEMORY_LATENCY != 0} {
        if {$MEMORY_TYPE == $ipmbSPRAM} {
          puts " s_r1_compact_data_reg\[1..0\] "
          puts " s_r1_read_valid_reg "
        }
      }
      if {$MEMORY_TYPE == $ipmbROM} {
        puts " \"misr_0/hold_q_reg\" "
        puts " \"misr_0/s_rvo_reg\" "
        puts " \"misr_0/misr_int_reg\"\[[expr ($MISR_SIZE - 1)]..0\] "
        puts " \"misr_0/lock_q_reg\" "
        puts " hold_misr_reg "
        if {$MEMORY_LATENCY != 0} {
          puts " s_r1_read_valid_reg "
        }
      }

      if {$ALGO_FA_SUPPORT} {
	puts " s_sequence_q_reg\[2..0\] "
	if { $MEM_MASK_SUPPORT } {
	  if {$MEMORY_LATENCY != 0} {
	    if {! ($MEMORY_TYPE == $ipmbDPRAM && $isWO1 ) } {  
	      puts " \"expected_data_gen_0/s_fa_reg\" "
	      puts " \"expected_data_gen_0/s_operation_reg\"\[2..0\] "
	      puts " \"expected_data_gen_0/s_sequence_reg\"\[2..0\] "
	      puts " \"expected_data_gen_0/s_test_reg\"\[4..0\] "
	    }
	    if { $MEMORY_TYPE == $ipmbDPRAM && !$isWO2 } {
	      puts " \"expected_data_gen_1/s_fa_reg\" "
	      puts " \"expected_data_gen_1/s_operation_reg\"\[2..0\] "
	      puts " \"expected_data_gen_1/s_sequence_reg\"\[2..0\] "
	      puts " \"expected_data_gen_1/s_test_reg\"\[4..0\] "
	    }
	  }
	  if {$MEMORY_LATENCY == 2} {
	    if {! ($MEMORY_TYPE == $ipmbDPRAM && $isWO1 ) } {
	      puts " \"expected_data_gen_0/s2_fa_reg\" "
	      puts " \"expected_data_gen_0/s2_operation_reg\"\[2..0\] "
	      puts " \"expected_data_gen_0/s2_sequence_reg\"\[2..0\] "
	      puts " \"expected_data_gen_0/s2_test_reg\"\[4..0\] "
	    }
	    if { $MEMORY_TYPE == $ipmbDPRAM && !$isWO2 } {
	      puts " \"expected_data_gen_1/s2_fa_reg\" "
	      puts " \"expected_data_gen_1/s2_operation_reg\"\[2..0\] "
	      puts " \"expected_data_gen_1/s2_sequence_reg\"\[2..0\] "
	      puts " \"expected_data_gen_1/s2_test_reg\"\[4..0\] "
	    }
	  }
	}
      }
      if {$MEMORY_LATENCY == 2 && !$all_topological} {
	puts " s_data_bgnd_reg\[[expr ($DATA_BACKGROUND_SIZE_0 - 1)]..0\] "
      }
      # sequential bypass flip-flops 
      if { $seq_bypass_type == 2 } {
	puts " seq_byp_q_reg\[[expr ($max_byp_reg - $REDUCED_ADDRESS_WIDTH - 1)]..0\] "
      }
      if { $seq_bypass_type == 3 } {
	puts " seq_byp_q_reg\[[expr ($DATA_WIDTH - $REDUCED_ADDRESS_WIDTH - 1)]..0\] "
      }
      if { $MEMORY_TYPE == $ipmbDPRAM && !$isRO1 && !$isRO2 && $seq_bypass_type > 0} {
	if { $DATA_WIDTH > $max_byp_reg } {
	  puts " seq_byp_q_b_reg\[[expr ($max_byp_reg - 1)]..0\] "
        } else {
	  puts " seq_byp_q_b_reg\[[expr ($DATA_WIDTH - 1)]..0\] "
        }
      }
      if { $ALGO_FA_SUPPORT || ($MEM_NB_PAGES > 1 && $ENABLE_PAGE_TESTING) } {
	puts " s_seq_type_q_reg\[1..0\] "
	  }

      if { $NON_MARCH_TEST_SUPPORT && ($MEMORY_TYPE == $ipmbSPRAM || ($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT)) } {
        puts " s_run_local_q_reg "
      }  
      puts " s_counter_address_q_reg\[$ADDRESS_MSB..0\] "
      puts " s_counter_mode_q_reg "
      puts " s_direction_q_reg "
      puts " s_run_q_reg; "
 puts "
     ScanMasterClock sbl_clk; 
}
}
"
}
*}



Environment {
  CTL {
    Family SNPS_MBIST_wrapper;

    Relation {
      
Pragma TCL {*
    foreach bus $BUSSES {puts " Bus $bus;"}
    if {$MEMORY_TYPE == $ipmbROM} {
      puts " Port 'sbl_error + sbl_shift' 0; "
    } elseif {$MEMORY_TYPE == $ipmbSPRAM} {
      puts " Port 'sbl_error "
    } elseif {$MEMORY_TYPE == $ipmbDPRAM } {
      puts " Port 'sbl_error\[${SBL_ERR_BUS_MSB}..0\] "
    }
    if { $MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
      if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
         puts "+ repair_used"
      }
      puts "' 0; "
    }
    if { $MEMORY_TYPE == $ipmbDPRAM } {
      puts " Corresponding 'sbl_error\[${SBL_ERR_BUS_MSB}..0\] "
    } else {
      puts " Corresponding 'sbl_error "
    }
    if {$MEMORY_TYPE == $ipmbROM} {
      puts "+ sbl_shift "
    }
    if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
      puts "+ repair_used"
    }
    puts "
            + sbl_control\[${SBL_CNTRL_BUS_MSB}..0\]'; "
*}
   }

    External {
Pragma TCL{*
  for {set i 0} {$i <= $SBL_CNTRL_BUS_MSB} {incr i} {
    puts " sbl_control\[${i}\]
           {ConnectTo{Symbolic \"stitch_sbl_control${i}\";}}"
  } ;# sbl_control bus width
  for {set i 0} {$i <= $SBL_ERR_BUS_MSB} {incr i} {
    if { $MEMORY_TYPE == $ipmbDPRAM } {
      puts " sbl_error\[${i}\]
             {ConnectTo{Symbolic \"stitch_sbl_error${i}\";}}"
    } else {
      puts " sbl_error
            {ConnectTo{Symbolic \"stitch_sbl_error${i}\";}}"
    }
    if {$MEMORY_TYPE == $ipmbROM} {
      puts " sbl_shift
           {ConnectTo{Symbolic \"stitch_sbl_shift${i}\";}}"
    }
    
  } ;# sbl_error and sbl_shift bus width
    if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
      puts " repair_used
           {ConnectTo{Symbolic \"stitch_repair_used0\";}}"
    }
  
*}     
      
    } // External

Pragma TCL {*  puts "
    Internal {
      sbl_clk { DataType TestClock User snps_bist_clk { ActiveState ForceUp;}}
      sbl_rst { DataType Asynchronous Reset User snps_bist_reset { ActiveState ForceDown;}}
      "
if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM} {
if {$X_FIXING && !$SHADOW_DISABLE} {
  puts " mbist_bypass { DataType TestMode { ActiveState ForceDown;}} "}
}
if {$MEMORY_HOLD} {
  puts " mem_hold { DataType User snps_iddq_stable { ActiveState ForceUp;}} "} 
   if { $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR
     || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
     puts "
      sar_clk { DataType ScanMasterClock User snps_bist_clk_lu
                   { ActiveState ForceUp; } }
      repair_si {
        CaptureClock sar_clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
       }
       repair_so {
        LaunchClock sar_clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
       }
       repair_se { DataType ScanEnable {ActiveState ForceUp;} } 
     "
   }
   puts "
   }
   "
*} 
} // anonymous CTL

  CTL Mission_mode { 
    Family SNPS_MBIST_wrapper;
    DomainReferences {}
    TestMode Normal;
    Pragma TCL {*
    if { $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR
      || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
    puts "DomainReferences { ScanStructures repair; }"
    } else {
    puts " DomainReferences {}"
    } 
  *} 
   TestMode Normal;
  } // CTL Mission_mode

Pragma TCL {*
 puts "
 CTL Internal_scan {
     Family SNPS_MBIST_wrapper;
     TestMode InternalTest;
     DomainReferences {
 "
 if { $SCAN_SUPPORT==1
   || $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR
   || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
  puts " ScanStructures "
  if { $REPAIR_TYPE_ENUM == $ipmbROW_REPAIR
    || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
    puts " repair "
  }
  if {$SCAN_SUPPORT==1} {
    puts " Internal_scan "
  }
  puts " ; "
 }
 puts "
   }
   Internal {
   "
 if {$SCAN_SUPPORT==1} {
 if {$MEMORY_HOLD} {
 puts "
        mem_hold { DataType User snps_iddq_stable { ActiveState ForceUp;}}
 " 
 } 
 puts "
     sbl_clk { DataType ScanMasterClock User snps_bist_clk
                 { ActiveState ForceUp;}}
 "
   if {$ERROR_DETECTION_MODE == 2} {
     if {$MEMORY_TYPE == $ipmbSPRAM} {
 puts "
     scan_r2_error_vector_in {
        CaptureClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
     }
     scan_r2_error_vector_out {
        LaunchClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
     }
 "
     } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
       if {!$isWO1} {
 puts "
     scan_r2_error_vector_in_0 {
        CaptureClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
     }
     scan_r2_error_vector_out_0 {
        LaunchClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
     }
 "	
       }
       if {!$isWO2} {
 puts "
     scan_r2_error_vector_in_1 {
        CaptureClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
     }
     scan_r2_error_vector_out_1 {
        LaunchClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
     }
 "	
       }
     }
}
 
   if { $NON_MARCH_TEST_SUPPORT } {
     if { $MEMORY_TYPE == $ipmbSPRAM || ($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT) } {
    puts "
     scan_oadf_shift_reg_in {
        CaptureClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
     }
     scan_oadf_shift_reg_out {
        LaunchClock sbl_clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
     }
"
      }
   }

    if { ($NON_MARCH_TEST_SUPPORT && ($MEMORY_TYPE == $ipmbSPRAM || (($MEMORY_TYPE == $ipmbDPRAM && $ONE_RW_PORT)))) || $ERROR_DETECTION_MODE == 2 || $REPAIR_TYPE_ENUM != $ipmbNONE_REPAIR} {
  puts "
      scan_en { DataType ScanEnable {ActiveState ForceUp;} }
  " 
      }



   if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM} {
     if {$X_FIXING && !$SHADOW_DISABLE} {
 puts "
     mbist_bypass { DataType TestMode { ActiveState ForceUp;}}
 "
     }
   }
}
 puts "
    } // Internal
  } // CTL Internal_scan
  "
 *}

  CTL go_nogo { 
    Family SNPS_MBIST_wrapper;
    Pragma TCL {*
    if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
    puts " DomainReferences { ScanStructures repair;} "
    } else {
    puts " DomainReferences {} "
    }
    puts " TestMode InternalTest;"
    puts " Internal { "
  puts " } "
   *}    
  } // CTL go_nogo

  CTL diagnose { 
    Family SNPS_MBIST_wrapper;
Pragma TCL {* 
    if {$REPAIR_TYPE_ENUM == $ipmbROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_REPAIR || $REPAIR_TYPE_ENUM == $ipmbCOLUMN_ROW_REPAIR || $REPAIR_TYPE_ENUM == $ipmbDATABIT_REPAIR} {
    puts "DomainReferences { ScanStructures repair; }"
    } else {
    puts "DomainReferences {}"
    }
   *}
    TestMode Debug;
  } // CTL diagnose
}






