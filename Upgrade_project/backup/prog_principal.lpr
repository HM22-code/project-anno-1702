program prog_principal;

{$codepage utf8}

uses SysUtils,GestionEcran, unit_ecran, unit_texte, unit_variable, unit_sauvegarde;

var
  start:Boolean;
  jouer:Boolean;
  menu, menuBatiment,menuDestruction, menuConstruction, menuNavire, menuSelectNavire,menuChoixIle:Boolean;
  menuMarchand, menuAction:Boolean;
  name:String;
  page1,page2:Integer;
  batiment,selectNavire,explorer,selectIle:Integer;
  nomNavire:String;
  coo:coordonnees;
  afficheNavire:tab;
  i,j,coeff:Integer;
  action:Integer;
  rencontre:Integer;
  sellOrBuy:Integer;
  afficheTab:tabIle;
  afficheTest:tab;
  ancienneIle:Integer;
  choixLvl:Integer;

begin
     changerTailleConsole(200,60);
     jouer:=True;
     start:=True;
     accueil();                            //lancement du premier écran (accueil)

     begin
          while start=True do
          begin
            readln(page1);
            case(page1) of
              1:                             //nouvelle partie
                begin
                  creer_partie();

                  couleurTexte(3);

                  readln(choixLvl);
                  while (choixLvl<>1) AND (choixLvl<>2) AND (choixLvl<>3) do     //choix du niveau
                    begin
                      deplacerCurseurXY(112,8);
                      readln(choixLvl);
                    end;

                  initialisation(choixLvl);
                  ilePrendVariable(1);
                  nomIle(1);
                  deplacerCurseurXY(28,10);
                  readln(name);
                  setName(name);
                  deplacerCurseurXY(112,10);
                  start:=False;
                end;
              2:
                begin
                  exit();                    //quitter le jeu
                end;
              3:
                begin
                  if FileExists('sauvegardeTabIle.dat') AND FileExists('sauvegarde.dat') AND FileExists('sauvegardeTabNavire.dat') then    //charger une partie
                     begin
                       readTabIle();
                       readSauv();
                       readTabNavire();
                       start:=False;
                     end

                  else
                    begin
                      coo.x:=74;
                      coo.y:=58;
                      couleurTexte(4);
                      ecrireEnPosition(coo,txt(102));
                      couleurTexte(3);
                      deplacerCurseurXY(101,57);
                    end;
                end;
            end;
            deplacerCurseurXY(101,57);
          end;

          while jouer=True do                        //Boucle prinicpal du jeu
          begin
            menu:=True;
            while menu=True do
              begin
              page1:=-1;
              setStockage(40*getEntrepots());
              case (getNumIle()) of                        //En fonction de l'île ou on est on importe les bonnes variables du tableau
                1:ileDonneVariable(1);
                2:ileDonneVariable(2);
                3:ileDonneVariable(3);
                4:ileDonneVariable(4);
                5:ileDonneVariable(5);
                6:ileDonneVariable(6);
              end;



              interface_ile();
              readln(page1);
              case(page1) of
                1:                            //Tour suivant
                  begin
                       setTour(1);
                       afficheNavire:=getAfficheNavire();
                       for i:=1 to getNbNavire() do
                         if afficheNavire[i,8]='vrai' then              //Si le navire est sur vrai (càd qu'il peut aller explorer)
                           afficheNavire[i,6]:=IntToStr(StrToInt(afficheNavire[i,6])+1);    //On ajoute un à tourNavire
                       setAfficheNavire(afficheNavire);
                       afficheTest:=getAfficheNavire();
                       for i:=1 to getNbNavire() do                      //Pour i allant de 1 au nombre de navires
                         begin
                           if ((StrToInt(afficheTest[i,6]))>=(StrToInt(afficheTest[i,7])))   then     //Si tourNavire=randTour  alors on arrive sur la nouvelle ile
                             begin
                             if afficheTest[i,8] ='vrai' then
                               begin
                                if getNbIleDecouvert()<>6 then
                                  begin
                                    if afficheTest[i,3]= txt(83) then
                                      setExplorerNavire(1)
                                    else
                                      setExplorerIle(1);
                                    ancienneIle:=getNumIle();
                                    ileDonneVariable(getNumIle());
                                    ilePrendVariable(StrToInt(afficheTest[i,9]));

                                    setNbNavireIle(-1);
                                    ileDonneVariable(getNumIle());

                                    ilePrendVariable(getNbIleDecouvert()+1);
                                    setNbNavireIle(1);
                                    nomIle(getNbIleDecouvert()+1);
                                    afficheTest[i,5] := txt(110);
                                    nomIle(ancienneIle);
                                    afficheTest[i,8] :='faux';
                                    setAfficheNavire(afficheTest);
                                    ileDonneVariable(getNumIle());
                                    ilePrendVariable(ancienneIle);

                                  end;
                                end;
                               end
                           else if StrToInt(afficheTest[i,6])=0 then
                             afficheTest[i,5] := txt(109)
                           else if ((StrToInt(afficheTest[i,6]))<(StrToInt(afficheTest[i,7])))   then
                             afficheTest[i,5] := txt(111);
                         end;

                       setAfficheNavire(afficheTest);
                       fin_tour();
                       readln();
                       rencontre:=random(5);
                       //rencontre:=0;
                       if rencontre = 2 then
                          begin
                            menuMarchand:=True;
                            while menuMarchand=True do
                              begin                                         //Lancement interface du marchand
                                 interface_marchand();
                                 readln(action);
                                 if action=0 then
                                    menuMarchand:=False
                                  else
                                    begin
                                      for i:=1 to 5 do
                                          if i=action then
                                            begin
                                              menuAction:=True;
                                              while menuAction=True do
                                                begin
                                                  appelleMarchand(i);
                                                  readln(sellOrBuy);
                                                  case(sellOrBuy) of
                                                    0: menuAction:=False;
                                                    1: coeff:=-10;
                                                    2: coeff:=-5;
                                                    3: coeff:=-1;
                                                    4: coeff:=10;
                                                    5: coeff:=5;
                                                    6: coeff:=1;
                                                  end;
                                                  if appelleRessource(i)>=-1*coeff then
                                                    begin
                                                      nouvelleRessource(i,coeff);
                                                      setGold(-3*coeff);
                                                    end;
                                                end;

                                            end;
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
                             readln(batiment);                   //Choix du batiment
                             case(batiment) of
                                1:construDestru(1,1);
                                2:construDestru(1,2);
                                3:construDestru(1,3);
                                4:construDestru(1,4);
                                5:construDestru(1,5);
                                6:construDestru(1,6);
                                7:construDestru(1,7);
                                8:construDestru(1,8);
                                9:construDestru(1,9);
                                10:construDestru(1,10);

                                0:menuConstruction:=False;      //retour interface île

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
                              case(batiment) of                    //destruction de batiment
                                1:construDestru(-1,1);
                                2:construDestru(-1,2);
                                3:construDestru(-1,3);
                                4:construDestru(-1,4);
                                5:construDestru(-1,5);
                                6:construDestru(-1,6);
                                7:construDestru(-1,7);
                                8:construDestru(-1,8);
                                9:construDestru(-1,9);
                                10:construDestru(-1,10);
                                0:menuDestruction:=False;      //retour interface île

                             end;
                             end;
                         end;
                       0:  menuBatiment:=False;                     //Retour à l'écran de gestion de l'ile

                     end;

                     end;
                    end;
                3:                                           //Allez sur l'île suivante
                  begin
                    menuChoixIle:=True;
                    while menuChoixIle=True do
                      begin
                        page2:=-1;
                        ile_suivante();
                        deplacerCurseurXY(115,35);
                        readln(page2);
                        case(page2) of
                          1:                                           //Atterir sur une nouvelle île
                            begin
                              if getExplorerIle()=0 then
                                begin
                                  cadre_info(10,49,3,4,4,39,117);        //si explorer est sur false
                                  readln();
                                end
                              else
                                begin
                                  afficheNavire:=getAfficheNavire();
                                  for i:=1 to getNbNavire() do
                                    begin
                                      if (afficheNavire[i,3]=txt(113)) AND (afficheNavire[i,6]>=afficheNavire[i,7]) then  //si le navire est un navire de colonisation et s'il est arrivé à destination
                                        begin
                                          setNbIleDecouvert(1);
                                          setExplorerIle(-1);
                                          ileDonneVariable(getNumIle());
                                          ilePrendVariable(getNbIleDecouvert());
                                        end;

                                     end;
                                 end;

                              end;


                          2:                                                        //Changer d'île
                            begin
                              selectIle:=-1;
                              afficheTab:=getIleTab();
                              coo.x:=110;
                              coo.y:=11;
                              deplacerCurseurXY(130,25);
                              readln(selectIle);
                              for i:=1 to getNbIleDecouvert() do
                                begin
                                  if i=selectIle then
                                    begin

                                      ilePrendVariable(i);
                                      nomIle(i);
                                      ColorierZone(3,3,10,11+i,1);
                                    end;

                                end;

                              menuChoixIle:=False;
                            end;
                          0: menuChoixIle:=False;

                          end;

                        end;
                      end;

                4:                                           //Accédez au menu de gestion des navires
                  begin
                   menuNavire:=True;
                   while menuNavire=True do
                    begin
                     page2:=-1;
                     interface_navire();
                     deplacerCurseurXY(115,35);
                     readln(page2);
                     case(page2) of
                       1:                                                //Construire un navire d'exploration
                         begin
                          if getChantierNaval()=0 then
                             begin
                               cadre_info(104,25,3,4,4,39,79);
                               readln();
                             end
                          else
                            begin
                             if getNbNavire()<=40 then
                                begin
                                  if getBois()>=12  then
                                     begin
                                       if getTissu() >=8 then
                                          begin
                                           setNbNavire(1);
                                           setBois(-12);
                                           setTissu(-8);
                                           coo.x:=110;
                                           coo.y:=11;
                                           ecrireEnPosition(coo,txt(82));
                                           readln(nomNavire);
                                           navire(IntToStr(getNbNavire()),txt(83),nomNavire);
                                          end
                                        else
                                          begin
                                            cadre_info(104,25,3,4,4,39,43);
                                            readln();
                                          end;

                                     end;

                                end
                             else
                               begin
                                 cadre_info(104,25,3,4,4,39,122);
                                 readln();
                               end;
                            end;
                         end;
                       2:                                                  //Construire un navire de colonisation
                         begin
                          if getChantierNaval()=0 then
                             begin
                               cadre_info(104,25,3,4,4,39,79);
                               readln();
                             end
                          else
                            begin
                             if getNbNavire()<=40 then
                                begin
                                  if getBois()>=32 then
                                     if getTissu()>=16 then
                                        begin
                                          if getOutils()>=20 then
                                             begin
                                               setNbNavire(1);
                                               setBois(-32);
                                               setTissu(-16);
                                               setOutils(-20);
                                               coo.x:=110;
                                               coo.y:=11;
                                               ecrireEnPosition(coo,txt(82));
                                               readln(nomNavire);
                                               navire(IntToStr(getNbNavire()),txt(113),nomNavire);

                                             end
                                          else
                                            begin
                                              cadre_info(104,25,3,4,4,39,43);
                                              readln();
                                            end;
                                        end;
                                end
                             else
                               begin
                                 cadre_info(104,25,3,4,4,39,122);
                                 readln();
                               end;
                            end;
                         end;
                       3:                                                          //Séléctionner un navire
                         begin
                          menuSelectNavire:=True;
                          while menuSelectNavire=True do                          //Selection navire
                           begin
                              if getNbNavire()>0 then
                                 begin
                                   selectNavire:=-1;
                                   coo.x:=110;
                                   coo.y:=11;
                                   //ecrireEnPosition(coo,txt(88));
                                   deplacerCurseurXY(130,25);
                                   readln(selectNavire);
                                   selection_navire(selectNavire);
                                   for i:=0 to selectNavire do
                                       begin
                                        if i=selectNavire then
                                           begin
                                             if (i>0) AND (i<=getNbNavire()) then
                                                begin
                                                  selection_navire(i);
                                                  deplacerCurseurXY(130,25);
                                                  //dessinerCadreXY(12,13+i,92,13+i,simple,3,3);

                                                  readln(explorer);
                                                  case(explorer) of
                                                    1:                                          //Partir à l'exploration
                                                      begin
                                                        afficheNavire:=getAfficheNavire();
                                                        if StrToInt(afficheNavire[i,6])>=StrToInt(afficheNavire[i,7]) then
                                                           begin
                                                             cadre_info(104,25,3,4,4,39,112);
                                                             readln();
                                                             menuSelectNavire:=False;
                                                           end
                                                        else
                                                          begin
                                                            if afficheNavire[i,3]=txt(83) then      //si le bateau est un bateau d'exploration
                                                               begin
                                                                  afficheNavire[i,8]:='vrai';
                                                                  setAfficheNavire(afficheNavire);
                                                                  cadre_info(104,25,3,2,2,40,89);
                                                                  readln();
                                                                  menuSelectNavire:=False;
                                                               end
                                                            else
                                                              begin
                                                                if afficheNavire[i,3]=txt(113) then   //si le bateau est un bateau de colonisation
                                                                 begin
                                                                   afficheNavire:=getAfficheNavire();
                                                                   for j:=1 to getNbNavire() do
                                                                     begin
                                                                        if ((afficheNavire[j,6])>=(afficheNavire[j,7])) AND (afficheNavire[j,3]=txt(83)) then
                                                                            begin
                                                                              afficheNavire[i,8]:='vrai';
                                                                              setAfficheNavire(afficheNavire);
                                                                              setExplorerNavire(-1);
                                                                              cadre_info(104,25,3,2,2,40,89);
                                                                              readln();
                                                                              menuSelectNavire:=False;
                                                                              menuNavire:=False;
                                                                            end;
                                                                     end;
                                                                   if afficheNavire[i,8]='faux' then
                                                                      begin
                                                                       cadre_info(104,25,3,4,4,39,119);
                                                                       readln();
                                                                       menuSelectNavire:=False;
                                                                      end;
                                                                 end;
                                                              end;
                                                          end;
                                                      end;

                                                    0: menuSelectNavire:=False;
                                                  end;
                                                end
                                             else if i=0 then                           //si i=0 alors on revient en arrière
                                                menuSelectNavire:=False
                                             else
                                               begin
                                                 cadre_info(104,25,3,4,4,39,87);        //si i supérieur au nombre de navire alors dire que le chiffre ne correspond pas
                                                 readln();
                                                 menuSelectNavire:=False;
                                               end;

                                           end;


                                       end;

                                 end
                              else
                                begin
                                 cadre_info(104,25,3,4,4,39,84);        //Vous n'avez pas de navire
                                 readln();
                                 menuSelectNavire:=False;
                                end;
                            end;

                           end;
                       0: menuNavire:=False;
                     end;

                    end;

                  end;
                0:begin                         //quitter le jeu
                    writeTabIle();
                    writeSauv();
                    writeTabNavire();
                    exit();
                  end;
                {5:                                         //Tableau permettant de vérifier les variables de chaque ile
                  begin
                   afficheTab:=getIleTab();
                   for i:=1 to 22 do
                     begin
                       for j:=1 to 6 do
                         begin
                           write(afficheTab[i,j],' ');
                         end;
                       writeln();
                     end;

                   writeln();
                   writeln('nb num ile: ' ,getNumIle());
                   writeln();
                   writeln('nb ile decouvert: ' , getNbIleDecouvert());
                   writeln();
                   writeln('nb navire: ' , getNbNavire());
                   writeln();
                   writeln('explorer ile: ' , getExplorerIle());


                   readln();

                  end;}
              end;
            end;
          end;

     end;

     readln;
end.
