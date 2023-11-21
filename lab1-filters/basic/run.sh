rm -rf netlist
rm -rf reports
rm -rf logs
mkdir netlist
mkdir reports
mkdir logs
cd bash_scripts

echo Simulation
./sim.sh > ../logs/sim.log
cat ../logs/sim.log | grep -i error

echo Synthesis
./syn.sh > ../logs/syn.log
cat ../logs/syn.log | grep -i error

echo Power_analysis
./power.sh > ../logs/power.log
cat ../logs/power.log | grep -i error

echo Innovus
./innovus.sh > ../logs/innovus.log
cat ../logs/innovus.log | grep -i error

echo "Post place and route power analysis"
./post_PR_power.sh > ../logs/post_PR_power.log
cat ../logs/post_PR_power.log | grep -i error

