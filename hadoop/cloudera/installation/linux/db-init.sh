#!/bin/bash
echo "yum update"
yum -y update
echo "install wget net-tools nano openssh-server openssh-clients"
yum -y install wget net-tools nano openssh-server openssh-clients
echo "enable ssh server"
systemctl start sshd.service
yum -y --enablerepo=extras install epel-release
yum -y install postgresql-server
yum -y install python-pip
pip install psycopg2==2.7.5 --ignore-installed
echo 'LC_ALL="en_US.UTF-8"' >> /etc/locale.conf
su -l postgres -c "postgresql-setup initdb"
sed -i 's!# IPv4 local connections:!# IPv4 local connections:\nhost    all             all             172.17.0.3/16            md5\nhost    all             all             172.17.0.4/16            md5!' /var/lib/pgsql/data/pg_hba.conf
sed -i 's!# IPv4 local connections:!# IPv4 local connections:\nhost    all             all             172.17.0.5/16            md5\nhost    all             all             172.17.0.6/16            md5!' /var/lib/pgsql/data/pg_hba.conf
sed -i 's!# IPv4 local connections:!# IPv4 local connections:\nhost    all             all             172.17.0.7/16            md5!' /var/lib/pgsql/data/pg_hba.conf
sed -i 's/#listen_addresses = '\''localhost'\''/listen_addresses = '\''*'\''/' /var/lib/pgsql/data/postgresql.conf
sed -i 's/shared_buffers = 32MB/shared_buffers = 256MB/' /var/lib/pgsql/data/postgresql.conf
sed -i 's/#wal_buffers = -1/wal_buffers  = 8MB/' /var/lib/pgsql/data/postgresql.conf
sed -i 's/#checkpoint_completion_target = 0.5/checkpoint_completion_target = 0.9/' /var/lib/pgsql/data/postgresql.conf
systemctl enable postgresql
systemctl restart postgresql
su -l postgres -c "psql -d postgres -a -f /mnt/create-db.sql"