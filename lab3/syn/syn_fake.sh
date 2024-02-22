rm -rf work 
rm -rf RISCV_rep

mkdir work
mkdir RISCV_rep

source  /eda/scripts/init_design_vision 

ls ../src/*.sv > compile_VLOG.f

dc_shell-xg-t -f syn_fake.tcl > dc_shell.log
