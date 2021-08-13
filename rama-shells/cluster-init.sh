#!/usr/bin/env bash

sudo iptables -P FORWARD ACCEPT

hostnamectl status | head -n 1 | awk '{print $3}' > hostname

VAR1="$(cat hostname)"
VAR2="master-node"

rm hostname

if [ "$VAR1" = "$VAR2" ]; then
	echo 'init as a master node...'
	sudo swapoff -a
	sudo kubeadm init --apiserver-advertise-address 192.168.57.3 | tee 'init.log'
	
	mkdir -p $HOME/.kube
	sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	sudo chown $(id -u):$(id -g) $HOME/.kube/config

	echo '#!/usr/bin/env bash' > join.sh
	tail -n 2 init.log >> join.sh
	sudo chmod a+x join.sh
	echo 'join.sh is ready!'
else
	echo 'init as a worker node...'
	sudo swapoff -a
	scp admin@master-node:join.sh join.sh
	echo 'please run sudo ./join.sh to join the cluster'
fi
