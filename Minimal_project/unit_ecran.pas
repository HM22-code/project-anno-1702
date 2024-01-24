unit unit_ecran;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses GestionEcran, unit_texte, unit_variable;

//Cette procédure affiche l'écran d'accueil
procedure accueil();

//Cette procédure affiche l'écran ou le joueur écrit le nom qu'il souhaite
procedure creer_partie();

//Cette procédure affiche l'écran des évènements lorsque l'on passe un tour
procedure fin_tour();

//Cette procédure affiche l'écran d'échange avec le marchand
procedure interface_marchand();

//Cette procédure affiche l'écran d'échange de poisson
procedure marchand_poisson();

//Cette procédure affiche l'écran d'échange de bois
procedure marchand_bois();

//Cette procédure affiche l'écran d'échange d'outils
procedure marchand_outils();

//Cette procédure affiche l'écran d'échange de laine
procedure marchand_laine();

//Cette procédure affiche l'écran d'échange de tissu
procedure marchand_tissu();

//Cette procédure affiche l'écran de gestion de l'île
procedure interface_ile();

//Cette procédure affiche l'écran de gestion des batiments
procedure interface_batiment();

//Cette procédure affiche l'écran de création de batiments
procedure creer_batiment();

//Cette procédure affiche l'écran de destruction de batiments
procedure detruire_batiment();

//Cette procédure permet d'afficher un cadre de message d'erreur ou de réussite
procedure cadre_info(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte1:Integer;numTexte2:Integer);

//Cette procédure permet d'afficher des cadres sur l'écran
procedure cadre1(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte:Integer);

//Cette procédure permet d'afficher la bannière qui cadre l'écran
procedure banniere(y,numTexte:Integer);

//Cette procédure permet de réaliser la construction ou la destruction de bâtiments ou sinon d'afficher un cadre de message d'erreur ou de réussite pour la destruction ou la création
procedure construDestru(choix:Integer;numProcedure:Integer);

implementation

procedure accueil();
var
   coo:coordonnees;
begin
     //Affichage des cadres
     dessinerCadreXY(84,40,116,48,simple,14,0);

     //Affichage des textes
     couleurTexte(3);
     coo.x:=90;
     coo.y:=42;
     ecrireEnPosition(coo,txt(80));
     coo.x:=87;
     coo.y:=43;
     ecrireEnPosition(coo,txt(82));
     coo.x:=94;
     coo.y:=45;
     ecrireEnPosition(coo,txt(81));
     coo.x:=87;
     coo.y:=46;
     ecrireEnPosition(coo,txt(83));
     deplacerCurseurXY(100,54);


end;

procedure creer_partie();
var
  coo:coordonnees;
begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,5);

     //Affichage des textes
     couleurTexte(15);

     coo.x:=10;
     coo.y:=8;
     ecrireEnPosition(coo,txt(4));

     deplacerCurseurXY(28,8);
end;

procedure fin_tour();

var
   coo : coordonnees;

begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,62);
     dessinerCadreXY(1,10,198,10, simple, 15, 0);
     dessinerCadreXY(1,19,198,19, simple, 15, 0);

     //Affichage des textes
     coo.x:=37;
     coo.y:=12;
     ecrireEnPosition(coo,txt(63));
     coo.x:=14;
     coo.y:=10;
     ecrireEnPosition(coo,txt(64));
     coo.y:=19;
     ecrireEnPosition(coo,txt(65));
     coo.y:=21;
     coo.x:=37;
     ecrireEnPosition(coo,txt(66));
     coo.y:=22;
     ecrireEnPosition(coo,txt(67));

     coo.x:=85;
     coo.y:=56;
     ecrireEnPosition(coo,txt(121));

     if getMaisonsColons() > 0 then
        setColons(getMaisonsColons());
     if getColons() > 0 then
        setPoissons(-1);
     if getCabanesBucheron() > 0 then
        setBois(getCabanesBucheron());
     if getCabanesPecheur() > 0 then
        setPoissons(2*getCabanesPecheur());

     deplacerCurseurXY(100,40);

end;

procedure interface_marchand();
var
   coo:coordonnees;
begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,84);

     //Affichage des textes
     coo.x:=12;
     coo.y:=3;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(2));
     coo.y:=5;
     ecrireEnPosition(coo,txt(3));
     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());
     couleurTexte(15);
     dessinerCadreXY(13,11,189,54, simple, 15, 0);
     dessinerCadreXY(91,10,110,12, simple, 15, 0);
     // Mise en forme de l'aspect marchandise
     coo.x:=97;
     coo.y:=11;
     ecrireEnPosition(coo,'Commerce');
     coo.x:=20;
     coo.y:=14;
     ecrireEnPosition(coo,txt(85));
     coo.x:=76;
     ecrireEnPosition(coo,txt(90));
     coo.x:=124;
     ecrireEnPosition(coo,'3');
     coo.x:=136;
     ecrireEnPosition(coo,txt(91));
     coo.x:=20;
     coo.y:=15;
     ecrireEnPosition(coo,txt(86));
     coo.x:=76;
     ecrireEnPosition(coo,txt(90));
     coo.x:=124;
     ecrireEnPosition(coo,'5');
     coo.x:=136;
     ecrireEnPosition(coo,txt(91));
     coo.x:=20;
     coo.y:=16;
     ecrireEnPosition(coo,txt(87));
     coo.x:=76;
     ecrireEnPosition(coo,txt(90));
     coo.x:=124;
     ecrireEnPosition(coo,'15');
     coo.x:=136;
     ecrireEnPosition(coo,txt(91));
     coo.x:=20;
     coo.y:=17;
     ecrireEnPosition(coo,txt(88));
     coo.x:=76;
     ecrireEnPosition(coo,txt(90));
     coo.x:=124;
     ecrireEnPosition(coo,'8');
     coo.x:=136;
     ecrireEnPosition(coo,txt(91));
     coo.x:=20;
     coo.y:=18;
     ecrireEnPosition(coo,txt(89));
     coo.x:=76;
     ecrireEnPosition(coo,txt(90));
     coo.x:=124;
     ecrireEnPosition(coo,'8');
     coo.x:=136;
     ecrireEnPosition(coo,txt(91));
     // Infos sur la façon dont on peut choisir l'objet voulu
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'Appuyez sur les touches de 1 à 5 du pavé numérique, puis entrée pour séléctionner l''objet souhaité');
     // Infos sur la façon dont on doit quitter l'interface
     coo.x:=65;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner sur l''écran de gestion de l''île');
end;


procedure marchand_poisson();
var
   coo:coordonnees;
begin
     interface_marchand();
     ColorierZone(9,0, 15,43,14);
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'  Appuyez sur les touches de 1 à 6 du pavé numérique, puis entrée pour réaliser l''action souhaitée');
     coo.x:=88;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner à la séléction de l''objet à vendre/acheter');
end;

procedure marchand_bois();
var
   coo:coordonnees;
begin
     interface_marchand();
     ColorierZone(9,0, 15,43,15);
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'  Appuyez sur les touches de 1 à 6 du pavé numérique, puis entrée pour réaliser l''action souhaitée');
     coo.x:=88;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner à la séléction de l''objet à vendre/acheter');
end;

procedure marchand_outils();
var
   coo:coordonnees;
begin
     interface_marchand();
     ColorierZone(9,0, 15,43,16);
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'  Appuyez sur les touches de 1 à 6 du pavé numérique, puis entrée pour réaliser l''action souhaitée');
     coo.x:=88;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner à la séléction de l''objet à vendre/acheter');
end;

procedure marchand_laine();
var
   coo:coordonnees;
begin
     interface_marchand();
     ColorierZone(9,0, 15,43,17);
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'  Appuyez sur les touches de 1 à 6 du pavé numérique, puis entrée pour réaliser l''action souhaitée');
     coo.x:=88;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner à la séléction de l''objet à vendre/acheter');
end;

procedure marchand_tissu();
var
   coo:coordonnees;
begin
     interface_marchand();
     ColorierZone(9,0, 15,43,18);
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'  Appuyez sur les touches de 1 à 6 du pavé numérique, puis entrée pour réaliser l''action souhaitée');
     coo.x:=88;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner à la séléction de l''objet à vendre/acheter');
end;


procedure interface_ile();
var
  coo:coordonnees;
begin
     //Affichage des cadres
     changerTailleConsole(200,60);
     banniere(1,1);
     cadre1(11,10,10,14,3,16);
     cadre1(11,24,10,14,3,17);
     cadre1(105,10,46,14,3,18);

     //Affichage des textes
     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=12;
     coo.y:=4;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(3));                       //Or

     coo.x:=19;
     coo.y:=13;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(6));                       //Nom de l'île

     coo.x:=19;
     coo.y:=14;
     ecrireEnPosition(coo,txt(7));                       //Propriétaire

     coo.x:=19;
     coo.y:=15;
     ecrireEnPosition(coo,txt(8));                       //Emplacements

     coo.x:=19;
     coo.y:=27;
     ecrireEnPosition(coo,txt(10));                       //Nombre de Colons

     coo.x:=33;
     coo.y:=38;
     ecrireEnPosition(coo,txt(20));                       //Tour suivant

     coo.x:=19;
     coo.y:=40;
     ecrireEnPosition(coo,txt(21));                       //Gestion bâtiments

     coo.x:=32;
     coo.y:=56;
     ecrireEnPosition(coo,txt(50));                      //Quitter le jeu

     coo.x:=113;
     coo.y:=13;
     ecrireEnPosition(coo,txt(11));                      //Quantité de poissons

     coo.x:=113;
     coo.y:=14;
     ecrireEnPosition(coo,txt(12));                      //Quantité de bois

     coo.x:=113;
     coo.y:=15;
     ecrireEnPosition(coo,txt(13));                      //Quantité d'outils

     coo.x:=113;
     coo.y:=16;
     ecrireEnPosition(coo,txt(14));                      //Quantité de laine

     coo.x:=113;
     coo.y:=17;
     ecrireEnPosition(coo,txt(15));                      //Quantité de tissu

     deplacerCurseurXY(54,51);

end;

procedure cadre1(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte:Integer);
var
  coo:coordonnees;
  chaine:String;
  i,compte: Integer;
  plus:String;
begin
     dessinerCadreXY(debX,debY,debX+83,debY+longueur, double, couleur_cadre, 0);   //gros cadre
     dessinerCadreXY(debX+30,debY-1,debX+52,debY+1, double, couleur_cadre, 0);     //petit cadre

     couleurTexte(couleur_texte);
     coo.x:=debX+31;
     coo.y:=debY;
     compte:=0;
     plus:=' ';
     chaine:=txt(numTexte);
     for i:=1 to length(txt(numTexte)) do
           compte:=compte+1;
     for i:=1 to (21-compte) div 2 do
           chaine:=plus + chaine;

     ecrireEnPosition(coo,chaine);

end;

procedure banniere(y,numTexte:Integer);
var
  coo:coordonnees;
  chaine:String;
  x:Integer;

begin
     chaine:=txt(numTexte);
     x:=100-(length(chaine)+7) div 2;
     dessinerCadreXY(1,1,198,58, simple, 14, 0);                                      //gros cadre
     dessinerCadreXY(x,y,x+length(chaine)+7,y+4, double, 14, 0);                      //cadre majeur
     dessinerCadreXY(x-12,y,x,y+1, double, 14, 0);                                    //cadre 1 gauche
     dessinerCadreXY(x+length(chaine)+7,y,x+length(chaine)+19,y+1, double, 14, 0);    //cadre 1 droite
     dessinerCadreXY(x-8,y+1,x,y+2, double, 14, 0);                                   //cadre 2 gauche
     dessinerCadreXY(x+length(chaine)+7,y+1,x+length(chaine)+15,y+2, double, 14, 0);  //cadre 2 droite
     dessinerCadreXY(x-4,y+2,x,y+3, double, 14, 0);                                   //cadre 3 gauche
     dessinerCadreXY(x+length(chaine)+7,y+2,x+length(chaine)+11,y+3, double, 14, 0);  //cadre 3 droite

     couleurTexte(3);
     coo.x:=x+4;
     coo.y:=y+2;
     ecrireEnPosition(coo,chaine);
end;


procedure interface_batiment();

var
   coo:coordonnees;


begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,22);
     cadre1(11,10,10,15,15,23);
     cadre1(11,24,10,15,15,26);
     cadre1(105,10,46,15,15,30);

     //Affichage des textes
     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=12;
     coo.y:=4;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(3));                       //Or

     coo.x:=19;
     coo.y:=13;
     ecrireEnPosition(coo,txt(24));                       //Maisons de colons

     coo.x:=19;
     coo.y:=14;
     ecrireEnPosition(coo,txt(25));                       //Maisons de citoyen

     coo.x:=19;
     coo.y:=27;
     ecrireEnPosition(coo,txt(27));                       //Nombre d'entrepots

     coo.x:=19;
     coo.y:=28;
     ecrireEnPosition(coo,txt(28));                       //Nombre de centres-villes

     coo.x:=19;
     coo.y:=29;
     ecrireEnPosition(coo,txt(29));                       //Nombre de chapelles

     coo.x:=113;
     coo.y:=13;
     ecrireEnPosition(coo,txt(31));                      //Cabanes de bucheron

     coo.x:=113;
     coo.y:=14;
     ecrireEnPosition(coo,txt(32));                      //Cabanes de pêcheur

     coo.x:=113;
     coo.y:=15;
     ecrireEnPosition(coo,txt(33));                      //Bergeries

     coo.x:=113;
     coo.y:=16;
     ecrireEnPosition(coo,txt(34));                      //Ateliers de tisserands

     coo.x:=30;
     coo.y:=38;
     ecrireEnPosition(coo,txt(35));                       //Construire un bâtiment

     coo.x:=31;
     coo.y:=40;
     ecrireEnPosition(coo,txt(36));                       //Détruire un bâtiment

     coo.x:=23;
     coo.y:=56;
     ecrireEnPosition(coo,txt(44));                      //Retour à l'écran de gestion de l'île

end;

procedure detruire_batiment();

var
   coo:coordonnees;

begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,22);
     cadre1(11,10,10,15,15,23);
     cadre1(11,24,10,15,15,26);
     cadre1(105,10,46,15,15,30);

     //Affichage des textes
     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=12;
     coo.y:=4;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(3));                       //Or

     coo.x:=19;
     coo.y:=13;
     ecrireEnPosition(coo,txt(24));                       //Maisons de colons

     coo.x:=19;
     coo.y:=14;
     ecrireEnPosition(coo,txt(25));                       //Maisons de citoyen



     coo.x:=19;
     coo.y:=27;
     ecrireEnPosition(coo,txt(27));                       //Nombre d'entrepots

     coo.x:=19;
     coo.y:=28;
     ecrireEnPosition(coo,txt(28));                       //Nombre de centres-villes

     coo.x:=19;
     coo.y:=29;
     ecrireEnPosition(coo,txt(29));                       //Nombre de chapelles

     coo.x:=113;
     coo.y:=13;
     ecrireEnPosition(coo,txt(31));                      //Cabanes de bucheron

     coo.x:=113;
     coo.y:=14;
     ecrireEnPosition(coo,txt(32));                      //Cabanes de pêcheur

     coo.x:=113;
     coo.y:=15;
     ecrireEnPosition(coo,txt(33));                      //Bergeries

     coo.x:=113;
     coo.y:=16;
     ecrireEnPosition(coo,txt(34));                      //Ateliers de tisserands


     coo.x:=17;
     coo.y:=44;
     ecrireEnPosition(coo,txt(102));                      //Information séléction

     coo.x:=25;
     coo.y:=45;
     ecrireEnPosition(coo,txt(103));                      //Information séléction

     coo.x:=32;
     coo.y:=56;
     ecrireEnPosition(coo,txt(44));                      //Retour à l'écran de gestion de l'île

end;

procedure creer_batiment();
var
   coo:coordonnees;
begin
     //Affichage des cadres
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,22);
     cadre1(11,10,10,15,15,23);
     cadre1(11,24,10,15,15,26);
     cadre1(105,10,46,15,15,30);

     //Affichage des textes
     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=12;
     coo.y:=4;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(3));                       //Or

     coo.x:=19;
     coo.y:=13;
     ecrireEnPosition(coo,txt(52));                       //Maisons de colons

     coo.x:=19;
     coo.y:=14;
     ecrireEnPosition(coo,txt(53));                       //Maisons de citoyen



     coo.x:=19;
     coo.y:=27;
     ecrireEnPosition(coo,txt(54));                       //Nombre d'entrepots

     coo.x:=19;
     coo.y:=28;
     ecrireEnPosition(coo,txt(55));                       //Nombre de centres-villes

     coo.x:=19;
     coo.y:=29;
     ecrireEnPosition(coo,txt(56));                       //Nombre de chapelles

     coo.x:=113;
     coo.y:=13;
     ecrireEnPosition(coo,txt(57));                      //Cabanes de bucheron

     coo.x:=113;
     coo.y:=14;
     ecrireEnPosition(coo,txt(58));                      //Cabanes de pêcheur

     coo.x:=113;
     coo.y:=15;
     ecrireEnPosition(coo,txt(59));                      //Bergeries

     coo.x:=113;
     coo.y:=16;
     ecrireEnPosition(coo,txt(60));                      //Ateliers de tisserands


     coo.x:=17;
     coo.y:=44;
     ecrireEnPosition(coo,txt(102));                      //Information séléction

     coo.x:=25;
     coo.y:=45;
     ecrireEnPosition(coo,txt(103));                      //Information séléction

     coo.x:=32;
     coo.y:=56;
     ecrireEnPosition(coo,txt(44));                      //Retour à l'écran de gestion de l'île

end;

procedure cadre_info(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte1:Integer;numTexte2:Integer);
var
   coo:coordonnees;
begin
  cadre1(debX,debY,longueur, couleur_cadre,couleur_texte,numTexte1);  //Vous ne disposer pas de bâtiment de ce type
  coo.x:=debX+22;
  coo.y:=debY+2;
  ecrireEnPosition(coo,txt(numTexte2));


end;


procedure construDestru(choix:Integer;numProcedure:Integer);    //choix : 1=Construction -1=Destruction
begin
   if choix=1 then                                  //Cadre info + construction
    begin
      if appelleVariable(numProcedure)=True then
        begin
          appelleProcedure(choix,numProcedure);
          nouvelleValeur(numProcedure);
          cadre_info(11,49,3,2,2,40,42);
          readln();
        end
      else
        begin
          cadre_info(11,49,3,4,4,39,43);
          readln();
        end;
    end

   else if choix=-1 then                           //Cadre info + destruction
    begin
      if appelleFonction(numProcedure)>0 then
        begin
          appelleProcedure(choix,numProcedure);
          cadre_info(11,49,3,2,2,40,41);
          readln();
        end
      else
        begin
          cadre_info(11,49,3,4,4,39,38);
          readln();
        end;
     end;

end;

end.

