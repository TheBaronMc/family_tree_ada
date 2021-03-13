with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;

package body P_Arbre_Genealog is

   package p_liste_ab is new p_liste(T_Element        => T_AG,
                                     afficher_element => arbre_bin_personne.Afficher_Arbre_Bin,
                                     egale            => arbre_bin_personne.arbre_bin_egale);
   use p_liste_ab;


   function creation_arbre(personne : in out T_Personne) return T_AG is
      racine : T_AG;
   begin
      -- R0: Comment créer un arbre généalogique ?
      -- R1: Initialiser un abre binaire (R1.1)
      --     Ajouter la personne à la racine de l'abre binaire (R1.2)

      -- R2.1 : Comment R1.1 ?
      -- Initialiser (Abr => racine);
      -- R2.2 : Comment R1.2 ?
      -- personne_racine.generation := 0
      -- Inserer (Abr    => racine, Donnee => personne_racine);

      Initialiser (Abr => racine);
      Inserer_donnee (Abr    => racine,
               Donnee => personne);

      return racine;
   end creation_arbre;

   procedure ajouter_parent1(racine: in out T_AG; enfant : in T_Personne; parent: in T_Personne) is
      noeud: T_AG;
   begin
      -- R0: Comment ajouter le parent1 ?
      -- R1: Récupérer le noeud (R1.1)
      --     Vérifier que le noeud existe (R1.2)
      --     Insérer le noeud à gauche (R1.3)

      -- R2.1 Comment R1.1 ?
      -- noeud := creation_arbre(parent);

      -- R2.2 Comment R1.2 ?
      -- Si Est_Vide(Abr => noeud) alors
      --    raise personne_n_existe_pas;
      -- Fin Si;

      -- R2.3 Comment R1.3 ?
      -- Inserer_a_gauche(Abr => noeud, Donnee => parent);

      -- Récupérer le noeud
      noeud := Rechercher (Abr => racine, Donnee => enfant);

      -- Vérifier que le noeud existe
      if Est_Vide(Abr => noeud) then
         raise personne_n_existe_pas;
      end if;

      -- Insérer le noeud à gauche
      Inserer_a_droite(Abr => noeud, Donnee => parent);
   exception
         when noeud_non_null => raise insertion_erreur;
   end ajouter_parent1;



   procedure ajouter_parent2(racine: in out T_AG; enfant : in T_Personne; parent: in T_Personne) is
      noeud: T_AG;
   begin
      -- R0: Comment ajouter le parent1 ?
      -- Même chose que pour ajouter_parent1 mais avec insertion à droite


      noeud := Rechercher (Abr => racine, Donnee => enfant);

      if Est_Vide(Abr => noeud) then
         raise personne_n_existe_pas;
      end if;

      Inserer_a_gauche(Abr => noeud, Donnee => parent);
   exception
         when noeud_non_null => raise insertion_erreur;
   end ajouter_parent2;



   function obtenir_nombre_ancetre(noeud : in T_AG) return Integer is
   begin
      -- R0: Comment obtenir le nombre d'ancêtre ?
      -- R1: return Taille(Abr => noeud);

      return Taille(Abr => noeud);
   end obtenir_nombre_ancetre;



   function obtenir_ancetres(racine: in T_AG; personne : in T_Personne) return T_AG is
      noeud: T_AG;
      parent: T_AG;
   begin
      -- R0: Obtenir le descendant d'une personne
      -- R1: Comment R0 ?
      --     Rechercher la personne dans l'arbre (R1.1)
      --     Obtenir son parent au sens arbre binaire (R1.2)
      --     retourner le parent (R1.3)
      -- R2.1: Comment R1.1 ?
      --     noeud: T_AG := null;
      --     noeud := Rechercher (Abr => racine, Donnee => personne);
      -- R2.2: Comment R1.2 ?
      --     parent: T_AG := null;
      --     parent := Obtenir_Noeud_Parent (Abr => racine; Noeud_Enfant => noeud);
      -- R2.3: Comment R1.3
      --     return parent;

      Initialiser (Abr => noeud);
      Initialiser (Abr => parent);

      noeud := Rechercher (Abr => racine, Donnee => personne);
      if Est_Vide(Abr => noeud) then
         raise personne_n_existe_pas;
      else
         parent := Obtenir_Noeud_Parent (Abr => racine, Noeud_Enfant => noeud);
         if Est_Vide(Abr => parent) then
            raise personne_racine;
         end if;
      end if;

      return parent;
   end obtenir_ancetres;

   procedure supprimer_personne(racine: in out T_AG; personne: in T_Personne) is
   begin

      -- R0: Supprimer le noeud contenant la personne
      -- R1: Comment R0 ?
      --     Vérifier que la personne ne soit pas contenue dans la racine (R1.1)
      --     Supprimer le noeud (R1.2)

      -- R2.1: Comment R1.1 ?
      --     if egale(pers1 => personne, pers2 => obtenir_donnee_noeud(noeud => racine)) then
      --       raise suppression_racine_erreur;
      --     end if;
      -- R2.2: Comment R1.2 ?
      --     Supprimer (Abr => racine, donnee => personne);

      if egale(pers1 => personne, pers2 => obtenir_donnee_noeud(noeud => racine)) then
         raise suppression_racine_erreur;
      end if;

      Supprimer (Abr => racine, donnee => personne);

   exception
         when not_exists => raise suppression_noeud_inexistant_erreur;

   end supprimer_personne;

   --function obtenir_succession(racine: in T_AG; personne : in T_Personne) return liste_chainee is
   --   noeud_personne: T_AG;
   --   successeur: T_AG;
   --   noeud_courant: liste_chainee;
   --   liste: liste_chainee;
   --begin

      -- R0: Obtenir toute la succession d'une personne
      -- R1: Comment R0 ?
      --     Obtenir le noeud correspondant à la personne (R1.1)
      --     Insérer toute la succession dans une liste chainée (R1.2)
      -- R2.1: Comment R1.1 ?
      --     noeud_personne: T_AG := null;
      --     noeud_personne := Rechercher (Abr => racine, Donnee => personne);
      -- R2.2: Comment R1.2 ?
      --     liste: T_liste := new T_noeud;
      --     noeud_courant: T_liste := new T_noeud;
      --     successeur: T_AG := Obtenir_Noeud_Parent (Abr => racine, Noeud_Enfant => noeud_personne);
      --     while (successeur /= null) then
      --         noeud_courant.all.suiv := liste;
      --         noeud_courant.all.arbre := successeur;
      --         liste := noeud_courant;
      --         successeur: T_AG := Obtenir_Noeud_Parent (Abr => racine, Noeud_Enfant => noeud_personne);
      --     end while;

   --   Initialiser (Abr => noeud_personne);
   --   noeud_personne := Rechercher (Abr => racine, Donnee => personne);

   --   Initialiser (Abr => successeur);
   --   successeur := Obtenir_Noeud_Parent (Abr => racine, Noeud_Enfant => noeud_personne);
   --   while not Est_Vide (Abr => successeur) loop
   --      noeud_courant.all.suiv := liste;
   --      noeud_courant.all.arbre := successeur;
   --      liste := noeud_courant;
   --      successeur := Obtenir_Noeud_Parent (Abr => racine, Noeud_Enfant => noeud_personne);
   --   end loop;

   --   return liste;

   --exception
   --      when not_exists => raise rechercher_erreur;
   --end;



   function obtenir_parents (noeud: in T_AG) return p_liste_ab.T_Liste is
      liste: p_liste_ab.T_Liste;
      SAD: T_AG;
      SAG: T_AG;
   begin

      -- R0: Obtenir les parents d'un noeud donné
      -- R1: Comment R0 ?
      --     initialisation des pointeurs R1.1
      --     Récupération des sous-arbres R1.2
      --     Insertion des arbres dans une liste R1.3

      -- R2.1: Comment R1.1 ?
      --    Initialiser_liste(liste => liste);
      --    Initialiser (Abr => SAD);
      --    Initialiser (Abr => SAG);

      -- R2.2: Comment R1.2 ?
      --    SAD := Obtenir_sous_arbre_droit(noeud);
      --    SAG := Obtenir_sous_arbre_gauche(noeud);

      -- R2.3: Comment R1.3 ?
      --    Si not Est_Vide(Abr => SAD) alors
      --        inserer_en_tete (nouveau => SAD, liste => liste);
      --    Fin Si;
      --    Si not Est_Vide(Abr => SAG) alors
      --        inserer_en_tete (nouveau => SAG, liste => liste);
      --    Fin Si;

      -- initialisation des pointeurs
      Initialiser_liste(liste => liste);
      Initialiser (Abr => SAD);
      Initialiser (Abr => SAG);

      -- Récupération des sous-arbres
      SAD := Obtenir_sous_arbre_droit(noeud);
      SAG := Obtenir_sous_arbre_gauche(noeud);

      -- Insertion des arbres dans une liste
      if not Est_Vide(Abr => SAD) then
         inserer_en_tete (nouveau => SAD, liste => liste);
      end if;
      if not Est_Vide(Abr => SAG) then
         inserer_en_tete (nouveau => SAG, liste => liste);
      end if;

      return liste;
   end obtenir_parents;



   function obtenir_ancetres_generation(noeud : in T_AG; generation: in Integer) return p_liste_personne.T_Liste is
      liste: p_liste_personne.T_Liste;
      liste_AB1: p_liste_ab.T_Liste;
      liste_AB2: p_liste_ab.T_Liste;
   begin
      -- R0: Obtenir les ancêtres d'une noeud à une génération donnée
      -- R1: Comment R0 ?
      --     Initialiser une liste chainée avec les parents du noeud courant (R1.1)
      --     Parcourir l'arbre en ajoutant les ancêtres au fure et à mesure (R1.2)
      --     Renvoyer la liste chainée (R1.3)
      -- R2.1: Comment R1.1 ?
      --     liste: liste_chainee;
      --     Initialiser_liste (liste => liste);
      --     liste := obetnir_parents(noeud);
      -- R2.2: Comment R2.2 ?
      --     liste2: liste_chainee;
      --     for i in 1..generation loop
      --         liste2 := liste;
      --         Initialiser_liste (liste => liste);
      --         while not est_vite(liste2) loop
      --
      --         end loop;
      --     end loop;

      Initialiser_liste (liste => liste);
      liste_AB1 := obtenir_parents (noeud => noeud);

      for indice in 2..generation loop
         while not est_vide (liste => liste_AB1) loop
            p_liste_ab.inserer_en_queue (nouveau => p_liste_ab.enlever_tete(liste => liste_AB1), liste => liste_AB2);
         end loop;
         liste_AB1 := liste_AB2;
         Initialiser_liste (liste => liste_AB2);
      end loop;

      while not est_vide(liste => liste_AB1) loop
         p_liste_personne.inserer_en_tete (nouveau => obtenir_donnee_noeud (noeud => enlever_tete(liste => liste_AB1)),
                          liste   => liste);
      end loop;

      return liste;
   end obtenir_ancetres_generation;

   procedure affiche_entete(noeud: in T_AG) is
      longueur: Integer := Obtenir_longueur (racine => noeud);
   begin
      for i in 0..(longueur-1) loop
         Put(i'Image);
         Put("   ");
      end loop;
      Put(" génération");
      New_Line;
      for i in 0..(longueur-1) loop
         Put("-----");
      end loop;
      Put("------------");
      New_Line;
   end affiche_entete;

   procedure affiche_arbre(noeud: in T_AG; generation: in Integer) is
      personne: T_Personne := obtenir_donnee_noeud(noeud => noeud);
   begin
      Put(getId(personne)'Image&", "&To_String(getFirstname(personne))&" "&To_String(getName(personne)));
      New_Line;
      if not Est_Vide (Abr => Obtenir_sous_arbre_droit(noeud => noeud)) then
         for i in 1..generation loop
            Put("      ");
         end loop;
         Put ("- parent1: ");
         affiche_arbre (noeud => Obtenir_sous_arbre_droit(noeud => noeud), generation => (generation + 1));
      end if;
      if not Est_Vide (Abr => Obtenir_sous_arbre_gauche(noeud => noeud)) then
         for i in 1..generation loop
            Put("      ");
         end loop;
         Put ("- parent2: ");
         affiche_arbre (noeud => Obtenir_sous_arbre_gauche(noeud => noeud), generation => (generation + 1));
      end if;
   end affiche_arbre;



   procedure affiche_abre_genealog(noeud: in T_AG) is
   begin
      affiche_entete (noeud => noeud);

      affiche_arbre (noeud => noeud, generation => 1);
   end affiche_abre_genealog;



   function obtenir_noeud (racine: in T_AG; personne_recherchee: in T_Personne) return T_AG is
      noeud: T_AG;
   begin

      -- R0: Obtenir le noeud contenant la personne recherchée
      -- R1: Comment R0 ?
      --     Rechercher le noeud (R1.1)
      --     Vérifier que le noeud n'est pas null (R1.2)

      -- R2.1: Comment R1.1 ?
      --      noeud: T_AG;
      --      noeud := Rechercher(Abr => racine, Donnee => personne_recherchee);

      -- R2.2: Comment R1.2 ?
      --     Si Est_Vide(Abr => noeud) alors
      --         lever personne_n_existe_pas;
      --     Si Fin;

      noeud := Rechercher(Abr => racine, Donnee => personne_recherchee);

      if Est_Vide(Abr => noeud) then
         raise personne_n_existe_pas;
      end if;

      return noeud;
   end obtenir_noeud;



   function obtenir_personne (racine: in T_AG; personne_recherchee: in T_Personne) return T_Personne is
      noeud: T_AG;
   begin
      -- R0: Obtenir une personne
      -- R1: Comment R0 ?
      --     Obetenir le noeud correspondant à la personne (R1.1)
      --     Obetenir les données de ce noeud (R1.2)

      -- R2.1: Comment R1.1 ?
      --     noeud: T_AG;
      --     noeud := obtenir_noeud (racine => racine, personne_recherchee => personne_recherchee);

      -- R2.2: Comment R1.2 ?
      --     personne: T_Personne;
      --     personne: obtenir_donnee_noeud (noeud => noeud);

      noeud := obtenir_noeud (racine              => racine,
                              personne_recherchee => personne_recherchee);

      return obtenir_donnee_noeud (noeud => noeud);
   end obtenir_personne;



   procedure modifier_personne (racine: in out T_AG; ancienne_personne: in T_Personne; nouvelle_personne: in T_Personne) is
   begin
      -- R0: Mofier les données d'une personne
      -- R1: Comment R0 ?
      --     Modifier (Abr => racine, src_donnee => ancienne_personne, nouv_donnee => nouvelle_personne);

      Modifier (Abr         => racine,
                src_donnee  => ancienne_personne,
                nouv_donnee => nouvelle_personne);
   exception
      when not_exists => raise personne_n_existe_pas;
   end modifier_personne;


end P_Arbre_Genealog;
