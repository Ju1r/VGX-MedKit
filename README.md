# VGX-MedKit

Revive unconscious players using a medkit item. The script runs a **VGX-MiniGame** arrow sequence, then a CPR progress bar, before reviving the target.

**Author:** VGX DEV  
**Version:** 1.0.0

---

## Features

- Use a configurable item to revive nearby unconscious players
- **qb-target** interaction on downed players (third-eye)
- **VGX-MiniGame** skill check before revive starts
- CPR animation + progress bar during revive
- Configurable revive time, health level, and item removal
- Optional revive chance system (success roll)
- Works with custom death/unconscious animations
- Bilingual config comments (English / Arabic)

---

## Dependencies

| Resource | Purpose |
|----------|---------|
| [qb-core](https://github.com/) / QBCore | Framework (`Config.CoreName`) |
| [qb-target](https://github.com/) | Player target interaction (`Config.TargetName`) |
| [VGX-MiniGame](../VGX-MiniGame) | Arrow sequence minigame |
| Ambulance / death script | Must handle `Config.ReviveEvent` on the revived player |

> **Important:** Both resources must keep their original folder names:
> - `VGX-MedKit`
> - `VGX-MiniGame`

Renaming either resource will disable the script.

---

## Installation

1. Place `VGX-MedKit` and `VGX-MiniGame` in your server `resources` folder.
2. Add the medkit item to your shared items (see below).
3. Edit `config.lua` to match your server (core name, item name, revive event, etc.).
4. Add to `server.cfg` **in this order**:

```cfg
ensure VGX-MiniGame
ensure VGX-MedKit
```

5. Restart the server or run:

```
refresh
ensure VGX-MiniGame
ensure VGX-MedKit
```

---

## Item setup

Add this to your items file (e.g. `qb-core/shared/items.lua`).  
The item **name must match** `Config.ItemName` in `config.lua`.

```lua
['medkit'] = {
    ['name'] = 'medkit',
    ['label'] = 'Medkit',
    ['weight'] = 1000,
    ['type'] = 'item',
    ['image'] = 'medkit.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Used to revive an unconscious player'
},
```

Then set in `config.lua`:

```lua
Config.ItemName = 'medkit'
```

Add `medkit.png` to your inventory image folder if needed.

---

## How to use (in-game)

### Option 1 — Use the item
1. Stand near an unconscious player (within ~3m).
2. Use the medkit from your inventory.
3. Complete the arrow minigame.
4. Wait for the CPR progress bar to finish.
5. The player is revived.

### Option 2 — qb-target
1. Look at an unconscious player.
2. Select **Use Medkit** (requires the item in inventory).
3. Complete the minigame and progress bar.

If the minigame fails or the progress bar is cancelled, the revive is aborted. The item is **not** removed on failure (only on successful server-side revive when `Config.RemoveItem = true`).

---

## Revive flow

```
Player uses item / targets downed player
        ↓
Server checks item
        ↓
VGX-MiniGame (arrow sequence)
        ↓ (fail → stop, notify)
CPR animation + progress bar
        ↓ (cancel → stop, notify)
Server revive (optional chance roll)
        ↓
Target receives ReviveEvent + health restore
```

---

## Configuration

All settings are in `config.lua`.

### Framework

| Option | Default | Description |
|--------|---------|-------------|
| `Config.CoreName` | `'Just-core'` | Core resource export name |
| `Config.TargetName` | `'qb-target'` | Target resource name |

### Item

| Option | Default | Description |
|--------|---------|-------------|
| `Config.ItemName` | `'medkit'` | Item required to revive |
| `Config.RemoveItem` | `false` | Remove 1 item after successful revive |

### Revive

| Option | Default | Description |
|--------|---------|-------------|
| `Config.ReviveTime` | `8000` | Progress bar duration (ms) |
| `Config.ReviveChanceSystem` | `false` | Enable random success chance |
| `Config.ReviveChance` | `50` | Success chance % (if enabled) |
| `Config.Health` | `'half'` | `'half'` = 150 HP, `'full'` = 200 HP |
| `Config.ReviveEvent` | `'hospital:client:Revive'` | Client event fired on revived player |
| `Config.DeathAnims` | *(table)* | Animations treated as unconscious/dead |

### Minigame (VGX-MiniGame)

| Option | Default | Description |
|--------|---------|-------------|
| `Config.MinigameColor` | `'#38485C'` | UI accent color |
| `Config.MinigameArrowsPerRound` | `5` | Arrows per round |
| `Config.MinigameRounds` | `3` | Rounds to complete |
| `Config.MinigameTime` | `12` | Seconds per round |

### Notifications

Edit messages in `Config.Notify`:

```lua
Config.Notify = {
    progressbar = 'Reviving player...',
    no_item = 'You need a %s.',
    no_dead_player = 'This player is not unconscious.',
    failed = 'Revive failed.',
    revived = 'Player revived successfully.',
    being_revived = 'You are being revived.'
}
```

---

## Ambulance / death script setup

1. Set `Config.ReviveEvent` to the revive event your ambulance job uses (default: `hospital:client:Revive` for qb-ambulancejob).
2. If your death script uses different animations, add them to `Config.DeathAnims` so the script detects unconscious players correctly.

Example for qb-ambulancejob laststand/dead anims are already included in the default list.

---

## Exports & events

### Client events

| Event | Description |
|-------|-------------|
| `vgx-medkit:client:useMedkit` | Triggered when player uses the item |
| `vgx-medkit:client:reviveTarget` | Revives the target player locally |

### Server events

| Event | Description |
|-------|-------------|
| `vgx-medkit:server:revivePlayer` | Called after progress bar completes |

### Server callback

| Callback | Returns |
|----------|---------|
| `vgx-medkit:server:hasItem` | `true` if player has the configured item |

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Script prints name check failed | Keep folder name exactly `VGX-MedKit` |
| Minigame does not open | Ensure `VGX-MiniGame` starts before `VGX-MedKit` |
| "Not unconscious" on dead player | Add their death animation to `Config.DeathAnims` |
| Player not fully revived | Set correct `Config.ReviveEvent` for your ambulance script |
| Target option missing | Check `Config.TargetName` and that player has the item |

---

## Support

- **Developer:** Just.A  
- **Discord:** https://discord.gg/hnucPvSRHa

---

## License

VGX DEV — All rights reserved. Do not rename or redistribute without permission.
