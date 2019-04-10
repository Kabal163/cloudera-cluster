docker run -d --privileged ^
--name slave1 ^
-h sandbox-slave1.cloudera.com ^
--add-host=sandbox-slave2.cloudera.com:172.17.0.5 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
-p 2212:22 ^
-p 7280:7180 ^
-p 7282:7182 ^
-p 7283:7183 ^
-p 10101:9864 ^
-p 10102:9865 ^
-p 10103:9870 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec slave1 bash /mnt/slave-init.sh
docker restart slave1
docker run -d --privileged ^
--name slave2 ^
-h sandbox-slave2.cloudera.com ^
--add-host=sandbox-slave1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
-p 2213:22 ^
-p 7380:7180 ^
-p 7382:7182 ^
-p 7383:7183 ^
-p 10201:9864 ^
-p 10202:9865 ^
-p 10203:9870 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec slave2 bash /mnt/slave-init.sh
docker restart slave2