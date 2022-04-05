--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Title			: TheGM - Teleportation
--	File			: functions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Required		: World Of Warcraft + MANGOS Emulator 2.4
--	Author			: InstableDesign@gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	This file contains the functions for the teleportation page.
--
--	YOU CAN EDIT THIS FILE
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Function Declarations variable

if TT_Favoris == nil then
	TT_Favoris = {};
end
TT_Scroll_Value = {};
TT_Temp = {};
TT_Temp2 = "";

----------------------------------------------------------------------------------------------
--				Function Command /gmtele

SLASH_TT1 = "/gmtele"
SlashCmdList["TT"] = function()
	TT_OnShow();
end

----------------------------------------------------------------------------------------------
--				Function OnShow

function TT_OnShow()
	if TT:IsShown() then
		TT:Hide();
	else
		TT:Show();
	end
end

----------------------------------------------------------------------------------------------
--				Function Change Map

function TT_ChangeMap(Thegm_MapShow)
	if TT_FrameAzeroth ~= nil then		TT_FrameAzeroth:Hide();		end
	if TT_FrameKalimdor ~= nil then		TT_FrameKalimdor:Hide();	end
	if TT_FrameOutland ~= nil then		TT_FrameOutland:Hide();		end
	getglobal(Thegm_MapShow):Show();
end

----------------------------------------------------------------------------------------------
--				Function OnLoad

function TT_OnLoad()
    this:RegisterEvent('VARIABLES_LOADED');

	TT_OutlandTexture:SetTexture("interface\\lfgframe\\LFGIcon-Outland");
	TT_KalimdorTexture:SetTexture("interface\\lfgframe\\LFGIcon-Kalimdor");

	for i=1,table.maxn (TT_LAzeroth) do
		TT_CreateTP(TT_LAzeroth,TT_LAzeroth[i],i);
	end
	for i=1,table.maxn (TT_LKalimdor) do
		TT_CreateTP(TT_LKalimdor,TT_LKalimdor[i],i);
	end
	for i=1,table.maxn (TT_LOutland) do
		TT_CreateTP(TT_LOutland,TT_LOutland[i],i);
	end
end

----------------------------------------------------------------------------------------------
--				Function Tooltips

function TT_Tooltip(TT_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
    GameTooltip:SetText(TT_Name .. " |cff666666" .. TT_Project .. "|r\n\n" .. TT_Corp);
end

----------------------------------------------------------------------------------------------
--				Function Say

function TT_Dire(TT_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TT_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Function Add Text in Chat

function TT_Msg(TT_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TT_Name .. TT_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Function Error Message

function TT_Erreur(TT_Corp)
	UIErrorsFrame:AddMessage(TT_Name .. TT_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Function Scrollbar Onload

function TT_ScrollBar_OnLoad()
  TT_ScrollBar:Show();
end

function TT_ScrollBar_Update()
  local line;
  local lineplusoffset;
  FauxScrollFrame_Update(TT_ScrollBar,table.getn(TT_Favoris),21,15);
  for line=1,21 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(TT_ScrollBar);
    if lineplusoffset <= table.getn(TT_Favoris) then
	  getglobal("TT_ScrollBar"..line):SetText(TT_Favoris[lineplusoffset][1]);
	  getglobal("TT_ScrollBar"..line):SetTextColor (1,1,1);
	  setglobal("TT_ScrollBar_go_"..line, TT_Favoris[lineplusoffset][2]);
	  setglobal("TT_ScrollBar_id_"..line, lineplusoffset);
      getglobal("TT_ScrollBar"..line):Show();
    else
      getglobal("TT_ScrollBar"..line):Hide();
    end
  end
end

----------------------------------------------------------------------------------------------
--				Function Teleport

function TT_Tp(TT_Choix)
	if TT_Choix == "amener" then
		TT_Msg(TT_msg["amener"]);
		TT_Dire(TT_SUMMON .. " " .. TT_Nom:GetText());
	elseif TT_Choix == "aller" then
		TT_Msg(TT_msg["aller"]);
		TT_Dire(TT_APPEAR .. " " .. TT_Nom:GetText());
	elseif TT_Choix == "tamener" then
		TT_Msg(TT_msg["tamener"]);
		TT_Dire(TT_SUMMON .. " " .. UnitName("target"));
	elseif TT_Choix == "taller" then
		TT_Msg(TT_msg["taller"]);
		TT_Dire(TT_APPEAR .. " " .. UnitName("target"));
	elseif TT_Choix == "groupe" then
		TT_Msg(TT_msg["groupe"]);
		for i=1,4 do
			if UnitName("party"..i) ~= nil then
				TT_Msg(TT_bul["groupe"]);
				TT_Dire(TT_SUMMON .. " " .. UnitName("party"..i));
			end
		end
	elseif TT_Choix == "raid" then
		TT_Msg(TT_msg["raid"]);
		for i=1,40 do
			if UnitName("raid"..i) ~= nil then
				TT_Msg(TT_bul["raid"]);
				Thegm_Dire(TT_SUMMON .. " " .. UnitName("raid"..i));
			end
		end
	else
		TT_Msg(TT_erreur["valeur"]);
		TT_Erreur(TT_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function Create Teleport Point

function TT_CreateTP(TT_Map,TT_Map_Value,TT_Map_Num)

	if TT_Map == TT_LAzeroth then
		TT_Frame = TT_FrameAzeroth;
		TT_Btn = "TT_BtnAzeroth"..TT_Map_Num;
	elseif TT_Map == TT_LKalimdor then
		TT_Frame = TT_FrameKalimdor;
		TT_Btn = "TT_BtnKalimdor"..TT_Map_Num;
	elseif TT_Map == TT_LOutland then
		TT_Frame = TT_FrameOutland;
		TT_Btn = "TT_BtnOutland"..TT_Map_Num;
	end
	
	local f = CreateFrame("Button", TT_Btn, TT_Frame, "TT_Template");
	f:SetScript("OnMouseDown", function() TT_Teleporter(TT_Map_Value) end);
	f:SetScript("OnEnter", function() TT_Tooltip(TT_bul["tp"] .. TT_Map_Value[1] .. TT_bul["tp2"] .. TT_Map_Value[2]) end);
	f:SetPoint("CENTER",TT_Frame,"TOPLEFT",TT_Map_Value[3],TT_Map_Value[4]);

	if TT_Map_Value[5] ~= nil then
		getglobal(TT_Btn.."Norm"):SetTexture("interface\\minimap\\poiicons");
		getglobal(TT_Btn.."Push"):SetTexture("interface\\minimap\\poiicons");

		if TT_Map_Value[5] == "neutralCity" then	--ville neutre
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.625 , 0.75  ,  0, 0.125 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.625 , 0.75  ,  0, 0.125 );	
		elseif TT_Map_Value[5] == "hordeCity" then	--ville H2
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.125 , 0.25  ,  0.125, 0.25 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.125 , 0.25  ,  0.125, 0.25 );	
		elseif TT_Map_Value[5] == "allianceCity" then	--ville alli
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.25 , 0.375  ,  0.125, 0.25 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.25 , 0.375  ,  0.125, 0.25 );	
		elseif TT_Map_Value[5] == "pvp" then	--JCJ neutre
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.125 , 0.25 , 0.75, 0.875 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.125 , 0.25 , 0.75, 0.875 );	
		elseif TT_Map_Value[5] == "hordePvP" then	--JCJ H2
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0 , 0.125 , 0.75, 0.875 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0 , 0.125 , 0.75, 0.875 );	
		elseif TT_Map_Value[5] == "alliancePvP" then	--JCJ Alli
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.75 , 0.875  ,  0.625, 0.75 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.75 , 0.875  ,  0.625, 0.75 );	
		elseif TT_Map_Value[5] == "neutralTown" then	--Auberge neutre
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.5 , 0.625  ,  0, 0.125 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.5 , 0.625  ,  0, 0.125 );	
		elseif TT_Map_Value[5] == "hordeTown" then	--Auberge H2
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.375 , 0.5  ,  0.5, 0.625 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.375 , 0.5  ,  0.5, 0.625 );	
		elseif TT_Map_Value[5] == "allianceTown" then	--Auberge Alli
			getglobal(TT_Btn.."Norm"):SetTexCoord( 0.125 , 0.25  ,  0.5, 0.625 );	
			getglobal(TT_Btn.."Push"):SetTexCoord( 0.125 , 0.25  ,  0.5, 0.625 );	
		end
	end
	f:Show();
end

----------------------------------------------------------------------------------------------
--				Function Teleporter

function TT_Teleporter(TT_Choix)
	if ( arg1 == "LeftButton" ) then
		TT_Dire(TT_GO.." "..TT_Choix[2]);
		TT:Hide();
	elseif ( arg1 == "RightButton" ) then
		TT_Dire(TT_Choix[1] .. TT_msg["tpcoor"] .. TT_Choix[2]);
	end
end


----------------------------------------------------------------------------------------------
--				Function Show Person

function TT_ShowPerson()
	TT_Dire(TT_GPS);
	TT_Addnom:SetText("");
	TT_Addnom:Show();
	TT_Addok:Show();
end

----------------------------------------------------------------------------------------------
--				Function Add Person

function TT_AddPerson()
	if TT_Addnom:GetText() ~= "" then
		table.insert(TT_Favoris,{TT_Addnom:GetText(), TT_Temp[1].." "..TT_Temp[2].." "..TT_Temp[3].." ".. TT_Temp2});
		TT_ScrollBar_Update();
		TT_Addnom:Hide();
		TT_Addok:Hide();
	else
		TT_Dire(TT_erreur["valeur"]);
		TT_Msg(TT_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function Click Person

function TT_OnClick(go,ID)
		if IsControlKeyDown() then
			TT_Msg("Vous supprimer une tp");
			table.remove (TT_Favoris, ID);
			TT_ScrollBar_Update();
		else
			TT_Dire(TT_GO.." "..go);
		end
end

----------------------------------------------------------------------------------------------
--				Function Capture Chat

-- local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler
-- function ChatFrame_MessageEventHandler( event, ... )
-- 	if event == "CHAT_MSG_SYSTEM" then

-- 		if string.find(arg1, TT_Find_Coord) then
-- 			for x, y, z in string.gmatch(arg1, TT_Find_Coord) do
-- 				TT_Temp = {x,y,z};
-- 			end
-- 			return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 		elseif string.find(arg1, TT_Find_Map) then
-- 			for MapId in string.gmatch(arg1, TT_Find_Map) do
-- 				TT_Temp2 = MapId;
-- 			end
-- 			return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 		else
-- 			return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 		end
-- 	else
-- 		return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 	end
-- end
----------------------------------------------------------------------------------------------
--				Variables

TT_Name = "|cffef7801[TheGm]|r";
TT_Project = "Teleportation";