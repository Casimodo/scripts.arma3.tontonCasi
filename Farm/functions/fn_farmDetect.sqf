#include "..\..\..\script_macros.hpp"
/*
    file : fn_farmDetect.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this.
      All component files this code is filed, signed and certified with the competent international authority
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.

    Example:
    [] call c33_fnc_farmDetect;
*/

private["_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 10;

// Obtenir la position du joueur
_playerPos = getPos player;

// Utiliser nearestObjects pour trouver les objets autour du joueur
_isTypeof = false;
_nearbyObjects = nearestTerrainObjects[_playerPos, [ "Tree", "Bush" ], _distance];
if (count _nearbyObjects isEqualTo 0) then {
    _nearbyObjects = nearestObjects [_playerPos, [], _distance];
    _isTypeof = true;
};

hint format[">>>found: %1", str _ressoucesCfgList];
// Afficher les noms des objets trouvés dans la console
private _o = [];
{
    _myObject = _x;
    if (_isTypeof) then {
        _objectName = typeOf _myObject;
    } else {
        _objectName = getModelInfo _myObject;
        _objectName = (_objectName select 0) splitString ".";
        _objectName = (_objectName select 0);
    };
    _o pushBack _objectName;

}forEach _nearbyObjects;

hint str _o;