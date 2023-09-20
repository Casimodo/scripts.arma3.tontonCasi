/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : fn_panneauActions.sqf

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

    Example:
    [] call c33_fnc_panneauActions;     // A mettre dans l'init de votre panneau compatible
*/


/*private["_myobject", "_selected", "_licence", "_config", "_texturesList", "_texturesPath"];

_myobject       = _this select 0;
_selected       = _this select 1;
_config         = missionConfigFile >> "tontonCasi_Panneau";
_texturesList   = _config >> "textureList";
_licence        = getText (_config >> "licence");
_texturesPath   = "tontonCasi\Panneau\textures\";
_tt = "";

if !(_selected isEqualTo "") then {

    private _texture    = (_texturesList >> _selected);
    private _picture    = getText(_texture >> "picture");
    private _path       = format ["%1%2", _texturesPath, _picture];
    _myobject setobjecttextureGlobal [0, _path];
    _myobject setobjecttextureGlobal [1, _path];
};

for "_i" from 0 to count(_texturesList)-1 do {

    private _texture    = (_texturesList select _i);

    private _label      = getText(_texture >> "label");
    private _picture    = getText(_texture >> "picture");
    private _path       = format ["%1%2", _texturesPath, _picture];
    
    
    _tt = _tt + _label + "(" + _path + ")-";
    
    _myobject addAction [format["%1", _label],
    {
        (_this select 3 select 0) setobjecttextureGlobal [0, _this select 3 select 1];
        (_this select 3 select 0) setobjecttextureGlobal [1, _this select 3 select 1];
        //[nil, nil, nil, "affichePub"] call life_fnc_processingOpenDiag;
    }, [_myobject, _path], 1.5, true, true, "", _licence, 5, false, "", ""];

};*/
