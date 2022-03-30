--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Competences
--	Fichier			: TC_fonctions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les fonctions de la page competences.
--
--	NE PAS MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Declarations des variables

TC_Search = {};
TC_Scroll_Value = {};

----------------------------------------------------------------------------------------------
--				Fonction /gmcomp

SLASH_TC1 = "/gmcomp"
SlashCmdList["TC"] = function()
	TC_OnShow();
end

----------------------------------------------------------------------------------------------
--				Fonction On show

function TC_OnShow()
	if (TC:IsShown() ) then
		TC:Hide();
	else
		TC:Show();
	end
end

function Thegm_Show()
	TC:Hide();
end

----------------------------------------------------------------------------------------------
--				Fonction Onload

function TC_OnLoad()
	TC_BtnArmesTexture:SetTexture("interface\\icons\\ability_dualwield");
	TC_BtnArmesTexture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_BtnArmuresTexture:SetTexture("interface\\icons\\inv_misc_armorkit_09");
	TC_BtnArmuresTexture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_BtnMonturesTexture:SetTexture("interface\\icons\\ability_mount_gryphon_01");
	TC_BtnMonturesTexture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_BtnLanguesTexture:SetTexture("interface\\icons\\ability_dualwieldspecialization");
	TC_BtnLanguesTexture:SetTexCoord( 0 , 1  ,  0, 1 );

-- Dépeçage
	TC_Macro1Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro1Texture:SetTexture("interface\\icons\\INV_Misc_Pelt_Wolf_01");
-- Herboristerie
	TC_Macro2Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro2Texture:SetTexture("interface\\icons\\trade_herbalism");
-- Minage
	TC_Macro3Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro3Texture:SetTexture("interface\\icons\\trade_mining");

-- Alchimie
	TC_Macro4Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro4Texture:SetTexture("interface\\icons\\trade_alchemy");
-- Couture
	TC_Macro5Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro5Texture:SetTexture("interface\\icons\\trade_tailoring");
-- Forge
	TC_Macro6Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro6Texture:SetTexture("interface\\icons\\trade_blacksmithing");
-- Ingénierie
	TC_Macro7Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro7Texture:SetTexture("interface\\icons\\trade_engineering");
-- Joaillerie
	TC_Macro8Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro8Texture:SetTexture("interface\\icons\\INV_Misc_Gem_02");
-- Travail du cuir
	TC_Macro9Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro9Texture:SetTexture("interface\\icons\\trade_leatherworking");
-- Enchantement
	TC_Macro10Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro10Texture:SetTexture("interface\\icons\\trade_engraving");

-- Pêche
	TC_Macro11Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro11Texture:SetTexture("interface\\icons\\trade_fishing");
-- Cuisine
	TC_Macro12Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro12Texture:SetTexture("interface\\icons\\INV_Misc_Food_15");
-- Secourisme
	TC_Macro13Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro13Texture:SetTexture("interface\\icons\\Spell_Holy_SealOfSacrifice");
-- Poisons
	TC_Macro14Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro14Texture:SetTexture("interface\\icons\\trade_brewpoison");
-- Crochetage
	TC_Macro15Texture:SetTexCoord( 0 , 1  ,  0, 1 );
	TC_Macro15Texture:SetTexture("interface\\icons\\Spell_Nature_MoonKey");

end

----------------------------------------------------------------------------------------------
--				Fonction Nom de la cible

function TC_TName()
	if UnitName("target") == nil then
		return "|cffff0000" .. UnitName("player") .. "|r";
	else
		return "|cffff0000" .. UnitName("target") .. "|r";
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Tooltips

function TC_Tooltip(TC_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TC_Name .. " |cff666666By " .. TC_By .. "|r\n\n" .. TC_Corp);
end

----------------------------------------------------------------------------------------------
--				Fonction Parler

function TC_Dire(TC_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TC_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Fonction Ajouter un Texte dans le chat

function TC_Msg(TC_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TC_Name .. TC_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Fonction Message d erreur

function TC_Erreur(TC_Corp)
	UIErrorsFrame:AddMessage(TC_Name .. TC_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Fonction Learn Unlearn Comp

function TC_Learn(TC_array)
local id = TC_array[1];
local skill = TC_array[2];
local max = TC_array[3];
	if id ~= nil then
		if ( arg1 == "LeftButton" ) then
			if IsControlKeyDown() then
				if (skill ~= nil) and (max ~= nil) then
					TC_Dire(TC_SETSKILL .. " " .. skill .. " " .. max);
				else
					TS_Erreur(TS_erreur["skillmax"]);
					TS_Msg(TS_erreur["skillmax"]);
				end
			elseif IsShiftKeyDown() then
				TC_Dire("Comp ID: " .. id .. " skill: " .. skill .. " maxi: " .. max);
			else
				TC_Msg("Vous apprenez "..id.." a "..TC_TName());
				TC_Dire(TC_LEARN .. " " .. id);
			end
		elseif ( arg1 == "RightButton" ) then
			if IsControlKeyDown() then
				if (skill ~= nil) then
					TC_Dire(TC_SETSKILL .. " " .. skill .. " 1");
				else
					TS_Erreur(TS_erreur["skill"]);
					TS_Msg(TS_erreur["skill"]);
				end
			else
				TC_Msg("Vous desapprenez "..id.." a "..TC_TName());
				TC_Dire(TC_UNLEARN .. " " .. id);
			end
		end
	else
		TS_Erreur(TS_erreur["id"]);
		TS_Msg(TS_erreur["id"]);
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar on change

function TC_ScrollBar_Change(TC_Choix)
	TC_Scroll_Value = {};

	-- on rempli la table TC_Scroll_Value avec TC_Choix
	for i=1,table.maxn (TC_Choix) do
		TC_Scroll_Value[i] = {TC_Choix[i][1], TC_Choix[i][2], TC_Choix[i][3], TC_Choix[i][4]};
	end

	TC_ScrollBar:Show();
	TC_ScrollBar_Update();
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar On load

function TC_ScrollBar_OnLoad()
	for i=1,table.maxn (TC_Depeucage) do
		TC_Scroll_Value[i] = {TC_Depeucage[i][1],TC_Depeucage[i][2],TC_Depeucage[i][3],TC_Depeucage[i][4]};
	end
	TC_ScrollBar:Show();
end

----------------------------------------------------------------------------------------------
--				Fonction Scrollbar Update

function TC_ScrollBar_Update()
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(TC_ScrollBar,table.getn(TC_Scroll_Value),6,15);
	for line=1,6 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(TC_ScrollBar);
		if lineplusoffset <= table.getn(TC_Scroll_Value) then
			getglobal("TC_ScrollBar"..line):SetText(TC_Scroll_Value[lineplusoffset][1]);
			getglobal("TC_ScrollBar"..line):SetTextColor (1,1,1);
			setglobal("TC_ScrollBar_Value_"..line, {TC_Scroll_Value[lineplusoffset][2],TC_Scroll_Value[lineplusoffset][3],TC_Scroll_Value[lineplusoffset][4]});
			getglobal("TC_ScrollBar"..line):Show();
		else
			getglobal("TC_ScrollBar"..line):Hide();
		end
	end
end

TC_By = "InstableDesign";
TC_Name = "|cffef7801[ The Gm ]|r |cffffffff Competences : |r";
