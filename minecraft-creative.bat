@echo off
copy server-creative.properties server.properties
java -Xmx4G -Xms4G -jar paper-1.21.10-113.jar nogui
pause