with P_Personne; use P_Personne;
with arbre_bin;

package Arbre_Genealog is
   
   function egale(A: T_Personne; B: T_Personne) return Boolean;
   
   package arbre_bin_personne is new arbre_bin(T_Element        => T_Personne,
                                               egale            => egale,
                                               afficher_element => affichePersonne);
   
   use arbre_bin_personne;

   type T_AG is new T_AB;
   
   -- liste chainee
   type T_noeud;
   type T_liste is access T_noeud;
   type T_noeud is record
      arbre : T_AG;
      noeud_suiv : T_liste;
   end record;
   
   -- nom : creation_arbre
   -- sémantique: créer un arbre avec pour origine la personne en paramètre
   -- paramètres:
   --  personne_original : In personne; -- origine de l'abre
   -- pré-condition: le paramètre 'id' de la variable personne ne doit pas être null
   -- post-condition: L'abre est créé et un pointeur est renvoyé
   function creation_arbre(personne_racine : in out T_Personne) return T_AG;
   
   -- nom : ajouter_parent
   -- sémantique: ajoute un parent à un noeud enfant donné
   -- paramètres:
   --  enfant : In T_AB; -- enfant qui se vera un parent ajouter
   --  parent : In personne; -- parent qui sera ajouter à l'enfant
   -- post-condition: Le parent a été ajouté à l'enfant
   procedure ajouter_parent(enfant : in out T_AG; parent: in T_Personne);
   
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function obtenir_nombre_ancetre(noeud : in T_AG) return Integer;
   
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   --function obtenir_ancetre(noeud : in T_AG; generation: in Integer) return T_liste;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   --procedure affiche_abre_genealog(noeud: in T_AG);
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)   
   --procedure supprimer_noeud(racine: in out T_AG; id: in Integer);
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)  
   --function obtenir_individu_avec_un_parent(racine: in T_AG) return T_liste;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)  
   --function obtenir_individu_avec_deux_parent(racine: in T_AG) return T_liste;
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)  
   --function obtenir_individu_sans_parent(racine: in T_AG) return T_liste;
   
   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)  
   --function obtenir_succession(racine: in T_AG; id_ancetre : in Integer) return Integer;
   
   
end Arbre_Genealog;
