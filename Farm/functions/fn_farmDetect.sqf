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

private["_t"];

hint "";
_playerPos      = getPos player;
_distance       = 8;

_isTypeof = false;
_nearbyObjects = nearestTerrainObjects[_playerPos, [ "Tree", "Bush" ], _distance];
if (count _nearbyObjects isEqualTo 0) then {
    _nearbyObjects = nearestObjects [_playerPos, [], _distance];
    _isTypeof = true;
};

hint format[">>%1", _nearbyObjects];
copyToClipboard str _nearbyObjects;