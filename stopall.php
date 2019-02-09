<?php
echo "Stopping all VMs <br>";
//$command1 = shell_exec("sudo sshpass -p proxmox ssh root@10.12.7.8 'pvesh create /nodes/localhost/stopall'");
$command1 = shell_exec("sudo ./stopallvm.sh");
//$command1 = shell_exec("sshpass -p proxmox ssh root@10.12.7.1 'qm stop 200'");
echo $command1;
?>
