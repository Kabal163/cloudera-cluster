#!/bin/bash
docker run -d \
--privileged \
--name slave \
-h sandbox-slave.cloudera.com \
--add-host=sandbox-master.cloudera.com:172.17.0.3 \
--add-host=sandbox-db.cloudera.com:172.17.0.2 \
-p 2212:22 \
-p 7280:7180 \
-p 7283:7183 \
-p 50270:50070 \
-p 50275:50075 \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/cloudera:/mnt \
new-c7 \
/usr/sbin/init
docker exec slave bash /mnt/slave-init.sh
docker restart slave