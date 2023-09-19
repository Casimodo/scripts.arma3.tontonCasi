# Permet l'installation des scripts de tontonCasi

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
#include "tontonCasi\tontonCasi_dialog_master.cpp"
```
6. Dans le même fichier, chercher la class "CfgFunctions" et y ajouter à l'intérieur la ligne >> #include "tontonCasi\tontonCasi_CfgFunctions.hpp" exemple ci-dessous
```
class CfgFunctions {
    #include "Functions.hpp"
    #include "tontonCasi\tontonCasi_CfgFunctions.hpp"
};
```
