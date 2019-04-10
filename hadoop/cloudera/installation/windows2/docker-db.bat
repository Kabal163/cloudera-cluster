docker run -d --privileged ^
--name postgres-db ^
-h sandbox-db.cloudera.com ^
--network host ^
--network bridge ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-admin1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-admin2.cloudera.com:172.17.0.5 ^
--add-host=sandbox-datanode1.cloudera.com:172.17.0.6 ^
--add-host=sandbox-datanode2.cloudera.com:172.17.0.7 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec postgres-db bash /mnt/db-init.sh
docker restart postgres-db