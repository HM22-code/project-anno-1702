unit unit_sauvegarde;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, unit_variable;

//création d'un type record avec toutes les variables a sauvegardées
type
   SauvRecord = Record
      name: String[30];
      gold : integer;
      tour:Integer;
      nbNavire:Integer;
      nbIleDecouvert:Integer;
      explorerIle:Integer;

   end;

//Cette procedure permet d'écrire la sauvegarde des variables qui changent en fonction de chaque île
procedure writeTabIle();
//Cette procedure permet d'écrire la sauvegarde des navires
procedure writeTabNavire();
//Cette procedure permet d'écrire la sauvegarde des variables étant les mêmes pour toutes les îles
procedure writeSauv();

//Cette procedure permet de lire la sauvegarde de la procédure à laquelle elle est lié
procedure readTabIle();
//Cette procedure permet de lire la sauvegarde de la procédure à laquelle elle est lié
procedure readTabNavire();
//Cette procedure permet de lire la sauvegarde de la procédure à laquelle elle est lié
procedure readSauv();

implementation

procedure writeSauv();

var
   Sauv: SauvRecord;
   fichier: file of SauvRecord;

begin
   Assign(fichier,'sauvegarde.dat');
   Rewrite(fichier);
   Sauv.name := getName();               //Sauv.variable:=getVariable();
   Sauv.gold := getGold();

   Sauv.tour:=getTour();
   Sauv.nbNavire:= getNbNavire();
   Sauv.nbIleDecouvert:= getNbIleDecouvert();
   Sauv.explorerIle:=getExplorerIle();

   Write(fichier,Sauv);
   Close(fichier);
end;




procedure readSauv();

var
   Sauv: SauvRecord;
   fichier: file of SauvRecord;

begin
   assign(fichier, 'sauvegarde.dat');
   reset(fichier);
   while not eof(fichier) do

   begin
      read(fichier,Sauv);

      setName(Sauv.name);     //setVariable(Sauv.variable);
      setGold(Sauv.gold);

      setTour(Sauv.tour);
      setNbNavire(Sauv.nbNavire);
      setNbIleDecouvert(Sauv.nbIleDecouvert);
      setExplorerIle(Sauv.explorerIle);

   end;

   close(fichier);
end;

procedure writeTabIle();
var

  afficheTab:tabIle;
  fichier_tab: file of tabIle;

begin
  assign(fichier_tab,'sauvegardeTabIle.dat');
  rewrite(fichier_tab);

  afficheTab:=getIleTab();

  write(fichier_tab,afficheTab);
  close(fichier_tab);
end;

procedure readTabIle();
var

   afficheTab:tabIle;
   fichier_tab: file of tabIle;

begin
   assign(fichier_tab, 'sauvegardeTabIle.dat');
   reset(fichier_tab);
   while not eof(fichier_tab) do
     begin
     read(fichier_tab,afficheTab);

     setIleTab(afficheTab);
     ilePrendVariable(1);
     setIle('Marzanile');
     end;


close(fichier_tab);

end;

procedure writeTabNavire();
var

  afficheTab:tab;
  fichier_tab2: file of tab;

begin
  assign(fichier_tab2,'sauvegardeTabNavire.dat');
  rewrite(fichier_tab2);

  afficheTab:=getAfficheNavire();

  write(fichier_tab2,afficheTab);
  close(fichier_tab2);
end;

procedure readTabNavire();
var

   afficheTab:tab;
   fichier_tab2: file of tab;

begin
   assign(fichier_tab2, 'sauvegardeTabNavire.dat');
   reset(fichier_tab2);
   while not eof(fichier_tab2) do
     begin
     read(fichier_tab2,afficheTab);

     setAfficheNavire(afficheTab);

     end;


close(fichier_tab2);

end;

end.

