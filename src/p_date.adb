package body P_Date is

   function Obtenir_date (jour: Integer; mois: Integer; annee: Integer) return T_Date is
      date: T_Date;
   begin
      date.annee := annee;
      date.mois := mois;
      date.jour := jour;

      return date;
   end Obtenir_date;

   function Obtenir_chaine_date (date: T_Date) return String is
   begin
      return date.jour'Image&" /"&date.mois'Image&" /"&date.annee'Image;
   end Obtenir_chaine_date;

end P_Date;
