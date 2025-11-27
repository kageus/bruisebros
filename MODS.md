# Minecraft Server Mods

This document tracks mods installed on the server for client+server mod synchronization.

## Server Information

- **Minecraft Version:** 1.21.1
- **Mod Loader:** NeoForge 21.10.56-beta (✅ installed)
- **Java Version:** Java 21+ required for 1.21.1
- **Current Status:** NeoForge installed, running vanilla (no mods yet)

## Recommended Approach: Modpacks

**⭐ For family servers, use modpacks instead of individual mods!**

See **[MODPACK-SETUP.md](MODPACK-SETUP.md)** for complete guide.

### Why Modpacks?

| Method | Setup Time | Maintenance | Version Matching | Updates |
|--------|-----------|-------------|------------------|---------|
| **Modpack** | 2-3 hours | Low | Automatic | One-click |
| **Individual Mods** | 1-2 hours | High | Manual | Manual per mod |

**Modpack advantages:**
- ✅ One-click client installation
- ✅ Automatic dependency resolution
- ✅ Version locking (server/client always match)
- ✅ One-click updates for kids
- ✅ 70-80% less maintenance time

**Individual mod problems:**
- ❌ Manual dependency tracking
- ❌ Version mismatch nightmares
- ❌ Kids' clients get out of sync
- ❌ Hours of troubleshooting per update

### Quick Start with Modpacks

1. **Create modpack on Modrinth** (see MODPACK-SETUP.md)
2. **Download server pack** and install to `mods/` folder
3. **Kids install Prism Launcher** (see CLIENT-SETUP.md)
4. **Share modpack link** - kids one-click install
5. **Done!** Updates are one-click for everyone

---

## Individual Mods Reference

If you need to manage individual mods, this section lists compatible options.

## Mod Loader Options for 1.21.1

| Loader | Performance | Compatibility | Recommendation |
|--------|-------------|---------------|----------------|
| **NeoForge** | Good | Best for 1.21.1 | ✅ **Recommended** - Fork of Forge, best 1.21+ support |
| **Fabric** | Excellent | Good | Alternative - Lightweight but fewer animal mods |
| **Forge** | Good | Limited | Not recommended for 1.21+ (use NeoForge instead) |

## Installed Mods

### Recommended Stable Animal Mods for NeoForge 1.21.1

#### Tier S: Proven Stable for Family Servers

**Alex's Mobs** ⭐
- **Most popular animal mod** - 80+ creatures (realistic + fantasy)
- **Download:** Search Modrinth/CurseForge for NeoForge 1.21.1 version
- **Dependency:** Citadel (auto-included in modpacks)
- **Kid-Friendly:** ✅ Yes - dolphins, elephants, kangaroos, etc.
- **Performance:** Good

**Naturalist**
- **Realistic animals** - bears, deer, snakes, birds
- **Download:** Search Modrinth/CurseForge for NeoForge 1.21.1 version
- **Dependencies:** None
- **Kid-Friendly:** ✅ Yes - educational and peaceful
- **Performance:** Excellent (lighter than Alex's Mobs)

**Critters and Companions**
- **Cute whimsical creatures**
- **Download:** Search Modrinth/CurseForge for NeoForge 1.21.1 version
- **Dependencies:** None
- **Kid-Friendly:** ✅ Yes - adorable designs
- **Performance:** Good

**Recommended Combo:** Alex's Mobs + Naturalist + Critters and Companions
- Proven to work together without conflicts
- Wide variety of animals
- Good performance balance

#### Individual Mods (Alternative Options)

Pick and choose specific animal mods if not using modpack:

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

### Known Issues with Some Mods

**MoAnimals** ❌
- **Version:** 0.0.2-ALPHA
- **Status:** Incompatible with NeoForge 21.10.56-beta
- **Issue:** Event registration bug causes server crash
- **Recommendation:** Avoid until stable release

**Critters n' Crawlers (standalone)** ⚠️
- **Version:** 2.2.5
- **Status:** Works but has version check issue
- **Issue:** Expects Minecraft 1.21.1 notation, NeoForge reports 1.21.10
- **Workaround:** May work in modpacks with proper dependencies
- **Recommendation:** Use in modpack context, not standalone

## Installation Instructions

### Recommended: Modpack Method

**See [MODPACK-SETUP.md](MODPACK-SETUP.md) for complete guide.**

Quick overview:
1. Create modpack on Modrinth with desired mods
2. Download server pack → install to `mods/` folder
3. Kids install Prism Launcher → one-click install modpack
4. Done! Server and clients automatically match

### Alternative: Manual Individual Mods

**⚠️ Not recommended for families - use modpacks instead!**

If you must install individual mods manually:

#### Server Setup

**✅ NeoForge is Already Installed! (Version 21.10.56-beta)**

1. **Backup Current Server:**
   ```bat
   backup-worlds.bat
   ```

2. **Install Mods:**
   - Download chosen mods (must be NeoForge 1.21.1 compatible)
   - Place `.jar` files in `C:\Minecraft Server\mods\` folder
   - Track which mods + versions you installed (you'll need exact same for clients)

3. **Test Server:**
   - Start server using `minecraft-creative.bat` or `minecraft-survival.bat`
   - Watch console for mod loading messages
   - Check for errors (red text)
   - Verify: `[Server thread/INFO] [minecraft/DedicatedServer]: Loading mods...`

4. **Troubleshooting:**
   - Server won't start: Check `logs/latest.log` for errors
   - Missing dependencies: Install required library mods
   - Version mismatch: Ensure all mods say "NeoForge 1.21.1"

#### Client Setup (For All Players)

**See [CLIENT-SETUP.md](CLIENT-SETUP.md) for kid-friendly instructions.**

Manual method (not recommended):
1. Install Prism Launcher (replaces MultiMC)
2. Create NeoForge 1.21.1 instance
3. Download EXACT same mod versions as server
4. Place in instance mods folder
5. Launch and connect

**Warning:** Manual sync is error-prone. Use modpacks!

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
