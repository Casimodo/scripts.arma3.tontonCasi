/*
    file : fn_panneauAleatoire.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : GNU GPLv3
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.

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

    // Ont applique les textures
    (_myobject) setobjecttextureGlobal [0, _path];
    (_myobject) setobjecttextureGlobal [1, _path];

};