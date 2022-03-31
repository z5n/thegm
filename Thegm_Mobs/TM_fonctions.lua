--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Mobs
--	Fichier			: TM_fonctions.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les fonctions de la page mobs.
--
--	NE PAS MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

----------------------------------------------------------------------------------------------
--				Declarations des variables

TM_Search = {};
TM_Scroll_Value = {};

----------------------------------------------------------------------------------------------
--				Fonction /gmsorts

SLASH_THEGMMOBS1 = "/gmmobs"
SlashCmdList["THEGMMOBS"] = function()
	TM_OnShow();
end

----------------------------------------------------------------------------------------------
--				COMMANDE ON SHOW

function TM_OnShow()
	if (TM:IsShown() ) then
		TM:Hide();
	else
		TM:Show();
	end
end

----------------------------------------------------------------------------------------------
--				COMMANDE ON LOAD

function TM_OnLoad()
	TM_Tempete_Texture:SetTexture("interface\\lfgframe\\lfgicon-tempestkeep");
	TM_Serpent_Texture:SetTexture("interface\\lfgframe\\lfgicon-serpentshrinecavern");
	TM_Auchindoun_Texture:SetTexture("interface\\lfgframe\\lfgicon-auchindoun");
	TM_Infernal_Texture:SetTexture("interface\\lfgframe\\lfgicon-hellfirecitadel");
	TM_Gruul_Texture:SetTexture("interface\\lfgframe\\lfgicon-gruulslair");
	TM_BlackTemple_Texture:SetTexture("interface\\lfgframe\\lfgicon-blacktemple");
	TM_Zulaman_Texture:SetTexture("interface\\lfgframe\\lfgicon-zulaman");
	TM_Karazhan_Texture:SetTexture("interface\\lfgframe\\lfgicon-karazhan");
	TM_GT_Texture:SetTexture("interface\\lfgframe\\lfgicon-cavernsoftime");
	TM_Naxxramas_Texture:SetTexture("interface\\lfgframe\\lfgicon-naxxramas");
	TM_BWL_Texture:SetTexture("interface\\lfgframe\\lfgicon-blackwinglair");
	TM_AQ_Texture:SetTexture("interface\\lfgframe\\lfgicon-aqtemple");
	TM_MoltenCore_Texture:SetTexture("interface\\lfgframe\\lfgicon-moltencore");
	TM_Onyxia_Texture:SetTexture("interface\\lfgframe\\lfgicon-raid");
	TM_ZulGurub_Texture:SetTexture("interface\\lfgframe\\lfgicon-zulgurub");
	TM_Scholomance_Texture:SetTexture("interface\\lfgframe\\lfgicon-scholomance");
	TM_Stratholme_Texture:SetTexture("interface\\lfgframe\\lfgicon-stratholme");
	TM_HacheTripe_Texture:SetTexture("interface\\lfgframe\\lfgicon-diremaul");
	TM_Rochenoire_Texture:SetTexture("interface\\lfgframe\\lfgicon-blackrockspire");
	TM_ZulFarrak_Texture:SetTexture("interface\\lfgframe\\lfgicon-zulfarak");
	TM_LeTemple_Texture:SetTexture("interface\\lfgframe\\lfgicon-sunkentemple");
	TM_Maraudon_Texture:SetTexture("interface\\lfgframe\\lfgicon-maraudon");
	TM_Uldaman_Texture:SetTexture("interface\\lfgframe\\lfgicon-uldaman");
	TM_Monastere_Texture:SetTexture("interface\\lfgframe\\lfgicon-scarletmonastery");
	TM_Kraal_Texture:SetTexture("interface\\lfgframe\\lfgicon-razorfenkraul");
	TM_Gnomeregan_Texture:SetTexture("interface\\lfgframe\\lfgicon-gnomeregan");
	TM_LaPrison_Texture:SetTexture("interface\\lfgframe\\lfgicon-stormwindstockades");
	TM_Brassenoire_Texture:SetTexture("interface\\lfgframe\\lfgicon-blackfathomdeeps");
	TM_Ombrecroc_Texture:SetTexture("interface\\lfgframe\\lfgicon-shadowfangkeep");
	TM_CaverneLam_Texture:SetTexture("interface\\lfgframe\\lfgicon-wailingcaverns");
	TM_MorteMines_Texture:SetTexture("interface\\lfgframe\\lfgicon-deadmines");
	TM_Ragefeu_Texture:SetTexture("interface\\lfgframe\\lfgicon-ragefirechasm");
	TM_ScrollBar_OnLoad();
end

----------------------------------------------------------------------------------------------
--				Fonction Tooltips

function TM_Tooltip(TM_Corp)
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TM_Name .. " |cff666666By " .. TM_By .. "|r\n\n" .. TM_Corp);
end

----------------------------------------------------------------------------------------------
--				Fonction Tooltips ScrollBar

function TM_TooltipScroll(TM_Corp)
	TM_Snom = TM_Corp[1];
	TM_Sid = TM_Corp[2];
	TM_Sdispid = TM_Corp[3];
	TM_Scoord = TM_Corp[4];
	if TM_Sid == "" then 
		TM_T2 = TM_erreur["scrollcd"];
		TM_T4 = TM_erreur["scrollCcd"];
	else
		TM_T2 = TM_bul["scrollcd"];
		TM_T4 = TM_bul["scrollCcd"];
	end
	if TM_Sdispid == "" then
		TM_T1 = TM_erreur["scrollc"];
	else
		TM_T1 = TM_bul["scrollc"];
	end
	if TM_Scoord == "" then
		TM_T3 = TM_erreur["scrollCc"];
	else
		TM_T3 = TM_bul["scrollCc"];
	end
	GameTooltip:SetOwner(this, "ANCHOR_TOP");
	GameTooltip:SetText(TM_Name .. " |cff666666By " .. TM_By .. "|r\n\n" .. TM_T1 .. TM_T2 .. TM_T3 .. TM_T4);
end

----------------------------------------------------------------------------------------------
--				Fonction Parler

function TM_Dire(TM_Corp)
	local editBox = DEFAULT_CHAT_FRAME.editBox;
	DEFAULT_CHAT_FRAME.editBox:SetText(TM_Corp);
	ChatEdit_SendText(editBox, false);
end

----------------------------------------------------------------------------------------------
--				Fonction Ajouter un Texte dans le chat

function TM_Msg(TM_Corp)
	DEFAULT_CHAT_FRAME:AddMessage(TM_Name .. TM_Corp, 1.0, 0.0, 0.0);
end

----------------------------------------------------------------------------------------------
--				Fonction Message d erreur

function TM_Erreur(TM_Corp)
	UIErrorsFrame:AddMessage(TM_Name .. TM_Corp, 1.0, 1.0, 0.0, 1.0, 5);
end

----------------------------------------------------------------------------------------------
--				Fonction Mob Name

function TM_MobInfos()
	if ( UnitIsPlayer("target") ) or ( not UnitName("target") ) then 
		  TM_Msg(TM_erreur["cible"]);
	else 
		TM_Msg(TM_msg["info"] .. UnitName("target"));
		TM_Dire(TM_NPCINFO);
	end
end

----------------------------------------------------------------------------------------------
--				SCROLLBAR ON CHANGE

function TM_ScrollBar_Change(TM_Choix)
	if TM_Choix == TM_LWorldBoss then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenenviroment");
	elseif TM_Choix == TM_LTempete then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreentempestkeep");
	elseif TM_Choix == TM_LSerpent then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreencoilfang");
	elseif TM_Choix == TM_LAuchindoun then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenauchindoun");
	elseif TM_Choix == TM_LInfernal then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenhellfirecitadel5man");
	elseif TM_Choix == TM_LGruul then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreengruulslair");
	elseif TM_Choix == TM_LBlackTemple then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenblacktemple");
	elseif TM_Choix == TM_LZulaman then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenzulaman");
	elseif TM_Choix == TM_LKarazhan then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenkarazhan");
	elseif TM_Choix == TM_LGT then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreencavernstime");
	elseif TM_Choix == TM_LNaxxramas then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreennaxxramas");
	elseif TM_Choix == TM_LBWL then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenblackwinglair");
	elseif TM_Choix == TM_LAQ then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenahnqiraj40man");
	elseif TM_Choix == TM_LMoltenCore then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenmoltencore");
	elseif TM_Choix == TM_LOnyxia then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenraid");
	elseif TM_Choix == TM_LZulGurub then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenzulgurub");
	elseif TM_Choix == TM_LScholomance then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenscholomance");
	elseif TM_Choix == TM_LStratholme then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenstrathome");
	elseif TM_Choix == TM_LHacheTripe then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreendiremaul");
	elseif TM_Choix == TM_LRochenoire then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenblackrockspire");
	elseif TM_Choix == TM_LZulFarrak then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenzulfarrak");
	elseif TM_Choix == TM_LLeTemple then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreensunkentemple");
	elseif TM_Choix == TM_LMaraudon then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenmaraudon");
	elseif TM_Choix == TM_LUldaman then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenuldaman");
	elseif TM_Choix == TM_LMonastere then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenmonastery");
	elseif TM_Choix == TM_LKraal then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenrazorfenkraul");
	elseif TM_Choix == TM_LGnomeregan then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreengnomeregan");
	elseif TM_Choix == TM_LLaPrison then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenstormwindstockade");
	elseif TM_Choix == TM_LBrassenoire then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenblackfathomdeeps");
	elseif TM_Choix == TM_LOmbrecroc then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenshadowfangkeep");
	elseif TM_Choix == TM_LCaverneLam then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenwailingcaverns");
	elseif TM_Choix == TM_LMortemines then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreendeadmines");
	elseif TM_Choix == TM_LRagefeu then
		TM_Img:SetTexture("interface\\glues\\loadingscreens\\loadscreenragefirechasm");

	end

		TM_Scroll_Value = {};

		-- on rempli la table TM_Scroll_Value avec TM_Choix
		for i=1,table.maxn (TM_Choix) do
			if TM_Choix[i][3] == nil then TM_Choix[i][3]="";end
			TM_Scroll_Value[i] = {TM_Choix[i][1], TM_Choix[i][2], TM_Choix[i][3],TM_Choix[i][4]};
		end

		TM_ScrollBar:Show();
		TM_ScrollBar_Update();
end

----------------------------------------------------------------------------------------------
--				SCROLLBAR ONLOAD

function TM_ScrollBar_OnLoad()
  for i=1,table.maxn (TM_LMortemines) do
    TM_Scroll_Value[i] = {TM_LMortemines[i][1],TM_LMortemines[i][2],TM_LMortemines[i][3],TM_LMortemines[i][4]};
  end
  TM_ScrollBar:Show();
end

----------------------------------------------------------------------------------------------
--				SCROLLBAR UPDATE

function TM_ScrollBar_Update()
  local line;
  local lineplusoffset;
  FauxScrollFrame_Update(TM_ScrollBar,table.getn(TM_Scroll_Value),19,15);
  for line=1,19 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(TM_ScrollBar);
    if lineplusoffset <= table.getn(TM_Scroll_Value) then
	  getglobal("TM_ScrollBar"..line):SetText(TM_Scroll_Value[lineplusoffset][1]);
	  getglobal("TM_ScrollBar"..line):SetTextColor (1,1,1);
	  setglobal("TM_ScrollBar"..line.."_Value", TM_Scroll_Value[lineplusoffset]);
      getglobal("TM_ScrollBar"..line):Show();
    else
      getglobal("TM_ScrollBar"..line):Hide();
    end
  end
end

----------------------------------------------------------------------------------------------
--				SCROLLBAR CLICK

function TM_Scroll_Click(TM_Value)
	addspw = TM_Value[2];
	morph = TM_Value[3];
	gps = TM_Value[4];
	if ( arg1 == "LeftButton" ) then
		if IsControlKeyDown() then
			if (gps == nil)or(gps == "") then
				TM_Msg(TM_erreur["scrollCc"]);
			else
				TM_Dire(TM_GO .." ".. gps);
			end
		else	
			if (morph == nil)or(morph == "") then
				TM_Msg(TM_erreur["scrollc"]);
			else
				TM_Dire(TM_MORPH .. " ".. morph);
			end
		end
	end
	if ( arg1 == "RightButton" ) then
		if IsControlKeyDown() then
			if (addspw == nil)or(addspw == "") then
				TM_Msg(TM_erreur["scrollcd"]);
			else
				TM_Dire(TM_LISTCREATURE .." ".. addspw);
			end
		else	
			if (addspw == nil)or(addspw == "") then
				TM_Msg(TM_erreur["scrollcd"]);
			else
				TM_Dire(TM_ADDSPW .. " ".. addspw);
			end
		end
	end
end

----------------------------------------------------------------------------------------------
--				Fonction Capture message dans le chat

-- local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler
-- function ChatFrame_MessageEventHandler( event, ... )
-- 	if event == "CHAT_MSG_SYSTEM" then
-- 		if (string.find (arg1,"Hcreature_entry")) and (TM ~= nil) then
-- 			TM_Mobs(arg1);
-- 			if (TM_CheckMobs:GetChecked()) then
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
--				Resultat recherche

function TM_Mobs(arg1)
	for id, name in string.gmatch(arg1, "|cffffffff|Hcreature_entry:(%d+)|h%[(.-)%]|h|r") do
		table.insert(TM_Search,{name,id,"",""});
		TM_ScrollBar_Change(TM_Search);
	end
end

TM_By = "InstableDesign";
TM_Name = "|cffef7801[ The Gm ]|r |cffffffff Mobs : |r";
