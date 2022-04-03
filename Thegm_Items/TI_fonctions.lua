--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Items
--	Fichier			: TI_fonctions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les fonctions de la page items.
--
--	NE PAS MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Declaration des variables

TI_Value = "item";
TI_Search = {};
TI_Search_Stuff = {};
TI_Scroll_Value = {};

----------------------------------------------------------------------------------------------
--				Function /gmitems

SLASH_TI1 = "/gmitems"
SlashCmdList["TI"] = function()
	TI_OnShow();
end

----------------------------------------------------------------------------------------------
--				Function OnShow

function TI_OnShow()
	if (TI:IsShown() ) then
		TI:Hide();
	else
		TI:Show();
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Rarity

function TI_GetRarity(id)
	local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(id);
	return iRarity;
end

----------------------------------------------------------------------------------------------
--				Function Info Items

function TI_Infos(id)
itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,itemEquipLoc, itemTexture = GetItemInfo(id); 
return itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,itemEquipLoc, itemTexture, id;
end

----------------------------------------------------------------------------------------------
--				Fonction Tooltips

function TI_Tooltip(TI_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TI_Name .. " |cff666666By " .. TI_By .. "|r\n\n" .. TI_Corp);
end

----------------------------------------------------------------------------------------------
--				Fonction Parler

function TI_Dire(TI_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TI_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Fonction Ajouter un Texte dans le chat

function TI_Msg(TI_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TI_Name .. TI_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Fonction Message d erreur

function TI_Erreur(TI_Corp)
	UIErrorsFrame:AddMessage(TI_Name .. TI_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Function stuff MJ

function TI_StuffMJ_OnClick()
	TI_Dire(TI_ADDITEM .. " " .. TI_STUFFROBE);
	TI_Dire(TI_ADDITEM .. " " .. TI_SLIPPERS);
	TI_Dire(TI_ADDITEM .. " " .. TI_HOOD);
end

----------------------------------------------------------------------------------------------
--				Function Scroll on change

function TI_ScrollBar_Change(TI_Choix)
    if (TI_Choix == TI_LStuff)or(TI_Choix == TI_Search_Stuff) then

		TI_Value = "stuff";
		TI_Scroll_Value = {};

		-- on rempli la table TI_Scroll_Value avec TI_Choix
		for i=1,table.maxn (TI_Choix) do
			TI_Scroll_Value[i] = {"itemName", TI_Choix[i][1], "", "", "", TI_Choix[i][3], "itemSubType", "itemStackCount","itemEquipLoc", "", TI_Choix[i][2]};
		end

	else
	
		TI_Value = "item";
		TI_Scroll_Value = {};

		-- on rempli la table Thegm_Items_Scroll_Value avec Thegm_Items_Choix
		for i=1,table.maxn (TI_Choix) do
			TI_Scroll_Value[i] = {TI_Infos(TI_Choix[i][2])};
		end

	end
		TI_ScrollBar:Show();
		TI_ScrollBar_Update();
end

----------------------------------------------------------------------------------------------
--				Function Scroll OnLoad

function TI_ScrollBar_OnLoad()
  for i=1,table.maxn (TI_LComposants) do
    TI_Scroll_Value[i] = {TI_Infos(TI_LComposants[i][2])};
  end
  TI_ScrollBar:Show();
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar Update

function TI_ScrollBar_Update()
  local line;
  local lineplusoffset;
  FauxScrollFrame_Update(TI_ScrollBar,table.maxn (TI_Scroll_Value),8,16);
  for line=1,8 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(TI_ScrollBar);
    if lineplusoffset <= table.maxn (TI_Scroll_Value) then
      getglobal("TI_ScrollBar"..line.."_Nom"):SetText(TI_Scroll_Value[lineplusoffset][2]);
	  getglobal("TI_ScrollBar"..line.."_Type"):SetText(TI_Scroll_Value[lineplusoffset][6]);
	  getglobal("TI_ScrollBar"..line.."_LvlObjets"):SetText(TI_Scroll_Value[lineplusoffset][5]);
	  getglobal("TI_ScrollBar"..line.."ItemNormalTexture"):SetTexture(TI_Scroll_Value[lineplusoffset][10]);
	  setglobal("TI_ScrollBar_Value_"..line, TI_Scroll_Value[lineplusoffset][11]);
      getglobal("TI_ScrollBar"..line):Show();
    else
      getglobal("TI_ScrollBar"..line):Hide();
    end
  end
end

----------------------------------------------------------------------------------------------
--				Function Infobulle Item

function TI_Infosbulles(TI_Id_Infos)
	if TI_Value == "item" then
		if IsControlKeyDown() then
		  TI_Tooltip(TI_bul["iditem"] .. TI_Id_Infos);
		else
		  GameTooltip:SetOwner(this, "ANCHOR_TOP");
		  GameTooltip:SetHyperlink("item:" .. TI_Id_Infos .. ":0:0:0:0:0:0:0");
		end
	elseif TI_Value == "stuff" then
	  TI_Tooltip(TI_bul["idstuff"] .. TI_Id_Infos);
	end
end

----------------------------------------------------------------------------------------------
--				Function Item on click

function TI_OnClick(TI_Id_Action)
	if TI_Value == "item" then
		if ( arg1 == "LeftButton" ) then
			if IsControlKeyDown() then
				TI_Dire(TI_msg["iditem"] .. TI_Id_Action);
			elseif IsShiftKeyDown() then
				TI_Combien(TI_Id_Action)
			else
				TI_Dire(TI_ADDITEM .. " " .. TI_Id_Action);
			end
		elseif (arg1 == "RightButton" ) then
			if IsControlKeyDown() then
				TI_Dire(TI_LISTITEM .. " " .. TI_Id_Action);
			else
				TI_Dire(TI_ADDITEM .. " " .. TI_Id_Action .. " -1");
			end
		end
	elseif TI_Value == "stuff" then
		TI_Dire(TI_ADDITEMSET .. " " .. TI_Id_Action);
	end
end

----------------------------------------------------------------------------------------------
--				Function Search item stuff

function TI_Chercher(TI_Choix)
	if TI_SearchBox:GetText() ~= "" then
		if (TI_Choix == "" or TI_Choix == "items") then
			TI_Search = {};
			TI_Dire(TI_LOOKUPITEM .. " " .. TI_SearchBox:GetText());
		else
			TI_Search_Stuff = {};
			TI_Dire(TI_LOOKUPSET .. " " .. TI_SearchBox:GetText());
		end
	else
		TI_Dire(TI_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function Ajout item stuff

function TI_Ajout(TI_Choix)
	if (TI_Add:GetText() ~= "") then
		if (TI_Choix == "" or TI_Choix == "items") then
			TI_Dire(TI_ADDITEM .. " " .. TI_Add:GetText());
		else
			TI_Dire(TI_ADDITEMSET .. " " .. TI_Add:GetText());
		end
	else
		TI_Dire(TI_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function Ajout item stuff

function TI_Combien(ItemID)
	TI_CB_ID = ItemID;
	TI_Split:Show();
end

----------------------------------------------------------------------------------------------
--				Function Ajout item stuff

function TI_AjoutM()
	if (TI_SplitBox:GetText() ~= "") then
			TI_Dire(TI_ADDITEM .. " " .. TI_CB_ID .. " " .. TI_SplitBox:GetText());
			TI_Hide();
	else
		TI_Dire(TI_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function Ajout item stuff

function TI_Hide()
	TI_CB_ID = "";
	TI_SplitBox:SetText("");
	TI_Split:Hide();
end

----------------------------------------------------------------------------------------------
--				Fonction Capture message dans le chat

-- local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler
-- function ChatFrame_MessageEventHandler( event, ... )
-- 	if event == "CHAT_MSG_SYSTEM" then
-- 		if (string.find (arg1, TI_Find_Stuff)) and (TI ~= nil) then
-- 			TI_Set(arg1);
-- 			if (TI_CheckItems:GetChecked()) then
-- 				return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 			end
-- 		elseif (string.find (arg1, TI_Find_Items)) and (TI ~= nil) then
-- 			TI_Items(arg1);
-- 			if (TI_CheckItems:GetChecked()) then
-- 				return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 			end
-- 		else
-- 			return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 		end
-- 	else
-- 		return ORIG_ChatFrame_MessageEventHandler( event, ... );
-- 	end
-- end

----------------------------------------------------------------------------------------------
--				Resultat recherche ITEM

function TI_Items(arg1)
	for id, name in string.gmatch(arg1, TI_Find_Items) do
		table.insert(TI_Search,{"["..name.."]",id,TI_GetRarity(id)});
		TI_ScrollBar_Change(TI_Search);
		TI_Value = "item";
	end
end

----------------------------------------------------------------------------------------------
--				Resultat recherche STUFF

function TI_Set(arg1)
	for id, name in string.gmatch(arg1, TI_Find_Stuff) do
		table.insert(TI_Search_Stuff,{"["..name.."]", id, "1", ""});
		TI_ScrollBar_Change(TI_Search_Stuff);
		TI_Value = "stuff";
	end
end

TI_By = "InstableDesign";
TI_Name = "|cffef7801[ The Gm ]|r |cffffffff Items : |r";
