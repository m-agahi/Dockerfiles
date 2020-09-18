### This Dockerfile will create a suitable environment
### for reconstructing a single document sent by the vars to it
### inside a docker node
#
FROM centos:latest
LABEL maintainer="Moahmmadmahmoud Agahi <m.agahi@outlook.com>"
###This directory is for input and output files 
COPY gw.sh /root/
ENV SRCFILE="/dev/zero"
WORKDIR /root
CMD . /root/gw.sh

### there shourld be 2 volumes created: output and input
### run the containre with this command : 
### docker run --rm -itd --name <name> -v <volumenameinput> -v <volumenameoutput> <imagename>