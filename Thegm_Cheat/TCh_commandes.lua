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
--	This file contains the GM commands from the cheat page.
--
--	YOU CAN EDIT THIS PAGE
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

TCH_GM_LIST = ".gm ingame";
TCH_TAXI_VOIR = ".cheat taxi on";
TCH_TAXI_CACHER = ".cheat taxi off";
TCH_FLYMODE_ON = ".gm fly on";
TCH_FLYMODE_OFF = ".gm fly off";
TCH_MAPS_VOIR = ".cheat explore on";
TCH_MAPS_CACHER = ".cheat explore off";

TCH_DIE = ".die";
TCH_REVIVE = "/g .revive";
TCH_KICK = ".kick";
TCH_ACCT = ".account";

TCH_GPS = ".gps";
TCH_INFOS = ".server info";
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
--    hover text

TCh_bul = {
    ["ouvrir"] = "Tool window for GMs.";
    ["desc"] = "Tool window for GMs.";
    ["exit"] = "Close the tool window.";

    ["orp"] = "|cffffffffLeft Click :|r Click here to add the amount of gold indicated.";
    ["orm"] = "|cffffffffLeft Click :|r Click here to subtract the amount of gold indicated.";
    ["dire"] = "|cffffffffLeft Click :|r Make an NPC say something.\n|cffffffffRight Click :|r Make an NPC yell something.";
    ["modify"] = "|cffffffffLeft Click :|r Cliquez ici pour changer la valeur maxi ";
    ["modifylvl"] = "|cffffffffLeft Click :|r Increase the level of a player by a set amount.\n|cffffffffRight Click :|r Decrease the level of a player by a set amount.";
    ["modifyhonneur"] = "|cffffffffLeft Click :|r Add a set amount of honor points to the selected player.\n|cffffffffRight Click :|r Remove a set amount of honor points from the selected player.";
    ["modifyscale"] = "|cffffffffLeft Click :|r Modify the scale of your currently selected target.\n|cffffffffRight Click :|r Revert your currently selected target to normal scale.";
    ["modifyspeed"] = "|cffffffffLeft Click :|r Modify the speed of your currently selected target.\n|cffffffffRight Click :|r Revert your currently selected target to normal speed.";

    ["GM"] = "|cffffffffLeft Click :|r Enable GM mode.\n|cffffffffRight Click :|r Disable GM mode.\n|cffffffffCtrl + Left Click :|r Enable accepting whispers from players.\n|cffffffffCtrl + Right Click :|r Disable accepting whispers from players.";
    ["hover"] = "|cffffffffLeft Click :|r Enable hover mode.\n|cffffffffRight Click :|r Disable hover mode.";
    ["invisible"] = "|cffffffffLeft Click :|r Enable GM invisibility.\n|cffffffffRight Click :|r Disable GM invisibility.";
    ["bank"] = "|cffffffffLeft Click :|r Show your bank inventory.";

    ["GMlist"] = "|cffffffffLeft Click :|r Display a list of all the Game Masters currently online.";
    ["flypath"] = "|cffffffffLeft Click :|r Temporaily reveal all flight path routes for the selected player.\n|cffffffffRight Click :|r Temporaily hide all flight path routes for the selected player";
    ["flymode"] = "|cffffffffLeft Click :|r Enable GM fly mode.\n|cffffffffRight Click :|r Disable GM fly mode.";
    ["carte"] = "|cffffffffLeft Click :|r Reveal all maps for the selected player.\n|cffffffffRight Click :|r Hide all maps for the selected player.";

    ["die"] = "|cffffffffLeft Click :|r Kill the selected player. If no player is selected, it will kill you.\n|cffffffffRight Click :|r Revive the selected player. If no player is selected, it will revive you.";
    ["kick"] = "|cffffffffLeft Click :|r Kick the targeted player from the world.";
    ["acct"] = "Display current account level.";

    ["gps"] = "Display the current position information.";
    ["infos"] = "Display server version and the number of connected players.";
    ["infoscible"] = "Output account information for selected player.";

    ["soleil"] = "Cliquez pour mettre du soleil dans cette zone";
    ["cielgris"] = "Cliquez pour mettre un ciel gris dans cette zone";
    ["pluie"] = "Cliquez pour mettre de la pluie dans cette zone";
    ["neige"] = "Cliquez pour mettre de la neige dans cette zone";

    ["annonce"] = "|cffffffffLeft Click :|r Send a system message to all players online in chat log.\n|cffffffffRight Click :|r Pour faire une annonce serveur avec votre nom\n|cffffffffCtrl + Left Click :|r Pour notifier\n|cffffffffCtrl + Right Click :|r Pour notifier avec votre nom";

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

    ["GMlist"] = "Displaying all the GMs currently online...";
    ["flypathvoir"] = "Vous activez tous les maitres de griffon";
    ["flypathcacher"] = "Vous desactivez les maitre de griffon jamais visiter";
    ["flymodeon"] = "Flight mode has been enabled.";
    ["flymodeoff"] = "Flight mode has been disabled.";
    ["cartevoir"] = "Vous affichez toutes les cartes";
    ["cartecacher"] = "Vous masquez les carte non decouverte";

    ["die"] = "Killed |cff00ff00";
    ["revivre"] = "Revived |cff00ff00";
    ["kick"] = "Kicked |cff00ff00";
    ["acct"] = "Displaying current account level...";

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

