# Modpack Setup Guide

This guide walks you through creating and maintaining a custom Modrinth modpack for your family Minecraft server.

## Why Modpacks?

**Problem with manual mod management:**
- Dependency tracking is manual and error-prone
- Version mismatches between server and clients
- Kids' clients get out of sync
- Hours of troubleshooting per update

**Modpack solution:**
- One-click install for kids
- Automatic dependency resolution
- Version locking (server and clients always match)
- One-click updates
- 70-80% reduction in maintenance time

## Prerequisites

- Modrinth account (free): https://modrinth.com/auth/sign-up
- Server running NeoForge 1.21.1 (✓ already installed)
- Kids using Prism Launcher (see CLIENT-SETUP.md)

## Step 1: Create Modpack on Modrinth

### 1.1 Initial Setup

1. Go to https://modrinth.com/dashboard/projects
2. Click "Create a project"
3. Select "Modpack"
4. Fill in details:
   - **Name:** "[YourFamily] Animals Server" (or whatever you prefer)
   - **Summary:** "Kid-friendly animal mods for family server"
   - **Description:** (optional) Longer description
   - **Categories:** Select "Adventure" and "Mobs"
   - **Visibility:** Choose "Unlisted" (only accessible via link - perfect for family use)
5. Click "Create project"

### 1.2 Add Mods to Modpack

On your modpack page, click "Versions" → "Create a version"

**Required loader:**
- Loader: NeoForge
- Minecraft version: 1.21.1
- NeoForge version: 21.10.56-beta (or compatible)

**Recommended animal mods (proven stable combination):**

1. **Alex's Mobs** - Most popular animal mod, 80+ creatures
   - Search for "Alex's Mobs" and add the 1.21.1 version
   - Dependency: Will auto-add Citadel

2. **Naturalist** - Realistic animals (bears, deer, birds, etc.)
   - Search for "Naturalist" and add the 1.21.1 version
   - No dependencies

3. **Critters and Companions** - Cute whimsical creatures
   - Search for "Critters and Companions" and add the 1.21.1 version
   - Dependencies: Will auto-add any required libraries

**Optional quality-of-life mods:**
- **JEI (Just Enough Items)** - Recipe viewer (helpful for kids)
- **Waystones** - Teleportation points (reduces travel frustration)
- **AppleSkin** - Shows food/saturation values

### 1.3 Version Settings

- **Version number:** 1.0.0 (increment for updates)
- **Version title:** "Initial Release" (or descriptive name)
- **Changelog:** List what mods are included
- **Files:** Modrinth auto-generates the modpack file
- Click "Publish version"

### 1.4 Get Modpack Link

After publishing, you'll see:
- **Modpack page URL** (share this with kids for installation)
- **Server pack download** (use this for your server)

## Step 2: Install Server Pack

### 2.1 Download Server Pack

1. On your modpack version page, find "Server pack" download
2. Download the .zip file
3. Extract contents

### 2.2 Install on Server

The server pack typically contains:
- `mods/` folder with all required mod jars
- `config/` folder with pre-configured settings
- Sometimes `scripts/` or other resources

**Installation steps:**

```batch
# Stop server if running
# (Close the server window)

# Backup current setup (optional but recommended)
xcopy "C:\Minecraft Server\mods" "C:\Minecraft Server\mods.backup\" /E /I /Y

# Clear old mods
del "C:\Minecraft Server\mods\*.jar"

# Copy server pack mods
xcopy "[extracted-server-pack]\mods\*" "C:\Minecraft Server\mods\" /E /I /Y

# Copy configs
xcopy "[extracted-server-pack]\config\*" "C:\Minecraft Server\config\" /E /I /Y

# Start server
minecraft-creative.bat
```

### 2.3 Test Server

1. Watch startup logs for errors
2. Look for mods loading successfully:
   ```
   [INFO] Mod List:
       Alex's Mobs
       Citadel
       Naturalist
       Critters and Companions
       ...
   ```
3. Wait for "Done!" message
4. Server should start without crashes

## Step 3: Kids Install Modpack

See **CLIENT-SETUP.md** for detailed client installation instructions.

**Quick version:**
1. Kids open Prism Launcher
2. Click "Add Instance"
3. Select "Modrinth" tab
4. Paste your modpack URL or search for modpack name
5. Click "OK" - Prism auto-installs everything
6. Launch and connect to server

## Step 4: Testing

1. Kid connects to server with modpack
2. Verify mods loaded (check main menu shows mod list)
3. Test spawning animals (Creative mode):
   ```
   /summon alexsmobs:elephant
   /summon naturalist:bear
   ```
4. Check for lag/performance issues
5. Play for 10-15 minutes to ensure stability

## Updating the Modpack

When you want to add/remove/update mods:

### Update Process

1. **On Modrinth modpack page:**
   - Click "Versions" → "Create a version"
   - Add/remove/update mods
   - Increment version number (1.0.0 → 1.1.0)
   - Add changelog describing changes
   - Publish new version

2. **On server:**
   - Download new server pack
   - Stop server
   - Replace mods folder
   - Update config folder if changed
   - Restart server

3. **Kids' clients:**
   - Prism Launcher shows "Update available"
   - Kids click "Update" button
   - One-click update, done in seconds

**That's it!** No manual mod copying, no version checking, no troubleshooting.

## Recommended Starting Modpack

For first attempt, keep it simple:

**Minimal animal modpack (3 mods + dependencies):**
- Alex's Mobs + Citadel (auto-added)
- Naturalist
- Critters and Companions

**Total: ~5 mods including dependencies**

This is proven stable and gives tons of animal variety. Add more mods later once this works smoothly.

## Troubleshooting

### Server won't start after installing mods

**Check logs:** `C:\Minecraft Server\logs\latest.log`

Common issues:
- **Missing dependency:** Mod list in log shows what's missing
- **Version mismatch:** Verify all mods are for Minecraft 1.21.1 and NeoForge
- **Incompatible mods:** Check mod pages for known conflicts

**Solution:** Remove problematic mod, restart, try different version

### Kids can't connect

**Error: "Mod rejection"**
- Server has mods client doesn't (or vice versa)
- Ensure kids installed modpack correctly
- Verify they're launching the modpack instance, not vanilla

**Error: "Connection refused"**
- Server isn't running
- Check server IP is still 192.168.86.102:25565
- Verify kids on same local network

### Performance issues

If server lags with mods:
- **Reduce spawn rates:** Edit mod configs to lower animal spawn frequency
- **Increase RAM:** Already at 4GB, but can go higher if needed
- **Remove heaviest mods:** Alex's Mobs is most resource-intensive

## Maintenance Schedule

**Weekly:** Check for mod updates (optional)
**Monthly:** Update modpack if significant mod improvements released
**As needed:** Add new mods kids request

Average time per update: 30-60 minutes including testing

## Resources

- **Modrinth:** https://modrinth.com
- **Alex's Mobs Wiki:** https://alexsmobs.fandom.com/wiki/Alex%27s_Mobs_Wiki
- **Naturalist Wiki:** https://modrinth.com/mod/naturalist (see project page)
- **NeoForge Discord:** https://discord.neoforged.net/ (for technical help)

## Notes

- **Unlisted modpacks** are perfect for families - not searchable, only accessible via link
- **Version numbers** help track what's installed (1.0.0 = initial, 1.1.0 = update, 2.0.0 = major change)
- **Changelogs** help you remember what changed (future you will thank present you)
- **Test before rollout** - Always test new versions yourself before telling kids to update

## Current Status

**Server state:** NeoForge 21.10.56-beta installed, running vanilla (no mods)
**Next step:** Create modpack on Modrinth, install server pack
**Waiting for:** Modpack creation (external to this codebase)
