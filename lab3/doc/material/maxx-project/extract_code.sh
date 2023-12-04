#!/bin/bash

LLINES=4
CODE_HEX_FNAME=$1

# line count and remove filename
m=`wc -l ${CODE_HEX_FNAME} | sed s/${CODE_HEX_FNAME}//`
# remove leading lines
n=`echo ${m}-${LLINES} | bc`
# output address and binay only
tail -${n} ${CODE_HEX_FNAME} | grep -v Disass | awk '{print $1 $2}' | sed s/:/:" "/ > $2
#tail -${n} ${CODE_HEX_FNAME} | sed s/\<.*\>\:/\&" "\&/ | awk '{for(i=3;i<=NF;i++) printf $i" "; print ""}' | sed s/:/:" "/ > $3
tail -${n} ${CODE_HEX_FNAME} | sed s/\<.*\>\:/\&" "\&/ | awk '{for(i=3;i<=NF;i++) printf $i" "; print ""}' | sed s/:/:" "/ | sed s/^\<// | sed s/\>\:/:/ | sed s/_start/_\&/ | sed s/\#.*// | sed s/.*text.// | sed s/init/text/ > $3
