#docker run -d -P -v $1:/sshusers chenning84/sparkssh
#docker run -it -e ROOT_PASS=$1 -e  SPARK_OWNER=$2 --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/$2/.ssh:/ssh_config -v $3/users:/sshusers -v $3/config:/spark_config chenning84/sparkssh
docker run -d -P  -e ROOT_PASS=$1 -e  SPARK_OWNER=$2 --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/$2/.ssh:/ssh_config -v $3/users:/sshusers -v $3/config:/spark_config chenning84/sparkssh
docker run -d -P  -e ROOT_PASS=$1 -e  SPARK_OWNER=$2 --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/$2/.ssh:/ssh_config -v $3/users:/sshusers -v $3/config:/spark_config chenning84/sparkssh
docker run -d -P  -e ROOT_PASS=$1 -e  SPARK_OWNER=$2 --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/$2/.ssh:/ssh_config -v $3/users:/sshusers -v $3/config:/spark_config chenning84/sparkssh
