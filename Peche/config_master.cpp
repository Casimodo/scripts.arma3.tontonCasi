/*
    Author: tontonCasi [Steam UID: https// steamcommunity.com/id/Casimodo33/]
    Twitch : https://www.twitch.tv/tontoncasi
    file : config_master.cpp

    Terms of use:
      - This file is forbidden unless you have permission from the author. If you have this file without permission to use it please do not use it and do not share it.
      - If you have permission to use this file, you can use it on your server however it is strictly forbidden to share it.
      - Out of respect for the author please do not delete this information.

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