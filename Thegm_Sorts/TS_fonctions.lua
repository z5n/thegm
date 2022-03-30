--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Sorts
--	Fichier			: TS_fonctions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les fonctions de la page sorts.
--
--	NE PAS MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Declarations des variables

TS_Search = {};
TS_Scroll_Value = {};

----------------------------------------------------------------------------------------------
--				Fonction /gmsorts

SLASH_TS1 = "/gmsorts"
SlashCmdList["TS"] = function()
	TS_OnShow();
end

----------------------------------------------------------------------------------------------
--				Fonction On show

function TS_OnShow()
	if (TS:IsShown() ) then
		TS:Hide();
	else
		TS:Show();
	end
end

function Thegm_Show()
	TS:Hide();
end
----------------------------------------------------------------------------------------------
--				Fonction Onload

function TS_OnLoad()
	TS_Macro2Texture:SetTexCoord( 0.25 , 0.5  ,  0, 0.25 );
	TS_Macro3Texture:SetTexCoord( 0.5 , 0.75  ,  0, 0.25 );
	TS_Macro4Texture:SetTexCoord( 0.75 , 1  ,  0, 0.25 );
	TS_Macro5Texture:SetTexCoord( 0 , 0.25  ,  0.25, 0.5 );
	TS_Macro6Texture:SetTexCoord( 0.25 , 0.5  ,  0.25, 0.5 );
	TS_Macro7Texture:SetTexCoord( 0.5 , 0.75  ,  0.25, 0.5 );
	TS_Macro8Texture:SetTexCoord( 0.75 , 1  ,  0.25, 0.5 );
	TS_Macro9Texture:SetTexCoord( 0 , 0.25  ,  0.5, 0.75 );
end

----------------------------------------------------------------------------------------------
--				Fonction Tooltips

function TS_Tooltip(TS_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TS_Name .. " |cff666666By " .. TS_By .. "|r\n\n" .. TS_Corp);
end

----------------------------------------------------------------------------------------------
--				Fonction Parler

function TS_Dire(TS_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TS_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Fonction Ajouter un Texte dans le chat

function TS_Msg(TS_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TS_Name .. TS_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Fonction Message d erreur

function TS_Erreur(TS_Corp)
	UIErrorsFrame:AddMessage(TS_Name .. TS_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Fonction Chercher un sort

function TS_Chercher()
	if ( TS_Spellbox:GetText() == "" ) then
		TS_Erreur(TS_erreur["valeur"]);
		TS_Msg(TS_erreur["valeur"]);
	else
		if ( UnitIsPlayer("target") ) or ( not UnitName("target") ) then
			TS_Msg(TS_msg["cherche"] .. TS_Spellbox:GetText());
			TS_Search = {};
			TS_Dire(TS_LOOKUPSPELL  .. " " .. TS_Spellbox:GetText());
		else
			TS_Msg(TS_erreur["cible"]);
			TS_Erreur(TS_erreur["cible"]);
		end
	end 
end

----------------------------------------------------------------------------------------------
--				Fonction Learn Unlearn

function TS_Learn(TS_Sort)
	if ( arg1 == "LeftButton" ) then
		if IsControlKeyDown() then
			TS_Dire("L'ID du sort est " .. TS_Sort);
		else
			TS_Msg(TS_msg["learn"] .. TS_Sort);
			TS_Dire(TS_LEARN .. " " .. TS_Sort);
		end
	elseif ( arg1 == "RightButton" ) then
		TS_Msg(TS_msg["unlearn"] .. TS_Sort);
		TS_Dire(TS_UNLEARN .. " " .. TS_Sort);
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar on change

function TS_ScrollBar_Change(TS_Choix)
	TS_Scroll_Value = {};
	
	-- on rempli la table TS_Scroll_Value avec TS_Choix
	for i=1,table.maxn (TS_Choix) do
		TS_Scroll_Value[i] = {TS_Choix[i][1], TS_Choix[i][2], TS_Choix[i][3]};
	end
	
	TS_ScrollBar:Show();
	TS_ScrollBar_Update();
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar On load

function TS_ScrollBar_OnLoad()
	for i=1,table.maxn (TS_Guerrier) do
		TS_Scroll_Value[i] = {TS_Guerrier[i][1], TS_Guerrier[i][2], TS_Guerrier[i][3]};
	end
	TS_ScrollBar:Show();
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar Update

function TS_ScrollBar_Update()
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(TS_ScrollBar,table.getn(TS_Scroll_Value),21,15);
	for line=1,21 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(TS_ScrollBar);
		if lineplusoffset <= table.getn(TS_Scroll_Value) then
			getglobal("TS_ScrollBar"..line):SetText(TS_Scroll_Value[lineplusoffset][1]);
			getglobal("TS_ScrollBar"..line):SetTextColor (1,1,1);
			getglobal("TS_ScrollBar"..line.."lvl"):SetText(TS_Scroll_Value[lineplusoffset][2]);
			setglobal("TS_ScrollBar_Value_"..line, TS_Scroll_Value[lineplusoffset][3]);
			getglobal("TS_ScrollBar"..line):Show();
		else
		  getglobal("TS_ScrollBar"..line):Hide();
		end
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Recup message du chat

local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler
function ChatFrame_MessageEventHandler( event, ... )
	if event == "CHAT_MSG_SYSTEM" then
		if string.find (arg1,TS_Find_Sorts)  then
			TS_Sorts(arg1);
			if (TS_CheckSpell:GetChecked()) then
				return ORIG_ChatFrame_MessageEventHandler( event, ... );
			end
		else
			return ORIG_ChatFrame_MessageEventHandler( event, ... );
		end
	else
		return ORIG_ChatFrame_MessageEventHandler( event, ... );
	end
end

----------------------------------------------------------------------------------------------
--				Fonction tri du resultat

function TS_Sorts(arg1)
	for id, name in string.gmatch(arg1, TS_Find_Sorts) do
		table.insert(TS_Search,{name,"",id});
		TS_ScrollBar_Change(TS_Search);
	end
end

TS_By = "InstableDesign";
TS_Name = "|cffef7801[ The Gm ]|r |cffffffff Sorts : |r";
