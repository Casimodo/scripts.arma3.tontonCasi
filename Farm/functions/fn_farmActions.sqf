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

private["_myMemCube", "_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];

_config = missionConfigFile >> "tontonCasi_Farm";
_resourceCfg = _config >> "farmList";

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 10;

// Obtenir la position du joueur
_playerPos = getPos player;

// list des class reconnu
_ressoucesCfgList = [];
for "_i" from 0 to count(_resourceCfg) - 1 do
{
    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _ressoucesCfgList pushBack _resource;
};

// Utiliser nearestObjects pour trouver les objets autour du joueur
_isTypeof = false;
_nearbyObjects = nearestTerrainObjects[_playerPos, [ "Tree", "Bush" ], _distance];
if (count _nearbyObjects isEqualTo 0) then {
    _nearbyObjects = nearestObjects [_playerPos, [], _distance];
    _isTypeof = true;
};


// Parcours des object dans le coin
hint "";
{
    _myObject = _x;
    _tFarm_qt = 0;
    if (_isTypeof) then {
        _objectName = typeOf _myObject;
    } else {
        _objectName = getModelInfo _myObject;
        _objectName = (_objectName select 0) splitString ".";
        _objectName = (_objectName select 0);
    };
    //_o pushBack _objectName;
        
    if (isClass (_resourceCfg >> _objectName)) then {
        hint format[">>%1 est class", _objectName];

        _objPos = position _myObject;
        _foundMemFarmCube = nearestObjects [_playerPos, ["Land_VR_Shape_01_cube_1m_F"], 8];

        _max_amount = getNumber(_resourceCfg >> _objectName >> "max_amount");
        _message = getText(_resourceCfg >> _objectName >> "message");

        // Si cette arbre n'a pas encore était farm
        if (count _foundMemFarmCube isEqualTo 0) then {
            
            // Créer le cube et lui mettre les infos
            _myMemCube = "Land_VR_Shape_01_cube_1m_F" createVehicle _objPos;
            _tFarm_qt = _max_amount;
        } else {
            _myMemCube = (_foundMemFarmCube select 0);
            _tFarm_qt = _myMemCube getVariable ["tFarm_qt", _max_amount];
        };

        if (_tFarm_qt isEqualTo 0) exitWith {};
        hint str _tFarm_qt;

        // Suppression d'item sur l'arbre
        _tFarm_qt = _tFarm_qt - 1;
        _myMemCube setVariable ["tFarm_qt", _tFarm_qt];

        if (_tFarm_qt >= 0) then {  // si reste sur l'arbre
            // Ajout item dans la poche
            hint format[_message, _tFarm_qt];
        };

        if (_tFarm_qt < 1) then {  // si plus sur l'arbre destruction de celui-ci
            _myObject hideObjectGlobal true; 
            _myObject setVariable ['hidden_adm',true,true];

        };
    };



    // Recherche si l'objet est l'un des panneaux connus
    // if (_objectName in _ressoucesCfgList) then{
    
    //     // Calcul les distance entre le farm et le joueur
    //     _objPos = position _myObject;
    //     _deltaDistance = _playerPos distance _objPos;

    //     // Qt sur ce farm
    //     _qtFarm = getNumber(_resourceCfg >> _objectName >> "max_amount");
    //     hint format[">>%1",_qtFarm];
    //     //_tFarm_qt = player getVariable ["_tFarm_qt", 10];
    //     //hint format["delta: %1 / mem: %2 / diff: %3", _deltaDistance, _tFarm_distance, (_tFarm_distance - _deltaDistance)];

    //     //if ((_tFarm_distance isEqualTo 100) || (_tFarm_distance - _deltaDistance) < 1) then {

    //         player setVariable ["tFarm_distance", _deltaDistance, true];

    //         /*_qtMem = player getVariable ["qt_rest", 10];

    //         _qtMem = _qtMem - 1;
    //         player setVariable ["qt_rest", _qtMem, true];

    //         hint format[">>>tu rama: %1 / reste: %2 / dis: %3", _objectName, _qt, _deltaDistance];*/
    //         /*if !(createDialog "panneau_menu") exitWith {};

    //         private _pann_list = CONTROL(6000,6002);
    //         lbClear _pann_list;

    //         // List des panneaux
    //         for "_i" from 0 to (count _pannList) - 1 do
    //         {
    //             private _panneau    = _pannList select _i;
    //             private _label      = getText(_panneau >> "label");
    //             private _picture    = getText(_panneau >> "picture");
    //             private _legal      = getNumber(_panneau >> "legal");

    //             if (((_legal isEqualTo 1) && (_nbVitemLegal > 0)) || ((_legal isEqualTo 0) && (_nbVitemIllegal > 0))) then {
    //                 _pann_list lbAdd format["%1", _label];
    //                 _pann_list lbSetData [(lbSize _pann_list)-1, format["%1", configName  _panneau]];
    //                 _pann_list lbSetPicture [(lbSize _pann_list)-1, format ["%1\%2", _texturesPath, _picture]];
    //                 _pann_list lbSetValue [(lbSize _pann_list)-1, 0];
    //             };
    //         };*/
    //     //};
    // };
}forEach _nearbyObjects;

//hint str _o;