unit unit_ecran;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses SysUtils,GestionEcran, unit_texte, unit_variable;

procedure accueil();
procedure creer_partie();
procedure fin_tour();
procedure interface_marchand();
procedure marchand_poisson();
procedure marchand_bois();
procedure marchand_outils();
procedure marchand_laine();
procedure marchand_tissu();
procedure appelleMarchand(numProc:Integer);
procedure interface_ile();
procedure interface_batiment();
procedure creer_batiment();
procedure detruire_batiment();
//procedure cadre_creation();
procedure cadre_info(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte1:Integer;numTexte2:Integer);
procedure cadre1(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte:Integer);
procedure banniere(y,numTexte:Integer);
procedure construDestru(choix:Integer;numProcedure:Integer);
procedure interface_navire();
procedure navire(numNavire:String;typeNavire:String;nomNavire:String);
procedure selection_navire(numNavire:Integer);
procedure ile_suivante();


implementation

procedure accueil();                      //écran accueil
var
   coo:coordonnees;
   i:Integer;
begin
     couleurTexte(3);

     coo.x:=72;
     coo.y:=28;

     for i:=218 to 227 do
           begin
           ecrireEnPosition(coo,txt(i));//ligne du dessin parchemin
           coo.y:=coo.y+1;
           end;


     coo.x:=62;
     coo.y:=8;

     for i:=200 to 217 do
           begin
           ecrireEnPosition(coo,txt(i));//ligne du dessin titre anno
           coo.y:=coo.y+1;
           end;

     coo.x:=0;
     coo.y:=43;
     ecrireEnPosition(coo,txt(228));

     coo.x:=86;
     coo.y:=46;
     for i:=230 to 240 do
           begin
           ecrireEnPosition(coo,txt(i));//cadre
           coo.y:=coo.y+1;
           end;

     deplacerCurseurXY(101,57);


end;


procedure creer_partie();                       //écran créer partie
var
  coo:coordonnees;
begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);

     banniere(1,5);
     couleurTexte(15);

     coo.x:=10;
     coo.y:=8;
     ecrireEnPosition(coo,txt(120));             //Choix level

     coo.x:=10;
     coo.y:=10;
     ecrireEnPosition(coo,txt(4));             //Nom utilisateur

     deplacerCurseurXY(112,8);
end;

procedure fin_tour();                        //écran fin tour

var
   coo : coordonnees;

begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,62);
     dessinerCadreXY(1,10,198,10, simple, 15, 0);
     dessinerCadreXY(1,19,198,19, simple, 15, 0);
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
        begin
          if getPoissons()>0 then
             setPoissons(-1);
        end;
     if getCabanesBucheron() > 0 then
        begin
          setBois(getCabanesBucheron());
          if getBois()>getStockage() then
             setBois(getStockage()-getBois());
        end;
     if getCabanesPecheur() > 0 then
        begin
          setPoissons(2*getCabanesPecheur());
          if getPoissons()>getStockage() then
             setPoissons(getStockage()-getPoissons());
        end;
     //rajouter pour les ateliers de tisserands et les bergeries
     deplacerCurseurXY(100,40);

end;

procedure interface_marchand();                //écran  marchand
var
   coo:coordonnees;
begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     banniere(1,94);
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
     ecrireEnPosition(coo,txt(95));
     coo.x:=76;
     ecrireEnPosition(coo,txt(100));
     coo.x:=124;
     ecrireEnPosition(coo,'3');
     coo.x:=136;
     ecrireEnPosition(coo,txt(101));
     coo.x:=20;
     coo.y:=15;
     ecrireEnPosition(coo,txt(96));
     coo.x:=76;
     ecrireEnPosition(coo,txt(100));
     coo.x:=124;
     ecrireEnPosition(coo,'5');
     coo.x:=136;
     ecrireEnPosition(coo,txt(101));
     coo.x:=20;
     coo.y:=16;
     ecrireEnPosition(coo,txt(97));
     coo.x:=76;
     ecrireEnPosition(coo,txt(100));
     coo.x:=124;
     ecrireEnPosition(coo,'15');
     coo.x:=136;
     ecrireEnPosition(coo,txt(101));
     coo.x:=20;
     coo.y:=17;
     ecrireEnPosition(coo,txt(98));
     coo.x:=76;
     ecrireEnPosition(coo,txt(100));
     coo.x:=124;
     ecrireEnPosition(coo,'8');
     coo.x:=136;
     ecrireEnPosition(coo,txt(101));
     coo.x:=20;
     coo.y:=18;
     ecrireEnPosition(coo,txt(99));
     coo.x:=76;
     ecrireEnPosition(coo,txt(100));
     coo.x:=124;
     ecrireEnPosition(coo,'8');
     coo.x:=136;
     ecrireEnPosition(coo,txt(101));
     // Infos sur la façon dont on peut choisir l'objet voulu
     coo.x:=50;
     coo.y:=25;
     ecrireEnPosition(coo,'Appuyez sur les touches de 1 à 5 du pavé numérique, puis entrée pour séléctionner l''objet souhaité');
     // Infos sur la façon dont on doit quitter l'interface
     coo.x:=65;
     coo.y:=57;
     ecrireEnPosition(coo,'Appuyez sur 0 puis entrée pour retourner sur l''écran de gestion de l''île');
end;


procedure marchand_poisson();                    //écran  marchand poisson
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

procedure marchand_bois();                       //écran marchand bois
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

procedure marchand_outils();                         //écran marchand outils
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

procedure marchand_laine();                          //écran marchand laine
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

procedure marchand_tissu();                           //écran marchand tissu
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

procedure interface_ile();                                //écran interface de l'île
var
  coo:coordonnees;
begin
     changerTailleConsole(200,60);
     //cadre écran
     banniere(1,1);
     cadre1(11,10,10,14,3,16);
     cadre1(11,24,10,14,3,17);
     cadre1(105,10,46,14,3,18);

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

     coo.x:=142;
     coo.y:=3;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(70));                      //Tour x

     coo.x:=19;
     coo.y:=13;
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

     coo.x:=34;
     coo.y:=38;
     ecrireEnPosition(coo,txt(20));                       //Tour suivant

     coo.x:=20;
     coo.y:=40;
     ecrireEnPosition(coo,txt(21));                       //Gestion bâtiments

     coo.x:=34;
     coo.y:=44;
     ecrireEnPosition(coo,txt(90));                       //Allez sur l'ile suivante

     coo.x:=27;
     coo.y:=46;
     ecrireEnPosition(coo,txt(78));                       //Gestion navires

     coo.x:=35;
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

//procédure qui permet de créer des cadres avec un titre à celui-ci afin de gagner du temps et de compacter le code
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

//procédure étant mise en début de chaque écran (design principal de notre programme)
procedure banniere(y,numTexte:Integer);
var
  coo:coordonnees;
  chaine:String;
  x:Integer;

begin
     chaine:=txt(numTexte);
     x:=100-(length(chaine)+7) div 2;
     dessinerCadreXY(1,1,198,58, simple, 14, 0);           //gros cadre
     dessinerCadreXY(x,y,x+length(chaine)+7,y+4, double, 14, 0);           //cadre majeur
     dessinerCadreXY(x-12,y,x,y+1, double, 14, 0);            //cadre 1 gauche
     dessinerCadreXY(x+length(chaine)+7,y,x+length(chaine)+19,y+1, double, 14, 0);          //cadre 1 droite
     dessinerCadreXY(x-8,y+1,x,y+2, double, 14, 0);            //cadre 2 gauche
     dessinerCadreXY(x+length(chaine)+7,y+1,x+length(chaine)+15,y+2, double, 14, 0);          //cadre 2 droite
     dessinerCadreXY(x-4,y+2,x,y+3, double, 14, 0);            //cadre 3 gauche
     dessinerCadreXY(x+length(chaine)+7,y+2,x+length(chaine)+11,y+3, double, 14, 0);          //cadre 3 droite

     couleurTexte(3);
     coo.x:=x+4;
     coo.y:=y+2;
     ecrireEnPosition(coo,chaine);
end;


procedure interface_batiment();                  //écran interface batiment

var
   coo:coordonnees;


begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     //cadre écran
     banniere(1,22);
     cadre1(11,10,10,14,3,23);
     cadre1(11,24,10,14,3,26);
     cadre1(105,10,46,14,3,30);

     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=142;
     coo.y:=3;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(70));                      //Tour x

     coo.x:=12;
     coo.y:=4;
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

     coo.x:=19;
     coo.y:=30;
     ecrireEnPosition(coo,txt(71));                       //Nombre de chantier naval

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

procedure detruire_batiment();                             //écran détrurie batiment

var
   coo:coordonnees;

begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     //cadre écran
     banniere(1,22);
     cadre1(11,10,10,14,3,23);
     cadre1(11,24,10,14,3,26);
     cadre1(105,10,46,14,3,30);

     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=142;
     coo.y:=3;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(70));                      //Tour x

     coo.x:=12;
     coo.y:=4;
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

     coo.x:=19;
     coo.y:=30;
     ecrireEnPosition(coo,txt(71));                       //Nombre de chantier naval

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
     ecrireEnPosition(coo,txt(123));                      //Information séléction

     coo.x:=25;
     coo.y:=45;
     ecrireEnPosition(coo,txt(124));                      //Information séléction

     coo.x:=32;
     coo.y:=56;
     ecrireEnPosition(coo,txt(37));                      //Retour à l'écran de gestion de l'île

end;

procedure creer_batiment();                              //écran créer un batiment
var
   coo:coordonnees;
begin
     effacerEtColorierEcran(0);
     changerTailleConsole(200,60);
     //cadre écran
     banniere(1,22);
     cadre1(11,10,10,14,3,23);
     cadre1(11,24,10,14,3,26);
     cadre1(105,10,46,14,3,30);

     couleurTexte(15);

     coo.x:=12;
     coo.y:=3;
     ecrireEnPosition(coo,txt(2));                        //Nom du joueur

     coo.x:=32;
     coo.y:=3;
     couleurTexte(3);
     ecrireEnPosition(coo,getName());                     //Nom du joueur

     coo.x:=142;
     coo.y:=3;
     couleurTexte(15);
     ecrireEnPosition(coo,txt(70));                      //Tour x

     coo.x:=12;
     coo.y:=4;
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

     coo.x:=19;
     coo.y:=30;
     ecrireEnPosition(coo,txt(72));                       //Nombre de chantier naval

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
     ecrireEnPosition(coo,txt(123));                      //Information séléction

     coo.x:=25;
     coo.y:=45;
     ecrireEnPosition(coo,txt(124));                      //Information séléction

     coo.x:=32;
     coo.y:=56;
     ecrireEnPosition(coo,txt(81));                      //Retour à l'écran de gestion de l'île

end;

//procédure permettant de créer un cadre avec plusieurs paramètres qui permet de dire à l'utilisateur une information
procedure cadre_info(debX,debY:Integer; longueur:Integer; couleur_cadre:Integer; couleur_texte:Integer; numTexte1:Integer;numTexte2:Integer);
var
   coo:coordonnees;
   chaine:String;
   i,compte: Integer;
   plus:String;
begin
  cadre1(debX,debY,longueur, couleur_cadre,couleur_texte,numTexte1);  //Vous ne disposer pas de bâtiment de ce type
  coo.x:=debX+1;
  coo.y:=debY+2;
  compte:=0;
  plus:=' ';
  chaine:=txt(numTexte2);
  for i:=1 to length(txt(numTexte2)) do
      compte:=compte+1;
  for i:=1 to (83-compte) div 2 do
      chaine:=plus + chaine;

  ecrireEnPosition(coo,chaine);


end;


procedure construDestru(choix:Integer;numProcedure:Integer);    //permet de créer ou de détruire un batiment(choix : 1=Construction -1=Destruction)
begin
   if choix=1 then
    begin
      if appelleVariable(numProcedure)=1 then
        begin
          if getEmplacement()>0 then
            begin
              appelleProcedure(choix,numProcedure);
              nouvelleValeur(numProcedure);
              cadre_info(11,49,3,2,2,40,42);
              setEmplacement(-1);
              readln();
            end;
        end
      else if appelleVariable(numProcedure)=2 then
        begin
          cadre_info(11,49,3,4,4,39,43);
          readln();
        end
      else
        begin
          cadre_info(11,49,3,4,4,39,80);
          readln();
        end;

    end

   else if choix=-1 then
    begin
      if appelleFonction(numProcedure)>0 then
        begin
          appelleProcedure(choix,numProcedure);
          cadre_info(11,49,3,2,2,40,41);
          setEmplacement(1);
          readln();
        end
      else
        begin
          cadre_info(11,49,3,4,4,39,38);
          readln();
        end;
     end;

end;

procedure interface_navire();           //écran interface navire
var
   coo:coordonnees;
   i:Integer;
   affiche:tab;
   chaine:String;
begin
   banniere(1,73);
   cadre1(10,10,46,14,3,74);
   couleurTexte(15);

   affiche:=getAfficheNavire();

   coo.x:=122;
   coo.y:=45;
   ecrireEnPosition(coo,txt(75));     //Construire un navire d'exploration

   coo.x:=136;
   coo.y:=46;
   ecrireEnPosition(coo,txt(76));     //Ressoures nécessaire

   coo.x:=122;
   coo.y:=48;
   ecrireEnPosition(coo,txt(114));     //Construire un navire de colonisation

   coo.x:=130;
   coo.y:=49;
   ecrireEnPosition(coo,txt(115));     //Ressoures nécessaire

   coo.x:=105;
   coo.y:=52;
   ecrireEnPosition(coo,txt(85));     //Séléctionnez un navire

   coo.x:=125;
   coo.y:=56;
   ecrireEnPosition(coo,txt(77));     //Retour à l'écran précédent

   coo.x:=11;
   coo.y:=11;
   ecrireEnPosition(coo,txt(108));     //Nombre de navire


   deplacerCurseurXY(15,15);

   deplacerCurseurXY(0,14);
   for i:=1 to getNbNavire() do
    begin
      coo.x:=15;
      coo.y:=13+i;
      couleurTexte(15);
      if StrToInt(affiche[i,6])>=StrToInt(affiche[i,7]) then
        couleurTexte(4);
      chaine:=affiche[i,1]+' '+ affiche[i,2]+' '+affiche[i,3]+' '+affiche[i,4]+' '+affiche[i,5];
      ecrireEnPosition(coo,chaine);
      couleurTexte(15);

      writeln();
    end;

end;

procedure navire(numNavire:String;typeNavire:String;nomNavire:String);        //procédure créant un navire
var
   tourNavire,randTour:Integer;
   status,explore:String;
   afficheNavire,fusionAffiche:tab;
   i,j:Integer;
begin
  if getNbNavire()<>1 then
    begin
      setAncienAffiche(getAfficheNavire());
      fusionAffiche:=getAncienAffiche();
    end;

  afficheNavire[getNbNavire(),1]:=' ';
  afficheNavire[getNbNavire(),2]:=numNavire;
  afficheNavire[getNbNavire(),3]:=typeNavire;
  afficheNavire[getNbNavire(),4]:=nomNavire;
  nomIle(getNumIle());
  status:=txt(109);
  afficheNavire[getNbNavire(),5]:=status;
  randTour:=random(4)+2;
  tourNavire:=0;

  explore:='faux';
  afficheNavire[getNbNavire(),6]:=IntToStr(tourNavire);
  afficheNavire[getNbNavire(),7]:=IntToStr(randTour);
  afficheNavire[getNbNavire(),8]:=explore;
  afficheNavire[getNbNavire(),9]:=IntToStr(getNumIle());

  if getNbNavire()<>1 then
    begin
      for i:=1 to getNbNavire()-1 do
          for j:=1 to 10 do
              afficheNavire[i,j]:=fusionAffiche[i,j];
    end;

  setAncienAffiche(afficheNavire);

  setAfficheNavire(getAncienAffiche());

  setNbNavireIle(1);
end;

procedure selection_navire(numNavire:Integer);                //écran séléction navire
var
   coo:coordonnees;
   i:Integer;
   affiche:tab;
   chaine:String;
begin
  banniere(1,73);
  cadre1(10,10,46,14,3,74);
  couleurTexte(15);

  coo.x:=126;
  coo.y:=52;
  ecrireEnPosition(coo,txt(86));      //Partir à l'exploration

  coo.x:=125;
  coo.y:=56;
  ecrireEnPosition(coo,txt(77));     //Retour à l'écran précédent

  coo.x:=11;
  coo.y:=11;
  ecrireEnPosition(coo,txt(108));     //Nombre de navire


  deplacerCurseurXY(15,15);
  affiche:=getAfficheNavire();

  deplacerCurseurXY(0,14);
  for i:=1 to getNbNavire() do
    begin
      coo.x:=15;
      coo.y:=13+i;
      if i=numNavire then
        begin
          ColorierZone(3,3,11,92,13+i);
          couleurs(0,3);
          if StrToInt(affiche[i,6])>=StrToInt(affiche[i,7]) then
            couleurs(4,3);

          chaine:=affiche[i,1]+' '+ affiche[i,2]+' '+affiche[i,3]+' '+affiche[i,4]+' '+affiche[i,5];
          ecrireEnPosition(coo,chaine);
          couleurs(15,0);
        end
      else
        begin
          if StrToInt(affiche[i,6])>=StrToInt(affiche[i,7]) then
            couleurs(4,0);
          chaine:=affiche[i,1]+' '+ affiche[i,2]+' '+affiche[i,3]+' '+affiche[i,4]+' '+affiche[i,5];
          ecrireEnPosition(coo,chaine);
          couleurs(15,0);
        end;

      writeln();
    end;

end;

procedure ile_suivante();                           //écran ile suivante
var
   coo:coordonnees;
   i:Integer;
begin
  banniere(1,103);
  cadre1(10,10,46,14,3,104);
  couleurTexte(15);

  for i:=1 to getNbIleDecouvert() do
    begin
      coo.x:=15;
      coo.y:=13+i;
      if i=getNumIle then
        begin
          ColorierZone(3,3,11,92,13+i);
          couleurs(0,3);
          nomIle(i);
          ecrireEnPosition(coo,IntToStr(i)+' '+getIle()+txt(107));
          couleurs(15,0);
        end
      else
       begin
         nomIle(i);
         ecrireEnPosition(coo,IntToStr(i)+' '+getIle());
       end;
    end;

  coo.x:=126;
  coo.y:=50;
  ecrireEnPosition(coo,txt(105));      //Atterir sur une nouvelle ile

  coo.x:=105;
  coo.y:=52;
  ecrireEnPosition(coo,txt(106));      //Changer d'île

  coo.x:=125;
  coo.y:=56;
  ecrireEnPosition(coo,txt(77));     //Retour à l'écran précédent
end;

//procédure permettant d'appeler une autre procédure en fonction du nombre rentré en paramètre
procedure appelleMarchand(numProc:Integer);
begin
  case(numProc) of
    1: marchand_poisson();
    2: marchand_bois();
    3: marchand_outils();
    4: marchand_laine();
    5: marchand_tissu();
  end;
end;

end.

