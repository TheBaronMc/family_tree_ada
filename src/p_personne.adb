with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body P_Personne is

   function egale(pers1: T_Personne; pers2: T_Personne) return Boolean is
   begin
      -- R0: Savoir si les deux personnes sont les mêmes
      -- R1: Comment R0 ?
      --     pers1.id = pers2.id

      return pers1.id = pers2.id;
   end egale;


   function Creer_Personne(id: Integer) return T_Personne is
      personne : T_Personne;
   begin
      personne.id := id;
      personne.prenom := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.nom := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.sexe := 'N';
      personne.pays_naissance := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.ville_naissance := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.date_naissance := Obtenir_date(jour => -1, mois => -1, annee => -1);
      personne.pays_deces := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.ville_deces := Ada.Strings.Unbounded.To_Unbounded_String("N/A");
      personne.date_deces := Obtenir_date(jour => -1, mois => -1, annee => -1);

      return personne;
   end Creer_Personne;

   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character) return T_Personne is
      personne : T_Personne;
   begin
      personne := Creer_Personne (id => id);
      personne.prenom := prenom;
      personne.nom := nom;
      personne.sexe := sexe;

      return personne;
   end Creer_Personne;


   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character; pays_naissance: Unbounded_String; ville_naissance: Unbounded_String; date_naissance: T_Date) return T_Personne is
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


   function Creer_Personne(id: Integer; prenom: Unbounded_String; nom: Unbounded_String; sexe: Character; pays_naissance: Unbounded_String; ville_naissance: Unbounded_String; date_naissance: T_Date; pays_deces: Unbounded_String; ville_deces: Unbounded_String; date_deces: T_Date) return T_Personne is
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

   function getFirstname(personne: T_Personne) return Unbounded_String is
   begin
      return personne.prenom;
   end getFirstname;

   function getName(personne: T_Personne) return Unbounded_String is
   begin
      return personne.nom;
   end getName;

   function getSexe(personne: T_Personne) return Character is
   begin
      return personne.sexe;
   end getSexe;


   procedure affichePersonne(personne: T_Personne) is
   begin
      Put_Line("ID              : "&Integer'Image(personne.id));
      Put_Line("PRENOM          : "&To_String(personne.prenom));
      Put_Line("NOM             : "&To_String(personne.nom));
      Put_Line("SEXE            : "&Character'Image(personne.sexe));
      Put_Line("PAYS NAISSANCE  : "&To_String( personne.pays_naissance ));
      Put_Line("VILLE NAISSANCE : "&To_String( personne.ville_naissance ));
      Put_Line("DATE NAISSANCE  : "&Obtenir_chaine_date(date => personne.date_naissance));
      Put_Line("PAYS DECES      : "&To_String( personne.pays_deces ));
      Put_Line("VILLE DECES     : "&To_String( personne.ville_deces ));
      Put_Line("DATE DECES      : "&Obtenir_chaine_date(date => personne.date_deces));
   end affichePersonne;

end P_Personne;
