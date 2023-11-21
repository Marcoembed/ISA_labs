cd ../innovus
source /eda/scripts/init_cadence_2020-21
innovus -abort_on_error -no_gui -files PR.tcl
innovus -abort_on_error -no_gui -files post_PR_power.tcl
cd -
