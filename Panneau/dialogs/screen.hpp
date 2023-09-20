// Définition de la structure de la fenêtre de dialogue
class panneau_menu {
    idd = 66000;
    movingEnable = true;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.32;
            h = (1 / 25);
        };

        class MainBackGround: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.32;
            h = 0.6 - (22 / 250);
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0,0,0,0};
            idc = -1;
            text = "Choisir votre affiche";
            x = 0.1;
            y = 0.2;
            w = 0.32;
            h = (1 / 25);
        };

        class priceInfo: Life_RscStructuredText {
            idc = 66001;
            text = "";
            sizeEx = 0.035;
            x = 0.11;
            y = 0.68;
            w = 0.2;
            h = 0.2;
        };
    };

    class controls {
        class vehicleList: Life_RscListBox {
            idd = 66002;
            onLBSelChanged = "_this call life_fnc_chopShopSelection";
            sizeEx = 0.04;
            x = 0.11;
            y = 0.25;
            w = 0.3;
            h = 0.38;
        };

        class BtnSell: Life_RscButtonMenu {
            idc = -1;
            text = "Choisir";
            onButtonclick = "[] call life_fnc_chopShopSell;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class BtnClose: Life_RscButtonMenu {
            idc = -1;
            text = "Fermer";
            onButtonClick = "closeDialog 0";
            x = 0.1;
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};