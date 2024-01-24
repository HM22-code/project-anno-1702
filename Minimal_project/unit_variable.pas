unit unit_variable;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;
//Cette procédure initialise les variables (au début de la partie par exemple)
procedure initialisation();
//Appeler les différentes procédures et fonctions pour simplifier le code
function appelleFonction(numProc:Integer):Integer;
procedure appelleProcedure(construOuDestru:Integer; numProc:Integer);
function appelleVariable(numProc: Integer):Boolean;
procedure nouvelleValeur(numProc:Integer);

//Cette fonction renvoie la valeur de la variable pseudo
function getName () : String;
//Cette procedure modifie la valeur de la variable pseudo
procedure setName (pseudo : String);
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
//Cette procédure initialise les variables (au début de la partie par exemple)
procedure initialisation();
begin
  gold:= 50000;
  colons:= 0;
  citoyens:=0;
  bois:= 40;
  poissons:= 40;
  outils:= 40;
  laine:= 0;
  tissu:= 0;
  maisonsColons:=0;
  maisonsCitoyens:=0;
  entrepots:=0;
  centresVilles:=0;
  chapelles:=0;
  cabanesBucheron:=0;
  cabanesPecheur:=0;
  bergeries:=0;
  ateliersTisserand:=0;
  name:=' ';

end;

{Les fonctions permettent d'afficher les valeurs associées
 Les procédures permettent de modifier les valeurs}

//Nom utilisateur
function getName () : String;
begin
     getName := name;
end;
procedure setName (pseudo : String);
begin
     name := pseudo;
end;

//Ressources
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

//Bâtiments
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

//Appeler les différentes fonctions et procédures pour simplifier le code dans le unit_ecran
function appelleFonction(numProc:Integer):Integer;
begin
     case(numProc) of
       1: appelleFonction:= getMaisonsColons ();
       2: appelleFonction:=getMaisonsCitoyens();
       3: appelleFonction:=getEntrepots ();
       4: appelleFonction:=getCentresVilles ();
       5: appelleFonction:=getChapelles ();
       6: appelleFonction:=getCabanesBucheron ();
       7: appelleFonction:=getCabanesPecheur ();
       8: appelleFonction:=getBergeries ();
       9: appelleFonction:=getAteliersTisserands ();
       10: appelleFonction:=getGold();
       11: appelleFonction:=getBois();
       12: appelleFonction:=getOutils();
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
       6: setCabanesBucheron (construOuDestru);
       7: setCabanesPecheur (construOuDestru);
       8: setBergeries (construOuDestru);
       9: setAteliersTisserands (construOuDestru);
       10: setGold (construOuDestru);
       11: setBois (construOuDestru);
       12: setOutils (construOuDestru);
     end;
end;

function appelleVariable(numProc: Integer):Boolean;
begin
     case(numProc) of
       1: if (getBois()>=2) then appelleVariable:=True else appelleVariable:=False;
       2: if (getBois()>=1) AND (getOutils()>=1) AND (getMaisonsColons()>=1) then appelleVariable:=True else appelleVariable:=False;
       3: if (getBois()>=5) AND (getOutils()>=3) AND (getGold()>=200) then appelleVariable:=True else appelleVariable:=False;
       4: if (getBois()>=8) AND (getOutils()>=4) AND (getGold()>=200) then appelleVariable:=True else appelleVariable:=False;
       5: if (getBois()>=6) AND (getOutils()>=3) AND (getGold()>=300) then appelleVariable:=True else appelleVariable:=False;
       6: if (getOutils()>=3) AND (getGold()>=50) then appelleVariable:=True else appelleVariable:=False;
       7: if (getBois()>=5) AND (getOutils()>=3) AND (getGold()>=100) then appelleVariable:=True else appelleVariable:=False;
       8: if (getBois()>=4) AND (getOutils()>=2) AND (getGold()>=200) then appelleVariable:=True else appelleVariable:=False;
       9: if (getBois()>=3) AND (getOutils()>=2) AND (getGold()>=300) then appelleVariable:=True else appelleVariable:=False;
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
           setOutils(-3);
           setGold(-50);
         end;
       7:
         begin
           setBois(-5);
           setOutils(-3);
           setGold(-100);
         end;
       8:
         begin
           setBois(-4);
           setOutils(-2);
           setGold(-200);
         end;
       9:
         begin
           setBois(-3);
           setOutils(-2);
           setGold(-300);
         end;

     end;
end;

end.

