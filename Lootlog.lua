local F = CreateFrame("frame","FFrame")
F:SetBackdrop({
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
      tile=1, tileSize=2, edgeSize=2, 
      insets={left=11, right=12, top=12, bottom=11}
})
F:SetWidth(10);
F:SetHeight(10);
F:SetPoint("CENTER",UIParent);
F:EnableMouse(true);
F:SetMovable(true);
F:RegisterForDrag("LeftButton")
F:SetScript("OnDragStart", function(self) self:StartMoving() end)
F:SetScript("OnDragStart", function(self) self:StartMoving() end)
F:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
F:SetFrameStrata("FULLSCREEN_DIALOG");

local lootList = "";

F:RegisterEvent("CHAT_MSG_LOOT");
local helloFS = F:CreateFontString(nil, "OVERLAY", "GameFontNormal")
helloFS:SetPoint("TOP");
F:SetScript("OnEvent", eventHandler);
	
    F:SetScript("OnEvent",function(self,event,message)
		if event=="CHAT_MSG_LOOT" then
			local msg = string.gsub(message, "%[", "");
                        -- print ("ERROR");
			if string.match(msg,"You receive loot:") then
				lootList = lootList .. string.char(10) .. msg;
				helloFS:SetText(lootList);
				-- print(msg)		
			end
		end
    end)