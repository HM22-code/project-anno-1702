unit unit_texte;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, GestionEcran, unit_variable;

function txt(numTexte: Integer):String;

implementation

{faire venir les variables avec un procédure dans unit_variable
convertir à l'aide d'une fonction ou procédure les variables de type integer en string}
function txt(numTexte: Integer):String;
var
  nom_ile,emplacement:String;

begin
  nom_ile:='Coatiwe';
  emplacement:='79';

  case(numTexte) of
    1: txt:='Bienvenue sur : ' + nom_ile;
    2: txt:='Nom du joueur   :   ';
    3: txt:='Or              :   '+ IntToStr(getGold());
    4: txt:='Nom utilisateur : ' + getName();
    5: txt:=' Création d''nouvelle partie';
    6: txt:='Nom de l''île             :                     ' + nom_ile;
    7: txt:='Propriétaire             :                     ' + getName();
    8: txt:='Emplacements             :                     ' + emplacement;
    10: txt:='Nombre de Colons         :                     ' + IntToStr(getColons()) + '/40';
    11: txt:='Quantité de Poissons           :                   ' + IntToStr(getPoissons())+ '/40';
    12: txt:='Quantité de Bois               :                   ' + IntToStr(getBois())+ '/40';
    13: txt:='Quantité de d''Outils           :                   ' + IntToStr(getOutils())+ '/40';
    14: txt:='Quantité de Laine              :                   ' + IntToStr(getLaine())+ '/40';
    15: txt:='Quantité de Tissu              :                   ' + IntToStr(getTissu())+ '/40';
    16: txt:='Description';
    17: txt:='Liste des Habitants';
    18: txt:='Liste des Ressources';
    20: txt:='Tour suivant (appuyez sur 1 puis entree)';
    21: txt:='Accéder au menu de gestion des bâtiments (appuyez sur 2 puis entree)';
    22: txt:='Gestion des bâtiments de ' + nom_ile;
    23: txt:='Maisons';
    24: txt:='1 Maisons de Colons           :                     ' + IntToStr(getMaisonsColons());
    25: txt:='2 Maisons de Citoyens         :                     ' + IntToStr(getMaisonsCitoyens());
    26: txt:='Social et militaire';
    27: txt:='3 Entrepots                   :                     ' + IntToStr(getEntrepots());
    28: txt:='4 Centres-villes              :                     ' + IntToStr(getCentresVilles());
    29: txt:='5 Chapelles                   :                     ' + IntToStr(getChapelles());
    30: txt:='Industries';
    31: txt:='6 Cabanes de bucheron         :                     ' + IntToStr(getCabanesBucheron());
    32: txt:='7 Cabanes de pêcheur          :                     ' + IntToStr(getCabanesPecheur());
    33: txt:='8 Bergeries                   :                     ' + IntToStr(getBergeries());
    34: txt:='9 Ateliers de tisserands     :                     ' + IntToStr(getAteliersTisserands());
    35: txt:='Construire un bâtiment (appuyez sur 1 puis entree)';
    36: txt:='Detruire un bâtiment (appuyez sur 2 puis entree)';
    37: txt:='Ne rien détruire (appuyez sur 0 puis entree)';
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
    57: txt:='6 Cabanes de bucheron         50 or, 3 Outils';
    58: txt:='7 Cabanes de pêcheur          100 or, 5 Bois, 3 Outils';
    59: txt:='8 Bergeries                   200 or, 4 Bois, 2 Outils';
    60: txt:='9 Ateliers de tisserands      300 or, 3 Bois, 2 Outils';
    61: txt:='Ne rien construire (appuyez sur 0 puis entree)';
    62: txt:='Fin de tour - '+nom_ile;
    63:
       if getColons() = 0 then
          txt:='Vous n''avez pas encore de colons sur l''île.'
       else
          txt:='Vous avez '+ IntToStr(getColons())+ ' colons sur l''île.';
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
    80: txt:='-- Nouvelle partie --';
    81: txt:='-- Quitter --';
    82: txt:='(Appuyez sur 1 puis Entrée)';
    83: txt:='(Appuyez sur 2 puis Entrée)';
    84: txt:='Rencontre avec le Franc-Marchand - '+ nom_ile;
    // Interface marchand
    85: txt:='Poissons                 :           '+ IntToStr(getPoissons())+ '/40';
    86: txt:='Bois                     :           '+ IntToStr(getBois())+ '/40';
    87: txt:='Outils                   :           '+ IntToStr(getOutils())+ '/40';
    88: txt:='Laine                    :           '+ IntToStr(getLaine())+ '/40';
    89: txt:='Tissu                    :           '+ IntToStr(getTissu())+ '/40';
    90: txt:='Vendre(10)     Vendre(5)     Vendre(1)';
    91: txt:='Acheter(10)     Acheter(5)     Acheter(1)';
    100: txt:='';
    101: txt:='Appuyez sur 0 puis entrée pour passer';
    102: txt:='Appuyez sur les touches de votre pavé numérique pour séléctionner un bâtiment';
    103: txt:='(Le numéro des bâtiments est indiqué à côté de ces derniers)';

  end;
end;


end.

