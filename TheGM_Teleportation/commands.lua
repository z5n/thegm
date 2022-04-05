--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Title			: TheGM - Teleportation
--	File			: commands.lua
--	Version			: 2.4
--	Description		: Addon 
--	Required		: World Of Warcraft + MANGOS Emulator 2.4
--	Author			: InstableDesign@gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	This file contains the GM commands for the teleportation page.
--
--	YOU CAN EDIT THIS FILE
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TT_SUMMON = ".summon";
TT_APPEAR = ".appear";
TT_GO = ".go xyz";
TT_GPS = ".gps";

--############################################################################################
--############################################################################################
--    LES REGEX PERMETTANT DE TROUVER LES COORDS ET MAP ID

TT_Find_Map = "Map : (%d+) [(]";
TT_Find_Coord = "X : (.*) Y : (.*) Z : (.*) O";

--############################################################################################
--############################################################################################
--    LE TEXTE DANS LES INFOBULLES

TT_bul = {
    ["description"] = "Cette page rassemble des points de teleportations pratique";
    ["ouvrir"] = "Teleportation window for GMs.";
    ["tp"] = "|cffffffffLeft Click:|r Teleport to: |cff21FF1C";
    ["tp2"] = "\n|cffffffffRight Click:|r Print the coordinates in chat: |cff21FF1C";
    ["add"] = "Cliquez ici pour ajouter une TP perso",
    ["groupe"] = "Cliquez ici pour teleporter les joueurs de votre groupe sur votre position",
    ["raid"] = "Cliquez ici pour teleporter les joueurs de votre raid sur votre position",
    ["scroll"] = "|cffffffffLeft Click:|r pour vous TP\n|cffffffffCtrl + Left Click:|r pour Supprimer ce point",
    ["amener"] = "Cliquez ici tp le joueur sur vous",
    ["aller"] = "Cliquez ici pour vous tp sur le joueur",
    ["tamener"] = "Cliquez ici tp le joueur cible",
    ["taller"] = "Cliquez ici pour vous tp sur le joueur cible",
    ["azeroth"] = "Cliquez ici pour afficher la carte des TP d'azeroth",
    ["kalimdor"] = "Cliquez ici pour afficher la carte des TP de kalimdor",
    ["outreterre"] = "Cliquez ici pour afficher la carte des TP d'outreterre",
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TT_msg = {
    ["tp"] = "Vous vous teleportez",
    ["tpcoor"] = " coord xyz mapID :",
    ["add"] = "Vous ajouter une TP perso",
    ["groupe"] = "Vous teleportez votre groupe",
    ["raid"] = "Vous teleportez le raid",
	["amener"] = "Vous teleportez sur votre position le joueur ",
	["aller"] = "Vous teleportez pres de ",
	["tamener"] = "Vous teleportez votre cible sur votre position",
	["taller"] = "Vous vous teleportez pres de votre cible",
	["groupe"] = "Vous teleportez les joueurs du groupe sur votre position",
	["raid"] = "Vous teleportez les joueurs du raid sur votre position",
}

--############################################################################################
--############################################################################################
--    Error Messages

TT_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez un joueur",
}

