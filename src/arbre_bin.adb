with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body arbre_bin is

   -- Initialiser un AB Abr. L’AB est vide.
   procedure Initialiser(Abr: out T_AB) is
   begin
      Abr := null;
   end Initialiser;

     -- Est-ce qu’un AB Abr est vide ?
   function Est_Vide (Abr : T_AB) return Boolean is
   begin
      if Abr = null then
         return True;
      else
         return False;
      end if;
   end Est_Vide;

   -- Obtenir le nombre d’éléments d’un AB.
   function Taille (Abr : in T_AB) return Integer is
      nb_elmt: Integer;
   begin
      if Est_Vide(Abr => Abr) then
         return 0;
      else
         nb_elmt := 1;
         if not Est_Vide(Abr => Abr.all.Sous_Arbre_Gauche) then
            nb_elmt := nb_elmt + Taille(Abr => Abr.all.Sous_Arbre_Gauche);
         end if;
         if not Est_Vide(Abr => Abr.all.Sous_Arbre_Droit) then
            nb_elmt := nb_elmt + Taille(Abr => Abr.all.Sous_Arbre_Droit);
         end if;
         return nb_elmt;
      end if;
   end Taille;

   --procedure Inserer_noeud (Abr : in out T_AB ; noeud : in T_AB) is
   --begin
   --   if Est_Vide(Abr => Abr) then
   --      Abr := noeud;
   --   elsif plus_grand_que(noeud.all.Donnee, Abr.all.Donnee) then
   --      if Est_Vide(Abr => Abr.all.Sous_Arbre_Droit) then
   --         Abr.all.Sous_Arbre_Droit := noeud;
   --      else
   --         Inserer_noeud (Abr => Abr.all.Sous_Arbre_Droit, noeud => noeud);
   --      end if;
   --   elsif plus_petit_que(noeud.all.Donnee, Abr.all.Donnee) then
   --      if Est_Vide(Abr => Abr.all.Sous_Arbre_Gauche) then
   --         Abr.all.Sous_Arbre_Gauche := noeud;
   --      else
   --         Inserer_noeud (Abr => Abr.all.Sous_Arbre_Gauche, noeud => noeud);
   --      end if;
   --   end if;
   --end Inserer_noeud;


   -- Insérer la donnée dans l’AB Abr.
   --procedure Inserer (Abr : in out T_AB ; Donnee : in T_Element) is
   --   noeud : T_AB := New T_Noeud;
   --   trier : Boolean := False;
   --begin
   --   noeud.all.Donnee := Donnee;
   --   noeud.all.Sous_Arbre_Gauche := null;
   --   noeud.all.Sous_Arbre_Droit := null;
   --
   --   Inserer_noeud (Abr   => Abr,
   --                  noeud => noeud);
   --
   --end Inserer;

   -- Insérer la donnée dans l’AB Abr.
   procedure Inserer (Abr : in out T_AB ; Donnee : in T_Element) is
      noeud : T_AB := New T_Noeud;
   begin
      noeud.all.Donnee := Donnee;
      noeud.all.Sous_Arbre_Gauche := null;
      noeud.all.Sous_Arbre_Droit := null;
   end Inserer;

   -- Recherche dans l’AB Abr.
   function Rechercher (Abr : T_AB; Donnee: in T_Element) return T_AB is
      pointeur : T_AB := null;
   begin
      -- R0: Trouver un noeud pointant sur l'élément de l'arbre ?
      -- R1: Comment R0 ?
      --     Si le noeud courant pointe sur les mêmes données
      --        renvoyer le noeud courant
      --     Sinon si non Est_Vide(Arb.sous_arbre_droit) ou non Est_Vide(Arb.sous_arbre_gauche)
      --        pointeur : T_AB
      --        si non Est_Vide(Arb.sous_arbre_droit)
      --            pointeur := rechercher(Abr : T_AB; Donnee: in T_Element)
      --            si not (pointeur = null) alors
      --                return pointeur;
      --            fin si
      --        fin si
      --        si non Est_Vide(Arb.sous_arbre_gauche)
      --            pointeur := rechercher(Abr : T_AB; Donnee: in T_Element)
      --            si not (pointeur = null) alors
      --                return pointeur;
      --            fin si
      --        fin si
      --        renvoie null;
      --     Sinon
      --        renvoyer null
      --     Fin Si


      if egale (A => Abr.all.Donnee, B => Donnee) then
         return Abr;
      elsif (not Est_Vide( Abr => Abr.all.Sous_Arbre_Gauche)) or (not Est_Vide( Abr => Abr.all.Sous_Arbre_Droit)) then
         if not Est_Vide( Abr => Abr.all.Sous_Arbre_Gauche) then
            pointeur := Rechercher(Abr    => Abr.all.Sous_Arbre_Gauche, Donnee => Donnee);
            if not Est_Vide(Abr => pointeur) then
               return pointeur;
            end if;
         end if;
         if not Est_Vide( Abr => Abr.all.Sous_Arbre_Droit) then
            pointeur := Rechercher(Abr    => Abr.all.Sous_Arbre_Droit, Donnee => Donnee);
            if not Est_Vide(Abr => pointeur) then
               return pointeur;
            end if;
         end if;
         return null;
      else
         return null;
      end if;

   end Rechercher;

   function Rechercher_Noeud_Parent (Abr : T_AB; Donnee: in T_Element) return T_AB is
      t : T_AB;
   begin
      return t;
   end Rechercher_Noeud_Parent;

   function Est_Present (Abr : T_AB; Donnee: in T_Element) return Boolean is
   begin
      return True;
   end Est_Present;

   -- Modifier la donnée dans l’AB Abr.
   procedure Modifier (Abr : in out T_AB ; src_donnee : out T_Element; tar_donnee : in T_Element) is
   begin
      null;
   end Modifier;

   procedure Supprimer (Abr : in out T_AB; donnee : in T_Element) is
   begin
      null;
   end;

   function obetenir_donnee_noeud(noeud: in T_AB) return T_Element is
   begin
      return noeud.all.Donnee;
   end obetenir_donnee_noeud;

   procedure Afficher (Abr : in T_AB) is
   begin
      if(Abr /= null) then
         afficher_element(Abr.all.donnee);
         Afficher(Abr.all.Sous_Arbre_Gauche);
         Afficher(Abr.all.Sous_Arbre_Droit);
      end if;
   end Afficher;

   procedure Inserer_a_gauche (Abr: in out T_AB; Donnee : in T_Element) is
      noeud : T_AB := new T_Noeud;
   begin
      noeud.all.Donnee := Donnee;
      Abr.all.Sous_Arbre_Gauche := noeud;
   end Inserer_a_gauche;


   procedure Inserer_a_droite (Abr: in out T_AB; Donnee : in T_Element) is
      noeud : T_AB := new T_Noeud;
   begin
      noeud.all.Donnee := Donnee;
      Abr.all.Sous_Arbre_Droit := noeud;
   end Inserer_a_droite;

end arbre_bin;
