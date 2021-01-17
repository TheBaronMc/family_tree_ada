generic
   type T_Element is private;
   with function egale(A: T_Element; B: T_Element) return Boolean;
   with procedure afficher_element(element : in T_Element);

package arbre_bin is

   not_exists: exception;
   noeud_non_null: exception;

   type T_AB is private;

   -- nom : Initialiser
   -- sémantique: Initialiser un AB Abr. L’AB est vide.
   -- paramètres:
   --  Abr : Out T_AB; -- Pointeur qui contiendra la racine de l'arbre
   -- post-condition: Le pointeur contenant la racine a été initialisé.
   procedure Initialiser(Abr: out T_AB);

   -- nom : Est_Vide
   -- sémantique: Est-ce qu’un AB Abr est vide ?
   -- paramètres:
   --  Abr : In T_AB; -- Pointeur qui sera vérifié
   -- pré-condition: Le pointeur doit, au moins, avoir été initialisé.
   function Est_Vide (Abr : in T_AB) return Boolean;

   -- nom : Taille
   -- sémantique: Obtenir le nombre d’éléments d’un AB.
   -- paramètres:
   --  Abr : In T_AB; -- Racine de l'arbre dont la taille sera calculé.
   -- pré-condition: Le pointeur doit, au moins, avoir été initialisé.
   function Taille (Abr : in T_AB) return Integer;

   -- nom : Inserer
   -- sémantique: Insérer la donnée dans l’AB Abr.
   -- paramètres:
   --  Abr : In/Out T_AB; -- Arbre dans lequel la donnée sera inséré
   --  Donnee : In T_Element; -- Donnee qui sera inséré dans l'abre
   -- pré-condition: L'arbre doit avoir été initialisé.
   -- post-condition: La donnée a été ajouter à l'arbre sur le noeud courant.
   procedure Inserer (Abr : in out T_AB ; Donnee : in T_Element);

   -- nom : Rechercher
   -- sémantique: Recherche dans l’AB Abr.
   -- paramètres:
   --  Abr : In T_AD; -- Arbre dans lequel la donnée sera recherché
   --  Donnee : In T_Element; -- Donnée qui sera recherché
   -- pré-condition: Au moins un élément doit avoir été ajouté dans l'arbre
   function Rechercher (Abr : in T_AB; Donnee: in T_Element) return T_AB;

   -- nom : Obtenir_Noeud_Parent
   -- sémantique: Renvoie le noeud parent à celui a été mis en paramètre
   -- paramètres:
   --  Abr : In T_AB; -- Arbre dans lequel le noeud parent sera recherché
   --  Noeud_Enfant : In T_Element; -- Noeud enfant pour lequel on recherche un parent
   -- pré-condition: Au moins un élément doit avoir été ajouté dans l'arbre
   function Obtenir_Noeud_Parent (Abr : in T_AB; Noeud_Enfant: in T_AB) return T_AB;

   -- nom : Modifier
   -- sémantique: Modifie les informations d'un noeud
   -- paramètres:
   --  Abr : In T_AB; -- Arbre qui contient la donnee source
   --  src_donnee : In T_Element; -- donnée source
   --  nouv_donnee : In T_Element; -- donnée par laquelle la donnée source sera remplacée
   -- pré-condition: L'arbre doit contenir un noeud avec la donnée source.
   -- exception : not_exists => la donnee source n'a pas été trouvé dans l'arbre;
   procedure Modifier (Abr : in T_AB ; src_donnee : in T_Element; nouv_donnee : in T_Element);

   -- nom : Supprimer
   -- sémantique: Supprime dans l'arbre (Abr) le noeud contenant la donnee (donnee)
   -- paramètres:
   --  Abr : In/Out T_AB; -- Racine de l'arbre
   --  donnee : In T_Element; -- donnee du noeud recherché
   -- pré-condition: La donnée doit être présente dans l'arbre
   -- post-condition: Le noeud contenant la donnée a été supprimé de l'arbre
   -- exception: not_exists -- Aucun noeud ne possède la donnée mise en paramètre
   procedure Supprimer (Abr : in out T_AB; donnee : in T_Element);

   -- nom : Inserer_a_gauche
   -- sémantique: Inserer un noeud contenant une donnée dans le sous-arbre gauche
   -- paramètres:
   --  Abr : In/Out T_AB; -- Arbre qui se vera son sous-arbre gauche modifié
   --  Donnee : In T_Element; -- Donnée insérer dans le sous-arbre gauche
   -- pré-condition: L'arbre gauche au moins être initialisé
   -- post-condition: Le noeud contenant la donnée a été ajouté au sous-arbre gauche
   -- exception: noeud_non_null -- le noeud n'a pas pu être insérer, le sous-arbre gauche n'est pas vide
   procedure Inserer_a_gauche (Abr: in out T_AB; Donnee : in T_Element);

   -- nom : Inserer_a_droite
   -- sémantique: Inserer un noeud contenant une donnée dans le sous-arbre droit
   -- paramètres:
   --  Abr : In/Out T_AB; -- Arbre qui se vera son sous-arbre droit modifié
   --  Donnee : In T_Element; -- Donnée insérer dans le sous-arbre droit
   -- pré-condition: L'arbre doit au moins être initialisé
   -- post-condition: Le noeud contenant la donnée a été ajouté au sous-arbre droit
   -- exception: noeud_non_null -- le noeud n'a pas pu être insérer, le sous-arbre droit n'est pas vide
   procedure Inserer_a_droite (Abr: in out T_AB; Donnee : in T_Element);

   -- nom : obetenir_donnee_noeud
   -- sémantique: Obtenir la donnée d'un noeud.
   -- paramètres:
   --  noeud : In T_AB; -- Noeud pour lequel on veut la donnée
   -- pré-condition: Le noeud doit être initialisé
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
