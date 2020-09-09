FROM centos:latest

RUN yum install -y epel-release
RUN yum install -y python3 java-1.8.0-openjdk 
RUN pip3 install virtualenv
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir -p /python/results
RUN chmod -R 777 /python
RUN mkdir /root/.ssh
COPY authorized_keys /root/.ssh/
WORKDIR /python
VOLUME /python/results
RUN yum install -y openssh-server
EXPOSE 22
CMD [ "/bin/bash" ,"/usr/sbin/sshd"]
