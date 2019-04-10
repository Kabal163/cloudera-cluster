#!/bin/bash
docker run -d \
--privileged \
--name cloudera-db \
-h sandbox-db.cloudera.com \
--add-host=sandbox-master.cloudera.com:172.17.0.3 \
--add-host=sandbox-slave.cloudera.com:172.17.0.4 \
-p 2200:22 \
-p 5432:5432 \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/cloudera:/mnt new-c7 \
/usr/sbin/init
docker exec cloudera-db bash /mnt/db-init.sh
docker restart cloudera-db