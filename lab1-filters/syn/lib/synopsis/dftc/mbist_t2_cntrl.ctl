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
// VERSION:   CTL file for mbist_t2_cntrl
//
// DFT IP ID: 695662f0
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
  set SCAN_SUPPORT $SNPS_IP_SCAN
  set PROG_IR_MSB 0
  set DIAG_DELAY_ENABLE 1
  set IPMBDataWidthMax 512

  # Set sbl_error bus width
  if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbROM } {
    set SBL_ERR_CHILD_BUS_WIDTH 1
  } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
    set SBL_ERR_CHILD_BUS_WIDTH 2
  }

  # repair used msb
  if {$REPAIR_SUPPORT} {
  set REPAIR_USED_WIDTH 0
  for {set i 0} {$i < $WRAPPER_NUMBER} {incr i} {
    if {$REPAIR_SUPPORT_LIST($i)} {
    incr REPAIR_USED_WIDTH
    }
  }
  
  set REPAIR_USED_MSB [expr $REPAIR_USED_WIDTH  - 1]
  }
  # Set up/down bus msb

  set UP_BUS_MSB 4
  set DOWN_BUS_MSB 5

 if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
  if {$PROGRAMMABILITY} {
    set UP_BUS_MSB [expr $UP_BUS_MSB + 3]
    set DOWN_BUS_MSB [expr $DOWN_BUS_MSB + 3] 
  }
  if { $REPAIR_SUPPORT } {
    incr UP_BUS_MSB
    incr DOWN_BUS_MSB
    incr DOWN_BUS_MSB
  }    
  
  if { $RETENTION_ENABLE } {
    incr UP_BUS_MSB
    incr DOWN_BUS_MSB
  } 

  if { $DIAG_DELAY_ENABLE } {
    incr DOWN_BUS_MSB
  } 
  if { $BURN_IN } {
    incr DOWN_BUS_MSB
  } 

 } 
 if {$MEMORY_TYPE == $ipmbROM } {
   incr DOWN_BUS_MSB
   if { $BURN_IN } {
    incr DOWN_BUS_MSB
   } 
 }

  # Set sbl_control bus width and prog IR msb
  if {$MEMORY_TYPE == $ipmbSPRAM} {
    set SBL_CNTRL_BUS_MSB 10
    set OPCODE_MSB 7
    if {$REPAIR_SUPPORT} {
         set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3 ]
    }    
   
    set PROG_IR_MSB 24
  } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
    set SBL_CNTRL_BUS_MSB 15
    set OPCODE_MSB 12
      
      if {$REPAIR_SUPPORT} {
        set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3 ]
      }
    set PROG_IR_MSB 60
  } elseif {$MEMORY_TYPE == $ipmbROM} {
    set SBL_CNTRL_BUS_MSB 9
  }

  if { $MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
    if { $NON_MARCH_TEST_SUPPORT && $CNTRL_MASK_SUPPORT && $ALGO_FA_SUPPORT } {
      set SBL_CNTRL_BUS_MSB [expr $SBL_CNTRL_BUS_MSB + 3 ]
      set OPCODE_MSB [expr $OPCODE_MSB + 3 ]
    }
  }

  set SBL_ERR_BUS_MSB [expr ($WRAPPER_NUMBER * $SBL_ERR_CHILD_BUS_WIDTH) - 1]
  if {$SCAN_SUPPORT} {
    set ADDRESS_MSB [expr ([expr {int(ceil(log(abs(double([expr ($MAX_WORDS + 1)])))/log(2)))}]) - 1]
    set EMB_ADDR_MSB [expr ([expr {int(ceil(log(abs(double([expr ($ADDRESS_MSB + 1)])))/log(2)))}]) - 1]
  set ipmbMaxPresetAlgo 32
  set ipmbMaxSeqPerAlgo 8
  set ipmbMaxOpPerSeq 8
  set DIAG_COUNTER_MAX [expr $MAX_WORDS * $ipmbMaxSeqPerAlgo * $ipmbMaxOpPerSeq  + 10]
  set DIAG_COUNTER_MSB [expr ([expr {int(ceil(log(abs(double([expr ($DIAG_COUNTER_MAX + 1)])))/log(2)))}]) - 1]
  set TEST_COUNTER_WIDTH [expr ([expr {int(ceil(log(abs(double([expr ($ipmbMaxPresetAlgo)])))/log(2)))}]) - 1]
  
  set ID_LENGTH 4
  set ADAPTER_LENGTH 3
  set DIAG_COUNTER_LENGTH 5
  set DATA_LENGTH [expr {int(ceil(log(abs(double($IPMBDataWidthMax)))/log(2)))}]
  set DIAG_COUNTER_WIDTH [expr ([expr {int(ceil(log(abs(double([expr ($DIAG_COUNTER_MAX + 1)])))/log(2)))}])]
  set DIAG_DATA_IN_WIDTH [expr ([expr {int(ceil(log(abs(double($WRAPPER_NUMBER)))/log(2)))}]) + $MAX_DATA_WIDTH + $DIAG_COUNTER_WIDTH + $TEST_COUNTER_WIDTH]
  if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
  set DIAG_DATA_WIDTH [expr ($ID_LENGTH + $ADAPTER_LENGTH + $DIAG_COUNTER_LENGTH + $DATA_LENGTH + $DIAG_DATA_IN_WIDTH)]
  } else {
  set DIAG_DATA_WIDTH [expr ($ID_LENGTH + $ADAPTER_LENGTH + $DATA_LENGTH + 7)]
#  set DIAG_DATA_WIDTH [expr ($ID_LENGTH + $ADAPTER_LENGTH + $DATA_LENGTH + 4)]
  }
  
  set DIAG_DATA_COUNTER_MSB [expr ([expr {int(ceil(log(abs(double([expr ($DIAG_DATA_WIDTH)])))/log(2)))}]) - 1]  
  }
 if {$MEMORY_TYPE == $ipmbROM} {
  
  set SIGNATURE_COUNT_WIDTH [expr ([expr {int(ceil(log(abs(double([expr ($WRAPPER_NUMBER + $MAX_MISR_SIZE + 2)])))/log(2)))}]) - 1]
  set WRAPPER_ID_WIDTH [expr ([expr {int(ceil(log(abs(double([expr ($WRAPPER_NUMBER + 1)])))/log(2)))}]) - 1]
 }
# The list of busses
set BUSSES {}
*}

Pragma TCL {*
  puts " Title \"config_${MODULE_SUFFIX}\";"
*}

}

Variables {
  IntegerConstant num_rel_ports_up=1;
//  IntegerConstant num_mems=4;
}

Signals {

Pragma TCL {*

puts " mbist_up\[${UP_BUS_MSB}..0\] Out; " 
lappend BUSSES mbist_up 
puts " mbist_down\[${DOWN_BUS_MSB}..0\] In; "
lappend BUSSES mbist_down
puts " sbl_control\[${SBL_CNTRL_BUS_MSB}..0\] Out; "
lappend BUSSES sbl_control
if { ($MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbROM) && $WRAPPER_NUMBER == 1 } {
  puts " sbl_error In; "
} else {
  puts " sbl_error\[${SBL_ERR_BUS_MSB}..0\] In; "
  lappend BUSSES sbl_error
}
if {$REPAIR_SUPPORT} {
  if { $REPAIR_USED_MSB == 0 } {
    puts " repair_used In; "
  } else {
    puts " repair_used\[${REPAIR_USED_MSB}..0\] In; "
    lappend BUSSES repair_used
  }
}
if {$MEMORY_TYPE == $ipmbROM} {
  if { $WRAPPER_NUMBER == 1 } {
    puts [format " sbl_shift Out;" ] 
  } else {
    puts [format " sbl_shift\[%d..0\] Out;" [expr ($WRAPPER_NUMBER - 1)]] 
    lappend BUSSES sbl_shift
  }
}
if {$SCAN_SUPPORT} {
  if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
  puts " scan_bisd_counter_in  In; "
  puts " scan_bisd_counter_out  Out; " 
  puts " scan_adapter_data_in  In; "
  puts " scan_adapter_data_out  Out; "
  if {$PROGRAMMABILITY} {
    puts " scan_test_prog_in  In; "
    puts " scan_test_prog_out  Out; "
  }
  puts " scan_en  In; "
}
}
*}   
  clk          In;
  rst          In;  
}


Pragma TCL {*
if {$SCAN_SUPPORT} {
 puts "
ScanStructures Internal_scan {"
 if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
 puts "
   ScanChain bisd_counter_reg {
      ScanIn scan_bisd_counter_in;
      ScanOut scan_bisd_counter_out;
      ScanEnable scan_en;
      ScanCells  \"i_sb_diagnosis0/s_bisd_counter_q_reg\"\[$DIAG_COUNTER_MSB..0\];
      ScanMasterClock clk;
   }
   ScanChain adapter_data_reg {
      ScanIn scan_adapter_data_in;
      ScanOut scan_adapter_data_out;
      ScanEnable scan_en;
      ScanCells  \"i_sb_diagnosis0/s_adapter_data_q_reg\"\[$MAX_DATA_WIDTH..0\];
      ScanMasterClock clk;
   } 
"
   if {$PROGRAMMABILITY} {
   puts "
   ScanChain test_prog_reg {
      ScanIn scan_test_prog_in;
      ScanOut scan_test_prog_out;
      ScanEnable scan_en;
      ScanCells \"i_sb_interface0/s_test_prog_reg\"\[$PROG_IR_MSB..0\];
      ScanMasterClock clk;
   }
    "
   }
 }
   puts "
   ScanChain unstitched {
    ScanCells"
            if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbROM } {
              puts "  \"i_sb_test0/s_address_q_reg\"\[$ADDRESS_MSB..0\]"
              puts "  \"i_sb_test0/s_operation_q_reg\"\[2..0\]"
              puts "  \"i_sb_test0/s_sequence_q_reg\"\[2..0\]"
              puts "  \"i_sb_test0/s_state_q_reg\"\[2..0\]"
              if {$MEMORY_TYPE == $ipmbSPRAM && $PIPELINE} {
                puts "  \"i_sb_test0/s_instruction_q_reg\"\[$OPCODE_MSB..0\]"
              }
              if {$MEMORY_TYPE == $ipmbROM && $PIPELINE} {
                puts "  \"i_sb_test0/s_instruction_q_reg\"\[6..0\]"
              }
            } elseif {$MEMORY_TYPE == $ipmbDPRAM} {
              puts "  \"i_sb_dp_test0/s_address_q_reg\"\[$ADDRESS_MSB..0\]"
              puts "  \"i_sb_dp_test0/s_operation_q_reg\"\[2..0\]"
              puts "  \"i_sb_dp_test0/s_sequence_q_reg\"\[2..0\]"
              puts "  \"i_sb_dp_test0/s_state_q_reg\"\[2..0\]"
              if {$PIPELINE} {
                puts "  \"i_sb_dp_test0/s_instruction_q_reg\"\[$OPCODE_MSB..0\]"
              }
            }

            if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbROM } {
                puts "  \"i_sb_test0/s_int_count_reg\"\[2..0\]"
	    } elseif {$MEMORY_TYPE == $ipmbDPRAM } {
                puts "  \"i_sb_dp_test0/s_int_count_reg\"\[2..0\]"
	    }

	    if { $NON_MARCH_TEST_SUPPORT } {
	      if { $MEMORY_TYPE == $ipmbSPRAM } {
                puts "  \"i_sb_test0/s_emb_op_q_reg\"\[2..0\]"
                puts "  \"i_sb_test0/s_emb_addr_q_reg\"\[$EMB_ADDR_MSB..0\]"
	      } elseif { $MEMORY_TYPE == $ipmbDPRAM } {
                puts "  \"i_sb_dp_test0/s_emb_op_q_reg\"\[2..0\]"
                puts "  \"i_sb_dp_test0/s_emb_addr_q_reg\"\[$EMB_ADDR_MSB..0\]"
	      }
	    }
            if {$PROGRAMMABILITY} {
              puts "  \"i_sb_interface0/i_program_receiver0/s_trans_data_prev_reg\"\[1..0\]"
              puts "  \"i_sb_interface0/i_program_receiver0/s_trans_data_q_reg\"\[1..0\]"
              puts "  \"i_sb_interface0/test_prog_load_q_reg\" "
              puts "  \"i_sb_interface0/s_prog_ready_reg\" "
              if {$MEMORY_TYPE == $ipmbSPRAM} {
                puts "  \"i_sb_test0/s_prog_q_reg\"\[$PROG_IR_MSB..0\]"              
	      } elseif {$MEMORY_TYPE == $ipmbDPRAM } {
                puts "  \"i_sb_dp_test0/s_prog_q_reg\"\[$PROG_IR_MSB..0\]"
	      }
            }
            if { $RETENTION_ENABLE } {
              puts "  \"i_sb_interface0/s_q1_resume_reg\" "
              puts "  \"i_sb_interface0/s_q2_resume_reg\" "
            }
            if { $DIAG_DELAY_ENABLE } {
              puts "  \"i_sb_interface0/diag_shift_reg\" "
              puts "  \"i_sb_interface0/diag_shift_q_reg\" "
              puts "  \"i_sb_interface0/diag_shift_q1_reg\" "
              puts "  \"i_sb_interface0/diag_mode_reg\" "
              puts "  \"i_sb_interface0/s_diag_state_reg\"\[1..0\]"
            }
            if {$SBL_ERR_BUS_MSB > 0 && ($MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM)} {
            puts "  \"i_sb_diagnosis0/s_error_priority_q_reg\"\[$SBL_ERR_BUS_MSB..0\]"
            puts "  \"i_sb_diagnosis0/s_double_error_q_reg\" "
            }
            if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
            puts "  \"i_sb_diagnosis0/s_bisd_counter_save_q_reg\"\[$DIAG_COUNTER_MSB..0\]"
            puts "  \"i_sb_diagnosis0/s_detection_enable_q_reg\" "
            puts "  \"i_sb_diagnosis0/s_error_q_reg\"\[$SBL_ERR_BUS_MSB..0\]"
            puts "  \"i_sb_diagnosis0/s_bist_error_q_reg\" "
            puts "  \"i_sb_diagnosis0/s_test_counter_q_reg\"\[4..0\]"
              if {$REPAIR_SUPPORT} {
              puts "  \"i_sb_diagnosis0/sar_count_q_reg\"\[6..0\]"
              }
            }
            if {$MEMORY_TYPE == $ipmbROM} {
              puts "  \"i_sb_diagnosis0/signature_count_q_reg\"\[$SIGNATURE_COUNT_WIDTH..0\]"
              puts "  \"i_sb_diagnosis0/wrapper_id_q_reg\"\[$WRAPPER_ID_WIDTH..0\]"
              puts "  \"i_sb_diagnosis0/select_signature_q_reg\" "
              puts "  \"i_sb_interface0/shift_start_q_reg\" "
              puts "  \"i_sb_diagnosis0/s_test_counter_q_reg\"\[4..0\]"
              if {[string compare $SIGNATURE_COMPARISON INTERNAL] == 0} {
                puts "  \"i_sb_diagnosis0/gonogo_count_q_reg\"\[1..0\]"
                puts "  \"i_sb_diagnosis0/s_bist_error_q_reg\" "
              }
            }
            puts "  \"i_sb_diagnosis0/s_state_reg\"\[2..0\]"
            puts "  \"i_sb_interface0/i_diag_transmitter0/s_trans_ack_parity_reg\" "
            puts "  \"i_sb_interface0/i_diag_transmitter0/s_trans_ack_q_reg\"\[2..0\]"
            puts "  \"i_sb_interface0/i_diag_transmitter0/s_state_q_reg\"\[1..0\]"
            puts "  \"i_sb_interface0/i_diag_transmitter0/s_trans_data_reg\"\[1..0\]"
            puts "  \"i_sb_interface0/s_bist_on_reg\" "
            puts "  \"i_sb_interface0/s_diag_data_counter_q_reg\"\[$DIAG_DATA_COUNTER_MSB..0\]; "
  puts "
   ScanMasterClock clk; 
}
}
"
}
*}

Environment {
  CTL {
    Family SNPS_MBIST_controller;

    Relation {
Pragma TCL {* 
 foreach bus $BUSSES {puts " Bus $bus;"}
*}
      // Signals connecting to parent must be in first ports.
      // Number of parent ports = num_rel_ports_parent.
      
Pragma TCL {*
  puts " Port 'mbist_up\[${UP_BUS_MSB}..0\] + mbist_down\[${DOWN_BUS_MSB}..0\]' 0; "
# SPRAM uses one sbl_error bit per wrapper and DPRAM uses two bits per wrap.
  set SBL_ERR_LAST_MSB -1
  set REPAIR_DETECT 0
  for {set i 0} {$i < $WRAPPER_NUMBER} {incr i} {
    if {$SBL_ERR_CHILD_BUS_WIDTH > 1} {
      if {$REPAIR_SUPPORT && $REPAIR_SUPPORT_LIST($i)} {
	if { $REPAIR_USED_MSB == 0 } {
          puts [format " Port 'sbl_error\[%d..%d\] + repair_used' %d;" [expr $SBL_ERR_LAST_MSB + $SBL_ERR_CHILD_BUS_WIDTH] [expr $SBL_ERR_LAST_MSB + 1] [expr $i + 1]]
	} else {
          puts [format " Port 'sbl_error\[%d..%d\] + repair_used\[%d\]' %d;" [expr $SBL_ERR_LAST_MSB + $SBL_ERR_CHILD_BUS_WIDTH] [expr $SBL_ERR_LAST_MSB + 1] $REPAIR_DETECT [expr $i + 1]]
          incr REPAIR_DETECT;
	}
      } else {
        puts [format " Port 'sbl_error\[%d..%d\]' %d;" [expr $SBL_ERR_LAST_MSB + $SBL_ERR_CHILD_BUS_WIDTH] [expr $SBL_ERR_LAST_MSB + 1] [expr $i + 1]]
      }
    } else {
      if { $WRAPPER_NUMBER == 1 } {
        if {$MEMORY_TYPE == $ipmbROM} {
          puts [format " Port 'sbl_error + sbl_shift' %d;" [expr $i + 1]]
        } elseif {$MEMORY_TYPE == $ipmbSPRAM} {
          if {$REPAIR_SUPPORT && $REPAIR_SUPPORT_LIST($i)} {
            puts [format " Port 'sbl_error + repair_used' %d;" [expr $i + 1]]
            incr REPAIR_DETECT;
          } else {
            puts [format " Port 'sbl_error' %d;" [expr $i + 1]]
          }
	}
      } else {
        if {$MEMORY_TYPE == $ipmbROM} {
          puts [format " Port 'sbl_error\[%d\] + sbl_shift\[%d\]' %d;" $i $i [expr $i + 1]]
        } elseif {$MEMORY_TYPE == $ipmbSPRAM} {
          if {$REPAIR_SUPPORT && $REPAIR_SUPPORT_LIST($i)} {
	    if { $REPAIR_USED_MSB == 0 } {
              puts [format " Port 'sbl_error\[%d\] + repair_used' %d;" $i [expr $i + 1]]
	    } else {
              puts [format " Port 'sbl_error\[%d\] + repair_used\[%d\]' %d;" $i $REPAIR_DETECT [expr $i + 1]]
              incr REPAIR_DETECT;
	    }
          } else {
            puts [format " Port 'sbl_error\[%d\]' %d;" $i [expr $i + 1]]
          }
        }
      }
    }
    incr SBL_ERR_LAST_MSB $SBL_ERR_CHILD_BUS_WIDTH;
  }

  puts " Corresponding 'mbist_up\[${UP_BUS_MSB}..0\]
                      + mbist_down\[${DOWN_BUS_MSB}..0\]"
  if {$MEMORY_TYPE == $ipmbROM} {
    if { $SBL_ERR_BUS_MSB == 0 } { 
      puts "              + sbl_shift"
    } else {
      puts "              + sbl_shift\[${SBL_ERR_BUS_MSB}..0\]"
    }
  }
  if {$REPAIR_SUPPORT} {
    if { $REPAIR_USED_MSB == 0 } {
      puts "              + repair_used"
    } else {
      puts "              + repair_used\[${REPAIR_USED_MSB}..0\]"
    }
  }
  if { $SBL_ERR_BUS_MSB == 0 } {  
    puts "
                      + sbl_error' ;"
  } else {
    puts "
                      + sbl_error\[${SBL_ERR_BUS_MSB}..0\]' ;"
  }
*}
    }

    External {
Pragma TCL {*
  for {set i 0} {$i <= $DOWN_BUS_MSB} {incr i} {
    puts " mbist_down\[${i}\]
           {ConnectTo{ Symbolic \"stitch_mbist_down${i}\";}} "
  } ;# down bus width
  for {set i 0} {$i <= $UP_BUS_MSB} {incr i} {
    puts " mbist_up\[${i}\]
           {ConnectTo{ Symbolic \"stitch_mbist_up${i}\";}} "
  } ;# up bus width
  for {set i 0} {$i <= $SBL_CNTRL_BUS_MSB} {incr i} {
    puts " sbl_control\[${i}\]
           {ConnectTo{Symbolic \"stitch_sbl_control${i}\";}}"
  } ;# sbl_control bus width

  if {$MEMORY_TYPE == $ipmbROM} {
    if { $WRAPPER_NUMBER == 1 } {
      puts " sbl_shift
             {ConnectTo{Symbolic \"stitch_sbl_shift0\";}}"
    } else {
      for {set i 0} {$i < $WRAPPER_NUMBER} {incr i} {
        puts " sbl_shift\[${i}\]
             {ConnectTo{Symbolic \"stitch_sbl_shift0\";}}"
      } ;# sbl_shift bus width
    } 
  }

  # DPRAMs use multiple sbl_error bits.
  set SBL_ERR_CHILD_BUS_INDEX 0
    if { $SBL_ERR_BUS_MSB == 0 } {
      puts " sbl_error
        {ConnectTo{Symbolic \"stitch_sbl_error${SBL_ERR_CHILD_BUS_INDEX}\";}}"
    } else {
      for {set i 0} {$i <= $SBL_ERR_BUS_MSB} {incr i} {
        puts " sbl_error\[${i}\]
          {ConnectTo{Symbolic \"stitch_sbl_error${SBL_ERR_CHILD_BUS_INDEX}\";}}"
        incr SBL_ERR_CHILD_BUS_INDEX;
        if {$SBL_ERR_CHILD_BUS_INDEX == $SBL_ERR_CHILD_BUS_WIDTH} {
          set SBL_ERR_CHILD_BUS_INDEX 0
        }
      } ;# sbl_error bus width
    }
 
  if {$REPAIR_SUPPORT} {
    if { $REPAIR_USED_MSB == 0 } {
      puts " repair_used
        {ConnectTo{Symbolic \"stitch_repair_used0\";}}"
    } else {
      for {set i 0} {$i <= $REPAIR_USED_MSB} {incr i} {
	puts " repair_used\[${i}\]
           {ConnectTo{Symbolic \"stitch_repair_used0\";}}"
      } ;# repair_used bus width
    }
  }


*}      
    } // External

    Internal {
      clk { DataType TestClock User snps_bist_clk { ActiveState ForceUp;}}
      rst { DataType Asynchronous Reset User snps_bist_reset
                { ActiveState ForceDown;} }
    }
  } // anonymous CTL

  CTL Mission_mode { 
    Family SNPS_MBIST_generic;
    TestMode Normal;
  } // CTL Mission_mode

Pragma TCL {* puts "
  CTL Internal_scan {
    Family SNPS_MBIST_generic;
    TestMode InternalTest;
  "
if {$SCAN_SUPPORT==1} { puts "
    DomainReferences { ScanStructures Internal_scan; }
    Internal {
      clk { DataType ScanMasterClock User snps_bist_clk
                 { ActiveState ForceUp;}} "
      if {$MEMORY_TYPE == $ipmbSPRAM || $MEMORY_TYPE == $ipmbDPRAM } {
      puts "
      scan_en { DataType ScanEnable {ActiveState ForceUp;} } 
      scan_bisd_counter_in {
        CaptureClock clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
       }
       scan_bisd_counter_out {
        LaunchClock clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
       }
       scan_adapter_data_in {
        CaptureClock clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
       }
       scan_adapter_data_out {
        LaunchClock clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
       }
"
if {$PROGRAMMABILITY} {
puts "
       scan_test_prog_in {
        CaptureClock clk {
          LeadingEdge;
        }
        DataType ScanDataIn {
          ScanDataType Internal;
        }
       }
       scan_test_prog_out {
        LaunchClock clk {
          LeadingEdge;
        }
        DataType ScanDataOut {
          ScanDataType Internal;
        }
       }
"
}
}

puts "
} // Internal
"}
puts "
  } // CTL Internal_scan
"
 *}

  CTL go_nogo { 
    Family SNPS_MBIST_generic;
    TestMode ExternalTest;
  } // CTL go_nogo

  CTL diagnose { 
    Family SNPS_MBIST_generic;
    TestMode Debug;
  } // CTL diagnose
}


