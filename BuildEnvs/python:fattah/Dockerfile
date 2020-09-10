### This Dockerfile will create a suitable environment
### for running python codes with jenkins pipelines
### inside a docker node
#
FROM centos:latest
LABEL maintainer="Moahmmadmahmoud Agahi <m.agahi@outlook.com>"
#
RUN yum update -y && \
    yum upgrade -y && \
    yum clean all
RUN yum install -y \
    epel-release \
    python3 \
    java-1.8.0-openjdk \
    openssh-server \
    wget \
    curl \
    git 
RUN python3 -m pip install --upgrade pip 
RUN pip3 install \
    virtualenv \
    setuptools \
    wheel
RUN ln -s /usr/bin/python3 /usr/bin/python
#
###This directory is for testing the output of python it can be removed 
RUN mkdir -p /python/results && \
    chmod -R 777 /python
#
#
#adding jenkins user and configutin its environment
RUN adduser jenkins && \
    echo "jenkins:this is the new shit!" | chpasswd && \
    mkdir /home/jenkins/.m2 && \
    mkdir /home/jenkins/.ssh
COPY authorized_keys /home/jenkins/.ssh/
RUN chown -R jenkins:jenkins /home/jenkins/.m2/ && \
    chown -R jenkins:jenkins /home/jenkins/.ssh/
#
## Configuring sshd 
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
    ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i 's|#Port 22|Port 2222|g' /etc/ssh/sshd_config && \
    sed -i 's|HostKey /etc/ssh/ssh_host_ecdsa_key|#HostKey /etc/ssh/ssh_host_ecdsa_key|g' /etc/ssh/sshd_config && \
    sed -i 's|HostKey /etc/ssh/ssh_host_ed25519_key|#HostKey /etc/ssh/ssh_host_ed25519_key|g' /etc/ssh/sshd_config
#
#
VOLUME /python/results
WORKDIR /python
EXPOSE 2222
CMD [ "rm -f /run/nologin && /usr/sbin/sshd", "-D" ]
