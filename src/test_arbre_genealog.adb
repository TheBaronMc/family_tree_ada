with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Arbre_Genealog; use Arbre_Genealog;
with P_Personne; use P_Personne;

with p_liste;
with P_arbre_bin;

procedure test_arbre_genealog is
   package p_liste_personne is new p_liste(T_Element => T_Personne, afficher_element => affichePersonne, egale => egale);
   use p_liste_personne;

   package arbre_bin_personne is new P_arbre_bin(T_Element        => T_Personne,
                                               egale            => P_Personne.egale,
                                               afficher_element => affichePersonne);
   use arbre_bin_personne;

   arbre: T_AG;
   personne: T_Personne;
   enfant: T_Personne;
begin

   personne := Creer_Personne (id => 0, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Charly"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Ginevra"), sexe => 'M');

   -- Test #1 Création arbre généalogique
   arbre := creation_arbre (personne => personne);
   Assert (not Est_Vide (Abr => arbre), "Test #1: Arbre non-vide");
   Assert (Est_Vide (Abr => Obtenir_sous_arbre_droit(noeud => arbre)), "Test #1: sous-arbre droit vide");
   Assert (Est_Vide (Abr => Obtenir_sous_arbre_gauche(noeud => arbre)), "Test #1: sous-arbre gauche vide");
   Assert (egale(pers1 => obtenir_donnee_noeud (noeud => arbre), pers2 => personne), "Test #1: donnée égale");
   Put_Line ("Test #1: OK!");

   -- Test #2 Ajout parents
   enfant := Creer_Personne (id => 0);
   personne := Creer_Personne (id => 1, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Daniel"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Ginevra"), sexe => 'M');
   ajouter_parent1(racine => arbre, enfant => enfant, parent => personne);
   Assert (not Est_Vide (Abr => Obtenir_sous_arbre_droit(noeud => arbre)), "Test #2: Insertion père");
   personne := Creer_Personne (id => 2, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Catherine"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Simcic"), sexe => 'F');
   ajouter_parent2(racine => arbre, enfant => enfant, parent => personne);
   Assert (not Est_Vide (Abr => Obtenir_sous_arbre_gauche(noeud => arbre)), "Test #2: Insertion mère");
   personne := Creer_Personne (id => 3, prenom => Ada.Strings.Unbounded.To_Unbounded_String("tutu"), nom => Ada.Strings.Unbounded.To_Unbounded_String("tutu"), sexe => 'F');
   begin
      ajouter_parent1(racine => arbre, enfant => enfant, parent => personne);
      Put_Line ("Test #2 ERROR: Insertion parent déjà présent");
   exception
      when insertion_erreur => Put_Line ("Test #2: OK!");
   end;

   -- Ajout de noeuds dans l'arbre
   enfant := Creer_Personne (id => 1);
   personne := Creer_Personne (id => 3, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Philippe"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Ginevra"), sexe => 'M');
   ajouter_parent1(racine => arbre, enfant => enfant, parent => personne);
   personne := Creer_Personne (id => 4, prenom => Ada.Strings.Unbounded.To_Unbounded_String("André"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Colonel"), sexe => 'F');
   ajouter_parent2(racine => arbre, enfant => enfant, parent => personne);
   personne := Creer_Personne (id => 7, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Inconnue"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Inconnue"), sexe => 'M');
   ajouter_parent1(racine => arbre, enfant => Creer_Personne (id => 4), parent => personne);
   enfant := Creer_Personne (id => 2);
   personne := Creer_Personne (id => 5, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Alfred"), nom => Ada.Strings.Unbounded.To_Unbounded_String("Simcic"), sexe => 'M');
   ajouter_parent1(racine => arbre, enfant => enfant, parent => personne);
   personne := Creer_Personne (id => 6, prenom => Ada.Strings.Unbounded.To_Unbounded_String("Josette"), nom => Ada.Strings.Unbounded.To_Unbounded_String("France"), sexe => 'F');
   ajouter_parent2(racine => arbre, enfant => enfant, parent => personne);


   -- Test Affichage
   affiche_abre_genealog (noeud => arbre);

   -- test supprimer
   supprimer_personne (racine => arbre, personne => Creer_Personne(id => 7));
   Assert (Est_Vide (Abr => Rechercher(Abr => arbre, Donnee => Creer_Personne(id => 7))), "Test #3 Suppression");
   Put_Line ("Test #3 OK!");

   -- Test Affichage
   affiche_abre_genealog (noeud => arbre);

end test_arbre_genealog;
