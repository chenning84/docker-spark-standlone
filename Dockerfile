FROM kyunam/docker-ubuntu-java-spark
MAINTAINER Ning Chen <chenning84@yahoo.com>

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update
RUN apt-get -y install openssh-server pwgen
RUN apt-get -y install usbutils
# Prepare directories
RUN mkdir -p /var/run/sshd
RUN mkdir -p /sshusers
RUN mkdir -p /scripts
RUN mkdir -p /spark_config

# Create sshusers group
RUN groupadd sshusers

# Harden sshd configuration
RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/HostbasedAuthentication.*/HostbasedAuthentication no/g" /etc/ssh/sshd_config
RUN sed -i "s/PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitEmptyPasswords.*/PermitEmptyPasswords yes/g" /etc/ssh/sshd_config
RUN sed -i "s/PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config
RUN echo "AllowGroups sshusers" >> /etc/ssh/sshd_config

# Add scripts
ADD scripts/run.sh /scripts/run.sh
ADD scripts/add_users.sh /scripts/add_users.sh
ADD scripts/set_pw.sh /scripts/set_pw.sh
ADD scripts/set_pw_root.sh /scripts/set_pw_root.sh
ADD config/slaves /spark-1.5.2-bin-hadoop2.6/conf/slaves
ADD config/spark-env.sh /spark-1.5.2-bin-hadoop2.6/conf/spark-env.sh

# Change permissions on scripts
RUN chown -Rf root:root /scripts
RUN chmod -Rf 750 /scripts

# Expose the ssh port
EXPOSE 22

# Run the initial script
#ENTRYPOINT service ssh restart && bash
CMD ["/scripts/run.sh"]
