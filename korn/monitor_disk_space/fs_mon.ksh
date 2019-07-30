#!/usr/bin/env ksh

# set -x # add debug

FSMAX="85"
WORKFILE="/var/tmp/df.work"
>$WORKFILE
OUTFILE="/var/tmp/df.outfile"
>$OUTFILE
THISHOST=`hostname`

# get data of interest by stripping out /dev/cd#, /proc rows and keep colums 1,4 and 7
df -k | tail +2 | egrep -v '/dev/cd[0-9]|/proc' | awk '{ print $1, $4, $7 }' > $WORKFILE

# loop through each line of the file and compare column 2
while read FSDEVICE FSVALUE FSMOUNT; do
	FSVALUE=$(echo $FSVALUE | sed s/\%//g) 
	typeset -i FSVALUE
	if [ $FSVALUE -gt $FSMAX ] 
	then 
		echo "$FSDEVICE mounted on $FSMOUNT is ${FSVALUE}%" >> $OUTFILE
	fi
done < $WORKFILE # feed the while loop from the bottom!!

if [[ -s %OUTFILE ]] 
then
	echo "\nFull Filesystem(s) on $THISHOST\n"
	cat $OUTFILE
	print
fi
