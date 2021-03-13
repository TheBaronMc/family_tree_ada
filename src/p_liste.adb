with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body p_liste is

   -- fonction créer_liste_vide
   -- sémantique: créer une liste vide
   -- paramètres: aucun
   -- type-retour: liste
   -- pré-condition: aucune
   -- post-condition: est_vide (l) vaut vrai
   -- exception: aucune
   procedure Initialiser_liste (liste: out T_Liste) is
   begin
      liste := null;
   end Initialiser_liste;

   -- fonction est_vide
   -- sémantique: teste si une liste l est vide
   -- paramètres: l donnée type liste
   -- type retour: booléen
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   function est_vide (liste: in T_Liste) return Boolean is
   begin
      if liste = null then
         return True;
      else
         return False;
      end if;
   end est_vide;

   -- procedure inserer_en_tete
   -- sémantique: insère l’élément nouveau en tête de la liste l(l vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --pré-condition: aucune
   --post-condition: nouveau appartient à la liste
   --exception: aucune
   procedure inserer_en_tete (nouveau: in T_Element; liste: in out T_Liste) is
      elmt_liste: T_Liste;
   begin
      elmt_liste := new noeud;
      elmt_liste.all.val := nouveau;

      elmt_liste.all.suiv := liste;

      liste := elmt_liste;
   end inserer_en_tete;

   procedure inserer_en_queue (nouveau: in T_Element; liste: in out T_Liste) is
      elmt_liste: T_Liste;
      noeud_courant: T_Liste := liste;
   begin
      elmt_liste := new noeud;
      elmt_liste.all.val := nouveau;
      elmt_liste.all.suiv := null;

      if est_vide (liste => elmt_liste) then
         liste := elmt_liste;
      else
         while not est_vide(liste => noeud_courant.all.suiv) loop
            noeud_courant := noeud_courant.all.suiv;
         end loop;
         noeud_courant.all.suiv := elmt_liste;
      end if;
   end inserer_en_queue;

   -- procedure afficher_liste
   -- sémantique: afficher les éléments de la liste l
   -- paramètres: l donnée type liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   procedure affiche_liste (liste: in T_Liste) is
   begin
      if liste = null then
         null;
      else
         afficher_element (liste.all.val);
         if liste.all.suiv = null then
            New_Line;
         else
            Put (',');
            affiche_liste(liste => liste.all.suiv);
         end if;
      end if;
   end affiche_liste;

   -- fonction rechercher
   -- sémantique: recherche si e est présent dans la liste l,
   -- retourne son adresse ou null si la liste est vide ou si e n’appartient pas à la liste
   -- paramètres: l donnée type liste
   --             e donnée type entier
   -- type-retour: liste
   -- pré-condition: aucune
   -- post-condition: aucune
   -- exception: aucune
   function rechercher (e: in T_Element; l: in T_Liste) return T_Liste is
      p: T_Liste := l;
   begin
      -- recherche de l'entier dans la liste
      while not est_vide(liste => p) loop
         if egale (A => p.all.val, B => e) then
            return p;
         else
            null;
         end if;
         p := p.all.suiv;
      end loop;

      -- Si on sort de la boucle, l'entier n'a pas été trouvé dans la liste
      return null;
   end rechercher;

   -- procedure inserer_apres
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément nouveau, après la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la, la liste la liste est vide
   procedure inserer_apres (nouveau: in T_Element; data: in T_Element; liste: in out T_Liste) is
      elmt_liste_nouveau : T_Liste := new noeud;
      p : T_Liste;
   begin
      if est_vide (liste => liste) then -- Si la liste est vide
         raise liste_vide;
      else

         p := rechercher(e => data,
                         l => liste);
         if p = null then -- Si data n'est pas dans la liste
            raise data_pas_dans_la_liste;
         else
            elmt_liste_nouveau.all.val := nouveau;
            elmt_liste_nouveau.all.suiv := p.all.suiv;
            p.all.suiv := elmt_liste_nouveau;
         end if;
      end if;
   end inserer_apres;

   -- procedure inserer_avant
   -- sémantique: insère dans la liste l (liste vide ou non vide),
   -- l’élément de nom nouveau, avant la valeur data
   -- paramètres: liste donnée/résultat type liste
   --             nouveau donnée type entier
   --             data donnée type entier
   -- pré-condition: aucune
   -- post-condition: nouveau appartient à la liste
   -- exception: data n’est pas dans la la liste, la liste est vide
   procedure inserer_avant (data: in T_Element; nouveau: in T_Element; liste: in out T_Liste) is
      elmt_liste_nouveau : T_Liste := new noeud;
      p : T_Liste:= liste;
   begin
      if est_vide (liste => liste) then -- Si la liste est vide
         raise liste_vide;
      else
         elmt_liste_nouveau.all.val := nouveau;

         if egale (A => data, B => liste.all.val) then -- si data correspond au début de la chaine
            elmt_liste_nouveau.suiv := liste;
            liste := elmt_liste_nouveau;
         else
            while (not est_vide(p.all.suiv.all.suiv)) and (p.all.suiv.all.val /= data) loop
               p := p.all.suiv;
            end loop;

            -- La valeur peut être dans le dernier maillon de la chaine, il faut d'abord faire les vérifications dans cet ordre
            if egale (A => p.all.suiv.all.val, B => data) then
               elmt_liste_nouveau.all.suiv := p.all.suiv;
               p.all.suiv := elmt_liste_nouveau;
            else
               if est_vide(p.all.suiv.all.suiv) then
                  raise data_pas_dans_la_liste;
               else
                  null;
               end if;
            end if;
         end if;

      end if;
   end inserer_avant;

   -- procedure enlever
   -- sémantique: enlever un élément e de la liste l (liste vide ou non vide)
   -- paramètres: liste donnée/résultat type liste
   --             e donnée type entier
   -- pré-condition: aucune
   -- post-condition: e n’appartient pas à la liste
   -- exception: aucune
   procedure supprimer (e: in T_Element; liste: in out T_Liste) is
      elmt_e_liste : T_Liste;
      p : T_Liste := liste;
   begin
      if est_vide(liste => liste) then -- Si la liste est vide, je ne fais rien
         null;
      else
         elmt_e_liste := rechercher(e => e,
                                    l => liste);
         if elmt_e_liste = null then -- Si l'élément e n'est pas dans la liste, je ne fais rien.
            null;
         else
            if liste = elmt_e_liste then -- Si l'élément e de la liste et la tête de la liste pointent sur la même case mémoire
               liste := liste.all.suiv;
            else
               while (not est_vide(p.all.suiv.all.suiv)) and (p.all.suiv.all.val /= e) loop
                  p := p.all.suiv;
               end loop;
               if egale (A => p.all.suiv.all.val, B => e) then
                  p.all.suiv := p.all.suiv.all.suiv;
               else
                  null;
               end if;
            end if;
         end if;
      end if;
   end supprimer;

   function enlever_tete (liste: in out T_Liste) return T_Element is
      tete: T_Element;
   begin
      tete := liste.all.val;
      liste := liste.all.suiv;

      return tete;
   end enlever_tete;


end p_liste;
