sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.1
rsh $2@172.17.0.1 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.1"
rsh $2@172.17.0.1 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.2"
rsh $2@172.17.0.1 "sshpass -p $1 ssh-copy-id -o StrictHostKeyChecking=no $2@172.17.0.3"
rsh $2@172.17.0.1 "bash -x  /spark-1.5.2-bin-hadoop2.6/sbin/start-all.sh"

