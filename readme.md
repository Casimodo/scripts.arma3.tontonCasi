# Permet l'installation des scripts de tontonCasi

## Author
- **tontonCasi :** [Steam UID: https// steamcommunity.com/id/Casimodo33/]
- **Twitch :** https://www.twitch.tv/tontoncasi

## Terms of use:
- This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
- If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
- Out of respect for the author please do not delete this information.

## Description
Ce git vous permet d'ajouter des scripts fun pour votre serveur Arma3. Divers script sont en cours de création.
Ces scripts offert par la chaine twitch "tontonCasi" ont étaient développé pour le projet www.despote-isalnd.com compatible sur une Tonic 5 principalement à vous d'adapter à votre mission. Il peut exploiter le mods pack fournie aussi par tontonCasi à l'url "https://steamcommunity.com/sharedfiles/filedetails/?id=2703875351".
Sinon rejoinez notre discord à l'adresse "https://discord.gg/qPSwbHNMRd"

## Installation 
1. copier / coller à la rasine de votre projet Arma 3
2. Ajout la ligne ci-dessous au début du fichier "core\functions\fn_actionKeyHandler.sqf"
```
#include "..\..\tontonCasi\actionKeyHandler.sqf"
```
3. Aller dans votre fichier "description.ext"
4. Chercher la ligne avec >> #include "CfgRemoteExec.hpp"
5. Ajouter en dessous la ligne ci-dessous
```
#include "tontonCasi\dialog_master.cpp"
```
6. Dans le même fichier, chercher la class "CfgFunctions" et y ajouter à l'intérieur la ligne >> #include "tontonCasi\tontonCasi_CfgFunctions.hpp" exemple ci-dessous
```
class CfgFunctions {
    #include "Functions.hpp"
    #include "tontonCasi\CfgFunctions.hpp"
};
```

## Configurations
- Tout ce décline en modules configurable. Un module égale un dossier contenant le fichier de configuration nommé "config_master.cpp".

- Le fichier "actionKeyHandler.sqf" peut être customisé en fonction des besoins.

## Warning 
Faire attention si vous avez récupéré par un git pull les fichiers afin de faire une mise à jour automatisé de mettre vos fichiers de configurations dans un gitignore et de surveiller les version et leur modification voir desciption des push git.

## Les Modules

### Peche
- **Version** : 1.1
- **Status** : OK
- **Description** : Prenez une canne à pêche au dessus de l'eau et action, la pêche ce lance (voir fichier config pour le détail).

### Panneau "aléatoire"
- **Version** : 1.0
- **Status** : OK
- **Description** : Permet d'affichier de la publicité sur des panneaux en aléatoire (voir fichier config pour le détail).
- **Utilisation** : Mettre la ligne ci-dessous dans l'init de votre panneau "liste des images dans le fichier de config et dossier textures"
```
[this] call c33_fnc_panneauAleatoire; 
```

### Panneau "action pub"
- **Version** : 0.1
- **Status** : *Dev en cour (non visible dans le github pour l'instant)*
- **Description** : Permet de modifier par la touche action le contenu d'un panneau deux type dispo en fonction de licence "pub légale" et "pub illégale" (voir fichier config pour le détail).
- **Utilisation** : Mettre la ligne ci-dessous dans l'init de votre panneau "liste des images dans le fichier de config et dossier textures"
```
[this] call c33_fnc_panneauActions; 
```
- **Configurations** : vItem à ajouter, ainsi que la traduction, exemple ci-dessous des vitems (doivent correspondre au fichier config pour le détail).
```
class panneau_papier {
    variable = "pann_papier";
    displayName = "STR_Item_panneau_papier";
    weight = 1;
    buyPrice = -1;
    sellPrice = 150;
    illegal = false;
    edible = -1;
    drinkable = -1;
    icon = "";
};
class panneau_papier_sale {
    variable = "papier_sale";
    displayName = "STR_Item_panneau_papier_sale";
    weight = 1;
    buyPrice = -1;
    sellPrice = 15000;
    illegal = true;
    edible = -1;
    drinkable = -1;
    icon = "";
};
```