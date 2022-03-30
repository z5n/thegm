--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Cheat
--	Fichier			: TCh_commandes.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient les commandes MJ de la page cheat.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
-- Les commandes MJ ce trouve ci dessous

TCH_MONEY = ".modify money";

TCH_SAY = ".npc say";
TCH_YELL = ".npc yell";

TCH_LEVEL = ".level";
TCH_HP = ".modify hp";
TCH_MANA = ".modify mana";
TCH_RAGE = ".modify rage";
TCH_ENERGY = ".modify energy";
TCH_HONOR = ".honor add";
TCH_HONOR_UPDATE = ".honor update";

TCH_SCALE = ".modify scale";
TCH_SPEED = ".modify aspeed";

TCH_GM_ON = ".gm on";
TCH_GM_OFF = ".gm off";
TCH_WHISP_ON = ".whisper on";
TCH_WHISP_OFF = ".whisper off";
TCH_HOVER_ON = ".hover 1";
TCH_HOVER_OFF = ".hover 0";
TCH_VISIBLE = ".gm visible on";
TCH_INVISIBLE = ".gm visible off";
TCH_BANK = ".bank";

TCH_GM_LIST = ".gm list";
TCH_TAXI_VOIR = ".taxicheat on";
TCH_TAXI_CACHER = ".taxicheat off";
TCH_FLYMODE_ON = ".gm fly on";
TCH_FLYMODE_OFF = ".gm fly off";
TCH_MAPS_VOIR = ".explorecheat 1";
TCH_MAPS_CACHER = ".explorecheat 0";

TCH_DIE = ".die";
TCH_REVIVE = "/g .revive";
TCH_KICK = ".kick";
TCH_ACCT = ".acct";

TCH_GPS = ".gps";
TCH_INFOS = ".info";
TCH_PINFO = ".pinfo";
TCH_NPCINFO = ".npc info";

TCH_SOLEIL = ".wchange 1 0";
TCH_PLUIE = ".wchange 1 1";
TCH_NEIGE = ".wchange 2 1";
TCH_GRIS = ".wchange 3 1";

TCH_ANNOUNCE = ".announce";
TCH_NOTIFY = ".notify";

--############################################################################################
--############################################################################################
--    LE TEXTE DANS LES INFOBULLES

TCh_bul = {
    ["ouvrir"] = "Affiche la page des cheat\n|cff999999Cliquez sur le bord pour deplacer le bouton|r";
    ["desc"] = "Cette page rassemble les commandes de cheat";
    ["fermer"] = "Ferme la page cheat";

    ["orp"] = "Cliquez ici pour ajouter la somme d'or indique";
    ["orm"] = "Cliquez ici pour retirer la somme d'or indique";
    ["dire"] = "|cffffffffClic :|r pour faire dire a la cible\n|cffffffffClic Droit :|r Pour faire crier la cible";
    ["modify"] = "Cliquez ici pour changer la valeur maxi ";
    ["modifylvl"] = "|cffffffffClic :|r Pour ajouter des levels a la cible\n|cffffffffClic Droit :|r Pour retirer des levels la cible";
    ["modifyhonneur"] = "|cffffffffClic :|r Pour ajouter des points d'honneur a la cible\n|cffffffffClic Droit :|r Pour mettre a jour les point d'honneur de la cible";
    ["modifyscale"] = "|cffffffffClic :|r Pour modifier la taille de a la cible\n|cffffffffClic Droit :|r Pour remettre la taille de la cible normalement";
    ["modifyspeed"] = "|cffffffffClic :|r Pour modifier la vitesse de a la cible\n|cffffffffClic Droit :|r Pour remettre la vitesse de la cible normalement";

    ["GM"] = "|cffffffffClic :|r Pour activer mode GM\n|cffffffffClic Droit :|r Pour desactiver le mode GM\n|cffffffffCtrl + Clic :|r Pour accepter les whisp\n|cffffffffCtrl + Clic Droit :|r Pour desactiver les whisp";
    ["hover"] = "|cffffffffClic :|r Pour activer le hover mode\n|cffffffffClic Droit :|r Pour desactiver le hover mode";
    ["invisible"] = "|cffffffffClic :|r Pour activer le mode invisible\n|cffffffffClic Droit :|r Pour desactiver le mode invisible";
    ["bank"] = "Cliquez pour afficher votre banque";

    ["GMlist"] = "Cliquez ici pour afficher la liste des Maitres de jeux connecte";
    ["flypath"] = "|cffffffffClic :|r Pour voir tous les flypath\n|cffffffffClic Droit :|r Pour retablir a vos flypath";
    ["flymode"] = "|cffffffffClic :|r Pour activer le mode de vol\n|cffffffffClic Droit :|r Pour desactiver le mode de vol";
    ["carte"] = "|cffffffffClic :|r Pour voir toutes les cartes\n|cffffffffClic Droit :|r Pour retablir l'affichage de vos carte";

    ["tuer"] = "|cffffffffClic :|r Pour tuer votre cible\n|cffffffffClic Droit :|r Pour faire revivre votre cible";
    ["kick"] = "Cliquez pour kicker le joueur cible";
    ["acct"] = "Cliquez pour afficher le niveau de compte du joueur cible";

    ["gps"] = "Cliquez pour afficher vos coordonnees gps";
    ["infos"] = "Cliquez pour afficher les informations du serveur";
    ["infoscible"] = "Cliquez pour afficher les informations de la cible joueur ou PNJ";

    ["soleil"] = "Cliquez pour mettre du soleil dans cette zone";
    ["cielgris"] = "Cliquez pour mettre un ciel gris dans cette zone";
    ["pluie"] = "Cliquez pour mettre de la pluie dans cette zone";
    ["neige"] = "Cliquez pour mettre de la neige dans cette zone";

    ["annonce"] = "|cffffffffClic :|r Pour faire une annonce serveur\n|cffffffffClic Droit :|r Pour faire une annonce serveur avec votre nom\n|cffffffffCtrl + Clic :|r Pour notifier\n|cffffffffCtrl + Clic Droit :|r Pour notifier avec votre nom";

    ["macro"] = "|cffffffffClic :|r Pour lancer la macro\n|cffffffffClic Droit :|r Pour lancer la macro 2\n|cffffffffCtrl+clic :|r Configurer la macro\n\nMacro pour |cffff0000";
}

--############################################################################################
--############################################################################################
--    LE TEXTE DES ACTIONS

TCh_msg = {
    ["orp"] = "Vous donnez ";
    ["orm"] = "Vous enlevez ";
    ["dire"] = "Vous faite parler un npc";
    ["crier"] = "Vous faite crier un npc";
    ["lvlp"] = "Vous ajouter des lvl a |cff00ff00";
    ["lvlm"] = "Vous retirer de lvl a |cff00ff00";
    ["modify"] = "Vous changer la valeur maxi ";
    ["modifylvl"] = "|cffffffffClic :|r Pour ajouter des levels a la cible\n|cffffffffClic Droit :|r Pour retirer des levels la cible";
    ["honneur"] = "Vous ajoutez des points d'honneur a |cff00ff00";
    ["honneurmaj"] = "Vous mettez a jour les points d'honneur de |cff00ff00";

    ["taille"] = "Vous modifier la taille de |cff00ff00";
    ["tailler"] = "Vous reinitialiser la taille de |cff00ff00";
    ["speed"] = "Vous modifier la vitesse de |cff00ff00";
    ["speedr"] = "Vous reinitialiser la vitesse de |cff00ff00";

    ["GMon"] = "Vous activer le mode GM";
    ["GMoff"] = "Vous desactiver le mode GM";
    ["whispon"] = "Vous activer les whisp";
    ["whispoff"] = "Vous desactiver les whisp";
    ["hoveron"] = "Vous activer le hover mode";
    ["hoveroff"] = "Vous desactiver le hover mode";
    ["invisible"] = "Vous activer le mode invisible";
    ["visible"] = "Vous desactiver le mode invisible";
    ["bank"] = "Vous affichez votre banque";

    ["GMlist"] = "Vous affichez la liste des Maitres de jeux connecte";
    ["flypathvoir"] = "Vous activez tous les maitres de griffon";
    ["flypathcacher"] = "Vous desactivez les maitre de griffon jamais visiter";
    ["flymodeon"] = "Vous activez le mode de vol";
    ["flymodeoff"] = "Vous desactivez le mode de vol";
    ["cartevoir"] = "Vous affichez toutes les cartes";
    ["cartecacher"] = "Vous masquez les carte non decouverte";

    ["tuer"] = "Vous tuer |cff00ff00";
    ["revivre"] = "Vous faite revivre |cff00ff00";
    ["kick"] = "Vous venez de kicker |cff00ff00";
    ["acct"] = "Vous afficher le niveau du compte de |cff00ff00";

    ["gps"] = "Voici vos coordonnes gps :";
    ["infos"] = "Voici les informations du serveur :";
    ["infosp"] = "Voici les information sur le joueur |cff00ff00";
    ["infosnpc"] = "Voici les information sur la creature |cff00ff00";

    ["soleil"] = "Vous mettez du soleil dans cette zone";
    ["cielgris"] = "Vous mettez un ciel gris dans cette zone";
    ["pluie"] = "Vous mettez de la pluie dans cette zone";
    ["neige"] = "Vous mettez de la neige dans cette zone";

    ["annonce"] = "Vous faite une annonce serveur";
    ["annoncenom"] = "Vous faite une annonce serveur en affichant votre nom";
    ["notify"] = "Vous faite une notification serveur";
    ["notifynom"] = "Vous faite une notification serveur en affichant votre nom";
}

--############################################################################################
--############################################################################################
--    LES MESSAGE D'ERREURS

TCh_erreur = {
    ["valeur"] = "Veuillez rentrer une valeur",
	["cible"] = "Vous devez selectionnez un joueur",
}

