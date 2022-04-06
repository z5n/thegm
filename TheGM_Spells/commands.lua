--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Title			: TheGM - Spells
--	File			: commands.lua
--	Version			: 2.4
--	Description		: Addon 
--	Required		: World Of Warcraft + MANGOS Emulator 2.4
--	Author			: InstableDesign@gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	This file contains the GM commands for the spells page.
--
--	YOU CAN EDIT THIS FILE
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TC_LEARN = ".learn";
TC_UNLEARN = ".unlearn";
TC_SETSKILL = ".setskill";

--############################################################################################
--############################################################################################
-- LE TEXTE DANS LES INFOBULLES

TC_bul = {
    ["desc"] = "Cette page rassemble toutes les competences";
    ["class"] = "Afficher la liste des niveaux de la competence : |cffffffff";
    ["item"] = "|cffffffffClic :|r Pour apprendre la comp\n|cffffffffClic Droit :|r Pour desaprendre la comp\n|cffffffffCtrl+Clic :|r Mettre la comp au maxi\n|cffffffffCtrl+Clic Droit :|r Mettre la comp a 1\n|cffffffffShift+clic :|r Pour dire l'ID et le skill de la comp\n|cffffffffComp :|r |cffff0000";
    ["ouvrir"] = "Affiche la page des competences\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TC_msg = {
    ["learn"] = "Vous apprenez la comp |cff00ff00",
    ["unlearn"] = "Vous desapprenez la comp |cff00ff00",
    ["max"] = "Vous mettez au maxi la comp |cff00ff00",
    ["mini"] = "Vous mettez a 1 la comp |cff00ff00",
}

--############################################################################################
--############################################################################################
--    LES MESSAGES D'ERREURS

TC_erreur = {
    ["id"] = "Id introuvable",
	["skill"] = "Skill introuvable",
	["skillmax"] = "Skill ou maxi introuvable",
}

