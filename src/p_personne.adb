with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body P_Personne is

   function equal(pers1: T_Personne; pers2: T_Personne) return Boolean is
   begin
      -- R0: Savoir si les deux personnes sont les mêmes
      -- R1: Comment R0 ?
      --     pers1.id = pers2.id

      return pers1.id = pers2.id;
   end equal;


   function getDate(jour: Integer; mois: Integer; annee: Integer) return T_Date is
      date : T_Date;
   begin
      -- R0: Création d'une date
      -- R1: Comment R0 ?
      --     verification annee
      --         attribution annee
      --     verification mois
      --         attribution mois
      --     verification jour
      --         attribution jour

      -- verification annee
      date.annee := annee;

      -- verification mois
      if (mois >= 1) and (mois <= 12) then
         date.mois := mois;
      else
         raise error_date;
      end if;

      -- verification jour
      if (jour >= 1) and (jour <= 31) then
         date.jour := jour;
      else
         raise error_date;
      end if;

      return date;
   end getDate;


   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character) return T_Personne is
      personne : T_Personne;
   begin
      personne.id := id;
      personne.prenom := prenom;
      personne.nom := nom;
      personne.sexe := sexe;

      return personne;
   end Creer_Personne;


   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character; pays_naissance: T_Chaine; ville_naissance: T_Chaine; date_naissance: T_Date) return T_Personne is
      personne : T_Personne;
   begin
      personne := Creer_Personne (id             => id,
                                  prenom         => prenom,
                                  nom            => nom,
                                  sexe           => sexe);
      personne.pays_naissance := pays_naissance;
      personne.ville_naissance := ville_naissance;
      personne.date_naissance := date_naissance;

      return personne;
   end Creer_Personne;


   function Creer_Personne(id: Integer; prenom: T_Chaine; nom: T_Chaine; sexe: Character; pays_naissance: T_Chaine; ville_naissance: T_Chaine; date_naissance: T_Date; pays_deces: T_Chaine; ville_deces: T_Chaine; date_deces: T_Date) return T_Personne is
      personne: T_Personne;
   begin
      personne := Creer_Personne (id              => id,
                                  prenom          => prenom,
                                  nom             => nom,
                                  sexe            => sexe,
                                  pays_naissance  => pays_naissance,
                                  ville_naissance => ville_naissance,
                                  date_naissance  => date_naissance);
      personne.pays_deces := pays_deces;
      personne.ville_deces := ville_deces;
      personne.date_deces := date_deces;

      return personne;
   end Creer_Personne;


   function getId(personne: T_Personne) return Integer is
   begin
      return personne.id;
   end getId;


   -- nom : nom de la procédure
   -- sémantique: décrire ce que réalise la procédure
   -- paramètres:
   --  F_Param_1 : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   --  ...
   --  F_Param_n : Mode (In, In/Out, Out) Type; -- Rôle du paramètre
   -- pré-condition: Conditions sur les paramètres en entrée (in)
   -- post-condition: Conditions sur les paramètres en sortie (out)
   function getSexe(personne: T_Personne) return Character is
   begin
      return personne.sexe;
   end getSexe;


   procedure affichePersonne(personne: T_Personne) is
   begin
      Put("ID : "&Integer'Image(personne.id));
      New_Line;
      Put("PRENOM : ");
      Put_Line(personne.prenom.chaine);
      Put("NOM : ");
      Put_Line(personne.nom.chaine);
      Put("SEXE : "&Character'Image(personne.sexe));
      New_Line;
   end affichePersonne;

end P_Personne;
