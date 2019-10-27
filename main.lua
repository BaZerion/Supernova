



SLASH_TEST1 = "/sng"
SLASH_TEST2 = "/addontest1"
SlashCmdList["TEST"] = function(msg)
   local numTotal, numOnlineMaxLevel, numOnline = GetNumGuildMembers();
   DEFAULT_CHAT_FRAME:AddMessage(numTotal .. " guild members: " .. numOnline .. " online (" .. numOnlineMaxLevel .. " at maximum level), " .. (numTotal - numOnline) .. " offline.");
end 


-- AddMessage(numTotal .. " guild members: " .. numOnline .. " online (" .. numOnlineMaxLevel .. " at maximum level), " .. (numTotal - numOnline) .. " offline.")
