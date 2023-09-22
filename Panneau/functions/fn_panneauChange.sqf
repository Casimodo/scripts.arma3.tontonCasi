/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : fn_panneauChange.sqf

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

*/
private["_pClassName", "_panneauList", "_panneau", "_config", "_objectName", "_texture", "_path", "_distance", "_playerPos", "_detectCalss", "_nearbyObjects", "_texturesPath", "_textureIndex"];


_pClassName  = lbData[6002,(lbCurSel 6002)];

_config         = missionConfigFile >> "tontonCasi_Panneau";
_panneauList    = (_config >> "panneauList");
_panneau        = (_panneauList >> _pClassName);
_texturesPath   = "tontonCasi\Panneau\textures";
_detectCalss    = getArray(_config >> "detectCalss");

_texture        = getText(_panneau >> "picture");
_path           = format ["%1\%2", _texturesPath, _texture];

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 5;

// Obtenir la position du joueur
_playerPos = getPos player;

// Utiliser nearestObjects pour trouver les objets autour du joueur
_nearbyObjects = nearestObjects [_playerPos, [], _distance];

{
    _objectName = typeOf _x;
    _myObject = _x;

    // Recherche si l'objet est l'un des panneaux connus
    if (_objectName in _detectCalss) exitWith {
        
        // Ont applique les textures
        (_myobject) setobjecttextureGlobal [0, _path];
        (_myobject) setobjecttextureGlobal [1, _path];        

    };
} forEach _nearbyObjects;