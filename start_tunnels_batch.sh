#!/bin/bash
echo "starting tunnels .............................................................."

path=$1
file2=$2

for host in $(cat $HOME/$path/$file2); do
	(sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L $host) &
done


echo "tunnels started"

sh ./keepAlive.sh $path $file2
