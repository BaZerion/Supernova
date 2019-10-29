local f = CreateFrame("Frame");

f:RegisterEvent("CHAT_MSG_LOOT");

f:SetScript("OnEvent", function(self,event,...);

Print(event);

end
