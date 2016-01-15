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
cp /ssh_config/known_hosts /home/"$owner"/.ssh/known_hosts


chown -R "$owner":"$owner"  /home/"$owner"/.ssh
su - $owner -c 'ssh-keygen -f .ssh/id_rsa -t rsa -N ""'
su - $owner -c 'cat .ssh/id_rsa.pub >> .ssh/authorized_keys'
service ssh restart && bash

#exec su - spark