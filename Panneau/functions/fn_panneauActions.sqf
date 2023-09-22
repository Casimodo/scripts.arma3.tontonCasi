#include "..\..\..\script_macros.hpp"
/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : fn_panneauActions.sqf

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

    Example:
    [] call c33_fnc_panneauActions;
*/

private["_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];
disableSerialization;

_config         = missionConfigFile >> "tontonCasi_Panneau";
_detectCalss    = getArray(_config >> "detectCalss");
_texturesPath   = "tontonCasi\Panneau\textures";
_pannList       = _config >> "panneauList";
_vitemLegale    = getText(_config >> "itemLegale");      
_vitemIllegale  = getText(_config >> "itemIllegale");   

_nbVitemLegal   = ITEM_VALUE(_vitemLegale);
_nbVitemIllegal = ITEM_VALUE(_vitemIllegale);

// Si aucun des items requis pas d'action
if ((_nbVitemLegal isEqualTo 0) && (_nbVitemIllegal isEqualTo 0)) exitWith {};    

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 15;

// Obtenir la position du joueur
_playerPos = getPos player;

// Utiliser nearestObjects pour trouver les objets autour du joueur
_nearbyObjects = nearestObjects [_playerPos, [], _distance];

// Afficher les noms des objets trouvés dans la console
{
    _objectName = typeOf _x;
    _myObject = _x;
    // Recherche si l'objet est l'un des panneaux connus
    if (_objectName in _detectCalss) then {
        
        if !(createDialog "panneau_menu") exitWith {};

        private _pann_list = CONTROL(6000,6002);
        lbClear _pann_list;

        // List des panneaux
        for "_i" from 0 to (count _pannList) - 1 do 
        {
            private _panneau    = _pannList select _i;
            private _label      = getText(_panneau >> "label");
            private _picture    = getText(_panneau >> "picture");
            private _legal      = getNumber(_panneau >> "legal");

            if (((_legal isEqualTo 1) && (_nbVitemLegal > 0)) || ((_legal isEqualTo 0) && (_nbVitemIllegal > 0))) then {
                _pann_list lbAdd format["%1", _label];
                _pann_list lbSetData [(lbSize _pann_list)-1, format["%1", configName  _panneau]];
                _pann_list lbSetPicture [(lbSize _pann_list)-1, format ["%1\%2", _texturesPath, _picture]];
                _pann_list lbSetValue [(lbSize _pann_list)-1, 0];
            }; 
        };

    };
} forEach _nearbyObjects;
