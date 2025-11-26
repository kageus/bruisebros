# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a PaperMC-based Minecraft server management system designed for multi-mode server switching (Creative and Survival modes) with automated backup capabilities. The server runs on Windows.

**Note:** For information about installing client+server mods (Forge/Fabric/NeoForge), see [MODS.md](MODS.md).

## Server Launch Commands

**Start Creative Mode:**
```bat
minecraft-creative.bat
```

**Start Survival Mode:**
```bat
minecraft-survival.bat
```

**Run Manual Backup:**
```bat
backup-worlds.bat
```

**Setup Automated Daily Backups (4:00 AM):**
```powershell
powershell -ExecutionPolicy Bypass -File setup-daily-backup.ps1
```

## Architecture Overview

### Multi-Mode Switching Mechanism

The system uses a **configuration swapping architecture** to switch between game modes:

1. Each mode has its own properties file:
   - `server-creative.properties` (level-name=world)
   - `server-survival.properties` (level-name=survivalworld)

2. Mode-specific launch scripts copy the appropriate properties file to `server.properties` before starting the server:
   ```bat
   copy server-creative.properties server.properties
   java -Xmx4G -Xms4G -jar paper-1.21.10-113.jar nogui
   ```

3. The `level-name` property determines which world folder loads:
   - Creative: `/world`
   - Survival: `/survivalworld`

### Backup System Architecture

**Location:** `backup-worlds.bat`

The backup system implements intelligent change detection and auto-restart:

1. **Mode Detection:** Parses `server.properties` to extract the `level-name` property, determining if server is running Creative or Survival mode
2. **Server Management:** If server is running, stops it gracefully via `taskkill /IM java.exe /F`
3. **Change Detection:** Uses PowerShell to compare world file modification times against last backup timestamp - skips backup if no changes
4. **Backup Creation:** Compresses world folders to `C:\minecraft_backups\[worldname]-[YYYY-MM-DD-HHMM].zip`
5. **Cleanup:** Maintains rolling 7-backup history per world
6. **Auto-Restart:** Relaunches server in detected mode using appropriate bat file

**Critical Implementation Detail:** Mode detection uses nested if-else blocks (not `else if`) because batch file syntax requires this structure:
```bat
if "!LEVEL_NAME!"=="world" (
    set SERVER_MODE=creative
) else (
    if "!LEVEL_NAME!"=="survivalworld" (
        set SERVER_MODE=survival
    ) else (
        set SERVER_MODE=unknown
    )
)
```

### Configuration Hierarchy

The server uses a layered configuration system:

1. **Server Properties** (`server.properties`) - Base Minecraft settings (port, max players, difficulty)
2. **Paper Global Config** (`config/paper-global.yml`) - Server-wide PaperMC optimizations (chunk loading, async processing, watchdog)
3. **Paper World Defaults** (`config/paper-world-defaults.yml`) - Default settings for all worlds (entity spawning, tick rates, mob limits)
4. **World-Specific Overrides** (`world/paper-world.yml`) - Per-world configuration overrides
5. **Bukkit Config** (`bukkit.yml`) - Plugin framework settings (spawn limits, chunk GC)
6. **Spigot Config** (`spigot.yml`) - Spigot-level optimizations (entity tracking, hopper mechanics)

Settings flow from global to specific: Global defaults → World defaults → Per-world overrides

## Current Server Configuration

- **Server Software:** PaperMC 1.21.10-113
- **Java Memory:** 4GB min/max heap (`-Xmx4G -Xms4G`)
- **Max Players:** 6
- **View Distance:** 8 chunks (optimized from 10)
- **Simulation Distance:** 6 chunks (optimized from 10)
- **Port:** 25565
- **Performance Tuning:** `sync-chunk-writes=false`, `entity-broadcast-range=75%`, `max-tick-time=-1`

## Important Technical Notes

### When Modifying Backup Scripts

- Always test mode detection logic using nested if-else (batch file limitation)
- Use `enabledelayedexpansion` and `!VARIABLE!` syntax for variable expansion in loops
- Mode detection reads `level-name` property, NOT by comparing entire files (which breaks when other settings change)

### When Updating PaperMC Version

Update the jar filename in all three launch scripts:
- `minecraft.bat`
- `minecraft-creative.bat`
- `minecraft-survival.bat`

The backup script does NOT need updating (it calls the bat files, not the jar directly).

### Performance Optimization History

The server underwent major performance optimization (commit 0079d96) to address tick lag:
- Switched from vanilla server.jar to PaperMC
- Reduced view/simulation distances
- Disabled sync-chunk-writes
- Reduced entity-broadcast-range to 75%

When making performance changes, test under load and monitor with `/spark profiler`.

## World Management

Each world folder contains:
- `region/` - Chunk data (MCA format)
- `playerdata/` - Player NBT files
- `level.dat` - World metadata
- `paper-world.yml` - World-specific config overrides
- `DIM-1/`, `DIM1/` - Nether and End dimensions

Worlds are backed up independently based on modification time.
