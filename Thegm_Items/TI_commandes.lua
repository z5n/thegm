--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Items
--	Fichier			: TI_commandes.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les commandes MJ de la page items.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TI_LISTITEM = ".list item";
TI_ADDITEM = ".additem";
TI_ADDITEMSET = ".additem set";
TI_LOOKUPSET = ".lookup itemset";
TI_LOOKUPITEM = ".lookup item";
TI_ROBE = "2586";
TI_SLIPPERS = "11508";
TI_HOOD = "12064";
TI_SHIRT = "17"
TI_RING = "12947 2";

--############################################################################################
--############################################################################################
--    LES REGEX PERMETTANT DE TROUVER LES SORTS

TI_Find_Items = "|cffffffff|Hitem:(%d+):0:0:0:0:0:0:0|h%[(.-)%]|h|r";
TI_Find_Stuff = "|cffffffff|Hitemset:(%d+)|h%[(.-)%]|h|r";

--############################################################################################
--############################################################################################
--    LE TEXTE DANS LES INFOBULLES

TI_bul = {
	["ouvrir"] = "Affiche la page des Items\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
	["desc"] = "Cette page rassemble les commandes concernant les items";
    ["check"] = "Cocher : Affiche les resultats dans le chat\nDecocher : Affiche les resultats uniquement dans l'addon";
	["iditem"] = "ID : ";
	["idstuff"] = "ID : ";
	["chercheo"] = "Cliquez ici pour chercher un objet";
	["chercheo"] = "Cliquez ici pour chercher un objet";
	["cherches"] = "Cliquez ici pour chercher un stuff";
	["addo"] = "Cliquez ici pour cree un objet avec un ID";
	["adds"] = "Cliquez ici pour cree un stuff avec un ID";
	["composants"] = "Cliquez pour afficher la liste des composants";
	["armes"] = "Cliquez pour afficher la liste des armes";
	["sacs"] = "Cliquez pour afficher la liste des sacs";
	["stuff"] = "Cliquez pour afficher la liste des stuff";
	["montures"] = "Cliquez pour afficher la liste des montures";
	["minipet"] = "Cliquez pour afficher la liste des mini pet";
	["plans"] = "Cliquez pour afficher la liste des plans";
	["mj"] = "Cliquez pour creer le stuff mj officiel";
	["fermer"] = "Cliquez pour fermer la fenetre des items";
	["split"] = "Cliquez pour creer le nombre d'items voulu";
	["splitf"] = "Cliquez ici pour annuler la creation";
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TI_msg = {
    ["iditem"] = "ID : ";
}

--############################################################################################
--############################################################################################
--    LES MESSAGES D'ERREURS

TI_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez un joueur",
}

