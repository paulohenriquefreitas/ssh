echo "starting tunnels .............................................................."
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 37201:soati8.intranet:37201 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 80:soacc.intranet:80 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 6379:mbchx04:6379 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 8765:digdx01.interno:8765 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 9881:osbserviceti.intranet:9881 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 7200:soasso.intranet:7200 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 7200:soasync01.telemar:7200 &
sshpass -p "JkliuPh3" ssh -N -p 22 tr568073@mbchx03b -L 8080:soaqos3.intranet:80 &
echo "tunnels started"
