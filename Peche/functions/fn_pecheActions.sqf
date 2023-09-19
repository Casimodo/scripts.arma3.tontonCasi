/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : fn_pecheActions.sqf

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

	    Example:
	    call{
		[this] call c33_fnc_pecheActions;
	}
*/
private["_isWater", "_fishClasses", "_fishNames", "_fishClass", "_fishNames"];

_isWater = surfaceIsWater (visiblePositionASL player);

// Liste des classes d'objets de poissons possibles
_fishClasses = ["salema_raw", "ornate_raw", "mackerel_raw", "tuna_raw", "mullet_raw", "catshark_raw"];
_fishNames = ["Saumon", "Doré", "Maquereau", "Thon", "Mullet", "Poisson Chat"];

if (_isWater) then {
	if !(life_is_processing) then {
		// Vérifiez si le joueur a une canne à pêche dans les mains
		if (currentWeapon player == "vn_m_fishing_rod_01") then {
			
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
					hint "Vous n'êtes plus dans l'eau !";
				};

			};
			if !(surfaceIsWater (visiblePositionASL player))exitWith {
				hint "Vous n'êtes plus dans l'eau !";
				"progressBar" cutText ["", "PLAIN"]; life_is_processing = false; life_action_inUse = false;
			};

			// Générez un indice aléatoire pour choisir un poisson dans la liste
			_randomFishIndex = floor(random count _fishClasses);

			// Obtenez la classe du poisson à partir de l'indice aléatoire
			_fishClass = _fishClasses select _randomFishIndex;
			_fishName = _fishNames select _randomFishIndex;

			// Ajoutez le poisson à l'inventaire du joueur
			if ([true, _fishClass, 1] call life_fnc_handleInv) then {
				hint format ["Vous avez attrapé un %1 !", _fishName];
			};

            "progressBar" cutText ["","PLAIN"];
            life_is_processing = false; life_action_inUse = false;

		} else {
			hint "Vous devez avoir une canne à pêche équipée pour pêcher.";
            "progressBar" cutText ["","PLAIN"];
            life_is_processing = false; life_action_inUse = false;
		};
	};
};