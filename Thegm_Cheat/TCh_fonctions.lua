--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Title			: TheGM - Cheat
--	File			: TCh_Functions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Required		: World Of Warcraft + MANGOS Emulator 2.4
--	Author			: InstableDesign@gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	This file contains the functions for the cheat page.
--
--	YOU CAN EDIT THIS FILE
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Declarations variable

TCh_MacroRec = "a";

----------------------------------------------------------------------------------------------
--				Function /glmcheat

SLASH_TCH1 = "/gmcheat"
SlashCmdList["TCH"] = function()
	TCh_OnShow();
end

----------------------------------------------------------------------------------------------
--				Function On Show

function TCh_OnShow()
	if (TCh:IsShown() ) then
		TCh:Hide();
		TCh_Macro:Hide();
	else
		TCh:Show();
	end
end

----------------------------------------------------------------------------------------------
--				Function On Load

function TCh_OnLoad()
    this:RegisterEvent('VARIABLES_LOADED');

	TCh_Macro2Texture:SetTexCoord( 0.25 , 0.5  ,  0, 0.25 );
	TCh_Macro3Texture:SetTexCoord( 0.5 , 0.75  ,  0, 0.25 );
	TCh_Macro4Texture:SetTexCoord( 0.75 , 1  ,  0, 0.25 );
	TCh_Macro5Texture:SetTexCoord( 0 , 0.25  ,  0.25, 0.5 );
	TCh_Macro6Texture:SetTexCoord( 0.25 , 0.5  ,  0.25, 0.5 );
	TCh_Macro7Texture:SetTexCoord( 0.5 , 0.75  ,  0.25, 0.5 );
	TCh_Macro8Texture:SetTexCoord( 0.75 , 1  ,  0.25, 0.5 );
	TCh_Macro9Texture:SetTexCoord( 0 , 0.25  ,  0.5, 0.75 );

end

----------------------------------------------------------------------------------------------
--				Function Tooltips

function TCh_Tooltip(TCh_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TCh_Name .. " |cff666666By: " .. TCh_By .. "|r\n\n" .. TCh_Corp);
end

----------------------------------------------------------------------------------------------
--				Function Parler

function TCh_Dire(TCh_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TCh_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Function Ajouter un Texte dans le chat

function TCh_Msg(TCh_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TCh_Name .. TCh_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Function Message d erreur

function TCh_Erreur(TCh_Corp)
	UIErrorsFrame:AddMessage(TCh_Name .. TCh_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Function Cible nom

function TCh_TName()
	if UnitName("target") then
		return UnitName("target");
	else
		return UnitName("player")
	end
end

----------------------------------------------------------------------------------------------
--				Function Argent

function TCh_Tune(TCh_Transaction)
	local TCh_Total = 0;
	local TCh_Or = TCh_Or:GetText();
	local TCh_Argent = TCh_Argent:GetText();
	local TCh_Cuivre = TCh_Cuivre:GetText();

	if ( TCh_Or == "" ) then
		TCh_Or = 0;
	end
	if ( TCh_Argent == "" ) then
		TCh_Argent = 0;
	end
	if ( TCh_Cuivre == "" ) then
		TCh_Cuivre = 0;
	end

	TCh_Total = TCh_Cuivre + (TCh_Argent * 100) + (TCh_Or * 10000);

	if ( TCh_Total == 0 ) then
			TCh_Erreur(TCh_erreur["valeur"]);
			TCh_Msg(TCh_erreur["valeur"]);
	else
		if ( UnitIsPlayer("target") ) or ( not UnitName("target") ) then
			if (TCh_Transaction == "plus") then
				TCh_Msg(TCh_msg["orp"] .. TCh_Or .. " PO " .. TCh_Argent .. " argent " .. TCh_Cuivre .. " cuivre a |cff00ff00".. TCh_TName());
				TCh_Dire(TCH_MONEY .. " " .. TCh_Total);
			else
				TCh_Msg(TCh_msg["orm"] .. TCh_Or .. " PO " .. TCh_Argent .. " argent " .. TCh_Cuivre .. " cuivre a |cff00ff00".. TCh_TName());
				TCh_Dire(TCH_MONEY .. " -" .. TCh_Total);
			end
		else
			TCh_Erreur(TCh_erreur["cible"]);
			TCh_Msg(TCh_erreur["cible"]);
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function dire crier

function TCh_Crier()
	if (TCh_Say:GetText() ~= "") then
		if ( arg1 == "RightButton" ) then
			TCh_Dire(TCH_YELL .. " " .. TCh_Say:GetText());
		else
			TCh_Dire(TCH_SAY .. " " .. TCh_Say:GetText());
		end
	else
		TCh_Erreur(TCh_erreur["valeur"]);
		TCh_Msg(TCh_erreur["valeur"]);
	end
end

----------------------------------------------------------------------------------------------
--				Function modify

function TCh_Modify_Val(TCh_choix)
-- Function modify lvl
	if (TCh_choix == "lvl") then
		if ( arg1 == "RightButton" ) then
			TCh_Msg(TCh_msg["lvlm"] .. TCh_TName());
			TCh_Dire(TCH_LEVEL .. " -" .. TCh_Modify:GetText());
		else
			TCh_Msg(TCh_msg["lvlp"] .. TCh_TName());
			TCh_Dire(TCH_LEVEL .. " " .. TCh_Modify:GetText());
		end
-- Function modify hp
	elseif (TCh_choix == "hp") then
			TCh_Msg(TCh_msg["modify"] .. "de vie a |cff00ff00" .. TCh_TName());
			TCh_Dire(TCH_HP .. " " .. TCh_Modify:GetText());
-- Function modify mana
	elseif (TCh_choix == "mana") then
			TCh_Msg(TCh_msg["modify"] .. "de mana a |cff00ff00" .. TCh_TName());
			TCh_Dire(TCH_MANA .. " " .. TCh_Modify:GetText());
-- Function modify rage
	elseif (TCh_choix == "rage") then
			TCh_Msg(TCh_msg["modify"] .. "de rage a |cff00ff00" .. TCh_TName());
			TCh_Dire(TCH_RAGE .. " " .. TCh_Modify:GetText());
-- Function modify energie
	elseif (TCh_choix == "energie") then
			TCh_Msg(TCh_msg["modify"] .. "d'energie a |cff00ff00" .. TCh_TName());
			TCh_Dire(TCH_ENERGY .. " " .. TCh_Modify:GetText());
-- Function modify honneur
	elseif (TCh_choix == "honneur") then
		if ( arg1 == "RightButton" ) then
			TCh_Msg(TCh_msg["honneurmaj"] .. TCh_TName());
			TCh_Dire(TCH_HONOR_UPDATE);
		else
			TCh_Msg(TCh_msg["honneur"] .. TCh_TName());
			TCh_Dire(TCH_HONOR .. " " .. TCh_Modify:GetText());
		end
	end

-- Function modify taille
	if (TCh_choix == "taille") then
		if ( arg1 == "RightButton" ) then
			TCh_Msg(TCh_msg["tailler"] .. TCh_TName());
			TCh_Dire(TCH_SCALE .. " 1");
		else
			TCh_Msg(TCh_msg["taille"] .. TCh_TName());
			TCh_Dire(TCH_SCALE .. " " .. TCh_Modify_Slider:GetValue());
		end
-- Function modify speed
	elseif (TCh_choix == "speed") then
		if ( arg1 == "RightButton" ) then
			TCh_Msg(TCh_msg["speedr"] .. TCh_TName());
			TCh_Dire(TCH_SPEED .. " 1");
		else
			TCh_Msg(TCh_msg["speed"] .. TCh_TName());
			TCh_Dire(TCH_SPEED .. " " .. TCh_Modify_Slider:GetValue());
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function GM Mode

function TCh_GM_Mode()
	if ( arg1 == "LeftButton" ) then
		if IsControlKeyDown() then
			TCh_Msg(TCh_msg["whispon"]);
			TCh_Dire(TCH_WHISP_ON);
		else
			TCh_Msg(TCh_msg["GMon"]);
			TCh_Dire(TCH_GM_ON);
		end
	elseif ( arg1 == "RightButton" ) then
		if IsControlKeyDown() then
			TCh_Msg(TCh_msg["whispoff"]);
			TCh_Dire(TCH_WHISP_OFF);
		else
			TCh_Msg(TCh_msg["GMoff"]);
			TCh_Dire(TCH_GM_OFF);
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function activer/desactiver

function TCh_Activer(TCh_choix)
-- Function hover
	if (TCh_choix == "hover") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["hoveron"]);
			TCh_Dire(TCH_HOVER_ON);
		else
			TCh_Msg(TCh_msg["hoveroff"]);
			TCh_Dire(TCH_HOVER_OFF);
		end
-- Function invisible
	elseif (TCh_choix == "invisible") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["invisible"]);
			TCh_Dire(TCH_INVISIBLE);
		else
			TCh_Msg(TCh_msg["visible"]);
			TCh_Dire(TCH_VISIBLE);
		end
-- Function flypath
	elseif (TCh_choix == "flypath") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["flypathvoir"]);
			TCh_Dire(TCH_TAXI_VOIR);
		else
			TCh_Msg(TCh_msg["flypathcacher"]);
			TCh_Dire(TCH_TAXI_CACHER);
		end
-- Function flymode
	elseif (TCh_choix == "flymode") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["flymodeon"]);
			TCh_Dire(TCH_FLYMODE_ON);
		else
			TCh_Msg(TCh_msg["flymodeoff"]);
			TCh_Dire(TCH_FLYMODE_OFF);
		end
-- Function carte
	elseif (TCh_choix == "carte") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["cartevoir"]);
			TCh_Dire(TCH_MAPS_VOIR);
		else
			TCh_Msg(TCh_msg["cartecacher"]);
			TCh_Dire(TCH_MAPS_CACHER);
		end
-- Function die
	elseif (TCh_choix == "die") then
		if ( arg1 == "LeftButton" ) then
			TCh_Msg(TCh_msg["die"] .. TCh_TName());
			TCh_Dire(TCH_DIE);
		else
			TCh_Msg(TCh_msg["revivre"] .. TCh_TName() .. ".");
			TCh_Dire(TCH_REVIVE);
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function Infocible

function TCh_Infoscible()
	if UnitIsPlayer("target") then
		TCh_Msg(TCh_msg["infosp"] .. TCh_TName());
		TCh_Dire(TCH_PINFO);
	else
		TCh_Msg(TCh_msg["infosnpc"] .. TCh_TName());
		TCh_Dire(TCH_NPCINFO);
	end
end

----------------------------------------------------------------------------------------------
--				Function Annoncer

function TCh_Annoncer()
	if TCh_Annonce:GetText() == "" then
		TCh_Msg(TCh_erreur["valeur"]);
	else
		if IsControlKeyDown() then
		-- Function notify
			if ( arg1 == "LeftButton" ) then
				TCh_Msg(TCh_msg["notify"]);
				TCh_Dire(TCH_NOTIFY .. " " .. TCh_Annonce:GetText());
		-- Function notify avec affichage du nom
			else
				TCh_Msg(TCh_msg["notifynom"]);
				TCh_Dire(TCH_NOTIFY .. " " .. TCh_Annonce:GetText().. " <MJ>" .. UnitName("player"));
			end
		else
		-- Function annonce
			if ( arg1 == "RightButton" ) then
				TCh_Msg(TCh_msg["annonce"]);
				TCh_Dire(TCH_ANNOUNCE .. " " .. TCh_Annonce:GetText());
		-- Function annonce avec affichage du nom
			else
				TCh_Msg(TCh_msg["notify"]);
				TCh_Dire(TCH_NOTIFY .. " " .. TCh_Annonce:GetText());
			end
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function Echelle de slider

function Tch_Echelle(Tch_choix)
	if Tch_choix == "s" then
		TCh_Modify_Slider:SetMinMaxValues(0.5, 10);
		TCh_Modify_Slider:SetValueStep(0.5);
		TCh_Modify_SliderLow:SetText("0.5");
		TCh_Modify_SliderHigh:SetText("10");
	elseif Tch_choix == "t" then
		TCh_Modify_Slider:SetMinMaxValues(0.1, 3);
		TCh_Modify_Slider:SetValueStep(0.1);
		TCh_Modify_SliderLow:SetText("0.1");
		TCh_Modify_SliderHigh:SetText("3");
	end
end


----------------------------------------------------------------------------------------------
--				Function Macro

function TCh_Macro_Click(TCh_choix)
-- Function Macro Guerrier
	if (TCh_choix == "TCh_MGuerrier") then
		TCh_MacroRec = "TCh_MGuerrier";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0 , 0.25  ,  0, 0.25 );
		if TCh_MGuerrier == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MGuerrier[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MGuerrier[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MGuerrier[1] == nil or TCh_MGuerrier[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MGuerrier[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MGuerrier[2] == nil or TCh_MGuerrier[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MGuerrier[2]);
				end
			end
		end
-- Function Macro Mage
	elseif (TCh_choix == "TCh_MMage") then
		TCh_MacroRec = "TCh_MMage";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.25 , 0.5  ,  0, 0.25 );
		if TCh_MMage == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MMage[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MMage[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MMage[1] == nil or TCh_MMage[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MMage[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MMage[2] == nil or TCh_MMage[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MMage[2]);
				end
			end
		end
-- Function Macro Voleur
	elseif (TCh_choix == "TCh_MVoleur") then
		TCh_MacroRec = "TCh_MVoleur";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.5 , 0.75  ,  0, 0.25 );
		if TCh_MVoleur == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MVoleur[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MVoleur[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MVoleur[1] == nil or TCh_MVoleur[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MVoleur[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MVoleur[2] == nil or TCh_MVoleur[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MVoleur[2]);
				end
			end
		end
-- Function Macro Druid
	elseif (TCh_choix == "TCh_MDruid") then
		TCh_MacroRec = "TCh_MDruid";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.75 , 1  ,  0, 0.25 );
		if TCh_MDruid == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MDruid[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MDruid[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MDruid[1] == nil or TCh_MDruid[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MDruid[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MDruid[2] == nil or TCh_MDruid[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MDruid[2]);
				end
			end
		end
-- Function Macro Chasseur
	elseif (TCh_choix == "TCh_MChasseur") then
		TCh_MacroRec = "TCh_MChasseur";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0 , 0.25  ,  0.25, 0.5 );
		if TCh_MChasseur == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MChasseur[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MChasseur[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MChasseur[1] == nil or TCh_MChasseur[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MChasseur[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MChasseur[2] == nil or TCh_MChasseur[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MChasseur[2]);
				end
			end
		end
-- Function Macro Chaman
	elseif (TCh_choix == "TCh_MChaman") then
		TCh_MacroRec = "TCh_MChaman";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.25 , 0.5  ,  0.25, 0.5 );
		if TCh_MChaman == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MChaman[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MChaman[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MChaman[1] == nil or TCh_MChaman[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MChaman[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MChaman[2] == nil or TCh_MChaman[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MChaman[2]);
				end
			end
		end
-- Function Macro pretre
	elseif (TCh_choix == "TCh_MPretre") then
		TCh_MacroRec = "TCh_MPretre";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.5 , 0.75  ,  0.25, 0.5 );
		if TCh_MPretre == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MPretre[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MPretre[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MPretre[1] == nil or TCh_MPretre[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MPretre[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MPretre[2] == nil or TCh_MPretre[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MPretre[2]);
				end
			end
		end
-- Function Macro Demoniste
	elseif (TCh_choix == "TCh_MDemoniste") then
		TCh_MacroRec = "TCh_MDemoniste";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0.75 , 1  ,  0.25, 0.5 );
		if TCh_MDemoniste == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MDemoniste[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MDemoniste[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MDemoniste[1] == nil or TCh_MDemoniste[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MDemoniste[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MDemoniste[2] == nil or TCh_MDemoniste[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MDemoniste[2]);
				end
			end
		end
-- Function Macro Paladin
	elseif (TCh_choix == "TCh_MPaladin") then
		TCh_MacroRec = "TCh_MPaladin";
		TCh_MacroIcone:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes");
		TCh_MacroIcone:SetTexCoord( 0 , 0.25  ,  0.5, 0.75 );
		if TCh_MPaladin == nil then
			TCh_Macro:Show();
			TCh_Macro_Scroll1Txt:SetText("");
			TCh_Macro_Scroll2Txt:SetText("");
		else
			TCh_Macro_Scroll1Txt:SetText(TCh_MPaladin[1]);
			TCh_Macro_Scroll2Txt:SetText(TCh_MPaladin[2]);
			if arg1 == "LeftButton" and IsControlKeyDown() then
				TCh_Macro:Show();
			elseif arg1 == "LeftButton" and not IsControlKeyDown() then
				if TCh_MPaladin[1] == nil or TCh_MPaladin[1] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MPaladin[1]);
				end
			elseif arg1 == "RightButton" then
				if TCh_MPaladin[2] == nil or TCh_MPaladin[2] == "" then
					TCh_Macro:Show();
				else
					TCh_MacroDire(TCh_MPaladin[2]);
				end
			end
		end
	end
end

----------------------------------------------------------------------------------------------
--				Function save macro

function TCh_MacroSave(TCh_Choix)
	local TCh_Click = TCh_Macro_Scroll1Txt:GetText();
	local TCh_ClickD = TCh_Macro_Scroll2Txt:GetText();
	setglobal(TCh_Choix, {TCh_Click, TCh_ClickD});
end

----------------------------------------------------------------------------------------------
--				Function Dire macro

function TCh_MacroDire(s)
	TCh_MacroEach(TCh_split (s,"\n"));
end
-- Function Macro dire chaque ligne 
function TCh_MacroEach(var)
  for i=1,table.maxn (var) do
	TCh_Dire(var[i]);
  end
end
-- Function Macro decouper la chaine par ligne
function TCh_split( chaine, inSplitPattern )
  outResults = { }
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( chaine, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( chaine, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( chaine, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( chaine, theStart ) )
  return outResults
end

TCh_By = "InstableDesign";
TCh_Name = "|cffef7801[TheGm]|r ";
-- TCh_Name = "|cffef7801[ The Gm ]|r |cffffffff Cheat : |r";

