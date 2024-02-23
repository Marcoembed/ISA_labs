rm -rf work 
rm -rf RISCV_rep

mkdir work
mkdir RISCV_rep

source  /eda/scripts/init_design_vision 

echo '../src/riscv_pkg.sv' > compile_VLOG.f
ls ../src/*.sv  | grep -vE 'riscv_pkg.sv' >>s compile_VLOG.f

dc_shell-xg-t -f syn_fake.tcl > dc_shell.log
