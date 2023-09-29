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

private["_myMemCube", "_working", "_config", "_detectCalss", "_texturesPath", "_myObject", "_pannList", "_vitemLegale", "_vitemIllegale", "_nbVitemLegal", "_nbVitemIllegal", "_distance", "_playerPos", "_nearbyObjects", "_objectName"];

_config = missionConfigFile >> "tontonCasi_Farm";
_resourceCfg = _config >> "farmList";

// Obtenir la position du joueur
_playerPos = getPos player;

// Parcours des object dans le coin
hint "";
_myObject = cursorObject;
_tFarm_qt = 0;

if !(life_action_inUse) then {
    life_action_inUse = true;
    if !(isNull _myObject) then {

        _objectName = typeOf _myObject;
        if (_objectName isEqualTo "") then {
            _objectName = (str _myObject) splitString ": ";
            _objectName = (_objectName select 1) splitString ".";
            _objectName = (_objectName select 0);
        };
            
        if (isClass (_resourceCfg >> _objectName)) then {

            _objPos = position _myObject;
            _distance = _objPos distance _playerPos;

            if (_distance < 23) then {  // pour limiter et pas farm à plus de n distance

                _foundMemFarmCube = nearestObjects [_objPos, ["Land_VR_Shape_01_cube_1m_F"], 23];

                _max_amount = getNumber(_resourceCfg >> _objectName >> "max_amount");
                _message = getText(_resourceCfg >> _objectName >> "message");
                _vItem = getText(_resourceCfg >> _objectName >> "vitem");

                // Si cette arbre n'a pas encore était farm
                if (count _foundMemFarmCube isEqualTo 0) then {
                    
                    // Créer le cube et lui mettre les infos
                    _myMemCube = "Land_VR_Shape_01_cube_1m_F" createVehicle _objPos;
                    _myMemCube hideObject true;
                    _tFarm_qt = _max_amount;
                } else {
                    _myMemCube = (_foundMemFarmCube select 0);
                    _tFarm_qt = _myMemCube getVariable ["tFarm_qt", _max_amount];
                };

                if (_tFarm_qt isEqualTo 0) exitWith {};

                // Suppression d'item sur l'arbre
                _tFarm_qt = _tFarm_qt - 1;
                _myMemCube setVariable ["tFarm_qt", _tFarm_qt];

                // si reste sur l'arbre
                if (_tFarm_qt >= 0) then {  

                    // Ajout item dans la poche
                    if ([true, _vItem, 1] call life_fnc_handleInv) then {
                    
                        // Animation
                        if (animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
                            [player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                            player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
                            player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
                        };
                        sleep 1;

                        // Message
                        hint format[_message, _tFarm_qt];

                    } else {
                        _myMemCube setVariable ["tFarm_qt", (_tFarm_qt + 1)];
                    };

                };

                // si plus sur l'arbre destruction de celui-ci
                if (_tFarm_qt < 1) then {  
                    _myObject hideObjectGlobal true; 
                    _myObject setVariable ['hidden_adm',true,true];
                    deleteVehicle _myMemCube;
                };

            };
        };
    };
    life_action_inUse = false;
};