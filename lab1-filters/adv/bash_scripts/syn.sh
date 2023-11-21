cd ../syn
rm -rf work 
mkdir work
source /eda/scripts/init_design_vision
dc_shell-xg-t -f syn.tcl
cd -
