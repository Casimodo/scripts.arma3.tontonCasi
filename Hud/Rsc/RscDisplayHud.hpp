/*
    file : RscDisplayHud.hpp

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : GNU GPLv3
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/
class RscDisplayHud
{
	idd=-1;
	name="RscDisplayHud";
	onLoad="uiNamespace setVariable [""RscDisplayHud"",_this select 0]";
	movingEnable=0;
	fadein=6;
	duration=9999999999999;
	fadeout=0;
	class controlsBackground
	{
		/*===========================
		  ===    TontonCasi HUD   ===
		  =========================== */
		class HUD_GAUGE: RscStructuredText
		{
			idc=66600;

			x=0.922813 * safezoneW + safezoneX;
			y=0.511 * safezoneH + safezoneY;
			w=0.0773437 * safezoneW;
			h=0.044 * safezoneH;
		};

	class controls {};
};
