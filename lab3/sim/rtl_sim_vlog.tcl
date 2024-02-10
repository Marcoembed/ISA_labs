
quit -sim 
vlib work


vlog -work work -svinputport=relaxed ../src/riscv_pkg.sv
vlog -work work -svinputport=relaxed -F compile_VLOG.f
vcom -work work  -F compile_VHDL.f

vsim -t ps -L ./mem_wrap -do wave2.0.do work.tb -voptargs=+acc 
