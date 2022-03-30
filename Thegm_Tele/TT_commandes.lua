--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Teleportations
--	Fichier			: TT_commandes.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les commandes MJ de la page teleportations.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TT_NAMEGO = ".summon";
TT_GONAME = ".appear";
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
    ["desc"] = "Cette page rassemble des points de teleportations pratique";
    ["ouvrir"] = "Affiche la page des teleportations\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
    ["tp"] = "|cffffffffClic :|r Pour vous teleportez a : |cff21FF1C";
    ["tp2"] = "\n|cffffffffClic Droit :|r Pour dire les coordonnees : |cff21FF1C";
    ["add"] = "Cliquez ici pour ajouter une TP perso",
    ["groupe"] = "Cliquez ici pour teleporter les joueurs de votre groupe sur votre position",
    ["raid"] = "Cliquez ici pour teleporter les joueurs de votre raid sur votre position",
    ["scroll"] = "|cffffffffClic :|r pour vous TP\n|cffffffffCtrl+Clic :|r pour Supprimer ce point",
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
--    LES MESSAGES D'ERREURS

TT_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez un joueur",
}

