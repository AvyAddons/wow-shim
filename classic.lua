---@meta

-- Classic-only globals that are absent from the retail annotation corpora.
--
-- Ketho/vscode-wow-api and NumyAddon/FramexmlAnnotations both track retail
-- (`live` / `mainline`), so anything removed from retail has no annotation even
-- though it still exists on Vanilla/TBC/Wrath/Cata/Mists clients.
--
-- Add to this file when a Classic-flavor code path trips `undefined-global`.

--- Container index of the player's main bank on Classic clients.
---
--- Removed on retail by the War Within bank rework, which replaced it with
--- `Enum.BagIndex.Characterbanktab` (-2) and `Enum.BagIndex.CharacterBankTab_1`
--- onward (6+). On retail, `-1` is now `Enum.BagIndex.Keyring`.
---@type number
BANK_CONTAINER = -1

--- Converts a bank button ID into an inventory slot ID usable with
--- `GameTooltip:SetInventoryItem("player", slot)` and the `C_Container` bank APIs.
---
--- Classic only; removed on retail alongside `BANK_CONTAINER`.
---@param buttonID number Bank button index.
---@param isBag boolean? `true` for a bank *bag* slot; `nil`/`false` for a bank item slot.
---@return number invSlotID
function BankButtonIDToInvSlotID(buttonID, isBag) end
