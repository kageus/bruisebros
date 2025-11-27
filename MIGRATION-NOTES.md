# Server Migration Notes

## Context for Future Claude Code Sessions

This document provides context for migrating this Minecraft server to new hardware.

## Current State (Pre-Migration)

### Hardware Limitations
- **Current:** Old Windows 10 box
- **Performance Issue:** Running 40 ticks behind during heavy animal egg spawning by kids
- **Reason for Migration:** Need better hardware before installing animal mods (which will increase entity load)

### Server Software Status
- **NeoForge:** 21.10.56-beta installed and tested ✅
- **Vanilla Status:** Running without mods (intentional - waiting for hardware upgrade)
- **Mods Tested:** MoAnimals (incompatible), Critters n' Crawlers (version check issues)
- **Recommended Approach:** Use Modrinth modpacks (see MODPACK-SETUP.md)

### What Works
- ✅ NeoForge server starts cleanly without mods
- ✅ Creative and Survival mode switching works (`minecraft-creative.bat`, `minecraft-survival.bat`)
- ✅ Automated backup system with scheduled tasks (fixed pause issue in Nov 2025)
- ✅ Kid-friendly survival settings (peaceful, flight, keepInventory)
- ✅ Network security (bound to local network 192.168.86.102)

### Documentation Created
- **MODPACK-SETUP.md** - Complete guide for Modrinth modpack workflow
- **CLIENT-SETUP.md** - Kid-friendly Prism Launcher installation
- **MODS.md** - Mod recommendations and compatibility notes
- **CLAUDE.md** - Server architecture and technical details

## Migration Checklist

When setting up on new hardware, follow these steps:

### 1. Pre-Migration Backup
```batch
# Run final backup on old server
backup-worlds.bat

# Verify backups exist at:
C:\minecraft_backups\world-*.zip
C:\minecraft_backups\survivalworld-*.zip
```

### 2. Transfer Files to New Server

**Required files/folders:**
- `world/` - Creative world data
- `survivalworld/` - Survival world data (including DIM-1, DIM1 if they exist)
- `server-creative.properties` - Creative mode config
- `server-survival.properties` - Survival mode config
- `survival-gamerules.txt` - Kid-friendly game rules to apply
- `minecraft-creative.bat` - Creative launcher
- `minecraft-survival.bat` - Survival launcher
- `backup-worlds.bat` - Backup script
- `setup-daily-backup.ps1` - Scheduled task setup
- `user_jvm_args.txt` - JVM memory settings (4GB)
- `run.bat` - NeoForge launcher
- `libraries/` - NeoForge libraries folder
- `config/` - NeoForge config files (fml.toml, neoforge-common.toml, etc.)
- **All .md documentation files**

**Optional (if you want git history):**
- `.git/` - Git repository
- `.gitignore`

**Do NOT transfer:**
- `logs/` - Will be regenerated
- `crash-reports/` - Old crashes not relevant
- `mods/` - Empty folder, will be populated by modpack
- `server.properties` - Gets copied from mode-specific files

### 3. New Server Setup

#### Install Prerequisites
1. **Java 21+** - Required for NeoForge 1.21.1
   - Download from: https://adoptium.net/
   - Verify: `java -version` should show 21 or higher

2. **Git** (optional but recommended)
   - For version control and pushing updates

#### Configure Server
1. Copy transferred files to new server directory (e.g., `C:\Minecraft Server`)
2. **Update network binding** in both property files:
   - Edit `server-creative.properties` → Set `server-ip=[NEW_SERVER_IP]`
   - Edit `server-survival.properties` → Set `server-ip=[NEW_SERVER_IP]`
3. **Adjust RAM** if new hardware has more:
   - Edit `user_jvm_args.txt`
   - Consider 6GB or 8GB if available: `-Xmx8G -Xms8G`

#### Test Vanilla Server
```batch
# Test Creative mode
minecraft-creative.bat

# Look for:
# - "Done!" message
# - No errors in console
# - Server starts in under 30 seconds

# Test Survival mode
minecraft-survival.bat

# Verify kid-friendly settings work
```

#### Setup Automated Backups
```powershell
# Run as Administrator
powershell -ExecutionPolicy Bypass -File setup-daily-backup.ps1

# Update backup destination in backup-worlds.bat if needed
# Default: C:\minecraft_backups
```

#### Apply Survival Game Rules
Once in survival server, run from console:
```
/gamerule keepInventory true
/gamerule doFireTick false
/gamerule naturalRegeneration true
```

### 4. Install Modpack (After Vanilla Server Works)

**Do NOT install mods until vanilla server is tested!**

Follow this sequence:
1. Verify vanilla NeoForge server runs smoothly
2. Test client connections
3. Monitor performance (use `/spark profiler` if needed)
4. **Then** follow MODPACK-SETUP.md to add animal mods

**Recommended starting modpack:**
- Alex's Mobs + Citadel
- Naturalist
- Critters and Companions

This combo is proven stable and won't overwhelm even modest hardware.

## Known Issues & Lessons Learned

### Mod Compatibility Issues Encountered
1. **MoAnimals 0.0.2-ALPHA** - Event registration bug, crashes server
2. **Critters n' Crawlers standalone** - Version notation mismatch (1.21.1 vs 1.21.10)
3. **Manual mod management** - Dependency hell, version mismatches, hours wasted

### What NOT to Do
- ❌ Don't install mods manually (use modpacks)
- ❌ Don't skip testing vanilla server first
- ❌ Don't use MultiMC (unmaintained - use Prism Launcher)
- ❌ Don't try to run server without enough RAM (4GB minimum, 6-8GB recommended with mods)
- ❌ Don't forget to update network IP in both property files

### Performance Optimization Tips
If new server still lags with animal mods:
- Reduce `view-distance` in server.properties (currently 8, can go to 6)
- Reduce `simulation-distance` (currently 6, can go to 4)
- Use `/spark profiler` to identify bottlenecks
- Consider reducing animal spawn rates in mod configs

## Kids' Client Updates

When you get new server IP, kids need to update:

**In Prism Launcher:**
1. Go to Multiplayer
2. Edit "Family Server" entry
3. Change server address to new IP
4. Save and reconnect

**Or tell them the new IP and they can add it manually.**

## Future Modpack Updates

Once modpack is installed, updating is easy:
1. Update modpack version on Modrinth (add/remove/update mods)
2. Download new server pack
3. Replace `mods/` folder contents
4. Update `config/` if configs changed
5. Kids click "Update" in Prism Launcher (one-click)

See MODPACK-SETUP.md for detailed instructions.

## Helpful Commands for Testing

### Check Server Performance
```
/spark profiler --timeout 30
```

### Check Loaded Mods (when modpack installed)
```
/forge mods list
```

### Spawn Test Animals (Creative mode)
```
/summon alexsmobs:elephant
/summon naturalist:bear
/summon crittersandcompanions:ferret
```

### Check TPS (Ticks Per Second)
```
/spark tps
```
Good: 20.0 TPS
Acceptable: 18-20 TPS
Laggy: <18 TPS (investigate with `/spark profiler`)

## Architecture Reminders

### Mode Switching
- Launch scripts copy mode-specific `.properties` → `server.properties`
- Then call `run.bat` (NeoForge launcher)
- `level-name` property determines which world loads

### Backup System
- Runs daily at 4:00 AM via scheduled task
- Detects server mode by parsing `server.properties`
- Stops server → backs up → restarts in same mode
- Keeps rolling 7-backup history per world
- Only backs up if world modified since last backup

### Network Security
- Server bound to local IP (not 0.0.0.0)
- Only accessible on local network
- Kids are safe from random internet players

## Contact Info for Issues

If you run into problems during migration:
- **Server won't start:** Check `logs/latest.log` for errors
- **Mods won't load:** Verify NeoForge version matches mod requirements
- **Performance issues:** Use `/spark profiler` and check RAM allocation
- **Backup issues:** Check scheduled task in Task Scheduler (taskschd.msc)

## Final Notes for Future Claude

This server has been well-documented. All the hard lessons (manual mod management pain, MoAnimals crash, Critters version issues) are captured in the docs.

**Key philosophy:** Keep it simple. Use modpacks. Test vanilla first. Don't over-optimize prematurely.

The current setup is production-ready for vanilla NeoForge. Once you verify it works on new hardware, adding the animal modpack should be straightforward following MODPACK-SETUP.md.

Good luck with the migration!

---

**Last updated:** November 26, 2025
**Server version:** NeoForge 21.10.56-beta (Minecraft 1.21.1)
**Status:** Ready for hardware migration
