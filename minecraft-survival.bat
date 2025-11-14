@echo off
copy server-survival.properties server.properties
java -Xmx4G -Xms4G -jar server.jar nogui