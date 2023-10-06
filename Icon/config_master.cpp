/*
    file : config_master.cpp

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/

class tontonCasi_Icon { 


    class iconList {
        
        // ===============================================
        class cacaotier {
            long_distance   = -1;
            icon_pos[]      = {0,0,1.5};
            icon            = "ico_ramasser.paa";
            msg             = "ramasser";
        };
        class Land_vn_t_cacao_ripe_f : cacaotier {};
        class vn_t_cacao_ripe_f : cacaotier {};
        
        // ===============================================
        class cocotier {
            long_distance   = 1;
            icon_pos[]      = {0,0,1.5};
            icon            = "ico_ramasser.paa";
            msg             = "ramasser";
        };
        class vn_t_cocosnucifera3s_tall_f : cocotier {};
        class vn_t_cocosnucifera2s_small_f : cocotier {};

        // ===============================================
        class bananier {
            long_distance   = -1;
            icon_pos[]      = {2.6,0,1.5};
            icon            = "ico_ramasser.paa";
            msg             = "ramasser";
        };
        class vn_t_banana_slim_f : bananier {};
        class vn_t_banana_f : bananier {};

    };

};  
