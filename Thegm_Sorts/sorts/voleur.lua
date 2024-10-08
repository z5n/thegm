--############################################################################################
-- [InstableDesign] http://instabledesign.pbwiki.com/
--
--	Titre			: Thegm Sorts
--	Fichier			: voleur.lua
--	Version			: 2.4
--	Description		: Addon 
--	Requis			: World Of Warcraft + emulateur Mangos 2.4
--	Auteur			: InstableDesign chez gmail.com
--	Site			: http://instabledesign.pbwiki.com/
--
--	Ce fichier contient la liste des sorts voleur.
--
--	VOUS POUVEZ MODIFIER CE FICHIER
--
-- [InstableDesign] http://instabledesign.pbwiki.com/
--############################################################################################

--############################################################################################
--############################################################################################
TS_Voleur = {
--{"Nom du sorts", "lvl ?",  "N° ID"},
{"Attaque pernicieuse (Rang 1)", "lvl 1",  "1752"},
{"Camouflage (Rang 1)", "lvl 1",  "1784"},
{"Eviscération (Rang 1)", "lvl 1",  "2098"},
{"Attaque sournoise (Rang 1)", "lvl 4",  "53"},
{"Vol à la tire", "lvl 4",  "921"},
{"Attaque pernicieuse (Rang 2)", "lvl 6",  "1757"},
{"Suriner (Rang 1)", "lvl 6",  "1776"},
{"Evasion (Rang 1)", "lvl 8",  "5277"},
{"Eviscération (Rang 2)", "lvl 8",  "6760"},
{"Assommer (Rang 1)", "lvl 10",  "6770"},
{"Débiter (Rang 1)", "lvl 10",  "5171"},
{"Sprint (Rang 1)", "lvl 10",  "2983"},
{"Attaque sournoise (Rang 2)", "lvl 12",  "2589"},
{"Coup de pied (Rang 1)", "lvl 12",  "1766"},
{"Attaque pernicieuse (Rang 3)", "lvl 14",  "1758"},
{"Exposer l'armure (Rang 1)", "lvl 14",  "8647"},
{"Garrot (Rang 1)", "lvl 14",  "703"},
{"Crochetage", "lvl 16",  "1804"},
{"Eviscération (Rang 3)", "lvl 16",  "6761"},
{"Feinte (Rang 1)", "lvl 16",  "1966"},
{"Embuscade (Rang 1)", "lvl 18",  "8676"},
{"Suriner (Rang 2)", "lvl 18",  "1777"},
{"Attaque sournoise (Rang 3)", "lvl 20",  "2590"},
{"Camouflage (Rang 2)", "lvl 20",  "1785"},
{"Frappe fantomatique", "lvl 20",  "14278"},
{"Poison affaiblissant (Rang 1)", "lvl 20",  "3420"},
{"Poison instantané (Rang 1)", "lvl 20",  "8681"},
{"Poisons", "lvl 20",  "2842"},
{"Riposte", "lvl 20",  "14251"},
{"Rupture (Rang 1)", "lvl 20",  "1943"},
{"Attaque pernicieuse (Rang 4)", "lvl 22",  "1759"},
{"Disparition (Rang 1)", "lvl 22",  "1856"},
{"Distraction", "lvl 22",  "1725"},
{"Garrot (Rang 2)", "lvl 22",  "8631"},
{"Détection des pièges @ Passif", "lvl 24",  "2836"},
{"Eviscération (Rang 4)", "lvl 24",  "6762"},
{"Poison de distraction mentale (Rang 1)", "lvl 24",  "5763"},
{"Coup bas", "lvl 26",  "1833"},
{"Coup de pied (Rang 2)", "lvl 26",  "1767"},
{"Embuscade (Rang 2)", "lvl 26",  "8724"},
{"Exposer l'armure (Rang 2)", "lvl 26",  "8649"},
{"Assommer (Rang 2)", "lvl 28",  "2070"},
{"Attaque sournoise (Rang 4)", "lvl 28",  "2591"},
{"Feinte (Rang 2)", "lvl 28",  "6768"},
{"Poison instantané II (Rang 2)", "lvl 28",  "8687"},
{"Rupture (Rang 2)", "lvl 28",  "8639"},
{"Aiguillon perfide (Rang 1)", "lvl 30",  "408"},
{"Attaque pernicieuse (Rang 5)", "lvl 30",  "1760"},
{"Déluge de lames", "lvl 30",  "13877"},
{"Désarmement de piège", "lvl 30",  "1842"},
{"Garrot (Rang 3)", "lvl 30",  "8632"},
{"Hémorragie (Rang 1)", "lvl 30",  "16511"},
{"Poison mortel (Rang 1)", "lvl 30",  "2835"},
{"Préparation", "lvl 30",  "14185"},
{"Sang froid", "lvl 30",  "14177"},
{"Eviscération (Rang 5)", "lvl 32",  "8623"},
{"Poison douloureux (Rang 1)", "lvl 32",  "13220"},
{"Suriner (Rang 3)", "lvl 32",  "8629"},
{"Cécité", "lvl 34",  "2094"},
{"Embuscade (Rang 3)", "lvl 34",  "8725"},
{"Sprint (Rang 2)", "lvl 34",  "8696"},
{"Attaque sournoise (Rang 5)", "lvl 36",  "8721"},
{"Exposer l'armure (Rang 3)", "lvl 36",  "8650"},
{"Poison instantané III (Rang 3)", "lvl 36",  "8691"},
{"Rupture (Rang 3)", "lvl 36",  "8640"},
{"Attaque pernicieuse (Rang 6)", "lvl 38",  "8621"},
{"Garrot (Rang 4)", "lvl 38",  "8633"},
{"Poison de distraction mentale II (Rang 2)", "lvl 38",  "8694"},
{"Poison mortel II (Rang 2)", "lvl 38",  "2837"},
{"Camouflage (Rang 3)", "lvl 40",  "1786"},
{"Chute amortie @ Passif", "lvl 40",  "1860"},
{"Eviscération (Rang 6)", "lvl 40",  "8624"},
{"Feinte (Rang 3)", "lvl 40",  "8637"},
{"Poison douloureux II (Rang 2)", "lvl 40",  "13228"},
{"Poussée d'adrénaline", "lvl 40",  "13750"},
{"Préméditation", "lvl 40",  "14183"},
{"Coup de pied (Rang 3)", "lvl 42",  "1768"},
{"Débiter (Rang 2)", "lvl 42",  "6774"},
{"Disparition (Rang 2)", "lvl 42",  "1857"},
{"Embuscade (Rang 4)", "lvl 42",  "11267"},
{"Attaque sournoise (Rang 6)", "lvl 44",  "11279"},
{"Poison instantané IV (Rang 4)", "lvl 44",  "11341"},
{"Rupture (Rang 4)", "lvl 44",  "11273"},
{"Attaque pernicieuse (Rang 7)", "lvl 46",  "11293"},
{"Exposer l'armure (Rang 4)", "lvl 46",  "11197"},
{"Garrot (Rang 5)", "lvl 46",  "11289"},
{"Hémorragie (Rang 2)", "lvl 46",  "17347"},
{"Poison mortel III (Rang 3)", "lvl 46",  "11357"},
{"Suriner (Rang 4)", "lvl 46",  "11285"},
{"Assommer (Rang 3)", "lvl 48",  "11297"},
{"Eviscération (Rang 7)", "lvl 48",  "11299"},
{"Poison douloureux III (Rang 3)", "lvl 48",  "13229"},
{"Aiguillon perfide (Rang 2)", "lvl 50",  "8643"},
{"Embuscade (Rang 5)", "lvl 50",  "11268"},
{"Estropier (Rang 1)", "lvl 50",  "1329"},
{"Estropier (Rang 2)", "lvl 50",  "34411"},
{"Evasion (Rang 2)", "lvl 50",  "26669"},
{"Pas de l'ombre", "lvl 50",  "36554"},
{"Poison affaiblissant II (Rang 2)", "lvl 50",  "3421"},
{"Attaque sournoise (Rang 7)", "lvl 52",  "11280"},
{"Feinte (Rang 4)", "lvl 52",  "11303"},
{"Poison de distraction mentale III (Rang 3)", "lvl 52",  "11400"},
{"Poison instantané V (Rang 5)", "lvl 52",  "11342"},
{"Rupture (Rang 5)", "lvl 52",  "11274"},
{"Attaque pernicieuse (Rang 8)", "lvl 54",  "11294"},
{"Garrot (Rang 6)", "lvl 54",  "11290"},
{"Poison mortel IV (Rang 4)", "lvl 54",  "11358"},
{"Eviscération (Rang 8)", "lvl 56",  "11300"},
{"Exposer l'armure (Rang 5)", "lvl 56",  "11198"},
{"Poison douloureux IV (Rang 4)", "lvl 56",  "13230"},
{"Coup de pied (Rang 4)", "lvl 58",  "1769"},
{"Embuscade (Rang 6)", "lvl 58",  "11269"},
{"Hémorragie (Rang 3)", "lvl 58",  "17348"},
{"Sprint (Rang 3)", "lvl 58",  "11305"},
{"Attaque sournoise (Rang 8)", "lvl 60",  "11281"},
{"Attaque sournoise (Rang 9)", "lvl 60",  "25300"},
{"Camouflage (Rang 4)", "lvl 60",  "1787"},
{"Estropier (Rang 3)", "lvl 60",  "34412"},
{"Eviscération (Rang 9)", "lvl 60",  "31016"},
{"Feinte (Rang 5)", "lvl 60",  "25302"},
{"Poison instantané VI (Rang 6)", "lvl 60",  "11343"},
{"Poison mortel V (Rang 5)", "lvl 60",  "25347"},
{"Rupture (Rang 6)", "lvl 60",  "11275"},
{"Suriner (Rang 5)", "lvl 60",  "11286"},
{"Garrot (Rang 7)", "lvl 61",  "26839"},
{"Attaque pernicieuse (Rang 9)", "lvl 62",  "26861"},
{"Disparition (Rang 3)", "lvl 62",  "26889"},
{"Envenimer (Rang 1)", "lvl 62",  "32645"},
{"Poison mortel VI (Rang 6)", "lvl 62",  "26969"},
{"Eviscération (Rang 10)", "lvl 64",  "26865"},
{"Feinte (Rang 6)", "lvl 64",  "27448"},
{"Lancer mortel (Rang 1)", "lvl 64",  "26679"},
{"Poison douloureux V (Rang 5)", "lvl 64",  "27283"},
{"Cape d'ombre", "lvl 66",  "31224"},
{"Embuscade (Rang 7)", "lvl 66",  "27441"},
{"Exposer l'armure (Rang 6)", "lvl 66",  "26866"},
{"Suriner (Rang 6)", "lvl 67",  "38764"},
{"Attaque sournoise (Rang 10)", "lvl 68",  "26863"},
{"Poison anesthésiant (Rang 1)", "lvl 68",  "26786"},
{"Poison instantané VII (Rang 7)", "lvl 68",  "26892"},
{"Rupture (Rang 7)", "lvl 68",  "26867"},
{"Coup de pied (Rang 5)", "lvl 69",  "38768"},
{"Envenimer (Rang 2)", "lvl 69",  "32684"},
{"Attaque pernicieuse (Rang 10)", "lvl 70",  "26862"},
{"Estropier (Rang 4)", "lvl 70",  "34413"},
{"Garrot (Rang 8)", "lvl 70",  "26884"},
{"Hémorragie (Rang 4)", "lvl 70",  "26864"},
{"Kriss (Rang 1)", "lvl 70",  "5938"},
{"Poison mortel VII (Rang 7)", "lvl 70",  "27282"},
};