with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body arbre_bin is

   -- Initialiser un AB Abr. L’AB est vide.
   procedure Initialiser(Abr: out T_AB) is
   begin
      Abr := new T_Noeud;
   end Initialiser;

   -- Est-ce qu’un AB Abr est vide ?
   function Est_Vide (Abr : in T_AB) return Boolean is
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

   procedure Inserer (Abr : in out T_AB ; Donnee : in T_Element) is
   begin
      Abr.all.Donnee := Donnee;
      Abr.all.Sous_Arbre_Gauche := null;
      Abr.all.Sous_Arbre_Droit := null;
   end Inserer;

   -- Recherche dans l’AB Abr.
   function Rechercher (Abr : in T_AB; Donnee: in T_Element) return T_AB is
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

   function Obtenir_Noeud_Parent (Abr : in T_AB; Noeud_Enfant: in T_AB) return T_AB is
      noeud : T_AB := new T_Noeud;
   begin
      if Abr = Noeud_Enfant then
         return null;
      elsif not Est_Vide(Abr => Abr.all.Sous_Arbre_Droit) or not Est_Vide(Abr => Abr.all.Sous_Arbre_Gauche) then
         if not Est_Vide(Abr => Abr.all.Sous_Arbre_Droit) then
            if Abr.all.Sous_Arbre_Droit = Noeud_Enfant then
               return Abr;
            else
               noeud := Obtenir_Noeud_Parent(Abr          => Abr.all.Sous_Arbre_Droit,
                                             Noeud_Enfant => Noeud_Enfant);
               if noeud /= null then
                  return noeud;
               end if;
            end if;
         end if;
         if not Est_Vide(Abr => Abr.all.Sous_Arbre_Gauche) then
            if Abr.all.Sous_Arbre_Gauche = Noeud_Enfant then
               return Abr;
            else
               noeud := Obtenir_Noeud_Parent(Abr          => Abr.all.Sous_Arbre_Gauche,
                                             Noeud_Enfant => Noeud_Enfant);
               if noeud /= null then
                  return noeud;
               end if;
            end if;
         end if;
         return null;
      else
         return null;
      end if;


   end Obtenir_Noeud_Parent;

   -- Modifier la donnée dans l’AB Abr.
   procedure Modifier (Abr : in T_AB ; src_donnee : in T_Element; nouv_donnee : in T_Element) is
      noeud : T_AB := new T_Noeud;
   begin

      -- R0: Modifier les données d'un noeud
      -- R1: Comment R0 ?
      --     Récupérer le noeud qui contient la donnee src_donnee (R1.1)
      --     if Est_Vide(noeud) then
      --         Le champ donnée de ce noeud prend la valeur de nouv_donnee (R1.2)
      --     else
      --         raise not_exists;
      --     end if;
      -- R2.1: Comment R1.1 ?
      --     noeud : T_AB := noeud T_Noeud;
      --     noeud := Rechercher (Abr => Abr; Donnee => src_donnee);
      -- R2.2: Comment R1.2 ?
      --     noeud.all.Donnee := nouv_donnee;

      noeud := Rechercher (Abr    => Abr,
                           Donnee => src_donnee);
      if Est_Vide(noeud) then
         noeud.all.Donnee := nouv_donnee;
      else
         raise not_exists;
      end if;
   end Modifier;

   procedure Supprimer (Abr : in out T_AB; donnee : in T_Element) is
      noeud_enfant: T_AB := new T_Noeud;
      noeud_parent: T_AB := new T_Noeud;
   begin

      -- obtenir le noeud contenant la donnee
      noeud_enfant := Rechercher (Abr    => Abr,
                                  Donnee => donnee);
      if noeud_enfant = null then
         raise not_exists;
      end if;

      -- obtenir le noeud parent
      noeud_parent := Obtenir_Noeud_Parent ( Abr          => Abr,
                                             Noeud_Enfant => noeud_enfant);

      -- Si le noeud contenant la donnee correspond à la racine
      if noeud_parent = null then
         Initialiser (Abr => Abr);
      else
         -- mettre le pointeur à null
         if noeud_parent.all.Sous_Arbre_Droit = noeud_enfant then
            noeud_parent.all.Sous_Arbre_Droit := null;
         else
            noeud_parent.all.Sous_Arbre_Gauche := null;
         end if;
      end if;
   end Supprimer;

   function obetenir_donnee_noeud(noeud: in T_AB) return T_Element is
   begin
      return noeud.all.Donnee;
   end obetenir_donnee_noeud;

   procedure Afficher_Arbre_Bin (Abr : in T_AB) is
   begin
      if(Abr /= null) then
         afficher_element(Abr.all.donnee);
         Afficher_Arbre_Bin(Abr.all.Sous_Arbre_Gauche);
         Afficher_Arbre_Bin(Abr.all.Sous_Arbre_Droit);
      end if;
   end Afficher_Arbre_Bin;

   procedure Inserer_a_gauche (Abr: in out T_AB; Donnee : in T_Element) is
      noeud : T_AB := new T_Noeud;
   begin

      -- R0: Insérer à gauche ?
      -- R1: Comment R0 ?
      --    créé un noeud contenant les données (R2)
      --    if Est_Vide(Abr.all.Sous_Arbre_Gauche) then
      --        Abr.all.Sous_Arbre_Gauche := noeud;
      --    else
      --        raise noeud_non_null;
      --    end if;
      -- R2: Comment R2 ?
      --    noeud : T_AB := new T_Noeud;
      --    noeud.all.Donnee := Donnee;

      noeud.all.Donnee := Donnee;
      if Est_Vide(Abr => Abr.all.Sous_Arbre_Gauche) then
         Abr.all.Sous_Arbre_Gauche := noeud;
      else
         raise noeud_non_null;
      end if;

   end Inserer_a_gauche;


   procedure Inserer_a_droite (Abr: in out T_AB; Donnee : in T_Element) is
      noeud : T_AB := new T_Noeud;
   begin

      -- R0: Insérer à droite ?
      -- Voir les raffinages pour "Inserer_a_gauche"

      noeud.all.Donnee := Donnee;
      if Est_Vide(Abr => Abr.all.Sous_Arbre_Droit) then
         Abr.all.Sous_Arbre_Droit := noeud;
      else
         raise noeud_non_null;
      end if;
   end Inserer_a_droite;

end arbre_bin;
