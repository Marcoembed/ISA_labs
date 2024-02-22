rm -rf work 
rm -rf RISCV_rep_real

mkdir work
mkdir RISCV_rep_real

source /eda/scripts/init_design_vision

echo '../src/riscv_pkg.sv' > compile_VLOG.f
ls ../src/*.sv | grep -vE 'riscv_pkg.sv' >> compile_VLOG.f


dc_shell-xg-t -f ./syn_real.tcl > dc_shell.log
