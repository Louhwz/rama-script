#!/usr/bin/env bash

hostnamectl status | head -n 1 | awk '{print $3}' > hostname

VAR1="$(cat hostname)"
VAR2="inet-router"

rm hostname

if [ "$VAR1" = "$VAR2" ]; then
	echo 'acquire mac address of the router'
	cat /sys/class/net/enp0s8/address > router_mac
	echo 'router_mac is ready!'
else
	echo 'fetch mac address of the router'
	scp admin@inet-router:router_mac .
	VAR3="$(cat router_mac)"
	sudo arp -s 192.168.56.1 -i enp0s8 "$VAR3"
	echo 'arp is ready!'
fi
