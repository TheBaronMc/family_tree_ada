with Ada.Text_IO; use Ada.Text_IO;

with Arbre_Genealog; use Arbre_Genealog;
with P_Personne; use P_Personne;

procedure Main is
   racine : T_AG;
   per : T_Personne;
   prenom : T_Chaine;
begin
   --  Insert code here.
   Get_Line (prenom.chaine, prenom.nb_carac);
   per := Creer_Personne(id             => 1,
                      prenom         => prenom,
                      nom            => prenom,
                      sexe           => 'M');
   racine := creation_arbre (personne_racine => per);
end Main;
