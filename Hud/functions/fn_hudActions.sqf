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
	("hudLayer" call BIS_fnc_rscLayer) cutRsc ["RscDisplayHud", "PLAIN"];
	[] spawn
	{
		_cagoule_active = false;

		disableSerialization;
		_hud = uiNameSpace getVariable ["RscDisplayHud", displayNull];

		_ctrl_gauge	= _hud displayCtrl 66600;
		_iconsPath  = getMissionPath "tontonCasi\Hud\icons";

		while {!(isNull _hud)} do
		{
			uiSleep 0.30;

			_ctrl_gauge ctrlSetStructuredText parseText format
			[
				"<t align='right' font='RobotoRegular' size='1.3'>AA</t><t size='1.0' align='right'>BB </t> <img size='1.4' align='right' image='%1\sources.paa'/>",
				_iconsPath, 100
			];

			uiSleep 0.3;
		};
	};
};
