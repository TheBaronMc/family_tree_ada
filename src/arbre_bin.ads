generic
   type T_Element is private;
   -- with function plus_grand_que(A: T_Element; B: T_Element) return Boolean;
   -- with function plus_petit_que(A: T_Element; B: T_Element) return Boolean;
   with function egale(A: T_Element; B: T_Element) return Boolean;
   with procedure afficher_element(element : in T_Element);

package arbre_bin is

   type T_AB is private;

   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Initialiser(Abr: out T_AB);

   -- nom : nom de la procédure
   -- sémantique: Est-ce qu’un AB Abr est vide ?
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Est_Vide (Abr : T_AB) return Boolean;

   -- nom : nom de la procédure
   -- sémantique: Obtenir le nombre d’éléments d’un AB.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Taille (Abr : in T_AB) return Integer;

   -- nom : nom de la procédure
   -- sémantique: Insérer la donnée dans l’AB Abr.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Inserer (Abr : in out T_AB ; Donnee : in T_Element);

   -- nom : nom de la procédure
   -- sémantique: Recherche dans l’AB Abr.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Rechercher (Abr : T_AB; Donnee: in T_Element) return T_AB;

   -- nom : nom de la procédure
   -- sémantique: Recherche dans l’AB Abr.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Rechercher_Noeud_Parent (Abr : T_AB; Donnee: in T_Element) return T_AB;

   -- nom : nom de la procédure
   -- sémantique: Recherche dans l’AB Abr.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Est_Present (Abr : T_AB; Donnee: in T_Element) return Boolean;

   -- Modifier la donnée dans l’AB Abr.
   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Modifier (Abr : in out T_AB ; src_donnee : out T_Element; tar_donnee : in T_Element);

   -- Supprimer la donnée dans l’AB Abr.
   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Supprimer (Abr : in out T_AB; donnee : in T_Element);

   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Inserer_a_gauche (Abr: in out T_AB; Donnee : in T_Element);

   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure Inserer_a_droite (Abr: in out T_AB; Donnee : in T_Element);

   -- nom : nom de la procédure
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function obetenir_donnee_noeud(noeud: in T_AB) return T_Element;

private

   type T_Noeud;
   type T_AB is access T_Noeud;
   type T_Noeud is
      record
         Donnee : T_Element;
         Sous_Arbre_Gauche : T_AB;
         Sous_Arbre_Droit : T_AB;
      end record;

end arbre_bin;
