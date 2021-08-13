#!/usr/bin/env bash

sudo yum install kubeadm -y 
sudo systemctl enable kubelet
sudo systemctl start kubelet
