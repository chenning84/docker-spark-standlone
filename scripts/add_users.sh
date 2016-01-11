#!/bin/bash

handle_user()
{
	# Get arguments
	user="$1"
	grps="$2"
	file="$3"

	# Add the user
	useradd   -m -s /bin/bash "$user"

	# Include the user in groups
	usermod -a -G  "$grps" "$user"

	# Get the public key
	pubkey=$(cat "$file")

	# Create ssh dir and authorized keys file
	mkdir -p /home/"$user"/.ssh
	echo "=> Adding public key(s) to /home/$user/.ssh/authorized_keys:"
	echo "$pubkey"
	echo "$pubkey" > /home/"$user"/.ssh/authorized_keys

	# Change permissions
	chmod 700 /home/"$user"/.ssh
	chmod 600 /home/"$user"/.ssh/*
	chown -Rf "$user:$user" /home/"$user"

	# Finish by setting a password
	/scripts/set_pw.sh "$user"
}

# Handle sudo users
for file in $(ls /sshusers/sudoers/ | grep .user);
do
	# Get username
	user="${file%.*}"

	# Set groups
	grps="sshusers,sudo"

	# Handle the user
	handle_user "$user" "$grps" "/sshusers/sudoers/$file"
done

# Handle normal users
for file in $(ls /sshusers/ | grep .user);
do
	# Get username
	user="${file%.*}"

	# Set groups
	grps="sshusers"

	# Handle the user
	handle_user "$user" "$grps" "/sshusers/$file"
done
