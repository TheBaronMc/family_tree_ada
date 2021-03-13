package P_Date is
   type T_Date is private;

   erreur_jour: exception;
   erreur_mois: exception;
   erreur_annee: exception;

   -- nom : Obtenir_date
   -- sémantique: Creer un type T_Date à partir des informations en paramètres
   -- paramètres:
   --  jour : In Integer;
   --  mois : In Integer;
   --  annee : In Integer;
   -- pré-condition: L'id doit être unique
   function Obtenir_date (jour: Integer; mois: Integer; annee: Integer) return T_Date;

   -- nom : Obtenir_chaine_date
   -- sémantique: renvoie une chaine de caractère correpondant à la date en paramètre
   -- paramètres:
   --  date : In T_Date;
   -- pré-condition: L'id doit être unique
   function Obtenir_chaine_date (date: T_Date) return String;

private
   type T_Date is record
      jour: Integer;
      mois: Integer;
      annee: Integer;
   end record;

end P_Date;
