local addonName, addon = ...
---@type MiniFramework
local mini = addon.Framework

mini:WaitForAddonLoad(function()
	-- A styled button clashes with the stock Blizzard art around it in the settings screen.
	mini:SetCustomStyling(true, { Button = false })

	local panel = CreateFrame("Frame")
	panel.name = addonName

	local category = mini:AddCategory(panel)

	if not category then
		return
	end

	-- No saved settings exist yet, so the panel is the title, the description, and the rule.
	mini:PanelHeader({
		Parent = panel,
		Description = "Makes /afk and /gg surrender arena, without the right click and the confirmation.",
		Divider = true,
	})

	mini:RegisterSlashCommand(category, panel, {
		"/minisurrender",
		"/msur",
	})
end)
