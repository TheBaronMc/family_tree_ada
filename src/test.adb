with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure test is
 T : Unbounded_String := To_Unbounded_String ("613fqzd");
   I : Integer := Integer'Value (To_String (T));
begin
    Put_Line (I'Image);
end test;
