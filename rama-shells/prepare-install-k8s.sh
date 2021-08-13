#!/usr/bin/env bash

sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=2379-2380/tcp
sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=10251/tcp
sudo firewall-cmd --permanent --add-port=10252/tcp
sudo firewall-cmd --permanent --add-port=10255/tcp
sudo firewall-cmd --reload
sudo modprobe br_netfilter

echo '[kubernetes]' > kubernetes.repo
echo 'name=Kubernetes' >> kubernetes.repo
echo 'baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64' >> kubernetes.repo
echo 'enabled=1' >> kubernetes.repo
echo 'gpgcheck=1' >> kubernetes.repo
echo 'repo_gpgcheck=1' >> kubernetes.repo
echo 'gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg' >> kubernetes.repo

sudo mv kubernetes.repo /etc/yum.repos.d/kubernetes.repo

echo 'please reboot now'
