# Minecraft Server Mods

This document tracks mods installed on the server for client+server mod synchronization.

## Server Information

- **Minecraft Version:** 1.21.1 (transitioning from PaperMC)
- **Mod Loader:** NeoForge (recommended for 1.21.1)
- **Java Version:** Java 21+ required for 1.21.1

## Mod Loader Options for 1.21.1

| Loader | Performance | Compatibility | Recommendation |
|--------|-------------|---------------|----------------|
| **NeoForge** | Good | Best for 1.21.1 | ✅ **Recommended** - Fork of Forge, best 1.21+ support |
| **Fabric** | Excellent | Good | Alternative - Lightweight but fewer animal mods |
| **Forge** | Good | Limited | Not recommended for 1.21+ (use NeoForge instead) |

## Installed Mods

### Animal & Creature Mods (Compatible with NeoForge 1.21.1)

#### Option 1: "More Animals [NEOFORGE]" Modpack (Recommended - Easy Setup)
- **Version:** 2.0.0 (NeoForge 1.21.1)
- **Loader:** NeoForge
- **Download:** [Modrinth - More Animals](https://modrinth.com/modpack/more-animals/version/AOHQTwNY)
- **Description:** Dozens of animal mods bundled together - realistic creatures across all biomes
- **Kid-Friendly:** ✅ Yes - focuses on peaceful creatures
- **Client Required:** Yes - all players must install the SAME modpack version
- **Pros:** One-click installation via modpack launcher, all dependencies included
- **Cons:** All-or-nothing (can't pick individual mods)

#### Option 2: Individual Mods (Custom Selection)
Pick and choose specific animal mods:

**Critters n' Crawlers** (Recommended for kids)
- **Version:** 2.2.5 (NeoForge 1.21.1)
- **Download:** [CurseForge](https://www.curseforge.com/minecraft/mc-mods/critters-n-crawlers)
- **Adds:** North American animals & myths for temperate/cold biomes
- **Kid-Friendly:** ✅ Yes
- **File:** `critters_and_crawlers-2.2.5-neoforge.jar`

**Animal Garden - Manatee**
- **Version:** 1.0.0-neoforge-1.21.1
- **Download:** [Modrinth](https://modrinth.com/mod/animal-garden-manatee/version/1.0.0-neoforge-1.21.1-21.1.209)
- **Adds:** Gentle sea cows (manatees)
- **Kid-Friendly:** ✅ Yes

**Animal Garden - Common Raven**
- **Version:** 1.0.0-neoforge-1.21.1
- **Download:** [Modrinth](https://modrinth.com/mod/animal-garden-common-raven/version/1.0.0-neoforge-1.21.1-21.1.213)
- **Adds:** Common ravens
- **Kid-Friendly:** ✅ Yes

**Animal Garden - Sugar Glider**
- **Version:** 1.0.0-neoforge-1.21.1
- **Download:** [Modrinth](https://modrinth.com/mod/animal-garden-sugar-glider)
- **Adds:** Cute sugar gliders
- **Kid-Friendly:** ✅ Yes

#### Optional: Respawning Animals
- **Version:** v21.1.1 (NeoForge 1.21.1)
- **Download:** [Modrinth](https://modrinth.com/mod/respawning-animals/version/v21.1.1-1.21.1-NeoForge)
- **Description:** Makes animals spawn/despawn like monsters (prevents overpopulation)
- **Recommended:** Only if you notice too many animals causing lag

### NOT Compatible (Future Options)

**Naturalist Mod** ❌
- **Latest:** 5.0pre5 (Forge/Fabric 1.20.1 only)
- **Status:** Not available for 1.21.1 yet
- **Watch:** May be updated in future

**Alex's Mobs** ❌
- **Latest:** 1.22.9 (1.20.1 only)
- **Status:** Not available for 1.21.1 yet
- **Note:** 80+ animals, very popular but waiting for 1.21 update

## Installation Instructions

### Server Setup

**✅ NeoForge is Already Installed! (Version 21.10.56-beta)**

1. **Backup Current Server (Always do this first!):**
   ```bat
   backup-worlds.bat
   ```

2. **Install Mods:**
   - Download chosen mods from links above (must be NeoForge 1.21.1 compatible)
   - Place `.jar` files in `C:\Minecraft Server\mods\` folder
   - **Important:** Note which mods you installed (you'll need the exact same ones for clients)

3. **Test Server:**
   - Start server using `minecraft-creative.bat` or `minecraft-survival.bat`
   - Watch console for mod loading messages
   - Look for errors (red text)
   - Verify mods appear in server console: `[Server thread/INFO] [minecraft/DedicatedServer]: Loading mods...`

4. **Troubleshooting:**
   - If server won't start: Check `logs/latest.log` for errors
   - Missing dependencies: Some mods require other mods (called "dependencies")
   - Version mismatch: Ensure all mods say "NeoForge 1.21.1" in their filename

### Client Setup (For All Players)

1. **Install NeoForge Client:**
   - Download NeoForge installer: https://neoforged.net/
   - Run installer
   - Select "Install client"
   - Choose Minecraft installation directory

2. **Install Same Mods:**
   - Download EXACT same mod versions as server
   - Place in: `%AppData%\.minecraft\mods\` (Windows)
   - Or use Minecraft launcher profiles folder

3. **Launch Game:**
   - Open Minecraft Launcher
   - Select "NeoForge 1.21.1" profile
   - Launch and connect to server

### Important Notes

- ⚠️ **All clients must have EXACT same mods as server**
- ⚠️ **Mod versions must match exactly** (1.21.1 mods only)
- ⚠️ **Backup worlds before switching from PaperMC to NeoForge**
- ⚠️ **Some PaperMC optimizations will be lost**

## Mod Configuration Files

Mod configs are stored in:
- Server: `config/[modname]/`
- Client: `%AppData%\.minecraft\config/[modname]/`

**Track in Git:**
- ✅ `config/` folder (settings)
- ✅ This MODS.md file (documentation)
- ❌ `mods/*.jar` files (too large, use .gitignore)
- ❌ `world/` folders (handled by backup system)

## Troubleshooting

### "Mod Mismatch" Error
- Ensure server and client have identical mod versions
- Check Minecraft version matches exactly (1.21.1)
- Verify mod loader version compatibility

### Performance Issues
- Reduce entity spawn limits in mod configs
- Allocate more RAM to server (currently 4GB)
- Consider reducing view distance further

### Kids Can't Connect
- Verify they installed NeoForge client launcher
- Check mods are in correct folder
- Ensure Minecraft version is 1.21.1

## Recommended Next Steps

1. **Research & Test:** Try "More Animals 2" modpack in creative world first
2. **Backup Everything:** Run backup-worlds.bat before migration
3. **Install NeoForge:** Set up server with NeoForge installer
4. **Test With One Client:** Have one kid test connection before deploying to all
5. **Document Versions:** Update this file with exact mod versions installed

## References

- NeoForge: https://neoforged.net/
- Modrinth Mods: https://modrinth.com/
- CurseForge Mods: https://www.curseforge.com/minecraft/mc-mods
