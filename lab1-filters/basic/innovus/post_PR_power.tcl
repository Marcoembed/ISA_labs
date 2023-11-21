#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Nov 20 14:52:52 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.11-s130_1 (64bit) 08/05/2020 15:53 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.11-s130_1 NR200802-2257/20_11-UB (database version 18.20.512) {superthreading v2.9}
#@(#)CDS: AAE 20.11-s008 (64bit) 08/05/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.11-s059_1 () Aug  2 2020 05:46:30 ( )
#@(#)CDS: SYNTECH 20.11-s028_1 () Aug  1 2020 06:14:27 ( )
#@(#)CDS: CPE v20.11-s013
#@(#)CDS: IQuantus/TQuantus 19.1.3-s260 (64bit) Thu May 28 10:57:28 PDT 2020 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
encMessage warning 0
encMessage debug 0
encMessage info 0
is_common_ui_mode
restoreDesign /home/isa01_2023_2024/renato/ISA_labs/LAB1/basic/innovus/IIR.dat IIR
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
gui_select -rect {-3.68900 10.91600 1.21400 13.41550}
setDrawView fplan
setDrawView place
getDrawView
setDrawView fplan
win
dumpToGIF /ss_snapsht1.fplan.gif
getDrawView
win
dumpToGIF /ss_snapsht1.fplan.gif
setDrawView place
getDrawView
setDrawView fplan
win
dumpToGIF /ss_snapsht1.fplan.gif
setDrawView place
setEditMode -snap false
gui_select -rect {-2.24700 63.40750 65.62700 -2.15900}
deselectAll
setEditMode -snap true
getDrawView
setDrawView fplan
win
dumpToGIF snap/ss_snapsht1.fplan.gif
getDrawView
setDrawView amoeba
win
dumpToGIF snap/ss_snapsht1.amoeba.gif
getDrawView
setDrawView place
win
dumpToGIF snap/ss_snapsht1.place.gif
checkPlace checkplace.ss.rpt
reset_parasitics
extractRC
set_power_analysis_mode -reset
set_power_analysis_mode -method static -corner max -create_binary_db true -write_static_currents true -honor_negative_energy true -ignore_control_signals true
set_power_output_dir -reset
set_power_output_dir ./
set_default_switching_activity -reset
set_default_switching_activity -input_activity 0.2 -period 10.0
read_activity_file -reset
read_activity_file -format VCD -scope /tb_iir/UUT -start {} -end {} -block {} ../vcd/design.vcd
set_power -reset
set_powerup_analysis -reset
set_dynamic_power_simulation -reset
report_power -rail_analysis_format VS -outfile .//IIR.rpt
report_power -outfile report_power -sort { total }
