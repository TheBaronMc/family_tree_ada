with P_Personne; use P_Personne;
with P_Arbre_Bin;
with p_liste;

package P_Arbre_Genealog is
   
   package arbre_bin_personne is new P_arbre_bin(T_Element        => T_Personne,
                                               egale            => egale,
                                               afficher_element => affichePersonne);
   
   package p_liste_personne is new p_liste(T_Element        => T_Personne,
                                           afficher_element => affichePersonne,
                                           egale            => egale);
   
   use p_liste_personne;
   use arbre_bin_personne;

   
   insertion_erreur: exception;
   suppression_noeud_inexistant_erreur: exception;
   suppression_racine_erreur: exception;
   personne_n_existe_pas: exception;
   personne_racine: exception;
   
   
   type T_AG is new T_AB;
   
   -- nom : creation_arbre
   -- sémantique: créer un arbre avec pour origine la personne en paramètre
   -- paramètres:
   --  personne : In T_Personne; -- origine de l'abre
   -- pré-condition: le paramètre 'id' de la variable personne ne doit pas être null
   -- post-condition: L'abre est créé et un pointeur est renvoyé
   function creation_arbre(personne : in out T_Personne) return T_AG;
   
   -- nom : ajouter_parent1
   -- sémantique: ajoute le parent1 à l'enfant mit en paramètre
   -- paramètres:
   --  racine : In/Out T_AG; -- racine de l'arbre
   --  enfant : In T_Personne; -- enfant qui se vera un parent ajouter
   --  parent : In T_Personne; -- parent qui sera ajouter à l'enfant
   -- pré-condition: la place du parent1 doit être vide
   -- post-condition: Le parent a été ajouté à l'enfant
   -- execption: insertion_erreur -- le place du parent1 n'était pas vide
   procedure ajouter_parent1(racine: in out T_AG; enfant : in T_Personne; parent: in T_Personne);
   
   
   -- nom : ajouter_parent2
   -- sémantique: ajoute le parent1 à l'enfant mit en paramètre
   -- paramètres:
   --  racine : In/Out T_AG; -- racine de l'arbre
   --  enfant : In T_Personne; -- enfant qui se vera un parent ajouter
   --  parent : In T_Personne; -- parent qui sera ajouter à l'enfant
   -- pré-condition: la place du parent2 doit être vide
   -- post-condition: Le parent a été ajouté à l'enfant
   -- execption: insertion_erreur -- le place du parent2 n'était pas vide
   procedure ajouter_parent2(racine: in out T_AG; enfant : in T_Personne; parent: in T_Personne);
   
   -- nom : obtenir_nombre_ancetre
   -- sémantique: renvoie le nombre d’ancêtres connus d’un individu donné (lui compris).
   -- paramètres:
   --  noeud : In T_AG;
   function obtenir_nombre_ancetre(noeud : in T_AG) return Integer;
   
   --function obtenir_descendant(racine: in T_AG; personne : in T_Personne) return T_AG;
   
   --function obtenir_parents (noeud: in T_AG) return p_liste_ab.liste_chainee;
   
   -- nom : obtenir_ancetres_generation
   -- sémantique: Pour un noeud donnée renvoie la liste des ancêtres (père/mère) d'une génération donnée
   -- paramètres:
   --  racine : In T_AG; -- Racine de l'arbre
   --  generation : In Integer; -- Génération souhaitée
   -- pré-condition: La génération indiquée en paramètre doit exister
   function obtenir_ancetres_generation(noeud : in T_AG; generation: in Integer) return p_liste_personne.T_Liste;

   -- nom : affiche_abre_genealog
   -- sémantique: affiche l'arbre généalogique à partir d'un noeud donné
   -- paramètres:
   --  noeud : In T_AG; -- Racine de l'arbre (pour l'affichage)
   -- pré-condition: l'arbre doit au moins contenir une personne
   procedure affiche_abre_genealog(noeud: in T_AG);
   
   -- nom : supprimer_personne
   -- sémantique: supprimer une personne et ses ancêtres 
   -- paramètres:
   --  racine : In/Out T_AB; -- Arbre dans lequel la personne est contenu
   --  id : In Integer; -- Identifiant de la personne visée
   -- pré-condition: La personne doit être contenu dans l'arbre
   -- post-condition: La personne a été supprimé de l'arbre.
   -- exception : suppression_racine_erreur -- Vous avez tanté de supprimer la racine de l'arbre
   -- exception : suppression_noeud_inexistant_erreur -- La personne n'est pas présente dans l'arbre
   procedure supprimer_personne(racine: in out T_AG; personne: in T_Personne);
   
   -- nom : obtenir_noeud
   -- sémantique: recherche le noeud correspondant à la personne recherchée et le renvoie
   -- paramètres:
   --  racine : In T_AG; -- Racine de l'arbre
   --  personne_recherchee : In T_Personne; -- Personne recherchée
   -- pré-condition: la personne recherchée doit être présente dans l'arbre
   -- post-condition: Le noeud contenant la personne est renvoyé 
   -- exception : personne_n_existe_pas -- la personne recherchée n'est pas présente dans l'arbre
   function obtenir_noeud (racine: in T_AG; personne_recherchee: in T_Personne) return T_AG;
   
   -- nom : obtenir_personne
   -- sémantique: renvoie la variable contenant toutes les informations de la personne mise en paramètre 
   -- paramètres:
   --  racine : In T_AG; -- Racine de l'arbre
   --  personne_recherchee : In T_Personne; -- Personne recherchée
   -- pré-condition: La personne recherchée doit être présente dans l'arbre
   -- post-condition: La variable correspondant à la personne est renvoyée 
   -- exception : personne_n_existe_pas -- la personne recherchée n'est pas présente dans l'arbre
   function obtenir_personne (racine: in T_AG; personne_recherchee: in T_Personne) return T_Personne;
   
   -- nom : modifier_personne
   -- sémantique: Remplace dans l'arbre les données de l'ancienne_personne par celles de la nouvelle_personne
   -- paramètres:
   --  racine : In/Out T_AG; -- Racine de l'arbre
   --  ancienne_personne : In T_Personne; -- Personne qui sera remplacée
   --  nouvelle_personne : In T_Personne; -- Personne par laquelle l'ancienne sera remplacée
   -- pré-condition: 
   --       L'ancienne personne doit être présente dans l'arbre
   --       L'ID de la nouvelle personne ne doit pas être présente dans l'arbre ou doit être la même que l'ancienne
   -- post-condition: l'ancienne personne a été remplacée par la nouvelle 
   -- exception : personne_n_existe_pas -- l'ancienne personne n'est pas présente dans l'arbre
   procedure modifier_personne (racine: in out T_AG; ancienne_personne: in T_Personne; nouvelle_personne: in T_Personne);
   
   
end P_Arbre_Genealog;
