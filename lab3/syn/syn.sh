rm -rf work 
rm -rf RISCV_rep

mkdir work
mkdir RISCV_rep

source /eda/scripts/init_questa_core_prime

ls ../src/*.sv > compile_VLOG.f
ls ../tb/*.sv >> compile_VLOG.f
ls ../tb/*.vhd > compile_VHDL.f


dc_shell-xg-t -f ./synfile.tcl > dc_shell.log
