@echo off
REM Minecraft World Backup Script
REM Backs up world folders to Google Drive synced location

setlocal enabledelayedexpansion

REM Set backup directory
set BACKUP_DIR=C:\minecraft_backups
set SERVER_DIR=C:\Minecraft Server

REM Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

REM Generate timestamp (YYYY-MM-DD-HHMM format)
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set TIMESTAMP=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%-%datetime:~8,2%%datetime:~10,2%

echo ========================================
echo Minecraft World Backup
echo Time: %TIMESTAMP%
echo ========================================
echo.

REM Backup main world
if exist "%SERVER_DIR%\world" (
    echo Backing up world...
    powershell -Command "Compress-Archive -Path '%SERVER_DIR%\world' -DestinationPath '%BACKUP_DIR%\world-%TIMESTAMP%.zip' -Force"
    if !errorlevel! equ 0 (
        echo   SUCCESS: world-%TIMESTAMP%.zip created
    ) else (
        echo   ERROR: Failed to backup world
    )
) else (
    echo   SKIP: world folder not found
)

echo.

REM Backup survival world
if exist "%SERVER_DIR%\survivalworld" (
    echo Backing up survivalworld...
    powershell -Command "Compress-Archive -Path '%SERVER_DIR%\survivalworld' -DestinationPath '%BACKUP_DIR%\survivalworld-%TIMESTAMP%.zip' -Force"
    if !errorlevel! equ 0 (
        echo   SUCCESS: survivalworld-%TIMESTAMP%.zip created
    ) else (
        echo   ERROR: Failed to backup survivalworld
    )
) else (
    echo   SKIP: survivalworld folder not found
)

echo.

REM Backup realworld
if exist "%SERVER_DIR%\realworld" (
    echo Backing up realworld...
    powershell -Command "Compress-Archive -Path '%SERVER_DIR%\realworld' -DestinationPath '%BACKUP_DIR%\realworld-%TIMESTAMP%.zip' -Force"
    if !errorlevel! equ 0 (
        echo   SUCCESS: realworld-%TIMESTAMP%.zip created
    ) else (
        echo   ERROR: Failed to backup realworld
    )
) else (
    echo   SKIP: realworld folder not found
)

echo.
echo ========================================
echo Cleaning up old backups (keeping last 7)
echo ========================================
echo.

REM Clean up old backups for each world (keep last 7)
for %%w in (world survivalworld realworld) do (
    echo Cleaning up old %%w backups...

    REM Count files and delete oldest if more than 7
    set COUNT=0
    for /f %%f in ('dir /b /o-d "%BACKUP_DIR%\%%w-*.zip" 2^>nul ^| find /c /v ""') do set COUNT=%%f

    if !COUNT! gtr 7 (
        set /a DELETE_COUNT=!COUNT!-7
        echo   Found !COUNT! backups, deleting !DELETE_COUNT! oldest...

        REM Delete oldest files beyond the 7 newest
        set SKIP=7
        for /f "skip=7 delims=" %%f in ('dir /b /o-d "%BACKUP_DIR%\%%w-*.zip" 2^>nul') do (
            del "%BACKUP_DIR%\%%f"
            echo   Deleted: %%f
        )
    ) else (
        echo   Found !COUNT! backups, no cleanup needed
    )
)

echo.
echo ========================================
echo Backup complete!
echo Location: %BACKUP_DIR%
echo ========================================
echo.

endlocal
pause
