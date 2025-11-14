# PowerShell script to create a scheduled task for daily Minecraft backups

$taskName = "Minecraft World Backup"
$taskDescription = "Daily backup of Minecraft server world files to Google Drive"
$scriptPath = "C:\Minecraft Server\backup-worlds.bat"

# Check if task already exists
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if ($existingTask) {
    Write-Host "Task '$taskName' already exists. Removing old task..." -ForegroundColor Yellow
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create the action (run the backup script)
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$scriptPath`""

# Create the trigger (daily at 2:00 AM)
$trigger = New-ScheduledTaskTrigger -Daily -At "2:00AM"

# Create settings
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -RunOnlyIfNetworkAvailable:$false

# Get current user
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# Register the task
Register-ScheduledTask `
    -TaskName $taskName `
    -Description $taskDescription `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -User $currentUser `
    -RunLevel Highest

Write-Host "`nScheduled task created successfully!" -ForegroundColor Green
Write-Host "Task Name: $taskName" -ForegroundColor Cyan
Write-Host "Schedule: Daily at 2:00 AM" -ForegroundColor Cyan
Write-Host "Script: $scriptPath" -ForegroundColor Cyan
Write-Host "`nYou can view/modify this task in Task Scheduler (taskschd.msc)" -ForegroundColor Yellow
Write-Host "To run the backup manually at any time, just double-click: backup-worlds.bat" -ForegroundColor Yellow
