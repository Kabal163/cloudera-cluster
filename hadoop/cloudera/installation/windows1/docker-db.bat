docker run -d --privileged ^
--name cloudera-db ^
-h sandbox-db.cloudera.com ^
--add-host=sandbox-master.cloudera.com:172.17.0.3 ^
--add-host=sandbox-slave1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-slave2.cloudera.com:172.17.0.5 ^
-p 2200:22 ^
-p 5432:5432 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec cloudera-db bash /mnt/db-init.sh
docker restart cloudera-db