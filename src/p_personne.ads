with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with P_Date; use P_Date;

package P_Personne is

   type T_Personne is private;


   -- nom : egale
   -- sémantique: vérifie si les deux personne en paramètre sont égales
   -- paramètres:
   --  pers1 : In T_Personne;
   --  pers1 : In T_Personne;
   function egale(pers1: T_Personne; pers2: T_Personne) return Boolean;

   -- nom : Creer_Personne
   -- sémantique: Crée une personne à partir d'un ID
   -- paramètres:
   --  id : In Integer; -- id de la personne
   -- pré-condition: L'id doit être unique
   function Creer_Personne(id: Integer) return T_Personne;

   -- nom : Creer_Personne
   -- sémantique: Crée une personne à partir d'un ID
   -- paramètres:
   --  id : In Integer; -- id de la personne
   --  prenom : In Unbounded_String; -- prenom de la personne
   --  nom : In Unbounded_String; -- nom de la personne
   --  sexe : In Character; -- sexe de la personne
   -- pré-condition: L'id doit être unique
   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character) return T_Personne;

   -- nom : Creer_Personne
   -- sémantique: Crée une personne à partir d'un ID
   -- paramètres:
   --  id : In Integer; -- id de la personne
   --  prenom : In Unbounded_String; -- prenom de la personne
   --  nom : In Unbounded_String; -- nom de la personne
   --  sexe : In Character; -- sexe de la personne
   --  pays_naissance : In Unbounded_String; -- pays de naissance de la personne
   --  ville_naissance : In Unbounded_String; -- ville de naissance de la personne
   --  date_naissance : In T_Date; -- date de naissance de la personne
   -- pré-condition: L'id doit être unique
   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character; pays_naissance: Unbounded_String; ville_naissance: Unbounded_String; date_naissance: T_Date) return T_Personne;

   -- nom : Creer_Personne
   -- sémantique: Crée une personne à partir d'un ID
   -- paramètres:
   --  id : In Integer; -- id de la personne
   --  prenom : In Unbounded_String; -- prenom de la personne
   --  nom : In Unbounded_String; -- nom de la personne
   --  sexe : In Character; -- sexe de la personne
   --  pays_naissance : In Unbounded_String; -- pays de naissance de la personne
   --  ville_naissance : In Unbounded_String; -- ville de naissance de la personne
   --  date_naissance : In T_Date; -- date de naissance de la personne
   --  pays_deces : In Unbounded_String; -- pays de décès de la personne
   --  ville_deces : In Unbounded_String; -- ville de décès de la personne
   --  date_deces : In T_Date; -- date de décès de la personne
   -- pré-condition: L'id doit être unique
   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character; pays_naissance: Unbounded_String; ville_naissance: Unbounded_String; date_naissance: T_Date; pays_deces: Unbounded_String; ville_deces: Unbounded_String; date_deces: T_Date) return T_Personne;

   -- nom : getId
   -- sémantique: Renvoie l'id de la personne en paramètre
   -- paramètres:
   --  personne : In T_Personne;
   -- pré-condition: l'id de cette personne doit avoir été défini
   function getId(personne: T_Personne) return Integer;

   -- nom : getFirstname
   -- sémantique: Renvoie le prénom de la personne en paramètre
   -- paramètres:
   --  personne : In T_Personne;
   -- pré-condition: le prénom de cette personne doit avoir été défini
   function getFirstname(personne: T_Personne) return Unbounded_String;

   -- nom : getName
   -- sémantique: Renvoie le nom de la personne en paramètre
   -- paramètres:
   --  personne : In T_Personne;
   -- pré-condition: le nom de cette personne doit avoir été défini
   function getName(personne: T_Personne) return Unbounded_String;

   -- nom : getSexe
   -- sémantique: Renvoie le sexe de la personne en paramètre
   -- paramètres:
   --  personne : In T_Personne;
   -- pré-condition: le sexe de cette personne doit avoir été défini
   function getSexe(personne: T_Personne) return Character;

   -- nom : affichePersonne
   -- sémantique: Affiche une personne
   -- paramètres:
   --  personne : In T_Personne; -- Personne affiché
   -- pré-condition: Tous les éléments de la personne doivent avoir été défini
   procedure affichePersonne(personne: T_Personne);

private

   type T_Personne is record
      id: Integer;
      prenom: Unbounded_String;
      nom: Unbounded_String;
      sexe: Character;
      pays_naissance: Unbounded_String;
      ville_naissance: Unbounded_String;
      date_naissance: T_Date;
      pays_deces: Unbounded_String;
      ville_deces: Unbounded_String;
      date_deces: T_Date;
   end record;

end P_Personne;
