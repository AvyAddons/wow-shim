---@meta _

-- Globals that exist on every client flavor but are missing from both
-- annotation corpora.
--
-- NumyAddon/FramexmlAnnotations is generated from Blizzard's shipped Interface
-- source, so anything the C++ client creates directly never shows up there.
-- Ketho/vscode-wow-api hand-curates those engine-created objects one file at a
-- time under Annotations/Core/Widget/Frame and simply lacks some of them.
--
-- Each entry here is a candidate upstream PR to Ketho/vscode-wow-api. Delete it
-- once the upstream annotation lands.

---[Documentation](https://warcraft.wiki.gg/wiki/UIOBJECT_WorldFrame)
---@class WorldFrame : Frame
WorldFrame = {}
