CreateFrame("Frame","lootFrame",UIParent,"UIPanelDialogTemplate"); -- BasicFrameTemplate

local lootFrameW = 300;
local lootFrameH = 400;

local listHidden = false;

SLASH_SHOW1 = "/sns"
SlashCmdList["SHOW"] = function(msg)
   lootFrame:Show()
   listHidden = false;
end

SLASH_HIDE1 = "/snh"
SlashCmdList["HIDE"] = function(msg)
   lootFrame:Hide()
   listHidden = true;
end

lootFrame:SetSize(lootFrameW,lootFrameH);
lootFrame:SetPoint("CENTER");

lootFrame:RegisterForDrag("LeftButton");
lootFrame:SetScript("OnDragStart", lootFrame.StartMoving);
lootFrame:SetScript("OnDragStop", lootFrame.StopMovingOrSizing);


lootFrame:RegisterForDrag("LeftButton","RightButton");
lootFrame:EnableMouse(true);
lootFrame:SetMovable(true);

eFw = lootFrameW - 22;

lootFrame.editFrame = CreateFrame("EditBox", nil, lootFrame, "InputBoxTemplate");
lootFrame.editFrame:SetPoint("TOPLEFT", 15, -30);
lootFrame.editFrame:SetWidth(eFw);
lootFrame.editFrame:SetHeight(10);	

lootFrame.editFrame:SetMovable(false);
lootFrame.editFrame:SetAutoFocus(false);
lootFrame.editFrame:SetMultiLine(1000);
lootFrame.editFrame:SetMaxLetters(32000);



lootFrame.button2 = CreateFrame("Button",nil,lootFrame,"UIPanelButtonTemplate")
lootFrame.button2:SetSize(40,20)
lootFrame.button2:SetPoint("TOPRIGHT",-107,-4)
lootFrame.button2:SetText("Heigth")


lootFrame.button2m = CreateFrame("Button",nil,lootFrame,"UIPanelButtonTemplate")
lootFrame.button2m:SetSize(10,20)
lootFrame.button2m:SetPoint("TOPRIGHT",-97,-4)
lootFrame.button2m:SetText("-")
lootFrame.button2m:SetScript("OnClick", function()
    lootFrameH = lootFrameH -4;
	lootFrame:SetSize(lootFrameW,lootFrameH);
	
end)

lootFrame.button2p = CreateFrame("Button",nil,lootFrame,"UIPanelButtonTemplate")
lootFrame.button2p:SetSize(10,20)
lootFrame.button2p:SetPoint("TOPRIGHT",-87,-4)
lootFrame.button2p:SetText("+")
lootFrame.button2p:SetScript("OnClick", function()
    lootFrameH = lootFrameH +4;
	lootFrame:SetSize(lootFrameW,lootFrameH);
	
end)

lootFrame.button1 = CreateFrame("Button","TestButton1",lootFrame,"UIPanelButtonTemplate")
lootFrame.button1:SetSize(40,20)
lootFrame.button1:SetPoint("TOPRIGHT",-47,-4)
lootFrame.button1:SetText("Width")

lootFrame.button1m = CreateFrame("Button","TestButton1p",lootFrame,"UIPanelButtonTemplate")
lootFrame.button1m:SetSize(10,20)
lootFrame.button1m:SetPoint("TOPRIGHT",-37,-4)
lootFrame.button1m:SetText("-")
lootFrame.button1m:SetScript("OnClick", function()
    
	if lootFrameW >= 20 then
	lootFrameW = lootFrameW -4;
	eFw = eFw -4;
	lootFrame:SetSize(lootFrameW,lootFrameH);
	lootFrame.editFrame:SetWidth(eFw);
	end
	
end)

lootFrame.button1p = CreateFrame("Button","TestButton1m",lootFrame,"UIPanelButtonTemplate")
lootFrame.button1p:SetSize(10,20)
lootFrame.button1p:SetPoint("TOPRIGHT",-27,-4)
lootFrame.button1p:SetText("+")
lootFrame.button1p:SetScript("OnClick", function()
    
	lootFrameW = lootFrameW + 4;
	eFw = eFw + 4;
	lootFrame:SetSize(lootFrameW,lootFrameH);
	lootFrame.editFrame:SetWidth(eFw);
		
end)


local lootList = "";

lootFrame:RegisterEvent("CHAT_MSG_LOOT");

lootFrame:SetScript("OnEvent", eventHandler);
	
    lootFrame:SetScript("OnEvent",function(self,event,message)
		if event=="CHAT_MSG_LOOT" then
			local msg = string.gsub(message, "%[", "");
                        -- print ("ERROR");
			if string.match(msg,"You receive loot:") then
				lootList = lootList .. string.char(10) .. msg;
				
				if listHidden == false then
				lootFrame.editFrame:SetText(lootList);
				end	
			end
		end
   end)