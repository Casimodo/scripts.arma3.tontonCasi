/*
    file : fn_pecheActions.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.

	    Example:
		[_veh] call c33_fnc_vehicleCaseRemove;

*/
private["_veh"];

_veh 				= [_this,0,objNull,[objNull]] call BIS_fnc_param;
{   
	deleteVehicle _x; 
} forEach attachedObjects _veh;  