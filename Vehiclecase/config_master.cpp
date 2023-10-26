/*
    file : config_master.cpp

    Author: tontonCasi {Twitch : https://www.twitch.tv/tontoncasi}
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/

/**
Pour trouver les positions utiliser le code ci-dessous

--- Test position --------
{  
  _vehicule = _x;  
  {  
         
    _contener = _x;  
    deleteVehicle _x;  
          
  } forEach attachedObjects _vehicule;  
} forEach nearestObjects [player, ["Car"], 15];  
  
_pos = [[0.0234375,-0.27832,1.42702]];   
{   
  _newObject = createVehicle ["Land_FoodSacks_01_small_brown_F", (getPos player), [], 0, "CAN_COLLIDE"]; 
  _newObject attachTo [cursorTarget , _x];  
} forEach _pos;

----- Get position on vehicule ------
_case = "Land_FoodSacks_01_small_brown_F"; 
_carPos = position cursorObject; 
_nearbyCases = nearestObjects[_carPos, [_case], 20]; 
_caseList = []; 
{   
    _distance =  (position _x) vectorDiff _carPos; 
    _caseList pushBack _distance; 
} forEach _nearbyCases; 
hint str _caseList;
copyToClipboard str _caseList;

-----------------------------------------------------------------------------*/

#define true 1
#define false 0

class tontonCasi_Vehiclecase { 

    carton_case  = "carton_militaire_contener";

    class vehicle_list {

        class vn_c_car_04_01 {
            case = "Land_FoodSacks_01_small_brown_F";
            position[] = {
                {-0.427734,-0.447266,-0.43},{0.410156,-0.475586,-0.43},{-0.392578,0.349609,-0.43},{0.445313,0.321289,-0.43},{-0.43457,-1.16699,-0.43},{0.40332,-1.19531,-0.43},
                {-0.365234,-0.429688,-0.05},{0.504883,-0.454102,-0.05},{-0.402344,0.342773,-0.05},{0.467773,0.318359,-0.05},{-0.375,-1.20215,-0.05},{0.495117,-1.22656,-0.05}, 
                {-0.21875,-0.407227,0.32},{0.0673828,0.356445,0.30},{0.195313,-1.18555,0.34} 
            };
        };

        class vn_c_car_02_01 {
            case = "vn_prop_sandbag_02";
            position[] = {
                {0.0273438,-1.25293,-0.65},{-0.0185547,0.0439453,0.15},{-0.0332031,-0.394531,0.15},{-0.0292969,-0.141602,0.28},{0.0566406,-0.789063,0.15},{-0.000976563,-1.52148,-0.55},{0.0683594,-0.637695,0.27},{-0.0585938,-1.62402,-0.65} 
            };
        };

        class vn_b_wheeled_m274_01_01 {
            case = "Land_FoodSacks_01_small_brown_F";
            position[] = {
                {0.0175781,-0.0332031,-0.5},{-0.0341797,-0.900391,-0.5},{-0.0234375,-0.0390625,-0.15},{-0.0361328,-0.708008,-0.15} 
            };
        };

        class vn_c_car_03_01 {
            case = "vn_prop_sandbag_02";
            position[] = {
                {0.0,0.04,0.15}, {0.0,-0.56,0.15}, {0.0,-0.25,0.22}, {0.0,0.00,0.25}, {0.0,-0.52,0.23}
            };
            galerieClass = "C33_furniture_galerie_voiture"
            galeriePosi[] = {0.0234375,-0.27832,0.27};
        };

    };
};  