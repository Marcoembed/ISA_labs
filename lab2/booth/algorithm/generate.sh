#!/bin/bash

sv_file="../dadda/dadda.sv"
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

pmline=$(grep -n '// portmap' $sv_file | head -n 1 | sed 's/:.*//')

if [ -z $pmline ]; then
	echo "error: pattern '// portmap' not found"
	exit 1
fi

head -n "$pmline" "$sv_file" > sv_tmp_head.txt
tail -n +"$pmline" "$sv_file" > sv_tmp_tail.txt

cat sv_tmp_head.txt "$pm_file" sv_tmp_tail.txt > $sv_file

rm sv_tmp_head.txt sv_tmp_tail.txt

echo "Done! Dadda generated. Check in $sv_file file"



