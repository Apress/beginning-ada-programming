-- ada_in_string.adb:

with Ada.Characters.Latin_1;
with Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure ada_in_string is
  Line : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("###############################################################");
  Ends : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("##                                                           ##");
  Ada1 : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("##       00000000000   0000000000    00000000000             ##");
  Ada2 : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("##       00       00   00       00   00       00             ##");
  Ada3 : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("##       00000000000   00       00   00000000000             ##");
  Ada4 : Ada.Strings.Unbounded.Unbounded_String   := Ada.Strings.Unbounded.To_Unbounded_String("##       00       00   0000000000    00       00             ##");
  Result : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("");
begin
  -- first create the string in question.
  Ada.Strings.Unbounded.Append(Result, Line);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Line);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ends);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada1);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada2);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada2);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada3);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada2);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada2);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ada4);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Ends);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Line);
  Ada.Strings.Unbounded.Append(Result, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Result, Line);

  -- lastly, output the created string.
  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Result));
end ada_in_string;

