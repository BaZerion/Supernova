--print("Loaded sng");
SLASH_SNONLINE1 = "/sno"
SlashCmdList["SNONLINE"] = function(msg)
	local numTotal, numOnlineMaxLevel, numOnline = GetNumGuildMembers();
	DEFAULT_CHAT_FRAME:AddMessage(numTotal .. " guild members: " .. numOnline .. " online ("  .. (numTotal - numOnline) .. " offline).");
end





