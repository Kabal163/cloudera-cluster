docker run -d --privileged ^
--name master ^
-h sandbox-master.cloudera.com ^
--add-host=sandbox-slave1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-slave2.cloudera.com:172.17.0.5 ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
-p 2211:22 ^
-p 7180:7180 ^
-p 7182:7182 ^
-p 7183:7183 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec master bash /mnt/master-init.sh
docker restart master
start cmd /c "docker exec master tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log"