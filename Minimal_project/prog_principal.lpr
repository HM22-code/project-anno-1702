program prog_principal;

uses GestionEcran, unit_ecran, unit_texte, unit_variable;

var
  start:Boolean;
  jouer:Boolean;
  menu,
  menuBatiment,menuDestruction, menuConstruction,
  menuMarchand, menuPoisson, menuBois, menuOutils, menuLaine, menuTissu:Boolean;
  tour:Integer;
  name:String;
  page1,page2:Integer;
  batiment:Integer;
  action:Integer;
  rencontre:Integer;
  sellOrBuy:Integer;

begin
     changerTailleConsole(200,60);
     jouer:=True;
     start:=True;
     accueil();                            //Lancement du premier écran (accueil)
     tour:=0;
     initialisation();

     begin
          while start=True do
          begin
            readln(page1);
            case(page1) of
              1:                             //Nouvelle partie
                begin
                  creer_partie();
                  couleurTexte(3);
                  readln(name);
                  setName(name);
                  start:=False;
                end;
              2:
                begin
                  exit();                    //Quitter le jeu
                end;
            end;
          end;

          while jouer=True do
          begin
            menu:=True;
            while menu=True do
              begin
              page1:=-1;
              interface_ile();
              readln(page1);
              case(page1) of
                1:                            //Tour suivant
                  begin
                       randomize;
                       tour:=tour+1;
                       fin_tour();
                       rencontre:=random(5);
                       //rencontre:=0;
                       if rencontre = 0 then
                          begin
                            menuMarchand:=True;
                            while menuMarchand=True do
                              begin                       //Lancement interface du marchand
                                 interface_marchand();
                                 readln(action);
                                 case(action) of
                                    1:                              //Sélection poisson
                                      begin                         //Puis sélection quantité
                                        menuPoisson:=True;
                                        while menuPoisson = True do
                                          begin
                                           marchand_poisson();
                                           readln(sellOrBuy);
                                           case(sellOrBuy) of
                                              1:
                                                begin
                                                  if getPoissons()>=10 then
                                                     begin
                                                          setPoissons(-10);
                                                          setGold(30);
                                                     end;
                                                end;
                                              2:
                                                begin
                                                  if getPoissons()>=5 then
                                                     begin
                                                       setPoissons(-5);
                                                       setGold(15);
                                                     end;

                                                end;
                                              3:
                                                begin
                                                  if getPoissons()>=1 then
                                                     begin
                                                       setPoissons(-1);
                                                       setGold(3);
                                                     end;

                                                end;
                                              4:
                                                begin
                                                  if getPoissons()<=30 then
                                                     begin
                                                       setPoissons(10);
                                                       setGold(-30);
                                                     end;

                                                end;
                                              5:
                                                begin
                                                  if getPoissons()<=35 then
                                                     begin
                                                       setPoissons(5);
                                                       setGold(-15);
                                                     end;
                                                end;
                                              6:
                                                begin
                                                  if getPoissons()<=39 then
                                                     begin
                                                       setPoissons(1);
                                                       setGold(-3);
                                                     end;
                                                end;
                                              0:
                                                menuPoisson:=False;   //Retour interface du marchand
                                           end;
                                          end;
                                      end;
                                    2:                            //Sélection bois
                                      begin                       //Puis sélection quantité
                                        menuBois:=True;
                                        while menuBois = True do
                                          begin
                                           marchand_bois();
                                           readln(sellOrBuy);
                                           case(sellOrBuy) of
                                              1:
                                                begin
                                                  if getBois()>=10 then
                                                     begin
                                                       setBois(-10);
                                                       setGold(50);
                                                     end;
                                                end;
                                              2:
                                                begin
                                                  if getBois()>=5 then
                                                     begin
                                                       setBois(-5);
                                                       setGold(25);
                                                     end;
                                                end;
                                              3:
                                                begin
                                                  if getBois()>=1 then
                                                     begin
                                                       setBois(-1);
                                                       setGold(5);
                                                     end;
                                                end;
                                              4:
                                                begin
                                                  if getBois()<=30 then
                                                     begin
                                                       setBois(10);
                                                       setGold(-50);
                                                     end;
                                                end;
                                              5:
                                                begin
                                                  if getBois()<=35 then
                                                     begin
                                                       setBois(5);
                                                       setGold(-25);
                                                     end;
                                                end;
                                              6:
                                                begin
                                                  if getBois()<=39 then
                                                     begin
                                                       setBois(1);
                                                       setGold(-5);
                                                     end;
                                                end;
                                              0:
                                                menuBois:=False;    //Retour interface du marchand
                                           end;
                                          end;
                                      end;
                                    3:                             //Sélection outils
                                      begin                        //Puis sélection quantité
                                        menuOutils:=True;
                                        while menuOutils = True do
                                          begin
                                           marchand_outils();
                                           readln(sellOrBuy);
                                           case(sellOrBuy) of
                                              1:
                                                begin
                                                  if getOutils()>=10 then
                                                     begin
                                                       setOutils(-10);
                                                       setGold(150);
                                                     end;
                                                end;
                                              2:
                                                begin
                                                  if getOutils()>=5 then
                                                     begin
                                                       setOutils(-5);
                                                       setGold(75);
                                                     end;
                                                end;
                                              3:
                                                begin
                                                  if getOutils()>=1 then
                                                     begin
                                                       setOutils(-1);
                                                       setGold(15);
                                                     end;
                                                end;
                                              4:
                                                begin
                                                  if getOutils()<=30 then
                                                     begin
                                                       setOutils(10);
                                                       setGold(-150);
                                                     end;
                                                end;
                                              5:
                                                begin
                                                  if getOutils()<=35 then
                                                     begin
                                                       setOutils(5);
                                                       setGold(-75);
                                                     end;
                                                end;
                                              6:
                                                begin
                                                  if getOutils()<=39 then
                                                     begin
                                                       setOutils(1);
                                                       setGold(-15);
                                                     end;
                                                end;
                                              0:
                                                menuOutils:=False;     //Retour interface du marchand
                                           end;
                                          end;
                                      end;
                                    4:                                //Sélection laine
                                      begin                           //Puis sélection quantité
                                        menuLaine:=True;
                                        while menuLaine = True do
                                          begin
                                           marchand_laine();
                                           readln(sellOrBuy);
                                           case(sellOrBuy) of
                                              1:
                                                begin
                                                  if getLaine()>=10 then
                                                     begin
                                                       setLaine(-10);
                                                       setGold(80);
                                                     end;
                                                end;
                                              2:
                                                begin
                                                  if getLaine()>=5 then
                                                     begin
                                                       setLaine(-5);
                                                       setGold(40);
                                                     end;
                                                end;
                                              3:
                                                begin
                                                  if getLaine()>=1 then
                                                     begin
                                                       setLaine(-1);
                                                       setGold(8);
                                                     end;
                                                end;
                                              4:
                                                begin
                                                  if getLaine()<=30 then
                                                     begin
                                                       setLaine(10);
                                                       setGold(-80);
                                                     end;
                                                end;
                                              5:
                                                begin
                                                  if getLaine()<=35 then
                                                     begin
                                                       setLaine(5);
                                                       setGold(-40);
                                                     end;
                                                end;
                                              6:
                                                begin
                                                  if getLaine()<=39 then
                                                     begin
                                                       setLaine(1);
                                                       setGold(-8);
                                                     end;
                                                end;
                                              0:
                                                menuLaine:=False;          //Retour interface du marchand
                                           end;
                                          end;
                                      end;
                                    5:                                    //Sélection tissu
                                      begin                               //Puis sélection quantité
                                        menuTissu:=True;
                                        while menuTissu = True do
                                          begin
                                           marchand_tissu();
                                           readln(sellOrBuy);
                                           case(sellOrBuy) of
                                              1:
                                                begin
                                                  if getTissu()>=10 then
                                                     begin
                                                       setTissu(-10);
                                                       setGold(80);
                                                     end;

                                                end;
                                              2:
                                                begin
                                                  if getTissu()>=5 then
                                                     begin
                                                       setTissu(-5);
                                                       setGold(40);
                                                     end;
                                                end;
                                              3:
                                                begin
                                                  if getTissu()>=1 then
                                                     begin
                                                       setTissu(-1);
                                                       setGold(8);
                                                     end;
                                                end;
                                              4:
                                                begin
                                                  if getTissu()<=30 then
                                                     begin
                                                       setTissu(10);
                                                       setGold(-80);
                                                     end;
                                                end;
                                              5:
                                                begin
                                                  if getTissu()<=35 then
                                                     begin
                                                       setTissu(5);
                                                       setGold(-40);
                                                     end;
                                                end;
                                              6:
                                                begin
                                                  if getTissu()<=39 then
                                                     begin
                                                       setTissu(1);
                                                       setGold(-8);
                                                     end;
                                                end;
                                              0:
                                                menuTissu:=False;     //Retour interface du marchand
                                           end;
                                          end;
                                      end;
                                    0:
                                      menuMarchand:=False;   //Retour interface île
                                 end;
                              end;
                          end;
                       menu:=False;
                  end;
                2:
                  begin                       //Accéder au menu de gestion des batiments
                  menuBatiment:=True;
                  while menuBatiment=True do
                    begin
                     page2:=-1;
                     interface_batiment();
                     readln(page2);
                     case(page2) of
                       1:                       //Construire un batiment
                         begin
                          menuConstruction:=True;
                          while menuConstruction=True do
                            begin
                             batiment:=-1;
                             creer_batiment();
                             readln(batiment);
                             case(batiment) of                    //Contruction de batiment
                                1:construDestru(1,1);
                                2:construDestru(1,2);
                                3:construDestru(1,3);
                                4:construDestru(1,4);
                                5:construDestru(1,5);
                                6:construDestru(1,6);
                                7:construDestru(1,7);
                                8:construDestru(1,8);
                                9:construDestru(1,9);

                                0:menuConstruction:=False;      //Retour interface île

                             end;
                            end;
                         end;
                       2:                       //Détruire un batiment
                         begin
                          menuDestruction:=True;
                          while menuDestruction=True do
                            begin
                              batiment:=-1;
                              detruire_batiment();
                              readln(batiment);
                              case(batiment) of                    //Destruction de batiment
                                1:construDestru(-1,1);
                                2:construDestru(-1,2);
                                3:construDestru(-1,3);
                                4:construDestru(-1,4);
                                5:construDestru(-1,5);
                                6:construDestru(-1,6);
                                7:construDestru(-1,7);
                                8:construDestru(-1,8);
                                9:construDestru(-1,9);

                                0:menuDestruction:=False;      //Retour interface île

                             end;
                             end;
                         end;
                       0:  menuBatiment:=False;           //Retour à l'écran de gestion de l'ile

                     end;

                     end;
                    end;
                0:begin                         //Quitter le jeu
                    exit();
                  end;
              end;
            end;
          end;

     end;

     readln;
end.
