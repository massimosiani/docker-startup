#!/bin/bash

sudo -i
# docker machine
curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip >machine.zip && \
unzip machine.zip && rm machine.zip && mv docker-machine* /usr/local/bin
# docker compose
curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# docker compose completion
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
exit

mName=api

docker-machine create --driver virtualbox $mName
eval "$(docker-machine env $mName)"
echo 'eval "$(docker-machine env $mName)"' >> $HOME/.bashrc

docker run busybox echo hello world
lastExit=$?
[[ $lastExit ]] || echo "Error running hello world install" || exit 1
