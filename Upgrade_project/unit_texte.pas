unit unit_texte;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, unit_variable;

function txt(numTexte: Integer):String;

implementation

//fonction qui renvoie un texte en fonction du numéro qu'on lui donne en paramètre (pratique pour éviter de rendre illisible les autres unit et le prog principal)
function txt(numTexte: Integer):String;

begin

  case(numTexte) of
    1: txt:='Bienvenue sur : ' + getIle();
    2: txt:='Nom du joueur   :   ';
    3: txt:='Or              :   '+ IntToStr(getGold());
    4: txt:='Nom utilisateur : ' + getName();
    5: txt:=' Création d''nouvelle partie';
    6: txt:='Nom de l''île             :                     ' + getIle();
    7: txt:='Propriétaire             :                     ' + getName();
    8: txt:='Emplacements             :                     ' + IntToStr(getEmplacement());
    10: txt:='Nombre de Colons         :                     ' + IntToStr(getColons());
    11: txt:='Quantité de Poissons           :                   ' + IntToStr(getPoissons())+ '/'+IntToStr(getStockage());
    12: txt:='Quantité de Bois               :                   ' + IntToStr(getBois())+ '/'+IntToStr(getStockage());
    13: txt:='Quantité de d''Outils           :                   ' + IntToStr(getOutils())+ '/'+IntToStr(getStockage());
    14: txt:='Quantité de Laine              :                   ' + IntToStr(getLaine())+ '/'+IntToStr(getStockage());
    15: txt:='Quantité de Tissu              :                   ' + IntToStr(getTissu())+ '/'+IntToStr(getStockage());
    16: txt:='Description';
    17: txt:='Liste des Habitants';
    18: txt:='Liste des Ressources';
    20: txt:='Tour suivant (appuyez sur 1 puis entree)';
    21: txt:='Accéder au menu de gestion des bâtiments (appuyez sur 2 puis entree)';
    22: txt:='Gestion des bâtiments de ' + getIle();
    23: txt:='Maisons';
    24: txt:='1 Maisons de Colons           :                     ' + IntToStr(getMaisonsColons());
    25: txt:='2 Maisons de Citoyens         :                     ' + IntToStr(getMaisonsCitoyens());
    26: txt:='Social et militaire';
    27: txt:='3 Entrepots                   :                     ' + IntToStr(getEntrepots());
    28: txt:='4 Centres-villes              :                     ' + IntToStr(getCentresVilles());
    29: txt:='5 Chapelles                   :                     ' + IntToStr(getChapelles());
    30: txt:='Industries';
    31: txt:='7 Cabanes de bucheron         :                     ' + IntToStr(getCabanesBucheron());
    32: txt:='8 Cabanes de pêcheur          :                     ' + IntToStr(getCabanesPecheur());
    33: txt:='9 Bergeries                   :                     ' + IntToStr(getBergeries());
    34: txt:='10 Ateliers de tisserands     :                     ' + IntToStr(getAteliersTisserands());
    35: txt:='Construire un bâtiment (appuyez sur 1 puis entrée)';
    36: txt:='Detruire un bâtiment (appuyez sur 2 puis entrée)';
    37: txt:='Ne rien détruire (appuyez sur 0 puis entrée)';
    38: txt:='Vous ne disposez pas de batiment de ce type !';
    39: txt:='Erreur';
    40: txt:='Réussi';
    41: txt:='Destruction du batiment réussi !';
    42: txt:='Construction du batiment réussi !';
    43: txt:='Vous ne disposez pas d''assez de ressources !';

    44: txt:='Retour à l''écran de gestion de l''île (appuyez sur 0 puis entree)';
    50: txt:='Quitter le jeu (appuyez sur 0 puis entree)';

    52: txt:='1 Maisons de Colons           2 Bois';
    53: txt:='2 Maisons de Citoyens         1 Bois, 1 Outils, 1 Maison de colons';
    54: txt:='3 Entrepots                   200 or, 5 Bois, 3 Outils';
    55: txt:='4 Centres-villes              200 or, 8 Bois, 4 Outils';
    56: txt:='5 Chapelles                   300 or, 6 Bois, 3 Outils';
    57: txt:='7 Cabanes de bucheron         50 or, 3 Outils';
    58: txt:='8 Cabanes de pêcheur          100 or, 5 Bois, 3 Outils';
    59: txt:='9 Bergeries                   200 or, 4 Bois, 2 Outils';
    60: txt:='10 Ateliers de tisserands     300 or, 3 Bois, 2 Outils';
    61: txt:='Ne rien construire (appuyez sur 0 puis entree)';
    62: txt:='Fin de tour - '+getIle();
    63:
       if getColons() = 0 then
          txt:='Vous n''avez pas encore de colons sur l''île.'
       else
          txt:='Vous avez '+ IntToStr(getColons())+ ' colons sur l''île.';
    68:
       if getCitoyens() = 0 then
          txt:='Vous n''avez pas encore de citoyens sur l''île.'
       else
          txt:='Vous avez '+ IntToStr(getCitoyens())+ ' citoyens sur l''île.';
    64: txt:='  Population  ';
    65: txt:='  Industries  ';
    66:
       if getCabanesBucheron() > 0 then
          txt:='Les cabanes de bucheron ont produit : '+ IntToStr(getCabanesBucheron())+ ' unités de Bois.'
       else
         txt:=' ';
    67:
       if getCabanesPecheur() > 0 then
          txt:='Les cabanes de pêcheur ont produit : '+ IntToStr(getCabanesPecheur()*2)+ ' unités de Poissons.'
       else
         txt:=' ';
    70: txt:='Tour : ' + IntToStr(getTour());
    71: txt:='6 Chantier naval              :                     '+ IntToStr(getChantierNaval());
    72: txt:='6 Chantier naval              2000 or, 30 Bois, 10 Outils';
    73: txt:='Gestion des navires';
    74: txt:='Liste des navires';
    75: txt:='Construire un navire d''exploration (appuyez sur 1)';
    76: txt:='(12 bois, 8 tissus)';
    77: txt:='Retour à l''écran précédent (appuyez sur 0)';
    78: txt:='Accéder au menu de gestion des navires (appuyez sur 4)';
    79: txt:='Vous n''avez pas de chantier naval sur cette île ! (appuyez sur entrée)';
    80: txt:='Vous ne pouvez plus construire ce batiment';
    81: txt:='Ne rien construire (appuyez sur 0 puis entrée)';
    82: txt:='Nom du navire : ';
    83: txt:='Navire d''exploration : ';
    84: txt:='Vous n''avez pas de navire';
    85: txt:='Séléctionnez un navire (appuyez sur 3 puis sur le numéro correspondant à celui du navire)';
    86: txt:='Partir à l''exploration ! (appuyez sur 1)';
    87: txt:='Le navire séléctionné n''existe pas !';
    88: txt:='Numéro du navire : ';
    89: txt:='Votre navire partira à l''exploration au prochain tour !';
    90: txt:='Allez sur l''ile suivante (appuyez sur 3)';
    91: txt:='Allez d''abord explorer les mers avec un navire d''exploration !';
    92: txt:='(Appuyez sur 1 puis Entrée)';
    93: txt:='(Appuyez sur 2 puis Entrée)';
    94: txt:='Rencontre avec le Franc-Marchand - '+ getIle();
    // Interface marchand
    95: txt:='Poissons                 :           '+ IntToStr(getPoissons())+ '/'+IntToStr(getStockage());
    96: txt:='Bois                     :           '+ IntToStr(getBois())+ '/'+IntToStr(getStockage());
    97: txt:='Outils                   :           '+ IntToStr(getOutils())+ '/'+IntToStr(getStockage());
    98: txt:='Laine                    :           '+ IntToStr(getLaine())+ '/'+IntToStr(getStockage());
    99: txt:='Tissu                    :           '+ IntToStr(getTissu())+ '/'+IntToStr(getStockage());
    100: txt:='Vendre(10)     Vendre(5)     Vendre(1)';
    101: txt:='Acheter(10)     Acheter(5)     Acheter(1)';
    102: txt:='Comment veux-tu charger une partie si tu n''as jamais joué ?';
    103: txt:='Changer d''île';
    104: txt:='Ile disponible';
    105: txt:='Atterir sur une nouvelle île (appuyez sur 1)';
    106: txt:='Changer d''île (appuyez sur 2 puis sur le numéro correspondant à celui de l''île)';
    107: txt:=' (vous êtes ici)';
    108: txt:='Nombre de navires : ' + IntToStr(getNbNavire());
    109: txt:='(au quai de '+getIle()+')';
    110: txt:='(arrivé à '+getIle()+')';
    111: txt:='(en mer)';
    112: txt:='Ce navire ne peut plus être utilisé !';
    113: txt:='Navire de colonisation : ';
    114: txt:='Construire un navire de colonisation (appuyez sur 2)';
    115: txt:='(32 bois, 16 tissus, 20 outils)';
    117: txt:='Construisez un navire de colonisation ou attendez qu''il arrive !';
    118: txt:='Votre bâteau de colonisation n''est pas sur cette île !';
    119: txt:='Aucun navire d''exploration n''est arrivé sur une île';
    120: txt:='Choix de difficulté de votre partie (appuyez sur: 1 pour facile / 2 pour normal / 3 pour difficile) : ';
    121: txt:='Appuyez sur 0 puis entrée pour passer';
    122: txt:='Vous avez atteint le nombre maximal de navires';
    123: txt:='Appuyez sur les touches de votre pavé numérique pour séléctionner un bâtiment';
    124: txt:='(Le numéro des bâtiments est indiqué à côté de ces derniers)';

    200: txt:='                      █████ █     ██        █████ █     ██        █ ███    ';
    201: txt:='     █████         ██████  ██    ████ █  ██████  ██    ████ █    █  ████   ';
    202: txt:='    █  ███        ██   █  █ ██    ████  ██   █  █ ██    ████    █  █  ███  ';
    203: txt:='       ███       █    █  █  ██    █ █  █    █  █  ██    █ █    █  ██   ███ ';
    204: txt:='      █  ██          █  █    ██   █        █  █    ██   █     █  ███    ███';
    205: txt:='      █  ██         ██ ██    ██   █       ██ ██    ██   █    ██   ██     ██';
    206: txt:='     █    ██        ██ ██     ██  █       ██ ██     ██  █    ██   ██     ██';
    207: txt:='     █    ██        ██ ██     ██  █       ██ ██     ██  █    ██   ██     ██';
    208: txt:='    █      ██       ██ ██      ██ █       ██ ██      ██ █    ██   ██     ██';
    209: txt:='    █████████       ██ ██      ██ █       ██ ██      ██ █    ██   ██     ██';
    210: txt:='   █        ██      █  ██       ███       █  ██       ███     ██  ██     ██';
    211: txt:='   █        ██         █        ███          █        ███      ██ █      █ ';
    212: txt:='  █████      ██    ████          ██      ████          ██       ███     █  ';
    213: txt:=' █   ████    ██ █ █  █████              █  █████                 ███████   ';
    214: txt:='█     ██      ██ █     ██              █     ██                    ███     ';
    215: txt:='█                █                     █                                   ';
    216: txt:=' █                █                     █                                  ';
    217: txt:='  ██               ██                    ██                                ';

    218: txt:='/ \---------------------------------------------------, ';
    219: txt:='\_,|      __      _______      ____        _____      | ';
    220: txt:='   |     /  |    |  ___  |   /.    .\     / ___ \.    | ';
    221: txt:='   |     \| |    |_/  / /   |  .--.  |   |_/___) |    | ';
    222: txt:='   |      | |        / /    | |    | |    ./____.     | ';
    223: txt:='   |     _| |_      / /     |  \--/  |   / /____      | ';
    224: txt:='   |    |_____|    /_/       \.____./    |_______|    | ';
    225: txt:='   |                                                  | ';
    226: txt:='   |  ,-------------------------------------------------';
    227: txt:='   \_/________________________________________________/ ';

    228:
       txt:='████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████';
    230: txt:='  ___________________________';
    231: txt:='((                           ))';
    232: txt:=' ))  -- Nouvelle partie --  ((';
    233: txt:='((      (Appuyez sur 1)      ))';
    234: txt:=' ))                         ((';
    235: txt:='((       -- Quitter --       ))';
    236: txt:=' ))     (Appuyez sur 2)     ((';
    237: txt:='((                           ))';
    238: txt:=' )) -- Reprendre  partie -- ((';
    239: txt:='((      (Appuyez sur 3)      ))';
    240: txt:='  ---------------------------';

  end;
end;


end.

