#!/bin/bash

# Quit if root password is set
if [[ -f /.root_pw_set ]]; then
	echo "Root password already set!"
	exit 0
fi

# Generate password if not set by environment variable
pass=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ "${ROOT_PASS}" ] && echo "preset" || echo "random" )

# Set the password
echo "=> Setting a ${_word} password for the user \"root\""
echo "root:$pass" | chpasswd

echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "Finished setting the following password for the user \"root\":"
echo "$pass"
echo ""
echo "You should change the password above as soon as possible!"
echo "Since root login via SSH is not permitted, use one of the sudoers."
echo "========================================================================"
