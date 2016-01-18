sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.2
rsh $2@172.17.0.2 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.2"
rsh $2@172.17.0.2 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.3"
rsh $2@172.17.0.2 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.4"
#rsh $2@172.17.0.2 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.5"
rsh $2@172.17.0.2 "bash -x  /spark-1.5.2-bin-hadoop2.6/sbin/start-all.sh"

