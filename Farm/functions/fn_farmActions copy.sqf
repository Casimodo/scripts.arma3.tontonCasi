#include "..\..\..\script_macros.hpp"
/*
    file : fn_farmActions.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this.
      All component files this code is filed, signed and certified with the competent international authority
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.

    Example:
    [] call c33_fnc_farmActions;
*/

private["_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];

hint "go rammassage !";
_config = missionConfigFile >> "tontonCasi_Farm";
_resourceCfg = _config >> "farmList";

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 10;

// Obtenir la position du joueur
_playerPos = getPos player;

// list des class reconnu
_ressoucesCfgList = [];
for
    "_i" from 0 to count(_resourceCfg) - 1 do
    {
        _curConfig = _resourceCfg select _i;
        _resource = configName _curConfig;
        _ressoucesCfgList pushBack _resource;
    };

// Utiliser nearestObjects pour trouver les objets autour du joueur
//_nearbyObjects = nearestObjects [_playerPos, [], _distance];
_nearbyObjects = nearestTerrainObjects[_playerPos, [ "Tree", "Bush" ], _distance];
hint format[">>>found: %1", str _ressoucesCfgList];
// Afficher les noms des objets trouvés dans la console
_o = [];
{
    _myObject = _x;
    _objectName = getModelInfo _myObject;
    _objectName = (_objectName select 0) splitString ".";
    _objectName = (_objectName select 0);
    _o pushBack _objectName;

    private _qt = player getVariable ["qt_rest", 10];

    // Recherche si l'objet est l'un des panneaux connus
    if (_objectName in _ressoucesCfgList) then{

        // Calcul les distance entre le farm et le joueur
        private _ddObj = position _myObject;
        _deltaDistance = _playerPos distance _ddObj;

        // Met en mémoire 
        if (_qt == 10) then {
            player setVariable ["tonton_farm_distance", _deltaDistance, true];                
        };

        _qt = _qt - 1;
        player setVariable ["qt_rest", _qt, true];

        hint format[">>>tu rama: %1 / reste: %2 / dis: %3", _objectName, _qt, _deltaDistance];
        /*if !(createDialog "panneau_menu") exitWith {};

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
        };*/
    };
}forEach _nearbyObjects;

//hint str _o;