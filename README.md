# wow-shim

LuaLS annotation shim for the World of Warcraft API, plus a GitHub Action
that runs `lua-language-server --check` against the full annotation set.
The shim fills the gaps in
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

## In CI

The action clones the annotation corpora to the same `~/.local/share` paths,
links this repo in as the shim, installs the tools from the caller's
`mise.toml`, and runs its `lint` task. `setup.sh` is the same script, runnable
by hand for a fresh machine.

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
      - uses: AvyAddons/wow-shim@main
```

The caller's `mise.toml` is the single source of truth for the LuaLS version
and the check command:

```toml
[tools]
"lua-language-server" = "latest"

[tasks.lint]
run = "lua-language-server --check . --checklevel=Warning --check_format=pretty"
```

## Adding an entry

Mirror the upstream file layout and link the wiki page, so the entry can be
sent upstream as is. Delete it here once the upstream annotation is merged.

```lua
---[Documentation](https://warcraft.wiki.gg/wiki/UIOBJECT_WorldFrame)
---@class WorldFrame : Frame
WorldFrame = {}
```
