#!/bin/bash

python3 dadda 

sv_file="../src/dadda.sv"
pm_file="./portmap.txt"

# check if systemverilog file exists
if [ ! -f $sv_file ]; then
	echo "error[$sv_file]: file not found"
	exit 1
fi

# check portmap file
if [ ! -f $pm_file ]; then
	echo "error[$pm_file]: file not found"
	exit 1
fi

pm_start=$(grep -n '/\*------------------------------ START PORTMAP\*/' $sv_file | sed 's/:.*//')
pm_end=$(grep -n '/\*------------------------------ END PORTMAP\*/' $sv_file | sed 's/:.*//')

#start_line=$(echo "$rm_lines" | awk '{print $1}')
#end_line=$(echo "$rm_lines" | awk '{print $2}')
#
#awk -v from_line="$start_line" -v to_line="$end_line" 'from_line < NR &&  NR < to_line {next} {print}' $sv_file > tmp_file.txt && mv tmp_file.txt $sv_file
#
#cat $sv_file

if [ -z $pm_start ] || [ -z $pm_end ]; then
	echo "error: pattern not found:"
	echo "	pattern1: /*------------------------------ START PORTMAP*/"
	echo "	pattern2: /*------------------------------ END PORTMAP*/"
	exit 1
fi

head -n "$pm_start" "$sv_file" > sv_tmp_head.txt
tail -n +"$pm_end" "$sv_file" > sv_tmp_tail.txt

cat sv_tmp_head.txt <(echo) "$pm_file" sv_tmp_tail.txt > $sv_file

rm sv_tmp_head.txt sv_tmp_tail.txt

echo "Done! Dadda tree generated. Check in $sv_file file"



