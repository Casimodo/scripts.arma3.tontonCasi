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
    [] call c33_fnc_iconActions;
*/

[] spawn {

    private["_myMemCube", "_working", "_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];

    addMissionEventHandler ["draw3D",
    {
        _iconsPath   = getMissionPath "tontonCasi\Icon\icons";
        _config      = missionConfigFile >> "tontonCasi_Icon";
        _resourceCfg = _config >> "iconList";

        // Obtenir la position du joueur
        _playerPos      = getPos player;
        
        // Parcours des object dans le coin
        _myObject = cursorObject;
        
        if !(isNull _myObject) then {

            _objPos = position _myObject;
            _distCalc = _objPos distance _playerPos;
            
            _objectName = typeOf _myObject;
            if (_objectName isEqualTo "") then {
                _objectName = (str _myObject) splitString ": ";
                _objectName = (_objectName select 1) splitString ".";
                _objectName = (_objectName select 0);
            };
            
            if (isClass (_resourceCfg >> _objectName)) then {
                    
                _long_distance  = getNumber(_resourceCfg >> _objectName >> "long_distance");
                _icon_pos       = getArray(_resourceCfg >> _objectName >> "icon_pos");
                _icon           = getText(_resourceCfg >> _objectName >> "icon");
                _msg            = getText(_resourceCfg >> _objectName >> "msg");

                _distance = 6;
                if (_long_distance isEqualTo 1) then {
                    _distance = 23;
                };

                if (_distCalc <= _distance) then {            
                    
                    _iconPos = [_objPos # 0, _objPos # 1, _playerPos # 2] vectorAdd _icon_pos;
                    //hint format[">>>Player : %1 / icon: %2", _playerPos, _iconPos];
                    //hint format[">>> %1 / %2 / [%3,%4,%5]", cursorObject, _objPos, (_playerPos # 0 - _objPos # 0), (_playerPos # 1 - _objPos # 1), (_playerPos # 2 - _objPos # 2)];
                    drawIcon3D
                    [
                        format ["%1\%2", _iconsPath, _icon],
                        [1,1,1,1],
                        _iconPos,
                        1.5,
                        1.5,
                        //getDirVisual player,
                        0,
                        _msg,
                        0,
                        0.05,
                        "PuristaMedium",
                        "center",
                        false
                    ];

                };

            };
        };     

    }];
};

//hint format["_objectName:%1, / _myObject:%2 / _isTypeof:%3 / _distCalc:%4 / life_action_inUse:%5 / _vItem:%6 / _tFarm_qt:%7", str _objectName, _myObject, _isTypeof, _distCalc, life_action_inUse, _vItem, _tFarm_qt];