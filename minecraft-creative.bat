@echo off
copy server-creative.properties server.properties
java -Xmx4G -Xms4G -jar server.jar nogui