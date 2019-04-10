docker run -d --privileged ^
--name admin1 ^
-h sandbox-admin1.cloudera.com ^
--add-host=sandbox-admin2.cloudera.com:172.17.0.5 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
--add-host=sandbox-datanode1.cloudera.com:172.17.0.6 ^
--add-host=sandbox-datanode2.cloudera.com:172.17.0.7 ^
-p 2212:22 ^
-p 10101:9864 ^
-p 10102:9865 ^
-p 10103:9870 ^
-p 8144:8044 ^
-p 8190:8090 ^
-p 51470:50470 ^
-p 5015:5005 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec admin1 bash /mnt/slave-init.sh
docker restart admin1
docker run -d --privileged ^
--name admin2 ^
-h sandbox-admin2.cloudera.com ^
--add-host=sandbox-admin1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
--add-host=sandbox-datanode1.cloudera.com:172.17.0.6 ^
--add-host=sandbox-datanode2.cloudera.com:172.17.0.7 ^
-p 2213:22 ^
-p 10201:9864 ^
-p 10202:9865 ^
-p 10203:9870 ^
-p 8244:8044 ^
-p 8290:8090 ^
-p 52470:50470 ^
-p 5025:5005 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec admin2 bash /mnt/slave-init.sh
docker restart admin2