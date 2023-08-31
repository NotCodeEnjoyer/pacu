#!/bin/bash

for image in evilginx nginx-proxy
do
    docker build -t $image $image/.
    docker tag  $image $image
done

docker rmi jwilder/nginx-proxy
docker rmi ubuntu:20.04

git clone https://github.com/NotCodeEnjoyer/pacu /opt/pacu
mkdir -p /opt/pacu
cp /opt/pacu/setup.sh /usr/local/bin/pacu
chmod +x /usr/local/bin/pacu
