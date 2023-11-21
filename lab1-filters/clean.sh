cd basic

rm -rf -v logs netlist reports saif vcd work
cd innovus
rm -rf -v IIR.dat timingReports
no_remove = ("design.globals" "PR.tcl" "post_PR_power.tcl" "mmm_design.tcl")
find . -type f ! -name "${no_remove[@]}" -delete
cd ..

cd sim
rm -rf -v work transcript
cd ..

cd syn
rm -rf -v ARCH BODY CONF ENTI PACK work *.syn *.mr *.log *.svf
cd ..

cd ..
cd adv

rm -rf -v logs netlist reports saif vcd work
cd innovus
rm -rf -v IIR.dat timingReports
find . -type f ! -name "${no_remove[@]}" -delete
cd ..

cd sim
rm -rf -v work transcript
cd ..

cd syn
rm -rf -v ARCH BODY CONF ENTI PACK work *.syn *.mr *.log *.svf
cd ..

cd ..
