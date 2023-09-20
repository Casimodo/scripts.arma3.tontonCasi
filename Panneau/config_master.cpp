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

    licenceLegale   = "licence_civ_news";                                           // licence modification de panneau legal
    licenceIllegale = "licence_civ_insurge";                                        // licence modification de panneau legal
    tarifLegale     = 15;                       // Tarifs si changement 
    tarifIllegale   = 15000;                                        

    // Liste des images aléatoire qui sera affiché sur les panneaux
    textures[]      = {"pan_bienvenu.paa", "pan_num.paa", "pan_garage.paa"};        

    // Liste des panneaux compatibles avec le système 
    detectCalss[]   = {
        "SignAd_SponsorS_F", "SignAd_Sponsor_F", "Land_Noticeboard_F", "Land_Billboard_03_blank_F", "Land_Billboard_02_blank_F",
        "Land_Billboard_F", "Land_Billboard_04_blank_F"
    };

    // List des panneaux Legal
    class panneauLegale {
        
        class bienvenu {
            label   = "Bienvenu";
            picture = "pan_bienvenu.paa";
        };
        
        class numbersIle {
            label   = "Numeros Ile";
            picture = "pan_num.paa";
        };
        
        class infoGarage {
            label   = "Info. Garage";
            picture = "pan_garage.paa";
        };
    };
        
    // List des panneaux illegale
    class panneauIllegale {
        class insurgPann1 {
            label   = "Info. Garage";
            picture = "pan_garage.paa";
        };
        
        class insurgPann2 {
            label   = "Info. Garage";
            picture = "pan_garage.paa";
        };
    };
};  