local function Surrender()
	if not IsActiveBattlefieldArena() then
		return
	end

	if CanSurrenderArena() then
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

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", Init)
