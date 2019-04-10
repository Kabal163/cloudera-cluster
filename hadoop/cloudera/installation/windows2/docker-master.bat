docker run -d --privileged ^
--name master2 ^
-h sandbox-master.cloudera.com ^
--network host ^
--network bridge ^
--add-host=sandbox-db.cloudera.com:172.17.0.2 ^
--add-host=sandbox-admin1.cloudera.com:172.17.0.4 ^
--add-host=sandbox-admin2.cloudera.com:172.17.0.5 ^
--add-host=sandbox-datanode1.cloudera.com:172.17.0.6 ^
--add-host=sandbox-datanode2.cloudera.com:172.17.0.7 ^
-p 2211:22 ^
-p 7180:7180 ^
-p 7182:7182 ^
-p 7183:7183 ^
-v C:\Users\Dmitrii_Kanaev\IdeaProjects\hadoop-advanced\hadoop\cloudera\installation\linux:/mnt ^
test/test ^
/usr/sbin/init
docker exec master2 bash /mnt/master-init.sh
docker restart master2
start cmd /c "docker exec master2 tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log"