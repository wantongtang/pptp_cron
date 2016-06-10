#!/bin/bash
 
HOST=yourhost
 
DATE=`date`
PINGRES=`ping -c 2 $HOST`
PLOSS=`echo $PINGRES : | grep -oP '\d+(?=% packet loss)'`
echo "$DATE : Loss Result : $PLOSS"
 
if [ "100" -eq "$PLOSS" ];
then
	echo "$DATE : Starting : $HOST"
	pon pptp0
	echo "$DATE : Now running : $HOST"
else
    echo "$DATE : Already running : $HOST"
fi
