-- string_array.adb:

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

procedure string_array is
  StringArray : array(1 .. 2, 1 .. 6) of Ada.Strings.Unbounded.Unbounded_String;
begin
  StringArray := ((To_Unbounded_String("John"), To_Unbounded_String("Michael"), To_Unbounded_String("Mathew"), To_Unbounded_String("Bob"),
    To_Unbounded_String("Jacob"), To_Unbounded_String("Heiko")), (To_Unbounded_String("Big"), To_Unbounded_String("Mighty"), To_Unbounded_String("Artistic"),
    To_Unbounded_String("Bright"), To_Unbounded_String("Quick"), To_Unbounded_String("Brilliant")));

  for iterA in StringArray'Range(1) loop
    for iterB in StringArray'Range(2) loop
      Ada.Text_IO.Put(To_String(StringArray(iterA, IterB)) & " ");
    end loop;

    Ada.Text_IO.New_Line;
  end loop;
end string_array;

