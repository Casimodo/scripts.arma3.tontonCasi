/*
    file : config_master.cpp

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/police_rp
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/

#define true 1
#define false 0

class tontonCasi_Peche { 

    className_CannePeche  = "vn_m_fishing_rod_01";
    msg_giveFish          = "Vous avez attrapé un %1 !";
    msg_notInWater        = "Vous n'êtes plus dans l'eau !";
    msg_notCanne          = "Vous devez avoir une canne à pêche équipée pour pêcher.";

    class poissonList {
        
        class salema {
            item  = "salema_raw";
            label = "Saumon";
        };
        class ornate {
            item  = "ornate_raw";
            label = "Doré";
        };
        class mackerel {
            item  = "mackerel_raw";
            label = "Maquereau";
        };
        class tuna {
            item  = "tuna_raw";
            label = "Thon";
        };
        class mullet {
            item  = "mullet_raw";
            label = "Mulet";
        };
        class catshark {
            item  = "catshark_raw";
            label = "Poisson Chat";
        };
        
    };
};  