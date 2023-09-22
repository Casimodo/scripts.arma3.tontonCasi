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

class tontonCasi_Panneau { 

    itemLegale     = "panneau_papier";                  // vItem legal requis pour avoir accès au panneau ==> [true,"panneau_papier",1] call life_fnc_handleInv;
    itemIllegale   = "panneau_papier_sale";              // vItem illegal requis pour avoir accès au panneau (illégaux)

    // Liste des images aléatoire qui sera affiché sur les panneaux
    textures[]      = {"pan_bienvenu.paa", "pan_num.paa", "pan_garage.paa"};        

    // Liste des panneaux compatibles avec le système 
    detectCalss[]   = {
        "SignAd_SponsorS_F", "SignAd_Sponsor_F", "Land_Noticeboard_F", "Land_Billboard_03_blank_F", "Land_Billboard_02_blank_F",
        "Land_Billboard_F", "Land_Billboard_04_blank_F"
    };

    // List des panneaux
    class panneauList {
        
        // Panneaux légal
        class bienvenu {
            label   = "Bienvenu";
            picture = "pan_bienvenu.paa";
            legal   = 1;
        };
        
        class numbersIle {
            label   = "Numeros Ile";
            picture = "pan_num.paa";
            legal   = 1;
        };
        
        class infoGarage {
            label   = "Info. Garage";
            picture = "pan_garage.paa";
            legal   = 1;
        };

        // Panneaux non légal
        class insurgPann1 {
            label   = "Exemple rebel 1";
            picture = "pan_rebel.paa";
            legal   = 0;
        };
        
        class insurgPann2 {
            label   = "Exemple rebel 2";
            picture = "pan_rebel1.paa";
            legal   = 0;
        };
    };
};  