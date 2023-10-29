////////////////////////////////////////////////////////////////////////////////
//
//       This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 2005 - 2021 SYNOPSYS INC.
//                           ALL RIGHTS RESERVED
//
//       The entire notice above must be reproduced on all authorized
//     copies.
//
// AUTHOR:    Martin B.,  June 21, 2005
//
// VERSION:   CTL file for mbist_t2_rrc
//
// DFT IP ID: c6230ee0
// DFT_release: S-2021.06-DWBB_202106.4
//
////////////////////////////////////////////////////////////////////////////////

STIL 1.0 {
    CTL P2001.10;
    Design P2001.01;
}
Header {
    Title "Minimal STIL for design `rrc'";
    Date "Wed May 24 15:39:26 2005";
    Source "Manual Creation Revision 0.1";
}
Signals {
    "repair_se_i" In;
    "rrc_inhibit" In;
    "rrc_reset" In;
    "clk" In;
    "repair_se_o" Out;
}
SignalGroups {
    "all_inputs" = '"repair_se_i" + "rrc_inhibit" + "rrc_reset" + "clk"';
    "all_outputs" = '"repair_se_o"';
}
SignalGroups Mission_mode {
    "_clk" = '"clk"';
}
SignalGroups Repair_mode {
    "_clk" = '"clk"';
}
Timing  {
    WaveformTable "_default_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '5ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '5ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '5ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '5ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '95ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '95ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '95ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '95ns' L;
                }
            }
            "clk" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "rrc_reset" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
        }
    }
}
Procedures Mission_mode {
    "capture" {
        W "_default_WFT_";
        C {
            "all_inputs" = NN00;
            "all_outputs" = X;
        }
        F {
        }
        V {
            "_pi" = \r4 #;
        }
        V {
            "_po" =  #;
        }
    }
    "capture_rrc_reset" {
        W "_default_WFT_";
        C {
            "all_inputs" = NN00;
            "all_outputs" = X;
        }
        F {
        }
        "forcePI" : V {
            "_pi" = \r4 #;
        }
        "measurePO" : V {
            "_po" = #;
        }
        "pulse" : V {
            "reset" = P;
        }
    }
}
Procedures Repair_mode {
    "capture" {
        W "_default_WFT_";
        C {
            "all_inputs" = NN00;
            "all_outputs" = X;
        }
        F {
        }
        V {
            "_pi" = \r4 #;
        }
        V {
            "_po" =  #;
        }
    }
    "capture_rrc_reset" {
        W "_default_WFT_";
        C {
            "all_inputs" = NN00;
            "all_outputs" = X;
        }
        F {
        }
        "forcePI" : V {
            "_pi" = \r4 #;
        }
        "measurePO" : V {
            "_po" = #;
        }
        "pulse" : V {
            "reset" = P;
        }
    }
    "capture_clk" {
        W "_default_WFT_";
        C {
            "all_inputs" = NN00;
            "all_outputs" = X;
        }
        F {
        }
        "forcePI" : V {
            "_pi" = \r4 #;
        }
        "measurePO" : V {
            "_po" = #;
        }
        "pulse" : V {
            "clk" = P;
        }
    }
}
MacroDefs Mission_mode {
    "test_setup" {
        W "_default_WFT_";
        C {
            "all_inputs" = \r4 N;
            "all_outputs" = X;
        }
        V {
            "clk" = 0;
        }
        V {
            "rrc_reset" = 0;
        }
    }
}
MacroDefs Repair_mode {
    "test_setup" {
        W "_default_WFT_";
        C {
            "all_inputs" = \r4 N;
            "all_outputs" = X;
        }
        V {
            "clk" = 0;
        }
        V {
            "rrc_reset" = 0;
        }
    }
}
Environment "MB_RRC" {
    CTL {
        Internal {
        }
    }
    CTL Mission_mode {
        TestMode Normal;
        Family SNPS_RRC;
        DomainReferences {
            SignalGroups Mission_mode;
            Procedures Mission_mode;
            MacroDefs Mission_mode;
        }
        Internal {
            "rrc_reset" {
                DataType Functional;
            }
            "clk" {
                DataType Functional;
            }
            "repair_se_i" {
                DataType Functional;
            }
            "rrc_inhibit" {
                DataType Functional;
            }
            "repair_se_o" {
                DataType Functional;
            }
        }
    }
    CTL Repair_mode {
        TestMode Repair;
        Family SNPS_RRC;
        DomainReferences {
            SignalGroups Repair_mode;
            Procedures Repair_mode;
            MacroDefs Repair_mode;
        }
        Internal {
            "rrc_reset" {
                DataType Asynchronous Reset User snps_rrc_reset {
                    ActiveState ForceDown;
                }
            }
            "clk" {
                DataType MasterClock User snps_bist_clk_lu {
                    ActiveState ForceUp;
                }
            }
            "repair_se_i" {
                DataType ScanEnable {
                    ActiveState ForceUp;
                }
            }
            "rrc_inhibit" {
                DataType Asynchronous User snps_rrc_inhibit {
                    ActiveState ForceDown;
                }
            }
            "repair_se_o" {
                IsConnected Out {
                    Signal "repair_se_i";
                }
                DataType ScanEnable {
                    ActiveState ForceUp;
                }
            }
        }
    }
}
