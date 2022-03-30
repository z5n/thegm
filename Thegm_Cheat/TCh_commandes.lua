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
-- commands

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
TCH_SPEED = ".modify speed";

TCH_GM_ON = ".gm on";
TCH_GM_OFF = ".gm off";
TCH_WHISP_ON = ".whisper on";
TCH_WHISP_OFF = ".whisper off";
TCH_HOVER_ON = ".hover on";
TCH_HOVER_OFF = ".hover off";
TCH_VISIBLE = ".gm visible on";
TCH_INVISIBLE = ".gm visible off";
TCH_BANK = ".bank";

TCH_GM_LIST = ".gm list";
TCH_TAXI_VOIR = ".taxicheat on";
TCH_TAXI_CACHER = ".taxicheat off";
TCH_FLYMODE_ON = ".gm fly on";
TCH_FLYMODE_OFF = ".gm fly off";
TCH_MAPS_VOIR = ".cheat explore 1";
TCH_MAPS_CACHER = ".cheat explore 0";

TCH_DIE = ".die";
TCH_REVIVE = "/g .revive";
TCH_KICK = ".kick";
TCH_ACCT = ".account";

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

    ["orp"] = "|cffffffffLeft Click :|r Click here to add the amount of gold indicated.";
    ["orm"] = "|cffffffffLeft Click :|r Click here to subtract the amount of gold indicated.";
    ["dire"] = "|cffffffffLeft Click :|r Make an NPC say something.\n|cffffffffRight Click :|r Make an NPC yell something.";
    ["modify"] = "|cffffffffLeft Click :|r Cliquez ici pour changer la valeur maxi ";
    ["modifylvl"] = "|cffffffffLeft Click :|r Pour ajouter des levels a la cible\n|cffffffffRight Click :|r Pour retirer des levels la cible";
    ["modifyhonneur"] = "|cffffffffLeft Click :|r Pour ajouter des points d'honneur a la cible\n|cffffffffRight Click :|r Pour mettre a jour les point d'honneur de la cible";
    ["modifyscale"] = "|cffffffffLeft Click :|r Modify the scale of your currently selected target.\n|cffffffffRight Click :|r Revert your currently selected target to normal scale.";
    ["modifyspeed"] = "|cffffffffLeft Click :|r Modify the speed of your currently selected target.\n|cffffffffRight Click :|r Revert your currently selected target to normal speed.";

    ["GM"] = "|cffffffffLeft Click :|r Enable GM mode.\n|cffffffffRight Click :|r Disable GM mode.\n|cffffffffCtrl + Left Click :|r Enable accepting whispers from players.\n|cffffffffCtrl + Right Click :|r Disable accepting whispers from players.";
    ["hover"] = "|cffffffffLeft Click :|r Enable hover mode.\n|cffffffffRight Click :|r Disable hover mode.";
    ["invisible"] = "|cffffffffLeft Click :|r Enable GM invisibility.\n|cffffffffRight Click :|r Disable GM invisibility.";
    ["bank"] = "|cffffffffLeft Click :|r Show your bank inventory.";

    ["GMlist"] = "|cffffffffLeft Click :|r Cliquez ici pour afficher la liste des Maitres de jeux connecte";
    ["flypath"] = "|cffffffffLeft Click :|r Pour voir tous les flypath\n|cffffffffRight Click :|r Pour retablir a vos flypath";
    ["flymode"] = "|cffffffffLeft Click :|r Pour activer le mode de vol\n|cffffffffRight Click :|r Pour desactiver le mode de vol";
    ["carte"] = "|cffffffffLeft Click :|r Pour voir toutes les cartes\n|cffffffffRight Click :|r Pour retablir l'affichage de vos carte";

    ["die"] = "|cffffffffLeft Click :|r Kill the selected player. If no player is selected, it will kill you.\n|cffffffffRight Click :|r Revive the selected player. If no player is selected, it will revive you.";
    ["kick"] = "|cffffffffLeft Click :|r Kick the targeted player from the world.";
    ["acct"] = "Cliquez pour afficher le niveau de compte du joueur cible";

    ["gps"] = "Cliquez pour afficher vos coordonnees gps";
    ["infos"] = "Cliquez pour afficher les informations du serveur";
    ["infoscible"] = "Cliquez pour afficher les informations de la cible joueur ou PNJ";

    ["soleil"] = "Cliquez pour mettre du soleil dans cette zone";
    ["cielgris"] = "Cliquez pour mettre un ciel gris dans cette zone";
    ["pluie"] = "Cliquez pour mettre de la pluie dans cette zone";
    ["neige"] = "Cliquez pour mettre de la neige dans cette zone";

    ["annonce"] = "|cffffffffLeft Click :|r Pour faire une annonce serveur\n|cffffffffRight Click :|r Pour faire une annonce serveur avec votre nom\n|cffffffffCtrl + Left Click :|r Pour notifier\n|cffffffffCtrl + Right Click :|r Pour notifier avec votre nom";

    ["macro"] = "|cffffffffLeft Click :|r Pour lancer la macro\n|cffffffffRight Click :|r Pour lancer la macro 2\n|cffffffffCtrl+Left Click :|r Configurer la macro\n\nMacro pour |cffff0000";
}

--############################################################################################
--############################################################################################
--    output text

TCh_msg = {
    ["orp"] = "Vous donnez ";
    ["orm"] = "Vous enlevez ";
    ["dire"] = "Vous faite parler un npc";
    ["crier"] = "Vous faite crier un npc";
    ["lvlp"] = "Vous ajouter des lvl a |cff00ff00";
    ["lvlm"] = "Vous retirer de lvl a |cff00ff00";
    ["modify"] = "Vous changer la valeur maxi ";
    ["modifylvl"] = "|cffffffffLeft Click :|r Pour ajouter des levels a la cible\n|cffffffffRight Click :|r Pour retirer des levels la cible";
    ["honneur"] = "Vous ajoutez des points d'honneur a |cff00ff00";
    ["honneurmaj"] = "Vous mettez a jour les points d'honneur de |cff00ff00";

    ["taille"] = "Vous modifier la taille de |cff00ff00";
    ["tailler"] = "Vous reinitialiser la taille de |cff00ff00";
    ["speed"] = "Vous modifier la vitesse de |cff00ff00";
    ["speedr"] = "Vous reinitialiser la vitesse de |cff00ff00";

    ["GMon"] = "GM mode is ON.";
    ["GMoff"] = "GM mode is OFF.";
    ["whispon"] = "Whispers have been enabled.";
    ["whispoff"] = "Whispers have been disabled.";
    ["hoveron"] = "Hover mode has been enabled.";
    ["hoveroff"] = "Hover mode has been disabled.";
    ["invisible"] = "You are now visible.";
    ["visible"] = "You are now invisible.";
    ["bank"] = "Displaying your bank inventory...";

    ["GMlist"] = "Displaying the current GM list...";
    ["flypathvoir"] = "Vous activez tous les maitres de griffon";
    ["flypathcacher"] = "Vous desactivez les maitre de griffon jamais visiter";
    ["flymodeon"] = "Flight mode has been enabled.";
    ["flymodeoff"] = "Flight mode has been disabled.";
    ["cartevoir"] = "Vous affichez toutes les cartes";
    ["cartecacher"] = "Vous masquez les carte non decouverte";

    ["die"] = "Killed |cff00ff00";
    ["revivre"] = "Vous faite revivre |cff00ff00";
    ["kick"] = "Vous venez de kicker |cff00ff00";
    ["acct"] = "Vous afficher le niveau du compte de |cff00ff00";

    ["gps"] = "Displaying the current position information...";
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

