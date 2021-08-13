#!/usr/bin/env bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io --allowerasing -y

sudo systemctl enable docker
sudo systemctl start docker
