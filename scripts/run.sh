#!/bin/bash

# Set password for root
if [ ! -f /.root_pw_set ]; then
	/scripts/set_pw_root.sh
fi

# Add any users in /sshusers
/scripts/add_users.sh

# Start the ssh daemon
#exec /usr/sbin/sshd -D
owner=${SPARK_OWNER}
chown -R "$owner":"$owner" /spark-1.5.2-bin-hadoop2.6
chown -R "$owner":"$owner" /spark_config
#cp /ssh_config/id_rsa /home/"$owner"/.ssh/id_rsa
#cp /ssh_config/id_rsa.pub /home/"$owner"/.ssh/id_rsa.pub
cp /ssh_config/id_rsa.pub /home/"$owner"/.ssh/authorized_keys
chown -R "$owner":"$owner"  /home/"$owner"/.ssh
service ssh restart && bash

#exec su - spark