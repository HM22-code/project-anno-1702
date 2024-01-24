unit unit_variable;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran;

//tableau pour les navires
type tab = Array[1..42,1..30] Of String[50] ;
  //tableau pour la gestion des îles (contient les variables)
type tabIle= Array[1..25,1..6] of Integer;

//Cette procédure initialise les variables (au début de la partie par exemple)
procedure initialisation(choix:Integer);
//Cette fonction renvoie la valeur du choix du niveau
function choixNiveau(choix:Integer):Integer;
//Cette procedure modifie les valeurs des variables de l'île choisi en paramètre
procedure ileDonneVariable(numIle:Integer);
//Cette procedure permet de prendre les valeurs des variables de l'ile choisi en paramètre
procedure ilePrendVariable(numeroDeIle:Integer);
//Cette procedure modifie le nom de l'île
procedure nomIle(numIle:Integer);
//Cette fonction renvoie le numéro de l'île
function getNumIle() : Integer;
//Cette procedure modifie le numéro de l'île
procedure setNumIle(valeur:Integer);
//Cette fonction renvoie le tableau gérant les variables des îles
function getIleTab() : tabIle;
//Cette procedure modifie le tableau gérant les variables des îles
procedure setIleTab(tab:tabIle);
//appeler les différentes procédures et fonctions pour simplifier le code
function appelleFonction(numProc:Integer):Integer;
//Cette procedure permet d'appeler d'autres procédures en fonction du nombre en paramètre
procedure appelleProcedure(construOuDestru:Integer; numProc:Integer);
//Cette fonction renvoie la valeur des variables
function appelleVariable(numProc: Integer):Integer;
//Cette procedure modifie la valeur de certaines ressources
procedure nouvelleValeur(numProc:Integer);
//Cette fonction renvoie la valeur des ressources
function appelleRessource(numProc:Integer):Integer;
//Cette procedure permet de changer la valeur de certaines ressources
procedure nouvelleRessource(numProc:Integer;coeff:Integer);


//Cette fonction renvoie la valeur de la variable pseudo
function getName () : String;
//Cette procedure modifie la valeur de la variable pseudo
procedure setName (pseudo : String);
//Cette fonction renvoie le numéro du tour
function getTour () : Integer;
//Cette procedure modifie le numéro du tour
procedure setTour (numTour : Integer);
//Cette fonction renvoie le numéro du tour
function getEmplacement () : Integer;
//Cette procedure modifie le numéro du tour
procedure setEmplacement (nbEmplacement : Integer);

//Cette fonction renvoie le numéro du tour
function getIle () : String;
//Cette procedure modifie le numéro du tour
procedure setIle (nomIle : String);

//Cette fonction permet de savoir si l'utilisateur peut partir explorer
function getExplorerNavire () : Integer;
//Cette procédure permet de modifier la valeur d'explorer
procedure setExplorerNavire (valeur : Integer);
//Cette fonction permet de savoir si l'utilisateur peut partir explorer
function getExplorerIle () : Integer;
//Cette procédure permet de modifier la valeur d'explorer
procedure setExplorerIle (valeur : Integer);
//Cette fonction permet de savoir le nombre d'île découvert
function getNbIleDecouvert () : Integer;
//Cette procédure permet de modifier le nombre d'île découvert
procedure setNbIleDecouvert (valeur : Integer);

//Cette fonction renvoie le nombre de navire en tout
function getNbNavire () : integer;
//Cette procédure modifie le nombre de navire en tout
procedure setNbNavire (valeur : integer);
//Cette fonction renvoie le nombre de navire sur l'île
function getNbNavireIle () : integer;
//Cette procédure modifie le nombre de navire sur l'île
procedure setNbNavireIle (valeur : integer);
//Cette fonction renvoie le nombre de navire
function getAfficheNavire () : tab;
//Cette procédure modifie le nombre de navire
procedure setAfficheNavire (tabNav : tab);
//Cette fonction renvoie le nombre de navire
function getAncienAffiche () : tab;
//Cette procédure modifie le nombre de navire
procedure setAncienAffiche (tabNav : tab);


//Cette fonction renvoie la valeur du stockage
function getStockage() : Integer;
//Cette procedure modifie la valeur du stockage
procedure setStockage(valeur : integer);

//Cette fonction renvoie la valeur de la variable Or
function getGold() : Integer;
//Cette procedure modifie la valeur de la variable Or
procedure setGold(valeur : integer);
//Cette fonction renvoie la valeur de la variable Bois
function getBois() : Integer;
//Cette procedure modifie la valeur de la variable bois
procedure setBois(valeur : integer);
//Cette fonction renvoie la valeur de la variable colons
function getColons () : integer;
//Cette fonction modifie la valeur de la variable colons
procedure setColons (valeur : integer);
//Cette fonction renvoie la valeur de la variable citoyens
function getCitoyens() : Integer;
//Cette procédure renvoie la valeur da la variable poissons
procedure setCitoyens (valeur : integer);
//Cette procédure renvoie la valeur da la variable citoyens
function getPoissons () : integer;
//Cette procédure modifie la valeur de la variable poissons
procedure setPoissons (valeur : integer);
//Cette fonction renvoie la valeur de la variable outils
function getOutils () : integer;
//Cette procédure modifie la valeur de la variable outils
procedure setOutils (valeur : integer);
//Cette fonction renvoie la valeur de la variable laines
function getLaine () : integer;
//Cette procédure modifie la valeur de la variable laines
procedure setLaine (valeur : integer);
//Cette fonction renvoie la valeur de la variable tissus
function getTissu () : integer;
//Cette procédure modifie la valeur de la variable tissus
procedure setTissu (valeur : integer);

//Cette fonction renvoie la valeur de la variable MaisonsColons
function getMaisonsColons () : integer;
//Cette procédure modifie la valeur de la variable MaisonsColons
procedure setMaisonsColons (valeur : integer);
//Cette fonction renvoie la valeur de la variable MaisonsCitoyens
function getMaisonsCitoyens () : integer;
//Cette procédure modifie la valeur de la variable MaisonsCitoyens
procedure setMaisonsCitoyens (valeur : integer);
//Cette fonction renvoie la valeur de la variable Entrepots
function getEntrepots () : integer;
//Cette procédure modifie la valeur de la variable Entrepots
procedure setEntrepots (valeur : integer);
//Cette fonction renvoie la valeur de la variable CentresVilles
function getCentresVilles () : integer;
//Cette procédure modifie la valeur de la variable CentresVilles
procedure setCentresVilles (valeur : integer);
//Cette fonction renvoie la valeur de la variable Chapelles
function getChapelles () : integer;
//Cette procédure modifie la valeur de la variable Chapelles
procedure setChapelles (valeur : integer);
//Cette fonction renvoie la valeur de la variable CabanesBucheron
function getCabanesBucheron () : integer;
//Cette procédure modifie la valeur de la variable CabanesBucheron
procedure setCabanesBucheron (valeur : integer);
//Cette fonction renvoie la valeur de la variable CabanesPecheur
function getCabanesPecheur () : integer;
//Cette procédure modifie la valeur de la variable CabanesPecheur
procedure setCabanesPecheur (valeur : integer);
//Cette fonction renvoie la valeur de la variable Bergeries
function getBergeries () : integer;
//Cette procédure modifie la valeur de la variable Bergeries
procedure setBergeries (valeur : integer);
//Cette fonction renvoie la valeur de la variable AteliersTisserands
function getAteliersTisserands () : integer;
//Cette procédure modifie la valeur de la variable AteliersTisserands
procedure setAteliersTisserands (valeur : integer);
//Cette fonction renvoie la valeur de la variable ChantierNaval
function getChantierNaval () : integer;
//Cette procédure modifie la valeur de la variable ChantierNaval
procedure setChantierNaval (valeur : integer);



implementation
//Ces variables sont connues de toute l'unité mais pas à l'extérieur
var
   gold : integer;
   bois : integer;
   colons: integer;
   citoyens: integer;
   poissons: integer;
   outils: integer;
   laine: integer;
   tissu: integer;
   maisonsColons: integer;
   maisonsCitoyens: integer;
   entrepots: integer;
   centresVilles: integer;
   chapelles: integer;
   cabanesBucheron: integer;
   cabanesPecheur: integer;
   bergeries: integer;
   ateliersTisserand: integer;
   name: String;
   tour:Integer;
   emplacement:Integer;
   ile:String;
   stockage:Integer;
   chantierNaval:Integer;
   explorerNavire:Integer;
   nbNavire:Integer;
   tableau:tab;
   ancienTableau:tab;
   tableauIle:tabIle;
   nbIleDecouvert:Integer;
   numeroIle:Integer;
   nbNavireIle:Integer;
   explorerIle:Integer;
//Cette procédure initialise les variables (au début de la partie) dans un tableau
procedure initialisation(choix:Integer);
var
   i:Integer;
   tab:tabIle;
begin
  for i:=1 to 6 do
      begin
        tab[1,i]:= i;                                   //numIle
        tab[2,i]:= 0;                                   //colons
        tab[3,i]:=0;                                    //citoyens
        tab[4,i]:= 20*choixNiveau(choix);               //bois
        tab[5,i]:= 20*choixNiveau(choix);               //poissons
        tab[6,i]:= 20*choixNiveau(choix);               //outils
        tab[7,i]:= 0;                                   //laine
        tab[8,i]:= 0;                                   //tissu
        tab[9,i]:=0;                                    //maisonsColons
        tab[10,i]:=0;                                   //maisonsCitoyens
        tab[11,i]:=0;                                   //entrepots
        tab[12,i]:=0;                                   //centresVilles
        tab[13,i]:=0;                                   //chapelles
        tab[14,i]:=0;                                   //cabanesBucheron
        tab[15,i]:=0;                                   //cabanesPecheur
        tab[16,i]:=0;                                   //bergeries
        tab[17,i]:=0;                                   //ateliersTisserand
        tab[18,i]:=40*choixNiveau(choix);               //emplacement
        tab[19,i]:=20*choixNiveau(choix);               //stockage
        tab[20,i]:=0;                                   //chantierNaval
        tab[21,i]:=0;                                   //explorerNavire     (0=non / 1 ou + = oui)
        tab[22,i]:=0;                                   //nbNavireIle


    end;
  setIleTab(tab);
  name:=' ';
  tour:=0;
  gold:= 25000*choixNiveau(choix);
  nbIleDecouvert:=1;
  numeroIle:=1;
  nbNavire:=0;
  explorerIle:=0;


end;

function choixNiveau(choix:Integer):Integer;
begin
  case(choix) of
    1:choixNiveau:=4;
    2:choixNiveau:=2;
    3:choixNiveau:=1;
  end;
end;

procedure ileDonneVariable(numIle:Integer);
var
   tab:tabIle;
begin
  tab:=getIleTab();

  tab[1,numIle]:=numeroIle;
  tab[2,numIle]:=colons;
  tab[3,numIle]:=citoyens;
  tab[4,numIle]:=bois;
  tab[5,numIle]:=poissons;
  tab[6,numIle]:=outils;
  tab[7,numIle]:=laine;
  tab[8,numIle]:=tissu;
  tab[9,numIle]:=maisonsColons;
  tab[10,numIle]:=maisonsCitoyens;
  tab[11,numIle]:=entrepots;
  tab[12,numIle]:=centresVilles;
  tab[13,numIle]:=chapelles;
  tab[14,numIle]:=cabanesBucheron;
  tab[15,numIle]:=cabanesPecheur;
  tab[16,numIle]:=bergeries;
  tab[17,numIle]:=ateliersTisserand;
  tab[18,numIle]:=emplacement;
  tab[19,numIle]:=stockage;
  tab[20,numIle]:=chantierNaval;
  tab[21,numIle]:=explorerNavire;
  tab[22,numIle]:=nbNavireIle;

  setIleTab(tab);

end;
procedure ilePrendVariable(numeroDeIle:Integer);
var
   i:Integer;
   tab:tabIle;
begin
  tab:=getIleTab();

  numeroIle:= tab[1,numeroDeIle];
  colons:= tab[2,numeroDeIle];
  citoyens:=tab[3,numeroDeIle];
  bois:= tab[4,numeroDeIle];
  poissons:= tab[5,numeroDeIle];
  outils:= tab[6,numeroDeIle];
  laine:= tab[7,numeroDeIle];
  tissu:= tab[8,numeroDeIle];
  maisonsColons:=tab[9,numeroDeIle];
  maisonsCitoyens:=tab[10,numeroDeIle];
  entrepots:=tab[11,numeroDeIle];
  centresVilles:=tab[12,numeroDeIle];
  chapelles:=tab[13,numeroDeIle];
  cabanesBucheron:=tab[14,numeroDeIle];
  cabanesPecheur:=tab[15,numeroDeIle];
  bergeries:=tab[16,numeroDeIle];
  ateliersTisserand:=tab[17,numeroDeIle];
  emplacement:=tab[18,numeroDeIle];
  stockage:=tab[19,numeroDeIle];
  chantierNaval:=tab[20,numeroDeIle];
  explorerNavire:=tab[21,numeroDeIle];
  nbNavireIle:=tab[22,numeroIle];

  setNumIle(numeroDeIle);
  nomIle(getNumIle());
  setIleTab(tab);

end;

procedure nomIle(numIle:Integer);
begin
  case(numIle) of
    1:setIle('Marzanile');
    2:setIle('Silemonet');
    3:setIle('Karile');
    4:setIle('Mineskile');
    5:setIle('Dodominile');
    6:setIle('Lurilago');
  end;
end;

function getIleTab () : tabIle;
begin
     getIleTab := tableauIle;
end;
procedure setIleTab(tab:tabIle);
begin
     tableauIle :=tab;
end;

function getNumIle() : Integer;
begin
     getNumIle := numeroIle;
end;
procedure setNumIle(valeur:Integer);
begin
     numeroIle :=valeur;
end;

{Les fonctions permettent d'afficher les valeurs associées
 Les procédures permettent de modifier les valeurs}

//Navire
function getAfficheNavire () : tab;
begin
     getAfficheNavire := tableau;
end;
procedure setAfficheNavire (tabNav: tab);
begin
     tableau :=tabNav;
end;
function getAncienAffiche () : tab;
begin
     getAncienAffiche := ancienTableau;
end;
procedure setAncienAffiche (tabNav: tab);
begin
     ancienTableau :=tabNav;
end;
//Données écran
function getName () : String;
begin
     getName := name;
end;
procedure setName (pseudo : String);
begin
     name := pseudo;
end;

function getTour () : Integer;
begin
     getTour := tour;
end;
procedure setTour (numTour : Integer);
begin
     tour := tour+numTour;
end;

function getEmplacement () : Integer;
begin
     getEmplacement := emplacement;
end;
procedure setEmplacement (nbEmplacement : Integer);
begin
     emplacement := emplacement+nbEmplacement;
end;

function getIle () : String;
begin
     getIle := ile;
end;
procedure setIle (nomIle : String);
begin
     ile := nomIle;
end;


//Ressources
function getStockage() : Integer;
begin
     getStockage:=stockage;
end;
procedure setStockage(valeur : integer);
begin
     stockage := stockage+valeur;
end;
function getGold() : Integer;
begin
     getGold := gold;
end;
procedure setGold(valeur : integer);
begin
     gold := gold+valeur;
end;
function getBois() : Integer;
begin
     getBois := bois;
end;
procedure setBois(valeur : integer);
begin
     bois := bois+valeur;
end;
function getColons () : integer;
begin
     getColons := colons;
end;
procedure setColons (valeur : integer);
begin
     colons := colons+valeur;
end;
function getCitoyens() : Integer;
begin
     getCitoyens := citoyens;
end;
procedure setCitoyens (valeur : integer);
begin
     citoyens:=citoyens+valeur;
end;

function getPoissons () : integer;
begin
     getPoissons := poissons;
end;
procedure setPoissons (valeur : integer);
begin
     poissons := poissons+valeur;
end;
function getOutils () : integer;
begin
     getOutils := outils;
end;
procedure setOutils (valeur : integer);
begin
     outils := outils+valeur;
end;
function getLaine () : integer;
begin
     getLaine := laine;
end;
procedure setLaine (valeur : integer);
begin
     laine := laine+valeur;
end;
function getTissu () : integer;
begin
     getTissu := tissu;
end;
procedure setTissu (valeur : integer);
begin
     tissu := tissu+valeur;
end;

//Batiments
function getMaisonsColons () : integer;
begin
     getMaisonsColons := maisonsColons;
end;
procedure setMaisonsColons (valeur : integer);
begin
     maisonsColons := maisonsColons+valeur;
end;
function getMaisonsCitoyens () : integer;
begin
     getMaisonsCitoyens := maisonsCitoyens;
end;
procedure setMaisonsCitoyens (valeur : integer);
begin
     maisonsCitoyens := maisonsCitoyens+valeur;
end;
function getEntrepots () : integer;
begin
     getEntrepots := entrepots;
end;
procedure setEntrepots (valeur : integer);
begin
     entrepots := entrepots+valeur;
end;
function getCentresVilles () : integer;
begin
     getCentresVilles := centresVilles;
end;
procedure setCentresVilles (valeur : integer);
begin
     centresVilles := centresVilles+valeur;
end;
function getChapelles () : integer;
begin
     getChapelles := chapelles;
end;
procedure setChapelles (valeur : integer);
begin
     chapelles := chapelles+valeur;
end;
function getCabanesBucheron () : integer;
begin
     getCabanesBucheron := cabanesBucheron;
end;
procedure setCabanesBucheron (valeur : integer);
begin
     cabanesBucheron := cabanesBucheron+valeur;
end;
function getCabanesPecheur () : integer;
begin
     getCabanesPecheur := cabanesPecheur;
end;
procedure setCabanesPecheur (valeur : integer);
begin
     cabanesPecheur := cabanesPecheur+valeur;
end;
function getBergeries () : integer;
begin
     getBergeries := bergeries;
end;
procedure setBergeries (valeur : integer);
begin
     bergeries := bergeries+valeur;
end;
function getAteliersTisserands () : integer;
begin
     getAteliersTisserands := ateliersTisserand;
end;
procedure setAteliersTisserands (valeur : integer);
begin
     ateliersTisserand := ateliersTisserand+valeur;
end;
function getChantierNaval () : integer;
begin
     getChantierNaval := chantierNaval;
end;
procedure setChantierNaval (valeur : integer);
begin
     chantierNaval := chantierNaval+valeur;
end;

//appeler les différentes fonctions et procédures pour simplifier le code dans le unit_ecran
function appelleFonction(numProc:Integer):Integer;
begin
     case(numProc) of
       1: appelleFonction:= getMaisonsColons ();
       2: appelleFonction:=getMaisonsCitoyens();
       3: appelleFonction:=getEntrepots ();
       4: appelleFonction:=getCentresVilles ();
       5: appelleFonction:=getChapelles ();
       6: appelleFonction:=getChantierNaval();
       7: appelleFonction:=getCabanesBucheron ();
       8: appelleFonction:=getCabanesPecheur ();
       9: appelleFonction:=getBergeries ();
       10: appelleFonction:=getAteliersTisserands ();

     end;
end;

procedure appelleProcedure(construOuDestru:Integer; numProc:Integer);
begin
     case(numProc) of
       1: setMaisonsColons(construOuDestru);
       2: setMaisonsCitoyens (construOuDestru);
       3: setEntrepots (construOuDestru);
       4: setCentresVilles (construOuDestru);
       5: setChapelles (construOuDestru);
       6: setChantierNaval (construOuDestru);
       7: setCabanesBucheron (construOuDestru);
       8: setCabanesPecheur (construOuDestru);
       9: setBergeries (construOuDestru);
       10: setAteliersTisserands (construOuDestru);

     end;
end;

function appelleVariable(numProc: Integer):Integer;
begin
     case(numProc) of
       1: if (getBois()>=2) then appelleVariable:=1 else appelleVariable:=2;
       2: if (getBois()>=1) AND (getOutils()>=1) AND (getMaisonsColons()>=1) then appelleVariable:=1 else appelleVariable:=2;
       3: if (getBois()>=5) AND (getOutils()>=3) AND (getGold()>=200) then appelleVariable:=1 else appelleVariable:=2;
       4: if (getBois()>=8) AND (getOutils()>=4) AND (getGold()>=200) then appelleVariable:=1 else appelleVariable:=2;
       5: if (getBois()>=6) AND (getOutils()>=3) AND (getGold()>=300) then appelleVariable:=1 else appelleVariable:=2;
       6:
         begin
           if getChantierNaval>0 then
              appelleVariable:=3
           else
             if (getBois()>=2) AND (getOutils()>=2) AND (getGold()>=2) then appelleVariable:=1 else appelleVariable:=2;
         end;
       7: if (getOutils()>=3) AND (getGold()>=50) then appelleVariable:=1 else appelleVariable:=2;
       8: if (getBois()>=5) AND (getOutils()>=3) AND (getGold()>=100) then appelleVariable:=1 else appelleVariable:=2;
       9: if (getBois()>=4) AND (getOutils()>=2) AND (getGold()>=200) then appelleVariable:=1 else appelleVariable:=2;
       10: if (getBois()>=3) AND (getOutils()>=2) AND (getGold()>=300) then appelleVariable:=1 else appelleVariable:=2;
     end;
end;

procedure nouvelleValeur(numProc:Integer);
begin
     case(numProc) of
       1:
         setBois(-2);
       2:
         begin
           setBois(-1);
           setOutils(-1);
           setMaisonsColons(-1);
         end;
       3:
         begin
           setBois(-5);
           setOutils(-3);
           setGold(-200);
         end;
       4:
         begin
           setBois(-8);
           setOutils(-4);
           setGold(-200);
         end;
       5:
         begin
           setBois(-6);
           setOutils(-3);
           setGold(-300);
         end;
       6:
         begin
           setBois(-2);
           setOutils(-2);
           setGold(-2);
         end;
       7:
         begin
           setOutils(-3);
           setGold(-50);
         end;
       8:
         begin
           setBois(-5);
           setOutils(-3);
           setGold(-100);
         end;
       9:
         begin
           setBois(-4);
           setOutils(-2);
           setGold(-200);
         end;
       10:
         begin
           setBois(-3);
           setOutils(-2);
           setGold(-300);
         end;

     end;
end;

function getExplorerNavire () : Integer;
begin
     getExplorerNavire := explorerNavire;
end;
procedure setExplorerNavire (valeur : Integer);
begin
     explorerNavire := explorerNavire+valeur;
end;
function getExplorerIle () : Integer;
begin
     getExplorerIle := explorerIle;
end;
procedure setExplorerIle (valeur : Integer);
begin
     explorerIle := explorerIle+valeur;
end;
function getNbIleDecouvert () : Integer;
begin
     getNbIleDecouvert := nbIleDecouvert;
end;
procedure setNbIleDecouvert (valeur : Integer);
begin
     nbIleDecouvert := nbIleDecouvert+valeur;
end;
function getNbNavire () : integer;
begin
     getNbNavire := nbNavire;
end;
procedure setNbNavire (valeur : integer);
begin
     nbNavire := nbNavire+valeur;
end;
function getNbNavireIle () : integer;
begin
     getNbNavireIle := nbNavireIle;
end;
procedure setNbNavireIle (valeur : integer);
begin
     nbNavireIle := nbNavireIle+valeur;
end;

function appelleRessource(numProc:Integer):Integer;
begin
  case(numProc) of
    1: appelleRessource:=getPoissons();
    2: appelleRessource:=getBois();
    3: appelleRessource:=getOutils();
    4: appelleRessource:=getLaine();
    5: appelleRessource:=getTissu();
  end;
end;

procedure nouvelleRessource(numProc:Integer;coeff:Integer);
begin
  case(numProc) of
    1:setPoissons(1*coeff);
    2:setBois(1*coeff);
    3:setOutils(1*coeff);
    4:setLaine(1*coeff);
    5:setTissu(1*coeff);

  end;

end;

end.

