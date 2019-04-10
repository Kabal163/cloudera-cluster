#!/bin/bash
docker run -d \
--privileged \
--name master \
-h sandbox-master.cloudera.com \
--add-host=sandbox-slave.cloudera.com:172.17.0.4 \
--add-host=sandbox-db.cloudera.com:172.17.0.2 \
-p 2211:22 \
-p 7180:7180 \
-p 7183:7183 \
-p 50070:50070 \
-p 50075:50075 \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/cloudera:/mnt \
new-c7 \
/usr/sbin/init
docker exec master bash /mnt/master-init.sh
docker restart master
docker exec master tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log