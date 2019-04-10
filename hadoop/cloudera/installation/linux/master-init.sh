#!/bin/bash
echo "yum update"
yum -y update
echo "install wget net-tools nano openssh-server openssh-clients"
yum -y install wget net-tools nano openssh-server openssh-clients
echo "enable ssh server"
systemctl start sshd.service
echo "install cloudera repo"
wget https://archive.cloudera.com/cm6/6.2.0/redhat7/yum/cloudera-manager.repo -P /etc/yum.repos.d/
rpm --import https://archive.cloudera.com/cm6/6.2.0/redhat7/yum/RPM-GPG-KEY-cloudera
echo "install java"
yum -y install oracle-j2sdk1.8
echo"install cloudera components"
yum -y install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server
export JAVA_HOME=/usr/java/jdk1.8.0_181-cloudera
/opt/cloudera/cm-agent/bin/certmanager setup --configure-services
echo "$(cat /var/log/cloudera-scm-agent/certmanager.log)"
echo "configuring db"
exec /opt/cloudera/cm/schema/scm_prepare_database.sh -h sandbox-db.cloudera.com postgresql scm scm scm
echo "start cloudera server"
systemctl start cloudera-scm-server