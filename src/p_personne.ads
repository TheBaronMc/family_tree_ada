package P_Personne is

   error_date : exception;

   type T_Chaine is record
      chaine: String(1..100);
      nb_carac: Integer;
   end record;

   type T_Personne is private;
   type T_Date is private;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function equal(pers1: T_Personne; pers2: T_Personne) return Boolean;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function getDate(jour: Integer; mois: Integer; annee: Integer) return T_Date;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character) return T_Personne;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character; pays_naissance: T_Chaine; ville_naissance: T_Chaine; date_naissance: T_Date) return T_Personne;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character; pays_naissance: T_Chaine; ville_naissance: T_Chaine; date_naissance: T_Date; pays_deces: T_Chaine; ville_deces: T_Chaine; date_deces: T_Date) return T_Personne;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function getId(personne: T_Personne) return Integer;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function getSexe(personne: T_Personne) return Character;

   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   procedure affichePersonne(personne: T_Personne);

private

   type T_Personne is record
      id: Integer;
      prenom: T_Chaine;
      nom: T_Chaine;
      age: Integer;
      sexe: Character;
      pays_naissance: T_Chaine;
      ville_naissance: T_Chaine;
      date_naissance: T_Date;
      pays_deces: T_Chaine;
      ville_deces: T_Chaine;
      date_deces: T_Date;
   end record;

   type T_Date is record
      jour: Integer;
      mois: Integer;
      annee: Integer;
   end record;

end P_Personne;
