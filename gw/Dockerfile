### This Dockerfile will create a suitable environment
### for reconstructing a single document sent by the vars to it
### inside a docker node
#
FROM centos:latest
LABEL maintainer="Moahmmadmahmoud Agahi <m.agahi@outlook.com>"
#
ENV srcfile="/dev/zero"
RUN yum update -y && \
    yum upgrade -y && \
    yum clean all

###This directory is for input and output files 
#
COPY gw.sh /root/
VOLUME [ "/input" ]
VOLUME [ "/output" ]
WORKDIR /mnt
CMD . /root/gw.sh

### there shourld be 2 volumes created: output and input
### run the containre with this command : 
### docker run --rm -itd --name <name> -v <volumenameinput> -v <volumenameoutput> <imagename>