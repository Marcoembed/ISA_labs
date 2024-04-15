puts "\n########## SIMULATION STARTS ##########\n"
add wave -position end sim:/alu_tb/aif/*
run -all
puts "\n##########  SIMULATION ENDS  ##########\n"
do report-cov.do
exit
