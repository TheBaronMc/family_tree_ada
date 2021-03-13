with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Assertions; use Ada.Assertions;
with arbre_bin;

procedure test_arbre_bin is
   function egale(A: in Integer; B: in Integer) return Boolean is
   begin
      return A = B;
   end egale;

   procedure afficheInt(A: in Integer) is
   begin
      Put(A);
   end afficheInt;

   package arbre_bin_integer is new arbre_bin(T_Element        => Integer,
                                               egale            => egale,
                                               afficher_element => afficheInt);
   use arbre_bin_integer;

   arbre: T_AB;
begin

   -- Test #1 Création
   Initialiser (Abr => arbre);
   Assert (Est_Vide (Abr => arbre), "Test #1: Initialisation arbre");
   Put_Line ("Test #1: OK!");

   -- Test #2 Insertion
   Inserer_donnee (Abr    => arbre, Donnee => 1);
   Assert (obtenir_donnee_noeud(noeud => arbre) = 1, "Test #2: Vérification donnée");
   Assert (Est_Vide(Abr => Obtenir_sous_arbre_droit (noeud => arbre)), "Test #2: Vérification SAD");
   Assert (Est_Vide(Abr => Obtenir_sous_arbre_gauche (noeud => arbre)), "Test #2: Vérification SAG");
   Put_Line ("Test #2: OK!");

   -- Test #3 Insertion SAD
   Inserer_a_droite (Abr    => arbre, Donnee => 2);
   Assert (obtenir_donnee_noeud(noeud => Obtenir_sous_arbre_droit (noeud => arbre)) = 2, "Test #3: Vérification donnée");
   Assert (Est_Vide(Abr => Obtenir_sous_arbre_droit (noeud => Obtenir_sous_arbre_droit (noeud => arbre))), "Test #3: Vérification SAD");
   Assert (Est_Vide(Abr => Obtenir_sous_arbre_gauche (noeud => Obtenir_sous_arbre_droit (noeud => arbre))), "Test #3: Vérification SAG");
   Put_Line ("Test #3: OK!");

   -- Test #4 Insertion SAG
   Inserer_a_gauche (Abr    => arbre, Donnee => 3);
   Assert (obtenir_donnee_noeud(noeud => Obtenir_sous_arbre_gauche (noeud => arbre)) = 3, "Test #4: Vérification donnée");
   Assert (Est_Vide(Abr => Obtenir_sous_arbre_droit (noeud => Obtenir_sous_arbre_gauche (noeud => arbre))), "Test #4: Vérification SAD");
   Assert (Est_Vide(Abr =>Obtenir_sous_arbre_gauche (noeud => Obtenir_sous_arbre_gauche (noeud => arbre))), "Test #4: Vérification SAG");
   Put_Line ("Test #4: OK!");

   -- Test #5 Taille
   Assert (Taille(Abr => arbre) = 3, "Test #5: test taille");
   Put_Line ("Test #5: OK!");

   -- Test #6 Rechercher
   Assert (Rechercher (Abr    => arbre, Donnee => 1) = arbre, "Test #6: Recherche racine");
   Assert (Rechercher (Abr    => arbre, Donnee => 2) = Obtenir_sous_arbre_droit (noeud => arbre), "Test #6: Recherche donnée présente");
   Assert (Est_Vide(Abr => Rechercher (Abr    => arbre, Donnee => 99)), "Test #6: Recherche donnée non présente");
   Put_Line ("Test #6: OK!");

   -- Test #7 Modifier
   Modifier (Abr => arbre, src_donnee => 1, nouv_donnee => 4);
   Assert (obtenir_donnee_noeud(noeud => arbre) = 4, "Test #7: Vérification donnée");
   -- Vérification donnée non présente
   begin
      Modifier (Abr => arbre, src_donnee => 85, nouv_donnee => 136);
   exception
         when not_exists => null;
   end;
   Put_Line ("Test #7: OK!");

   -- Test #8 Supprimer
   Supprimer (Abr    => arbre, donnee => 2);
   Assert (Est_Vide (Abr => Obtenir_sous_arbre_droit (noeud => arbre)), "Test #8: Suppression sous arbre droit");
   Supprimer (Abr    => arbre, donnee => 4);
   Assert (Est_Vide(Abr => arbre), "Test #8: Suppression racine");
   Put_Line ("Test #8: OK!");
end test_arbre_bin;
