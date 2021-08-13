#!/usr/bin/env bash

sudo swapoff -a
sudo iptables -P FORWARD ACCEPT
sudo ip route add 192.168.56.0/24 dev enp0s8
