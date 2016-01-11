#!/bin/bash

# Quit if number of args isn't 1
if [[ "$#" != "1" ]]; then
	echo "No user argument given!"
	exit 0
fi

# Get username
user=$1

# Generate random password
#pass=$(pwgen -s 12 1)
# Generate password if not set by environment variable
pass=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ "${ROOT_PASS}" ] && echo "preset" || echo "random" )

# Set the password
echo "=> Setting a random password for the user \"$user\""
echo "$user:$pass" | chpasswd

echo "=> Done!"

echo "======================================================================================="
echo "Finished creating the user \"$user\" with the following password:"
echo "$pass"
echo ""
echo "$(id $user)"
echo ""
echo "If the user is a part of the sshusers group, you can ssh into this"
echo "container using the following command:"
echo ""
echo "    ssh -i /path/to/ssh/key -p <port> $user@<host>"
echo ""
echo "You should change the password above as soon as possible!"
echo "======================================================================================="
