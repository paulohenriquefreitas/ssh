#!/bin/bash

echo "starting tunnels .............................................................."

if [ ! -z $1 ]
then
    sleep=$1
else
    sleep=5
fi    
echo $OSTYPE

echo $PWD
echo $sleep

for host in $(cat $PWD/tunnelList.txt); do
    echo $host
	(sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L $host) &
done

while true; do
    sleep $sleep    

    for host in $(cat $PWD/tunnelList.txt)
    do
    	if [ ! -z $host ]; then	
            r=$host	
            ntstat=`sudo netstat -lnp | grep ssh | grep :${r%%:*}`    
            if [ -z "$ntstat" ]
            then
                (sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L $host) &
                echo "Reconnecting " $host
            else
                echo $ntstat            
            fi    
    	fi        
    done
    echo "Check connection after "  $sleep " seconds"
done