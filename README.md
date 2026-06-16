# factorio-auto-sort-chest-mod

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![Factorio](https://img.shields.io/badge/Factorio-FAB71C?style=for-the-badge&logo=factorio&logoColor=white)](https://factorio.com/)

Factorio mod that adds an "Auto-sort" button to any chest UI, reorganizing its inventory alphabetically by item type.

## How it works

The mod registers listeners on Factorio's GUI runtime events (`on_gui_opened`, `on_gui_closed`, `on_gui_click`). When a player opens a container, a button is injected into the GUI. On click, the script collects all items, clears the inventory, and reinserts them in alphabetical order. When the container is closed, the button is removed automatically.

The full lifecycle — creation, action, cleanup — is handled in `control.lua` using the Factorio runtime API.

## Structure

```
info.json     # Mod metadata (name, version, dependencies)
control.lua   # Core logic (events, sorting, GUI)
```

## Installation

Copy the mod folder to Factorio's mods directory:

- Windows: `%APPDATA%/Factorio/mods/`
- Linux: `~/.factorio/mods/`
- macOS: `~/Library/Application Support/factorio/mods/`

Then enable the mod from the game's main menu.

## References

- [Factorio Modding API](https://lua-api.factorio.com/latest/)
- [Modding Tutorial (Factorio Wiki)](https://wiki.factorio.com/Tutorial:Modding_tutorial/Gangsir)

## License

MIT
