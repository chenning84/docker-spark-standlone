#!/bin/bash

# Set password for root
if [ ! -f /.root_pw_set ]; then
	/scripts/set_pw_root.sh
fi

# Add any users in /sshusers
/scripts/add_users.sh

# Start the ssh daemon
#exec /usr/sbin/sshd -D


service ssh restart && bash

exec su - spark