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
		[] call c33_fnc_pecheActions;

*/
private["_config", "_cannePache", "_isWater", "_poissonList", "_randomFishIndex", "_fishClasses", "_fishNames", "_fishClass", "_fishNames"];

_config         = missionConfigFile >> "tontonCasi_Peche";
_cannePache		= getText (_config >> "className_CannePeche");
_poissonList   	= _config >> "poissonList";
_isWater 		= surfaceIsWater (visiblePositionASL player);
_msg_giveFish	= getText (_config >> "msg_giveFish");
_msg_notInWater	= getText (_config >> "msg_notInWater");
_msg_notCanne	= getText (_config >> "msg_notCanne");

if (_isWater) then {
	if !(life_is_processing) then {
		// Vérifiez si le joueur a une canne à pêche dans les mains
		if (currentWeapon player == _cannePache) then {
			
			// Setup our progress bar.
			disableSerialization;
			"progressBar" cutRsc ["life_progress", "PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format ["%2 (1%1)...", "%", ""];
			_progress progressSetPosition 0.01;
			_cP = 0.01;

			life_is_processing = true;

			// Attendez quelques secondes pour simuler la pêche (ajustez le délai selon vos besoins)
			for "_i" from 0 to 1 step 0 do {
				
				// Use our progress bar
				uiSleep 0.10;
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format ["%3 (%1%2)...", round(_cP * 100), "%", "Pêche en cours"];
				if (_cP >= 1) exitWith {};
				if !(surfaceIsWater (visiblePositionASL player)) exitWith {
					hint format[_msg_notInWater];
				};

			};
			if !(surfaceIsWater (visiblePositionASL player))exitWith {
				hint format[_msg_notInWater];
				"progressBar" cutText ["", "PLAIN"]; life_is_processing = false; life_action_inUse = false;
			};

			// Générez un indice aléatoire pour choisir un poisson dans la liste
			_randomFishIndex = floor(random count(_poissonList)-1);

			private _poisson = (_poissonList select _randomFishIndex);

			// Obtenez la classe du poisson à partir de l'indice aléatoire
			_fishClass = getText(_poisson >> "item");
			_fishName = getText(_poisson >> "label");

			// Ajoutez le poisson à l'inventaire du joueur
			if ([true, _fishClass, 1] call life_fnc_handleInv) then {
				hint format [_msg_giveFish, _fishName];
			};

            "progressBar" cutText ["","PLAIN"];
            life_is_processing = false; life_action_inUse = false;

		} else {
			hint format[_msg_notCanne];
            "progressBar" cutText ["","PLAIN"];
            life_is_processing = false; life_action_inUse = false;
		};
	};
};