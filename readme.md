# Universal ID Commands for FiveM

This resource adds two simple yet powerful commands to your FiveM server, allowing players to view their own ID and nearby player IDs. It is compatible with all major FiveM frameworks, including **ESX**, **QBCore**, and **vRP**, as well as standalone servers.

## Features

- **Command 1**: `/id`
  - Displays the player's server ID in the chat.

- **Command 2**: `/ids`
  - Displays the IDs of nearby players above their heads for 10 seconds.

- **Framework Compatibility**:
  - Automatically detects and works with **ESX**, **QBCore**, **vRP**, and standalone setups.

---

## Installation

### Step 1: Download and Place the Resource
1. Create a folder named `id_command` (or any preferred name) in your server's `resources` directory.
2. Add the following files to the folder:
   - `fxmanifest.lua`
   - `server.lua`
   - `client.lua`
   - `config.lua`

### Step 2: Add the Resource to `server.cfg`
Edit your `server.cfg` file and add the following line:
```plaintext
ensure id_command
```

### Step 3: Restart Your Server
- Restart your server or run the following commands in the console:
  ```plaintext
  refresh
  start id_command
  ```

---

## Commands

### `/id`
- Displays the player's server ID in the chat.

### `/ids`
- Shows the IDs of nearby players above their heads for 10 seconds.
- The detection radius is set to **10 meters** by default but can be adjusted in the `config.lua` file.

---

## Framework Detection
This resource dynamically detects the active framework and adjusts its behavior accordingly. Supported frameworks include:
- **ESX**
- **QBCore**
- **vRP**
- Standalone mode (if no framework is detected)

---

## Configuration

### Adjusting the Detection Radius
To change the radius for detecting nearby players, edit the following line in `config.lua`:
```lua
Config.Radius = 10.0 -- Set the radius to check for nearby players
```

### Adding Framework-Specific Enhancements
You can extend this resource to include framework-specific features, such as displaying player names, jobs, or other metadata. Modify the commands in `server.lua` and use the framework's APIs for additional functionality.

---

## Optimization Improvements

### Optimized Logic
- Reduced unnecessary loops and computations in the scripts.
- Unified and modularized configuration settings in `config.lua`.

### Performance Tips
- Ensure that the detection radius is appropriate for your server's performance.
- Use framework-specific APIs where possible to reduce reliance on global player loops.

---

## Troubleshooting

- **Commands Not Working:** Ensure the resource is correctly added to your `server.cfg` and started.
- **Framework Not Detected:** Check that the framework resource (e.g., `es_extended`, `qb-core`, or `vrp`) is started before this resource.
- **Standalone Issues:** Ensure no framework-specific dependencies are accidentally introduced in the scripts.

---

## License
This resource is provided "as-is" with no guarantees. Feel free to modify and use it for your server.

---

## Credits
- **Author:** Yoshi Developments
- **Contributors:** OpenAI ChatGPT

