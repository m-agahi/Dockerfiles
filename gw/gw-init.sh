#!/bin/bash
### by mohammadmahmoud agahi

docker volume create gw-output
docker volume create gw-input

mkdir -p /var/lib/docker/volumes/gw-output/_data/files
mkdir -p /var/lib/docker/volumes/gw-output/_data/reports
mkdir -p /var/lib/docker/volumes/gw-input/_data/files

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
        -v gw-input:/gw-input:ro \
        -v gw-output:/gw-output \
        --env SRCFILE=$file \
        gw
    sleep 0.1
done
cd ../../../
rm -rf git-for-gw