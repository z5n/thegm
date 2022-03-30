--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Sorts
--	Fichier			: TS_commandes.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les commandes MJ de la page sorts.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TS_LOOKUPSPELL = "/g .lookup spell";
TS_RESETSPELL = "/g .reset spells";
TS_LEARN = "/g .learn";
TS_UNLEARN = "/g .unlearn";

--############################################################################################
--############################################################################################
--    LES REGEX PERMETTANT DE TROUVER LES SORTS

--TS_Find_Sorts = "|cffffffff|Hspell:(%d+)|h%[(.-)%]|h|r";
TS_Find_Sorts = "|cffffffff|Hspell:(%d+)|h%[(.*)%]|h|r";


--############################################################################################
--############################################################################################
--    LE TEXTE DANS LES INFOBULLES

TS_bul = {
    ["desc"] = "Cette page rassemble tous les sorts par class";
    ["check"] = "Cocher : Affiche les resultats dans le chat\nDecocher : Affiche les resultats uniquement dans l'addon";
    ["cherch"] = "Cherche le sort";
    ["rst"] = "Reset les sorts de la cible";
    ["class"] = "Afficher la liste des sorts |cffffffff";
    ["item"] = "|cffffffffClic :|r Pour apprendre le sort\n|cffffffffClic Droit :|r Pour desaprendre le sort\n|cffffffffCtrl+clic :|r Dire l'ID du sort\nL'ID du sort est : |cffff0000";
    ["ouvrir"] = "Affiche la page des sorts\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TS_msg = {
    ["cherche"] = "Vous chercher le sort |cff00ff00",
    ["learn"] = "Vous apprenez le sort |cff00ff00",
    ["unlearn"] = "Vous desapprenez le sort |cff00ff00",
}

--############################################################################################
--############################################################################################
--    LES MESSAGES D'ERREURS

TS_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez un joueur",
}

