-- unbounded_strings.adb:

with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure unbounded_strings is
  Temp1 : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("Hello, ");
  Temp2 : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("world!");
begin
  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Temp1));

  Ada.Strings.Unbounded.Append(Temp1, Temp2);
  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Temp1));

  Ada.Strings.Unbounded.Append(Temp1, "  From Ada!");
  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Temp1));

  Ada.Text_IO.Put_Line("Temp1 length: " & Natural'Image(Ada.Strings.Unbounded.Length(Temp1)));
  Ada.Text_IO.Put_Line("Temp2 length: " & Natural'Image(Ada.Strings.Unbounded.Length(Temp2)));
end unbounded_strings;

