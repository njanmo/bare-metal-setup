#!/bin/bash
echo "CentOS Node Cookbook"

echo "Baking core packages...."

sudo yum install -y net-tools
sudo yum install -y openssh-server
sudo yum install -y wget
sudo yum install -y nano
sudo yum install -y dos2unix
sudo yum install -y ntp

echo "Syncing Time"

systemctl start ntpd
systemctl enable ntpd
systemctl status ntpd

echo "Configuring Host Files...."

echo '192.168.0.18 master.x.com master' >> /etc/hosts
echo '192.168.0.19 slave1.x.com slave1' >> /etc/hosts
echo '192.168.0.20 slave2.x.com slave2' >> /etc/hosts
echo '192.168.0.21 slave3.x.com slave3' >> /etc/hosts

echo "Checking Config Actually Works....."

ping -c 3 master
ping -c 3 slave1
ping -c 3 slave2
ping -c 3 slave3

echo "Cooking Passwordless Logins....."

ssh-keygen -t rsa
ssh-copy-id master
ssh-copy-id slave1
ssh-copy-id slave2
ssh-copy-id slave3

echo "Disabling Pesky Firewalls...."

sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

echo "Disabling Pesky Certificates...."

sed -i 's/verify=platform_default/verify=disable/' /etc/python/cert-verification.cfg

echo "SE Linux"

setenforce 0

echo umask 0022 >> /etc/profile


exit
