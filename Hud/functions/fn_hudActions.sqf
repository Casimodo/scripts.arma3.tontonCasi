/*
    file : fn_hudActions.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.

	    Example:
		[] call c33_fnc_hudActions;

*/
if (isNull (uiNameSpace getVariable ["RscDisplayHud", displayNull])) then
{

	g_blood   = 100;
	g_fatigue = 100;
	g_hunger  = 100;
	g_thirst  = 100;
	g_mic     = 100;
	g_bag     = 100;

	("hudLayer" call BIS_fnc_rscLayer) cutRsc ["RscDisplayHud", "PLAIN"];
	[] spawn
	{
		disableSerialization;
		_hud = uiNameSpace getVariable ["RscDisplayHud", displayNull];

		_ctrl_gauge	= _hud displayCtrl 6650;
		_iconsPath  = getMissionPath "tontonCasi\Hud\icons";

		while {!(isNull _hud)} do
		{
			uiSleep 0.30;
			hint "let's gooo";

			//_ctrl_gauge ctrlSetStructuredText parseText format["<t align='right' size='1.3'>%1</t>", 666];
			_ctrl_gauge ctrlSetStructuredText parseText format
			[
				"<img size='4' opacity='100' align='right' image='%1\blood_100.paa'/>",
				_iconsPath
			];

			uiSleep 0.3;
		};
	};
};
