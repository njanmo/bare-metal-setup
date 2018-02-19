# bare-metal-setup

## Introduction

The script included with this repository is designed to speed up the environment prep for HortonWorks HDP on CentOS 7.

**It is important to note that while this script does a lot of the heavy lifting it is not intended for unattended install, it must be run manually on all 4 nodes and during the ssh setup the user must manually enter confirmations for each time the key is copied etc.**

To start the file, cd to the directory where it is stored and run `./setup.sh`

## Things to note before running the script

### Setting static IP's

This is for a 4 node cluster, since this is for a homelab setup, I have reserved/assigned the IP's of the nodes using DHCP leases on a local router and not set statically on the nodes themselves. [See Here](https://www.howtogeek.com/69612/how-to-set-up-static-dhcp-on-your-dd-wrt-router/)

### Customising FQDN

If you want to have a customised FQDN you will need to change the 'x' in each of these lines of the script:

```
echo '192.168.0.18 master.x.com master' >> /etc/hosts
echo '192.168.0.19 slave1.x.com slave1' >> /etc/hosts
echo '192.168.0.20 slave2.x.com slave2' >> /etc/hosts
echo '192.168.0.21 slave3.x.com slave3' >> /etc/hosts
```

### Permanently disabling SELinux

SELinux is only temporarily disabled using this script, to permanently disable please see instructions [here at 3.8](https://njanmo.github.io/bigdata/2018/02/03/hadoop-bare-metal.html#3)

### Customising hostname architecture

replace all instances of below names with desired names:

```
master
slave1
slave2
slave3
```

### Troubleshooting

If script does not run as expected it may be necessary to convert from DOS to Unix, to perform this cd to directory where setup script is located and run:

```
yum install -y dos2unix

dos2unix setup.sh
```

The script should then be ready to run
