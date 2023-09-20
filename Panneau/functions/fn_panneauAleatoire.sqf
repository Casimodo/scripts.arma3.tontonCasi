/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : fn_panneauAleatoire.sqf

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

    Example:
    [this] call c33_fnc_panneauAleatoire;   // A mettre dans l'init de votre panneau compatible
*/
private["_myobject", "_config", "_texturesList", "_detectCalss", "_texturesPath", "_textureIndex"];

_myobject       = _this select 0;
_config         = missionConfigFile >> "tontonCasi_Panneau";
_textureList    = getArray(_config >> "textures");
_detectCalss    = getArray(_config >> "detectCalss");
_texturesPath   = "tontonCasi\Panneau\textures";

// Vérifie que le panneau est authorisé
if(typeOf _myobject in _detectCalss) then {

    // Générez un indice aléatoire
	_textureIndex   = floor(random count(_textureList));
    _texture        = (_textureList select _textureIndex);
    _path           = format ["%1\%2", _texturesPath, _texture];

    hint format[">>%1 >>%2", _textureList, _texture];
    // Ont applique les textures
    (_myobject) setobjecttextureGlobal [0, _path];
    (_myobject) setobjecttextureGlobal [1, _path];

};