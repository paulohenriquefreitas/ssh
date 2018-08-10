#!/bin/bash

echo "starting tunnels .............................................................."

if [ ! -z $1 ]
then
    sleep=$1
else
    sleep=5
fi    
#echo $OSTYPE

case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;; 
  linux*)   path=$PWD/tunnelList.txt;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

#echo $path
#echo $sleep

for host in $(cat $path ); do    
	(echo "tinogomes" | sudo -S sshpass -p "JkliuPh3" ssh -N  tr568073@mbchx03b -L $host) &
done

while true; do
    sleep $sleep    

    for host in $(cat $path)
    do
    	if [ ! -z $host ]; then	
            r=$host	
            ntstat=`sudo netstat -lnp | grep ssh | grep :${r%%:*}`    
            if [ -z "$ntstat" ]
            then
                (echo "tinogomes" | sudo -S  sshpass -p "JkliuPh3" ssh -N  tr568073@mbchx03b -L $host) &
                echo "Reconnecting " $host
            else
                echo "Connected at " $ntstat            
            fi    
    	fi        
    done
    echo "Check connection after "  $sleep " seconds"
done