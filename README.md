# docker-spark-standlone
customize docker file for standalone cluster


PreInstall on host maching

sshpass

Assumption : The docker instance would be assigned with fixed ip addresses e.g. by default start from  172.17.0.2
Base on my observation it's achieved when I used 1.9.1 client

/config/slaves has the list of ipaddress that would be associated with started docker instances .
/config/spark-env.sh need to change the master node you would like to use for the master node of spark