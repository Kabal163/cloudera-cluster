#!/bin/bash
echo "yum update"
yum -y update
echo "install wget net-tools nano openssh-server openssh-clients"
yum -y install wget net-tools nano openssh-server openssh-clients bsdtar
echo "enable ssh server"
systemctl start sshd.service
rm -f /usr/bin/tar
alternatives --install /usr/bin/tar tar /usr/bin/bsdtar 1000
alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_181-cloudera/bin/java 1000
