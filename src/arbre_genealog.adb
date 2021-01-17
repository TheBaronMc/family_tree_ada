with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Arbre_Genealog is

   insertion_erreur : exception;

   function egale(A: T_Personne; B: T_Personne) return Boolean is
   begin
      return getId(personne => A) = getId(personne => B);
   end egale;

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
      Inserer (Abr    => racine,
               Donnee => personne_racine);

      return racine;
   end creation_arbre;

   procedure ajouter_parent(enfant : in out T_AG; parent: in T_Personne) is
   begin
      -- R0: Comment ajouter un parent
      -- R1: Si la personne est du sexe masculin
      --        Ajouter la personne à gauche
      --     Si la personne est du sexe féminin
      --        Ajouter la personne à droite

      -- R2.1 Comment R1.1 ?
      -- noeud := creation_arbre(parent);
      -- R2.2 Comment R2.2 ?
      -- if est_videenfant.all.s

      if getSexe(personne => parent) = 'M' then
         Inserer_a_gauche(Abr    => enfant,
                          Donnee => parent);
      elsif getSexe(personne => parent) = 'F' then
         Inserer_a_droite(Abr    => enfant,
                          Donnee => parent);
      end if;
   exception
         when noeud_non_null => raise insertion_erreur;
   end ajouter_parent;

   function obtenir_nombre_ancetre(noeud : in T_AG) return Integer is
   begin
      -- R0: Comment obtenir le nombre d'ancêtre ?
      -- R1: return Taille(Abr => noeud);

      return Taille(Abr => noeud);
   end obtenir_nombre_ancetre;

   procedure supprimer_noeud(racine: in out T_AG; id: in Integer) is
   begin

      -- R0: Supprimer un noeud avec un identifiant donner
      -- R1: Comment R0 ?
      --     Crée un type personne avec l'id correspondant (R1.1)
      --     Utiliser le sous-programme du module arbre_bin (R1.2)
      null;
   end supprimer_noeud;


end Arbre_Genealog;
