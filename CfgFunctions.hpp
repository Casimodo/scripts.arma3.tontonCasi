/*
   file : CfgFunctions.hpp

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/

class C33_Client_Core
{
	tag = "c33";

	class panneau
	{
		file = "tontonCasi\Panneau\functions";
		class panneauActions {};
		class panneauChange {};
		class panneauAleatoire {};
	};

	class peche
	{
		file = "tontonCasi\Peche\functions";
		class pecheActions {};
	};

	class farm
	{
		file = "tontonCasi\Farm\functions";
		class farmActions {};
		class farmDetect {};
	};
};