-- search_string.adb:

with Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure Search_String is
  Example : Ada.Strings.Unbounded.Unbounded_String :=
    Ada.Strings.Unbounded.To_Unbounded_String(
      "Hello there!  We're having very nice weather today!");
  Position_Holder : Positive := 1;
begin
  Ada.Text_IO.Put_Line("Location of 'v': "
    & Natural'Image(Ada.Strings.Unbounded.Index(Example, "v")));
  Ada.Text_IO.Put_Line("Location of apostrophe: "
    & Natural'Image(Ada.Strings.Unbounded.Index(Example, "'")));
  Ada.Text_IO.Put_Line("Location of 'i': "
    & Natural'Image(Ada.Strings.Unbounded.Index(Example, "i")));
  Ada.Text_IO.Put_Line("Location of '!': "
    & Natural'Image(Ada.Strings.Unbounded.Index(Example, "!")));
  Ada.Text_IO.Put_Line("Location of 'x': "
    & Natural'Image(Ada.Strings.Unbounded.Index(Example, "x")));

  Position_Holder := Positive(Ada.Strings.Unbounded.Index(Example, "!")) + 1;
  Ada.Text_IO.Put_Line("Location of second '!': "
    & Natural'Image(Ada.Strings.Unbounded.Index(
      Example, "!", Position_Holder)));
end Search_String;
