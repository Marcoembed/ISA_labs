#!/bin/bash

LLINES=6
DATA_HEX_FNAME=$1

# line count and remove filename
m=`wc -l ${DATA_HEX_FNAME} | sed s/${DATA_HEX_FNAME}//`
# remove leading lines
n=`echo ${m}-${LLINES} | bc`
# output data lines only
#tail -${n} ${DATA_HEX_FNAME} | awk '{print $1 $2}' | sed s/:/:" "/ > $2
#tail -${n} ${DATA_HEX_FNAME} | awk '{print $2}' | sed s/:/:" "/ | sed s/.*\<// > $2
tail -${n} ${DATA_HEX_FNAME} | grep -v Disassembly | awk '{print $2}'| sed s/\<// | sed s/\>// > $2
