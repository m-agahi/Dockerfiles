FROM centos:latest

RUN yum install -y epel-release
RUN yum install -y python3
RUN pip3 install virtualenv
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN ln -s /usr/bin/python3 /usr/bin/python

CMD [ "/bin/bash" ]

