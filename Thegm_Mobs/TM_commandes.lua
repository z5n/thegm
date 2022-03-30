--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Mobs
--	Fichier			: TM_commandes.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les commandes MJ de la page mobs.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TM_GO = "/g .go xyz";
TM_NPCINFO = "/g .npc info";
TM_MORPH = "/g .morph";
TM_DEMORPH = "/g .demorph";
TM_ADDSPW = "/g .npc add";
TM_DELETE = "/g .npc del";
TM_LOOKUPCREATURE = "/g .lookup creature";
TM_LISTCREATURE = "/g .list creature";

--############################################################################################
--############################################################################################
--    LE TEXTE DANS LES INFOBULLES

TM_bul = {
    ["ouvrir"] = "Affiche la page des Mobs\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
    ["fermer"] = "Ferme la page des Mobs";
    ["check"] = "Cocher : Affiche les resultats dans le chat\nDecocher : Affiche les resultats uniquement dans l'addon";
    ["desc"] = "Cette page rassemble les commandes relatives au NPC vendeur Boss";
    ["info"] = "Cliquez ici pour afficher les informations de la creature selectionne";
    ["mob"] = "Cherche la creature ";
    ["morph"] = "Cliquez ici pour vous transformer avec l'ID";
    ["demorph"] = "Cliquez ici pour vous demorph avec l'ID";
    ["spawn"] = "Cliquez ici pour spawn la creature avec l'ID";
    ["del"] = "Cliquez ici pour delete la creature selectionne";
    ["scrollc"] = "|cffffffffClic:|r pour morph votre cible\n";
    ["scrollCc"] = "|cffffffffCtrl+Clic:|r Pour vous TP\n";
    ["scrollcd"] = "|cffffffffClic droit:|r pour spawner la creature\n";
    ["scrollCcd"] = "|cffffffffCtrl+clic droit:|r pour lister cette creature";
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TM_msg = {
    ["cherche"] = "Vous chercher la creature |cff00ff00",
    ["info"] = "Voici les informations sur la creature |cff00ff00",
    ["morph"] = "Vous transformez votre cible avec l'ID |cff00ff00";
    ["spawn"] = "Vous spawnez la creature avec l'ID |cff00ff00";
}

--############################################################################################
--############################################################################################
--    LES MESSAGES D'ERREURS

TM_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez une creature",
    ["scrollc"] = "|cffff0000Display ID de la creature manquante\n";
    ["scrollCc"] = "|cffff0000Coord manquant pour TP\n";
    ["scrollcd"] = "|cffff0000ID de la creature manquante\n";
    ["scrollCcd"] = "|cffff0000ID de la creature manquante";
}

