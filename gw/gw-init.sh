#!/bin/bash
### by mohammadmahmoud agahi

docker volume create gw-output
docker volume create gw-input

mkdir /var/lib/docker/volumes/gw-output/_data/files
mkdir /var/lib/docker/volumes/gw-output/_data/reports
mkdir /var/lib/docker/volumes/gw-input/files

mkdir git-for-gw
cd git-for-gw
git clone https://github.com/m-agahi/Dockerfiles.git
cd Dockerfiles/gw
docker build -t gw:latest .

inputpath="/var/lib/docker/volumes/gw-input/_data/files"

for ((i=1;i<=100;i++))
do
    echo  " this is the source file number $i " > $inputpath/$i.src
done

for file in `ls $inputpath`
do  
    docker run \
        --rm \
        -itd \
        --name gw \
        -v gw-input:/gw-input:ro \
        -v gw-output:/gw-output \
        --env SRCFILE='$file' \
        gw
done
