@echo off
REM Monitor Minecraft server connections and network status
echo === Minecraft Server Connection Monitor ===
echo Press Ctrl+C to stop monitoring
echo.

:loop
cls
echo === Active Connections (Port 25565) ===
echo Time: %date% %time%
echo.
netstat -n | findstr :25565
echo.
echo === Recent Server Log (Last 5 lines) ===
powershell -Command "Get-Content 'C:\Minecraft Server\logs\latest.log' -Tail 5"
echo.
echo Refreshing in 10 seconds... (Press Ctrl+C to stop)
timeout /t 10 /nobreak >nul
goto loop
