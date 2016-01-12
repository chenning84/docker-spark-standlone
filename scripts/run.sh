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

service ssh restart && bash

#exec su - spark