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

### Animal & Creature Mods

#### Option 1: "More Animals" Modpack (Recommended for Kids)
- **Version:** 23.0.0 (Sept 2025)
- **Loader:** NeoForge 1.21.1
- **Download:** [Modrinth - More Animals 2](https://modrinth.com/modpack/more-animals)
- **Description:** Vanilla+ modpack with hundreds of realistic animals across all biomes
- **Kid-Friendly:** ✅ Yes - focuses on peaceful creatures
- **Client Required:** Yes - all players must install

#### Option 2: Better Animals Plus
- **Version:** Latest for 1.21.1
- **Loader:** NeoForge/Fabric/Quilt
- **Download:** CurseForge/Modrinth
- **Description:** 35+ new animals, items, food, blocks, and armor
- **Kid-Friendly:** ✅ Yes
- **Client Required:** Yes

#### Option 3: Animal Garden Series (Modular Approach)
- **Version:** 1.0.0-neoforge-1.21.1
- **Loader:** NeoForge
- **Download:** Modrinth (individual mods)
- **Available Animals:** Manatee, Common Raven, etc.
- **Kid-Friendly:** ✅ Yes
- **Client Required:** Yes

### Alternative: Naturalist Mod (NOT 1.21 Compatible)
- **Version:** 5.0pre5 (Aug 2025)
- **Loader:** Forge/Fabric 1.20.1 ONLY
- **Status:** ❌ Not available for 1.21+ yet
- **Note:** Would require downgrading server to 1.20.1

## Installation Instructions

### Server Setup

1. **Backup Current Server:**
   ```bat
   backup-worlds.bat
   ```

2. **Download NeoForge Server:**
   - Visit: https://neoforged.net/
   - Download: NeoForge installer for Minecraft 1.21.1
   - Run installer in server directory
   - Select "Install server"

3. **Install Mods:**
   - Create `mods/` folder in server directory
   - Download chosen mods (must match Minecraft 1.21.1 + NeoForge)
   - Place `.jar` files in `mods/` folder

4. **Update Launch Scripts:**
   - Modify `minecraft-survival.bat` and `minecraft-creative.bat`
   - Change jar reference from `paper-1.21.10-113.jar` to NeoForge server jar
   - May need different memory settings

5. **Test Server:**
   - Start server
   - Check logs for mod loading errors
   - Verify mods appear in server console

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
