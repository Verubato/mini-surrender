-- 12.1 moved CanSurrenderArena onto C_PvP; older clients still have the global.
local function CanSurrender()
	if C_PvP and C_PvP.CanSurrenderArena then
		return C_PvP.CanSurrenderArena()
	end

	return CanSurrenderArena and CanSurrenderArena()
end

local function Surrender()
	if not IsActiveBattlefieldArena() then
		return
	end

	if CanSurrender() then
		print("Successfully surrendered arena.")
		SurrenderArena()
	else
		print("Failed to surrender arena.")
	end
end

local function Init()
	SlashCmdList.CHAT_AFK = function(msg)
		if IsActiveBattlefieldArena() then
			Surrender()
		elseif not InCombatLockdown() then
			SendChatMessage(msg, "AFK")
		end
	end

	SLASH_MINISURRENDER1 = "/gg"
	SlashCmdList.MINISURRENDER = function()
		Surrender()
	end
end

local frame = CreateFrame("Frame") -- luaconv: its handler is a function defined above
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", Init)
