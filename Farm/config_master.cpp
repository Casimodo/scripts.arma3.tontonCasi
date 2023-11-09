/*
    file : config_master.cpp

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : GNU GPLv3
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
            vitem           = "cacaoUnprocessed";
            max_amount      = 8;
            message         = "Reste %1 fève(s) de cacao sur le cacaotier";
            long_distance   = 1;
            animate         = "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
            requiredTools   = "";
            requiredMsg     = "";
            sounds[]        = {};
        };
        class vn_t_cacao_ripe_f : cacaotier {};
        class Land_vn_t_cacao_ripe_f : cacaotier {};
        
        // ===============================================
        class cocotier {
            vitem           = "cocoUnprocessed";
            max_amount      = 5;
            message         = "Reste %1 coco(s) sur le cocotier";
            long_distance   = 1;
            animate         = "Swing_Axe";
            requiredTools   = "vn_m_machete_02";
            requiredMsg     = "Vous avez besoins d'une machette";
            sounds[]        = {"axe_sound_1","axe_sound_2","axe_sound_3"};
        };
        class vn_t_cocosnucifera3s_tall_f : cocotier {};
        class Land_vn_t_cocosnucifera3s_tall_f : cocotier {};
        class vn_t_cocosnucifera2s_small_f : cocotier {};
        class Land_vn_t_cocosnucifera2s_small_f : cocotier {};

        // ===============================================
        class bananier {
            vitem           = "banane";
            max_amount      = 10;
            message         = "Reste %1 banane(s) sur le bananier";
            long_distance   = -1;
            animate         = "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
            requiredTools   = "";
            requiredMsg     = "";
            sounds[]        = {};
        };
        class vn_t_banana_slim_f : bananier {};
        class Land_vn_t_banana_slim_f : bananier {};
        class vn_t_banana_f : bananier {};
        class Land_vn_t_banana_f : bananier {};
        class vn_t_banana_wild_f : bananier {};
        class Land_vn_t_banana_wild_f : bananier {};

        // ===============================================
        class troncPin {
            vitem           = "tronc_pin";
            max_amount      = 5;
            message         = "Reste %1 tronc(s) sur le Pin";
            long_distance   = 1;
            animate         = "Swing_Axe";
            requiredTools   = "Axe"; // vn_m_axe_01
            requiredMsg     = "Vous devez utiliser une hache";
            sounds[]        = {"axe_sound_1","axe_sound_2","axe_sound_3"};
        };
        class vn_t_palaquium_f : troncPin {};
        class Land_vn_t_palaquium_f : troncPin {};
        class vn_d_fallenbranch_lc_f : troncPin {};
        class Land_vn_d_fallenbranch_lc_f : troncPin {};
        class vn_d_fallentrunk_branches_lc_f : troncPin {};
        class Land_vn_d_fallentrunk_branches_lc_f : troncPin {};
        class vn_d_fallentrunk_roots_lc_f : troncPin {};
        class Land_vn_d_fallentrunk_roots_lc_f : troncPin {};        


    };

};  
