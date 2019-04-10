docker run -d --privileged ^
--name datanode1 ^
-h sandbox-datanode1.cloudera.com ^
--add-host=sandbox-datanode2.cloudera.com:172.17.0.7 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
--add-host=sandbox-admin1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-admin2.cloudera.com:172.17.0.5 ^
-p 2214:22 ^
-p 10301:9864 ^
-p 10302:9865 ^
-p 10303:9870 ^
-p 8344:8044 ^
-p 8390:8090 ^
-p 5035:5005 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec datanode1 bash /mnt/slave-init.sh
docker restart datanode1
docker run -d --privileged ^
--name datanode2 ^
-h sandbox-datanode2.cloudera.com ^
--add-host=sandbox-datanode1.cloudera.com:172.17.0.6 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
--add-host=sandbox-admin1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-admin2.cloudera.com:172.17.0.5 ^
-p 2215:22 ^
-p 10401:9864 ^
-p 10402:9865 ^
-p 10403:9870 ^
-p 8444:8044 ^
-p 8490:8090 ^
-p 5045:5005 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec datanode2 bash /mnt/slave-init.sh
docker restart datanode2