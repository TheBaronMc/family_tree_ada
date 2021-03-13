with Ada.Text_IO; use Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;
with Ada.Characters.Handling; use Ada.Characters.Handling;


with P_Arbre_Genealog; use P_Arbre_Genealog;
with P_Personne; use P_Personne;
with P_Date; use P_Date;

with p_liste;

procedure Main is

   package p_liste_personne is new p_liste(T_Element        => T_Personne,
                                           afficher_element => affichePersonne,
                                           egale            => egale);
   use p_liste_personne;

   -- choix dans le menu
   choix_s: Unbounded_String;
   choix: Character;
   choix_avancee: Character;

   -- creation de personne
   id: Integer := 0;
   personne: T_Personne;
   id_choix_s: Unbounded_String;
   id_choix: Integer;

   -- ajouter parent
   numero_parent: Integer;

   -- arbre genealogique
   arbre_initialise: Boolean := False;
   racine_arbre: T_AG;
   noeud : T_AG;

   -- liste personne
   --liste_personne: Arbre_Genealog.p_liste_personne.liste_chainee;
   racine_affichage: T_AG;

   procedure affiche_personne_liste (noeud: in out T_Liste) is
      num : Integer := 1;
      pers : T_Personne;
   begin
      while not est_vide(liste => noeud) loop
         pers := enlever_tete(liste => noeud);
         Put_Line("Personne "&num'Image&" :");
         affichePersonne (personne => pers);
         New_Line;
         num := num + 1;
      end loop;
   end affiche_personne_liste;

   function est_un_entier(chaine: String) return Boolean is
      entier: Integer;
   begin
      entier := Integer'Value (chaine);
      return True;
   exception
      when others =>
         return False;
   end est_un_entier;

   function Obtenir_entier (phrase_de_demande: Unbounded_String) return Integer is
   begin
       loop
         Put (To_String(Source => phrase_de_demande));
         Get_Line (id_choix_s);
         exit when est_un_entier(chaine => To_String(id_choix_s));
       end loop;

       return Integer'Value(To_String(id_choix_s));
   end Obtenir_entier;


   function creation_date return T_Date is
      annee: Integer;
      mois: Integer;
      jour: Integer;
      limite_fevrier: Integer;
   begin
      -- R0: créer une date
      -- R1: Comment R0 ?
      -- Demander l'année (R1.1)
      -- Demander le mois (R1.2)
      -- Demander le jour (R1.3)
      -- R2: Comment R1.1 ?
      -- loop
      --    annee := Obtenir_entier(To_Unbounded_String("Annee : "));
      --    exit when annee >= 0;
      -- end loop;
      -- R2: Comment R1.2 ?
      -- loop
      --    mois := Obtenir_entier(To_Unbounded_String("Mois : "));
      --    exit when (mois >= 1) or (mois <= 12);
      -- end loop;
      -- R2: Comment R1.3 ?
      -- Si le mois contient 31 jours (R2.1)
      -- Si le mois contient 30 jours (R2.2)
      -- Si il s'agit du moi de févirer (R2.3)
      -- R3: Comment R2.1 ?
      -- if mois = 1 or mois = 3 or mois = 5 or mois = 7 or mois = 8 or mois = 10 or mois = 12 then
      --     loop
      --        mois := Obtenir_entier(To_Unbounded_String("Jour : "));
      --        exit when (mois >= 1) or (mois <= 31);
      --     end loop;
      -- end if;
      -- R3: Comment R2.2 ?
      -- if mois = 4 or mois = 6 or mois = 9 or mois = 11 then
      --     loop
      --        mois := Obtenir_entier(To_Unbounded_String("Jour : "));
      --        exit when (mois >= 1) or (mois <= 30);
      --     end loop;
      -- end if;
      -- R3: Comment R2.3 ?
      -- if mois = 2 then
      --     if annee mod 4 = 0 then
      --         limite_fevrier := 29;
      --     else
      --         limite_fevrier := 28;
      --     end if;
      --     loop
      --        jour := Obtenir_entier(To_Unbounded_String("Jour : "));
      --        exit when (jour >= 1) or (jour <= limite_fevrier);
      --     end loop;
      -- end if;


      -- Demande annee
      loop
         annee := Obtenir_entier(To_Unbounded_String("Annee : "));
         exit when annee >= 0;
      end loop;

      -- Demande mois
      loop
         mois := Obtenir_entier(To_Unbounded_String("Mois : "));
         exit when (mois >= 1) and (mois <= 12);
      end loop;

      -- Demande jour
         -- Si le mois contient 31 jours
      if mois = 1 or mois = 3 or mois = 5 or mois = 7 or mois = 8 or mois = 10 or mois = 12 then
         loop
            jour := Obtenir_entier(To_Unbounded_String("Jour : "));
            exit when (jour >= 1) and (jour <= 31);
         end loop;
         -- Si le mois contient 30 jours
      elsif mois = 4 or mois = 6 or mois = 9 or mois = 11 then
         loop
            mois := Obtenir_entier(To_Unbounded_String("Jour : "));
            exit when (jour >= 1) and (jour <= 30);
         end loop;
         -- Si il s'agit du mois de Février
      elsif mois = 2 then
         if annee mod 4 = 0 then
            limite_fevrier := 29;
         else
            limite_fevrier := 28;
         end if;
         loop
            jour := Obtenir_entier(To_Unbounded_String("Jour : "));
            exit when (jour >= 1) and (jour <= limite_fevrier);
         end loop;
      end if;

      return Obtenir_date(jour => jour, mois => mois, annee => annee);
   end creation_date;

   function Obtenir_choix1_ou_choix2(phrase: String; choix1: Character; choix2: Character) return Character is
      saisie: Character;
   begin
      loop
         Put(phrase&" ("&choix1&"/"&choix2&") : ");
         Get(saisie);
         Skip_Line;
         exit when To_Upper(saisie) = To_Upper(choix1) or To_Upper(saisie) = To_Upper(choix2);
      end loop;

      return saisie;
   end Obtenir_choix1_ou_choix2;

   function creation_personne(id: in Integer) return T_Personne is
      personne: T_Personne;
      prenom: Unbounded_String;
      nom: Unbounded_String;
      sexe: Character;
      pays_naissance: Unbounded_String;
      ville_naissance: Unbounded_String;
      date_naissance: T_Date;
      pays_deces: Unbounded_String;
      ville_deces: Unbounded_String;
      date_deces: T_Date;
   begin
      -- A: Personne inconnue (Vous devrez au moins renseigner le sexe)
      -- B: Personne minimal (Prenom, nom, sexe)
      -- C: Personne (Option B + pays de naissance, ville de naissance, date de naissance)
      -- D: Personne (Option C + pays de mort, ville de mort, date de mort)

      -- R0: Créer une personne
      -- R1: Comment R0 ?
      -- Demander quel type de personne l'utilisateur veut créer (R1.1)
      -- Récupérer les informations nécessaires (R1.2)
      -- Créer la personne (R1.3)
      -- R2: Comment R1.1 ?
      -- loop
      --     Get_Line(Item => choix_s);
      --     choix := To_String(choix_s)(1);
      --     exit when choix = 'A' or choix = 'B' or choix = 'C' or choix = 'D';
      -- end loop;
      -- R2: Comment R1.2 ?
      -- if choix = 'A' then
      --     loop
      --         Put("sexe (M/F):");
      --         Get_Line(Item => choix_s);
      --         sexe := To_String(choix_s)(1);
      --         exit when sexe = 'M' or sexe = 'F';
      --     end loop;
      --     personne := Creer_Personne(id => id, prenom => To_Unbounded_String("Inconnu(e)"), nom => To_Unbounded_String("Inconnu(e)"), sexe => sexe);
      -- else
      --     Put("prenom : ");
      --     Get_Line(prenom);
      --     Put("nom : ");
      --     Get_Line(nom);
      --     loop
      --         Put("sexe (M/F):");
      --         Get_Line(Item => choix_s);
      --         sexe := To_String(choix_s)(1);
      --         exit when sexe = 'M' or sexe = 'F';
      --     end loop;
      --     if choix = 'C' or choix = 'D' then
      --         if choix = 'D' then
      --         end if;
      --     end if;
      -- end if;

      Put_Line("A: Personne inconnue");
      Put_Line("B: Personne non détaillée (Prenom, nom, sexe)");
      Put_Line("C: Personne détaillée (Option B + pays de naissance, ville de naissance, date de naissance)");
      Put_Line("D: Personne très détaillée (Option C + pays de mort, ville de décès, date de décès)");

      loop
         Put("Quel type : ");

         Get(choix);
         Skip_Line;

         choix := To_Upper(choix);

         exit when choix = 'A' or choix = 'B' or choix = 'C' or choix = 'D';
      end loop;

      if choix = 'A' then
         personne := Creer_Personne(id => id, prenom => To_Unbounded_String("Inconnu(e)"), nom => To_Unbounded_String("Inconnu(e)"), sexe => 'N');
      else
         Put("Prenom : ");
         Get_Line(prenom);
         Put("Nom : ");
         Get_Line(nom);
         sexe := Obtenir_choix1_ou_choix2 (phrase => "Sexe", choix1 => 'M', choix2 => 'F');
         sexe := To_Upper(sexe);
         if choix = 'C' or choix = 'D' then
            Put("Pays naissance : ");
            Get_Line(pays_naissance);
            Put("Ville naissance : ");
            Get_Line(ville_naissance);
            Put_Line("Date de naissance : ");
            date_naissance := creation_date;

            if choix = 'D' then
               Put("Pays décès : ");
               Get_Line(pays_deces);
               Put("Ville décès : ");
               Get_Line(ville_deces);
               Put_Line("Date de décès : ");
               date_deces := creation_date;

               personne := Creer_Personne (id     => id,
                                  prenom          => prenom,
                                  nom             => nom,
                                  sexe            => sexe,
                                  pays_naissance  => pays_naissance,
                                  ville_naissance => ville_naissance,
                                  date_naissance  => date_naissance,
                                  pays_deces      => pays_naissance,
                                  ville_deces     => ville_deces,
                                  date_deces      => date_deces);
            else
               personne := Creer_Personne(id     => id,
                                 prenom          => prenom,
                                 nom             => nom,
                                 sexe            => sexe,
                                 pays_naissance  => pays_naissance,
                                 ville_naissance => ville_naissance,
                                 date_naissance  => date_naissance);
            end if;
         else
            personne := Creer_Personne(id => id, prenom => prenom, nom => nom, sexe => sexe);
         end if;
      end if;

      return personne;
   end creation_personne;

   function Obtenir_arbre_par_defaut return T_AG is
      personne : T_Personne;
      arbre : T_AG;
   begin
      -- origine
      personne := Creer_Personne (id => 0, prenom => To_Unbounded_String("Charly"), nom => To_Unbounded_String("Ginevra"), sexe => 'M');
      arbre := creation_arbre (personne => personne);

      -- père
      personne := Creer_Personne (id => 1, prenom => To_Unbounded_String("Daniel"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Ginevra"), sexe => 'M');
      ajouter_parent1(racine => arbre, enfant => Creer_Personne (id => 0), parent => personne);

      -- grand père paternel
      personne := Creer_Personne (id => 3, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Philippe"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Ginevra"), sexe => 'M');
      ajouter_parent1(racine => arbre, enfant => Creer_Personne (id => 1), parent => personne);

       -- grand mère paternel
      personne := Creer_Personne (id => 4, prenom => Ada.Strings.Unbounded.To_Unbounded_String("André"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Colonel"), sexe => 'F');
      ajouter_parent2(racine => arbre, enfant => Creer_Personne (id => 1), parent => personne);

      -- arrière grand père
      personne := Creer_Personne (id => 7, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Inconnu(e)"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Inconnu(e)"), sexe => 'M');
      ajouter_parent1(racine => arbre, enfant => Creer_Personne (id => 4), parent => personne);

      -- mère
      personne := Creer_Personne (id => 2, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Catherine"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Simcic"), sexe => 'F');
      ajouter_parent2(racine => arbre, enfant => Creer_Personne (id => 0), parent => personne);

      -- grand père maternel
      personne := Creer_Personne (id => 5, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Alfred"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Simcic"), sexe => 'M');
      ajouter_parent1(racine => arbre, enfant => Creer_Personne (id => 2), parent => personne);

      -- grand mère maternel
      personne := Creer_Personne (id => 6, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Josette"), nom => Ada.Strings.Unbounded.To_Unbounded_String("France"), sexe => 'F');
      ajouter_parent2(racine => arbre, enfant => Creer_Personne (id => 2), parent => personne);

      return arbre;
   end Obtenir_arbre_par_defaut;

   procedure Generer_arbre(arbre: out T_AG; id: in out Integer) is
      personne : T_Personne;
      choix_avancee : Character;
   begin
      choix_avancee := Obtenir_choix1_ou_choix2 (phrase => "Voulez vous utiliser l'arbre par défaut ?", choix1 => 'Y', choix2 => 'N');
      if To_Upper(choix_avancee) = 'N' then
         id := 0;
         personne := creation_personne(id => id);
         arbre := creation_arbre (personne => personne);
         id := id + 1;
      else
         arbre := Obtenir_arbre_par_defaut;
         id := 8;
      end if;

   end Generer_arbre;

begin
   Put_Line("===========================================");
   Put_Line("              ARBRE GENEALOGIQUE           ");
   Put_Line("===========================================");
   loop
      Put_Line("------------- MENU PRINCIPAL --------------");
      Put_Line("N) Nouvel Arbre      A) Afficher l'arbre   ");
      Put_Line("P) Ajouter parent    D) Voir les détails   ");
      Put_Line("S) Supprimer parent  M) Modifier personne  ");
      Put_Line("V) Actions avancées  E) Quitter            ");
      Put_Line("-------------------------------------------");

      Put("Votre choix : ");
      Get(choix);
      Skip_Line;

      case To_Upper(Item => choix) is
         when 'N' =>
            if not arbre_initialise then
               Generer_arbre(arbre => racine_arbre, id => id);
               arbre_initialise := True;
            else
               choix_avancee := Obtenir_choix1_ou_choix2 (phrase => "Êtes-vous certain de vouloir créer une nouvel arbre", choix1 => 'N' , choix2 => 'Y');

               if To_Upper(choix_avancee) = 'Y' then
                  Generer_arbre(arbre => racine_arbre, id => id);
               else
                  Put_Line("Abandon de creation d'un nouvel arbre.");
               end if;
            end if;
         when 'A' =>
            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else

               choix_avancee := Obtenir_choix1_ou_choix2 (phrase =>"Voulez vous afficher l'arbre depuis la racine ?" ,
                                                          choix1 => 'Y',
                                                          choix2 => 'N');
               choix_avancee := To_Upper(choix_avancee);

               racine_affichage := racine_arbre;

               begin
                  if choix_avancee = 'N' then
                     id_choix := Obtenir_entier(phrase_de_demande => To_Unbounded_String("L'idée de la personne que vous voulez pour racine : "));

                     racine_affichage := obtenir_noeud(racine => racine_arbre, personne_recherchee => Creer_Personne(id => id_choix));
                  end if;

                  Put_Line("============== Affichage arbre ==============");
                  affiche_abre_genealog(noeud => racine_affichage);
               exception
                     when personne_n_existe_pas => Put("La personne que vous voulez pour racine n'existe pas.");
               end;

            end if;
         when 'P' => null;
            -- R0: Ajouter un parent depuis le menu
            -- R1: Comment R0 ?
            --    Créer le parent (R1.1)
            --    Savoir qui est l'enfant (R1.2)
            --    Insérer en tant que parent1 ou parent2 (R1.3)

            -- R2.1: Comment R1.1 ?
            -- personne := creation_personne(id => id);

            -- R2.2: Comment R1.2 ?
            -- id_choix := Obtenir_entier (phrase_de_demande => To_Unbounded_String("A quelle personne voulez-vous ajouter un parent ? (insérer l'ID) : "));

            -- R2.3: Comment R1.3 ?
            --     Obtenir 1 ou 2 (R2.1)
            --     Insérer en conséquence (R2.2)

            -- R3.1: Comment R2.1 ?
            -- loop
            --    numero_parent := Obtenir_entier (phrase_de_demande => To_Unbounded_String("Quel parent1 ou parent2 (1/2) ? : "));
            --    exit when numéro_parent = 1 or numéro_parent = 2;
            -- end loop

            -- R3.2: Comment R2.2 ?
            -- if parent = 1 then
            --   ajouter
            -- else
            -- end if;

            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else
               -- Créer le parent
               personne := creation_personne(id => id);

               -- Savoir qui est l'enfant
               id_choix := Obtenir_entier (phrase_de_demande => To_Unbounded_String("A quelle personne voulez-vous ajouter un parent ? (insérer l'ID) : "));

               -- Insérer en tant que parent1 ou parent2
               loop
                  numero_parent := Obtenir_entier (phrase_de_demande => To_Unbounded_String("Quel parent1 ou parent2 (1/2) ? : "));
                  exit when numero_parent = 1 or numero_parent = 2;
               end loop;

               begin
                  if numero_parent = 1 then
                     ajouter_parent1(racine => racine_arbre,
                                     enfant => Creer_Personne(id => id_choix),
                                     parent => personne);
                  elsif numero_parent = 2 then
                     ajouter_parent2(racine => racine_arbre,
                                     enfant => Creer_Personne(id => id_choix),
                                     parent => personne);
                  end if;

                  Put_Line("La personne "&id'Image&" a été ajoutée.");
                  New_Line;

                  id := id + 1;

               exception
                  when insertion_erreur => Put_Line("Un parent est déjà présent. Vous pouvez modifier les informées ou supprimer la personne correspondante.");
                  when personne_n_existe_pas => Put_Line("La personne à laquelle vous voulez ajouter un parent n'existe pas.");
               end;

            end if;
         when 'D' => null;
            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else
               id_choix := Obtenir_entier(phrase_de_demande => To_Unbounded_String("Quelle personne voulez-vous voir en détails ? (insérer l'ID) : "));

               begin
                  personne := obtenir_personne (racine              => racine_arbre,
                                                personne_recherchee => Creer_Personne (id => id_choix));
                  Put_Line("============ détails personne "&id_choix'Image&" ============");
                  affichePersonne (personne => personne);
               exception
                  when personne_n_existe_pas => Put_Line("Cette personne n'existe pas.");
               end;
            end if;
         when 'S' => null;
            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else
               id_choix := Obtenir_entier(phrase_de_demande => To_Unbounded_String("Quel est l'ID de la personne que vous voulez supprimer ? : "));

               begin
                  supprimer_personne (racine => racine_arbre, personne => Creer_Personne (id => id_choix));
                  Put_Line("La personne "&id_choix'Image&" a été supprimée ainsi que ses ancêtres.");
                  New_Line;
               exception
                  when suppression_noeud_inexistant_erreur => Put_Line("La personne que vous voulez supprimer n'existe pas.");
                  when suppression_racine_erreur => Put_Line("Vous essayez de supprimer la personne à la racine de votre arbre. Pour cela vous devez recréer un nouvel arbre ou modifier les données correspondantes à ce noeud.");
               end;
            end if;
         when 'M' =>
            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else
               id_choix := Obtenir_entier(phrase_de_demande => To_Unbounded_String("Quel est l'ID de la personne que vous voulez modifier ? : "));
               personne := creation_personne(id => id_choix);

               begin
                  modifier_personne (racine            => racine_arbre,
                                     ancienne_personne => Creer_Personne(id => id_choix),
                                     nouvelle_personne => personne);
                  Put_Line("La personne "&id_choix'Image&" a été modifié.");
                  New_Line;
               exception
                  when personne_n_existe_pas => Put_Line("La personne que vous essayer de modifier n'existe pas.");
               end;
            end if;
         when 'V' =>
            if not arbre_initialise then
               Put_Line("Vous n'avez pas encore créé d'arbre.");
            else
               Put_Line("============= options avancées =============");
               Put_Line("A) Obtenir les ancêtres d'une personne.");
               Put_Line("B) Obtenir les ancêtres d'une génération.");
               --Put_Line("A) Obtenir l’ensemble des individus qui n’ont qu’un parent connu.");
               --Put_Line("B) Obtenir l’ensemble des individus dont les deux parents sont connus.");
               --Put_Line("C) Obtenir l’ensemble des individus dont les deux parents sont inconnus.");
               --Put_Line("D) Obtenir la succession d’ancêtres d’une génération donnée pour un nœud donné.");
               --Put_Line("E) Identifier les descendants d’une génération donnée pour un nœud donné");
               --Put_Line("F) Obtenir la succession de descendants d’une génération donnée pour un nœud donné");
               --Put_Line("S) Sortir");

               loop
                  Put("Votre option: ");
                  Get(choix_avancee);
                  Skip_Line;
                  exit when To_Upper(choix_avancee) in 'A'..'F';
               end loop;

               case To_Upper(choix_avancee) is
               when 'A' => null;
                  --id_choix := Obtenir_entier(phrase_de_demande => To_Unbounded_String("Quel est l'idée de la personne : "));

                  --liste_personne := obtenir_parents(noeud => obtenir_noeud(racine              => racine_arbre,
                  --                                                         personne_recherchee => Creer_Personne (id => id_choix)) );
               when 'B' => null;
               when 'C' => null;
               when 'D' => null;
               when 'E' => null;
               when 'F' => null;
                  when 'S' => Put_Line("Retour au menu principal.");
                  when others => Put_Line("Option inconnue.");
               end case;

               New_Line;
            end if;
         when 'E' => null;
         when others => Put_Line ("Je n'ai pas compris");
      end case;

      New_Line;

      exit when To_Upper(Item => choix) = 'E';
   end loop;

end Main;
