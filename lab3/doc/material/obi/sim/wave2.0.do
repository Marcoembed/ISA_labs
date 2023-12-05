onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate /tb_mem_wrap_fake/CLK
add wave -noupdate /tb_mem_wrap_fake/RSTn
add wave -noupdate /tb_mem_wrap_fake/ADDR
add wave -noupdate /tb_mem_wrap_fake/WE
add wave -noupdate /tb_mem_wrap_fake/WDATA
add wave -noupdate -color Gold -itemcolor Gold /tb_mem_wrap_fake/PROC_REQ
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} /tb_mem_wrap_fake/MEM_RDY
add wave -noupdate /tb_mem_wrap_fake/RDATA
add wave -noupdate -color Magenta -itemcolor Magenta /tb_mem_wrap_fake/VALID
