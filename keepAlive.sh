#!/bin/bash

while true; do
    sleep 2
    path=$1
    file2=$2

    for host in $(cat $HOME/$path/$file2)
    do
    	if [ ! -z $host ]; then	
            r=$host	
            ntstat=`sudo netstat -lnp | grep ssh | grep :${r%%:*}`    
            if [ -z "$ntstat" ]
            then
                sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L $host
                echo "Reconnecting " $host
            else
                echo $ntstat            
            fi    
    	fi
    done
done