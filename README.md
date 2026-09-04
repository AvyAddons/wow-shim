# wow-shim

LuaLS annotation shim for the World of Warcraft API. Fills the gaps in
[Ketho/vscode-wow-api](https://github.com/Ketho/vscode-wow-api) and
[NumyAddon/FramexmlAnnotations](https://github.com/NumyAddon/FramexmlAnnotations),
both of which track retail.

| File | Contents |
|---|---|
| `classic.lua` | Globals removed from retail that still exist on Classic clients |
| `globals.lua` | Globals present on every flavor but absent upstream |

## Usage

Clone next to the upstream corpora and list it in `.luarc.json`:

```sh
git clone https://github.com/AvyAddons/wow-shim ~/.local/share/wow-shim
```

```json
"workspace.library": [
  "~/.local/share/wow-api/Annotations/Core",
  "~/.local/share/wow-framexml/Annotations",
  "~/.local/share/wow-shim"
]
```

## Adding an entry

Mirror the upstream file layout and link the wiki page, so the entry can be
sent upstream as is. Delete it here once the upstream annotation is merged.

```lua
---[Documentation](https://warcraft.wiki.gg/wiki/UIOBJECT_WorldFrame)
---@class WorldFrame : Frame
WorldFrame = {}
```
