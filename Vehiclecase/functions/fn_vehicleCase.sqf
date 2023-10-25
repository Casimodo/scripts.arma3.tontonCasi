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
		[_veh] call c33_fnc_vehicleCase;

*/
private["_veh", "_config", "_vehicle_list", "_data", "_veh_data", "_charge", "_max_charge", "_case_type", "_case_posi", "_max_case", "_coef_case", "_total_case", "_vehiclecase_number"];

_config      	= missionConfigFile >> "tontonCasi_Vehiclecase";
_vehicle_list 	= _config >> "vehicle_list";

if (!(_veh isKindOf "car") and !(_veh isKindOf "air") and !(_veh isKindOf "ship")) exitWith {};

_veh 				= [_this,0,objNull,[objNull]] call BIS_fnc_param;
_data 				= _veh getVariable ["Trunk",[]];
_veh_data 			= [_veh] call life_fnc_vehicleWeight;
_charge 			= (_veh_data select 1);
_max_charge 		= (_veh_data select 0);
_vehiclecase_number = _veh getVariable ["vehiclecase_number", 0];

if (isClass (_vehicle_list >> typeOf _veh)) then {

	_case_type 	= getText(_vehicle_list >> typeOf _veh >> "case");
	_case_posi 	= getArray(_vehicle_list >> typeOf _veh >> "position");
	_max_case 	= count _case_posi;

	_coef_case 	= _max_case / _max_charge;
	_total_case = round (_coef_case * _charge);

	if (_total_case < 1) then {
		_total_case = 0;
	};

	if (_total_case <= _max_case) then {
		_case_posi resize _total_case;
	};

	if !(_vehiclecase_number isEqualTo _total_case) then {

		_veh setVariable ["vehiclecase_number", _total_case];

		{   
			deleteVehicle _x;      
			//[_myObject, true] remoteExec ["deleteVehicle", 2]; 
		} forEach attachedObjects _veh;  

		if (_total_case > 0) then {
			{    
				_newObject = createVehicle [_case_type, [(getPos player) # 0, (getPos player) # 1, ((getPos player) # 2) - 5], [], 0, "CAN_COLLIDE"]; 
				_newObject attachTo [_veh , _x];  
			} forEach _case_posi;
		};
	};

};

// Permet d'enlever des éléments sur certain véhicules
_sogCar = ["vn_c_car_04_01"];
if ((typeOf _veh) in _sogCar) then {
    _veh animate ["canopy_hide", 1];
    _veh animate ["clutter_c_hide", 1];
};