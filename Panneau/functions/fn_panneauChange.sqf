/*
    file : fn_panneauChange.sqf

    Author: tontonCasi [Twitch : https://www.twitch.tv/tontoncasi]
    Licence : MIT
    Source : https://github.com/Casimodo/scripts.arma3.tontonCasi
    Terms of use:
      This file comes from a source code covered by the MIT license please respect this. 
      All component files this code is filed, signed and certified with the competent international authority 
      in order to enforce copyright and ensure proof of an MIT license, thank you to respect that.
*/

private["_pClassName", "_panneauList", "_legal", "_vItemPapier", "_panneau", "_config", "_objectName", "_texture", "_path", "_distance", "_playerPos", "_detectCalss", "_nearbyObjects", "_texturesPath", "_textureIndex"];


_pClassName  = lbData[6002,(lbCurSel 6002)];
closeDialog 0;  // ferme la fenetre de choix

_config         = missionConfigFile >> "tontonCasi_Panneau";
_panneauList    = (_config >> "panneauList");
_panneau        = (_panneauList >> _pClassName);
_texturesPath   = "tontonCasi\Panneau\textures";
_detectCalss    = getArray(_config >> "detectCalss");

_texture        = getText(_panneau >> "picture");
_legal          = getNumber(_panneau >> "legal");
_path           = format ["%1\%2", _texturesPath, _texture];

// déduction de l'item à supprimer
_vItemPapier = getText(_config >> "itemLegale");
if (_legal isEqualTo 0) then {
    _vItemPapier = getText(_config >> "itemIllegale");
};
            
// Suppression de l'item dans l'inventaire
if !([false,_vItemPapier,1] call life_fnc_handleInv) exitWith {
    hint "Vous n'avez plus assez de papier pour changer l'affiche.";
};

// Définir le rayon de détection autour du joueur (en mètres)
_distance = 17;

// Obtenir la position du joueur
_playerPos = getPos player;

// Utiliser nearestObjects pour trouver les objets autour du joueur
_nearbyObjects = nearestObjects [_playerPos, [], _distance];

private _foundObject = false;            
{
    _objectName = typeOf _x;
    _myObject = _x;

    // Recherche si l'objet est l'un des panneaux connus ont le retient le premier trouvé
    if (_objectName in _detectCalss) exitWith {
        
        (_myobject) setobjecttextureGlobal [0, _path];
        (_myobject) setobjecttextureGlobal [1, _path]; 

    };
} forEach _nearbyObjects;
