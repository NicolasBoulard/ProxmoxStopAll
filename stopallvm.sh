#!/bin/sh

numero=8
limite=0

while test $numero != $limite
    do
	ping -q -c2 10.12.7.$numero > /dev/null

	if [ $? -eq 0 ]
	then
		echo "<br><h1>pve"$numero": Stopping all VMs ...</h1><br>"
        sshpass -p proxmox ssh root@10.12.7.$numero "pvesh create /nodes/localhost/stopall"
        echo "<br><h1>pve"$numero": OK</h1><br>"
        sshpass -p proxmox ssh root@10.12.7.$numero "shutdown now"
        echo "<br><h1>pve"$numero": Shutdown OK</h1><br>"
        echo 
	else
		echo "<br>pve"$numero": Error node offline ?<br>"
	fi
    numero=$(($numero - 1))
done
