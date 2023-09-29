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

class tontonCasi_Farm { 

    class farmList {
        
        // ===============================================
        class cacaotier {
            name = "fève de cacao";
            condition = "";
            vitem = "cocoUnprocessed";
            max_amount = 8;
            animation = "";
            message = "Reste %1 sur le cacaotier";
        };
        class Land_vn_t_cacao_ripe_f : cacaotier {};
        
        // ===============================================
        class cocotier {
            name = "Caco";
            condition = "";
            vitem = "cocoUnprocessed";
            max_amount = 5;
            animation = "";
            message = "Reste %1 sur le cocotier";
        };
        class vn_t_cocosnucifera3s_tall_f : cocotier {};
        class vn_t_cocosnucifera2s_small_f : cocotier {};

        // ===============================================
        class bananier {
            name = "Banane";
            condition = "";
            vitem = "cocoUnprocessed";
            max_amount = 10;
            animation = "";
            message = "Reste %1 sur le bananier";
        };
        class vn_t_banana_slim_f : bananier {};

    };

};  